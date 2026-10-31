// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.postmedia;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.graphics.drawable.GradientDrawable;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.ViewFlipper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;
import io.github.joancomasfdz.extension.baconreader.DownloadProgress;
import io.github.joancomasfdz.extension.baconreader.GlideUtils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;

/**
 * Improves loading of post media (BaconReader's PostMediaHandler):
 * - while media loads, an overlay on the media area shows a dimmed still preview, a
 *   progress bar and, once a size is known, a label ("GIF · 80.6 MB", or "12.3 / 80.6 MB");
 * - GIFs load through the app's own cache loader, which reports download progress.
 *
 * The overlay is drawn with the media ViewFlipper's ViewOverlay, so it floats above whichever
 * page the app shows (the app shows an empty PhotoView while a GIF downloads) without
 * changing the app's view hierarchy.
 */
@SuppressWarnings("unused")
public final class PostMediaPatch {
    private static final int PAGE_LOADING = 0;
    private static final int PAGE_VIDEO = 3;

    /** One overlay per PostMediaHandler. */
    private static final Map<Object, LoadingOverlay> OVERLAYS = new WeakHashMap<>();
    /** HTTP status of the RedGIFs API error being reported on this thread. */
    private static final ThreadLocal<Integer> REDGIFS_ERROR = new ThreadLocal<>();
    private static final int HTTP_NOT_FOUND = 404;
    private static final int HTTP_GONE = 410;
    private static final ExecutorService SIZE_LOOKUP = Executors.newFixedThreadPool(2);

    private PostMediaPatch() {
    }

    /** Injected at the start of PostMediaHandler.start(): show the loading overlay. */
    public static void onStart(Object handler) {
        try {
            Object link = get(handler, "link");
            ViewFlipper flipper = (ViewFlipper) get(handler, "viewFlipper");
            if (flipper == null) return;
            LoadingOverlay overlay = OVERLAYS.get(handler);
            if (overlay == null) {
                overlay = new LoadingOverlay(handler, flipper);
                OVERLAYS.put(handler, overlay);
            }
            overlay.show(stillPreviewUrl(link));

            String gif = gifUrl(link);
            // Reddit videos (DASH) have no single file size: the bar alone shows they are loading.
            if (gif != null && !(Boolean) call(link, "isRedditVideo")) overlay.lookUpSize("GIF", gif);
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "onStart failed", t);
        }
    }

    /**
     * Injected at the start of PostMediaHandler.loadGifContent(String). The app loads GIFs with
     * Glide there, which reports no progress. For GIF URLs, use the app's own cache loader
     * instead (loadToCache): it streams the file to its image cache, reports progress through
     * onReceivedData (hooked below, for "x / y MB"), and then shows it with the app's
     * GifImageView. Static images keep the Glide path. Returns true when the original method
     * must return.
     */
    public static boolean loadGifWithProgress(Object handler, String url) {
        try {
            if (!isGifUrl(url)) return false;
            // displayGif() plays resolvedUrl from the cache when the download ends; it must be the
            // URL we download (loadGifContent is sometimes called with a rewritten preview URL).
            field(handler.getClass(), "resolvedUrl").set(handler, url);
            // Both are private in the app's bytecode.
            declared(handler, "showPage", int.class).invoke(handler, PAGE_LOADING);
            declared(handler, "loadToCache", String.class).invoke(handler, url);
            Logger.printDebug(() -> "GIF via cache loader: " + url);
            return true;
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "cache loader failed, using Glide", t);
            return false;
        }
    }

    /**
     * Injected where the app gives up loading an image or GIF (PostMediaHandler$4$1: the OkHttp fallback
     * after Glide failed). The app only logs it and keeps the loading page.
     */
    public static void onImageLoadFailed(Object callback) {
        try {
            Object handler = outerInstance(callback, "PostMediaHandler");
            final LoadingOverlay overlay = handler == null ? null : OVERLAYS.get(handler);
            if (overlay == null) return;
            overlay.flipper.post(new Runnable() {
                @Override
                public void run() {
                    overlay.fail();
                }
            });
        } catch (Exception ex) {
            Logger.printInfo(() -> "onImageLoadFailed failed", ex);
        }
    }

    /** Follows the this$ fields of inner classes up to the instance whose class name ends with {@code name}. */
    private static Object outerInstance(Object inner, String name) throws IllegalAccessException {
        Object current = inner;
        for (int depth = 0; current != null && depth < 4; depth++) {
            if (current.getClass().getName().endsWith(name)) return current;
            Object outer = null;
            for (Field field : current.getClass().getDeclaredFields()) {
                if (field.getName().startsWith("this$")) {
                    field.setAccessible(true);
                    outer = field.get(current);
                    break;
                }
            }
            current = outer;
        }
        return null;
    }

    /** Injected at the start of the download progress callback (PostMediaHandler$5.onReceivedData). */
    public static void onProgress(Object cacheListener, final int received, final int total) {
        try {
            final LoadingOverlay overlay = OVERLAYS.get(get(cacheListener, "this$0"));
            if (overlay == null) return;
            Runnable update = new Runnable() {
                @Override
                public void run() {
                    overlay.setProgress(received, total);
                }
            };
            if (Looper.myLooper() == Looper.getMainLooper()) update.run();
            else overlay.flipper.post(update);
        } catch (Exception t) {
            Logger.printInfo(() -> "onProgress failed", t);
        }
    }

    /**
     * Injected where BaconReader reports an error of the RedGIFs API (RedgifHandler, onResponse),
     * right before it cancels the request.
     */
    public static void onRedgifsError(Object response) {
        try {
            REDGIFS_ERROR.set((Integer) response.getClass().getMethod("code").invoke(response));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read the RedGIFs error", ex);
        }
    }

    /**
     * Injected at the start of the RedGIFs cancel callback (ImageHelper$4.onCancel). For a deleted or
     * missing video, the app would show RedGIFs' web page, which does not work without JavaScript.
     *
     * @return The message to show instead, or null to let the app continue.
     */
    public static String redgifsErrorMessage() {
        Integer code = REDGIFS_ERROR.get();
        REDGIFS_ERROR.remove();
        if (code == null) return null;
        if (code == HTTP_GONE) return str("revanced_post_media_redgifs_deleted");
        if (code == HTTP_NOT_FOUND) return str("revanced_post_media_redgifs_not_found");
        return null;
    }

    /** True when the URL's path ends in .gif (i.redd.it/x.gif, preview.redd.it/x.gif?s=…). */
    static boolean isGifUrl(String url) {
        if (url == null) return false;
        return unescape(url).toLowerCase(Locale.ROOT).replaceFirst("[?#].*$", "").endsWith(".gif");
    }

    /** The GIF the app downloads for GIF posts: link.preview.images[0].variants.gif.source.url. */
    private static String gifUrl(Object link) throws Exception {
        Object image = firstPreviewImage(link);
        if (image == null) return null;
        Object variants = get(image, "variants");
        if (variants == null) return null;
        Object item = get(variants, "gif");
        if (item == null) return null;
        Object source = get(item, "source");
        return source == null ? null : unescape((String) get(source, "url"));
    }

    // region Loading overlay

    /** A static image of the post: the largest preview resolution, else the source. */
    public static String stillPreviewUrl(Object link) throws Exception {
        Object image = firstPreviewImage(link);
        if (image == null) return null;
        List<?> resolutions = (List<?>) get(image, "resolutions");
        Object best = resolutions != null && !resolutions.isEmpty() ? resolutions.get(resolutions.size() - 1) : get(image, "source");
        return best == null ? null : unescape((String) get(best, "url"));
    }

    private static Object firstPreviewImage(Object link) throws Exception {
        if (link == null) return null;
        Object preview = get(link, "preview");
        if (preview == null) return null;
        List<?> images = (List<?>) get(preview, "images");
        return images == null || images.isEmpty() ? null : images.get(0);
    }

    /**
     * Still preview + label + progress bar, drawn above the media ViewFlipper. It stays until
     * the page the app shows has content: an image in the photo/GIF view, a playing video,
     * or any other page (web, blocked, error).
     */
    private static final class LoadingOverlay {
        /** The PostMediaHandler, weakly: its player tells when a video is ready. */
        final java.lang.ref.WeakReference<Object> handler;
        final ViewFlipper flipper;
        final FrameLayout root;
        final ImageView still;
        final TextView label;
        final ProgressBar progress;
        boolean attached;
        boolean progressKnown;
        boolean failed;
        final int accent;
        /** Changes on every show(), so a late size lookup for a previous post is ignored. */
        Object generation = new Object();

        private final ViewTreeObserver.OnPreDrawListener watcher = new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                if (attached && contentShown()) hide();
                return true;
            }
        };
        /**
         * Video frames on a SurfaceView do not trigger pre-draw, so also check twice a second.
         * A video that fails (no connection, removed) stays on the video page: the bar then stops and turns red.
         * The checks go on, so the overlay still hides if the video plays later.
         */
        private final Runnable ticker = new Runnable() {
            @Override
            public void run() {
                if (!attached) return;
                if (contentShown()) {
                    hide();
                    return;
                }
                if (playerFailed() || offline()) fail();
                flipper.postDelayed(this, 500);
            }
        };
        private final View.OnLayoutChangeListener resizer = new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                layoutToFlipper();
            }
        };

        LoadingOverlay(Object handler, ViewFlipper flipper) {
            this.handler = new java.lang.ref.WeakReference<>(handler);
            this.flipper = flipper;
            Context context = flipper.getContext();
            root = new FrameLayout(context);

            still = new ImageView(context);
            still.setScaleType(ImageView.ScaleType.FIT_CENTER);
            still.setAlpha(0.45f);
            root.addView(still, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            LinearLayout bottom = new LinearLayout(context);
            bottom.setOrientation(LinearLayout.VERTICAL);
            label = new TextView(context);
            label.setTextColor(0xFFFFFFFF);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            int padH = dp(context, 8);
            int padV = dp(context, 3);
            label.setPadding(padH, padV, padH, padV);
            GradientDrawable pill = new GradientDrawable();
            pill.setColor(0x99000000);
            pill.setCornerRadius(dp(context, 10));
            label.setBackground(pill);
            LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            labelParams.setMargins(dp(context, 8), 0, 0, dp(context, 6));
            bottom.addView(label, labelParams);

            progress = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
            progress.setMax(1000);
            accent = accentColor(context);
            progress.setProgressTintList(ColorStateList.valueOf(accent));
            progress.setIndeterminateTintList(ColorStateList.valueOf(accent));
            progress.setProgressBackgroundTintList(ColorStateList.valueOf(0x33FFFFFF));
            bottom.addView(progress, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 4)));
            root.addView(bottom, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
        }

        void show(String stillUrl) {
            generation = new Object();
            progressKnown = false;
            failed = false;
            DownloadProgress.showLoading(progress, accent);
            setLabel(null); // The bar shows it is loading; the label only appears with a size.

            GlideUtils.clear(still);
            still.setImageDrawable(null);
            if (!attached) {
                flipper.getOverlay().add(root);
                flipper.addOnLayoutChangeListener(resizer);
                flipper.getViewTreeObserver().addOnPreDrawListener(watcher);
                attached = true;
            }
            layoutToFlipper();
            flipper.removeCallbacks(ticker);
            flipper.postDelayed(ticker, 500);
            if (stillUrl != null) {
                try {
                    GlideUtils.load(still, stillUrl, null, null);
                } catch (Exception t) {
                    Logger.printInfo(() -> "still preview failed", t);
                }
            }
        }

        void hide() {
            if (!attached) return;
            attached = false;
            flipper.removeCallbacks(ticker);
            flipper.getOverlay().remove(root);
            flipper.removeOnLayoutChangeListener(resizer);
            if (flipper.getViewTreeObserver().isAlive()) flipper.getViewTreeObserver().removeOnPreDrawListener(watcher);
            GlideUtils.clear(still);
        }

        /** Real progress (only for media the app loads through its own ImageLoader). */
        void setProgress(int received, int total) {
            if (!attached || failed) return;
            if (total > 0) {
                progressKnown = true;
                progress.setIndeterminate(false);
                progress.setProgress((int) (1000L * received / total));
            }
            setLabel(progressLabel(received, total));
        }

        /** Shows the size label, or hides it when there is nothing to show (null). */
        void setLabel(String text) {
            label.setText(text);
            label.setVisibility(text == null || text.isEmpty() ? View.GONE : View.VISIBLE);
            layoutToFlipper(); // Views in a ViewOverlay are not re-measured when their text changes.
        }

        /** Shows "GIF · 80.6 MB" while loading, using the size the server reports (HEAD request). */
        void lookUpSize(final String kind, final String url) {
            final Object requested = generation;
            SIZE_LOOKUP.execute(new Runnable() {
                @Override
                public void run() {
                    final long size = contentLength(url);
                    if (size <= 0) return;
                    flipper.post(new Runnable() {
                        @Override
                        public void run() {
                            if (attached && generation == requested && !progressKnown && !failed) {
                                setLabel(sizeLabel(kind, size));
                            }
                        }
                    });
                }
            });
        }

        private boolean contentShown() {
            if (flipper.getVisibility() != View.VISIBLE) return false;
            int page = flipper.getDisplayedChild();
            View current = flipper.getCurrentView();
            if (page == PAGE_LOADING) return false;
            if (page == PAGE_VIDEO) return playerReady();
            if (current instanceof ImageView) return ((ImageView) current).getDrawable() != null;
            return true; // Web page, blocked, error, galleries: nothing to wait for.
        }

        /** Whether the app's video player has a frame ready (works for videos the app starts itself). */
        private boolean playerReady() {
            try {
                Object h = handler.get();
                if (h == null) return true;
                Object videoHandler = get(h, "videoHandler");
                if (videoHandler == null) return false;
                Object player = videoHandler.getClass().getMethod("getPlayer").invoke(videoHandler);
                if (player == null) return false;
                return (Integer) player.getClass().getMethod("getPlaybackState").invoke(player) == 3; // STATE_READY
            } catch (Throwable t) {
                return true; // Never leave the overlay stuck on top of a video.
            }
        }

        /** The media could not be loaded: the bar stops and turns red. */
        void fail() {
            if (!attached || failed) return;
            failed = true;
            DownloadProgress.showFailed(progress);
            setLabel(null);
        }

        /** Without a connection the app's loaders give up without telling (link resolving, images). */
        private boolean offline() {
            try {
                ConnectivityManager connectivity = (ConnectivityManager)
                        flipper.getContext().getSystemService(Context.CONNECTIVITY_SERVICE);
                NetworkInfo network = connectivity == null ? null : connectivity.getActiveNetworkInfo();
                return network == null || !network.isConnected();
            } catch (Throwable t) {
                return false;
            }
        }

        /** Whether the app's video player stopped with an error. */
        private boolean playerFailed() {
            try {
                if (flipper.getDisplayedChild() != PAGE_VIDEO) return false;
                Object h = handler.get();
                if (h == null) return false;
                Object videoHandler = get(h, "videoHandler");
                if (videoHandler == null) return false;
                Object player = videoHandler.getClass().getMethod("getPlayer").invoke(videoHandler);
                if (player == null) return false;
                return player.getClass().getMethod("getPlayerError").invoke(player) != null;
            } catch (Throwable t) {
                return false;
            }
        }

        private void layoutToFlipper() {
            int w = flipper.getWidth();
            int h = flipper.getHeight();
            root.measure(View.MeasureSpec.makeMeasureSpec(w, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(h, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, w, h);
        }
    }

    /** "12.3 / 84.5 MB", or "12.3 MB" when the total size is unknown. */
    static String progressLabel(long received, long total) {
        double mb = 1024 * 1024;
        if (total > 0) return String.format(Locale.US, "%.1f / %.1f MB", received / mb, total / mb);
        return String.format(Locale.US, "%.1f MB", received / mb);
    }

    /** "GIF · 80.6 MB". */
    static String sizeLabel(String kind, long bytes) {
        return String.format(Locale.US, "%s · %.1f MB", kind, bytes / (1024.0 * 1024.0));
    }

    /** The size the server reports for a URL, or -1. Runs on a background thread. */
    private static long contentLength(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("HEAD");
            connection.setConnectTimeout(10000);
            connection.setReadTimeout(10000);
            return connection.getResponseCode() == 200 ? connection.getContentLength() : -1;
        } catch (Throwable t) {
            return -1;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static int accentColor(Context context) {
        TypedArray array = context.getTheme().obtainStyledAttributes(new int[]{android.R.attr.colorAccent});
        try {
            return array.getColor(0, 0xFF4F7EC4);
        } finally {
            array.recycle();
        }
    }

    // endregion

    static String unescape(String url) {
        return url == null ? null : url.replace("&amp;", "&");
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    // region Reflection (the app's classes are not on the compile classpath)

    private static Field field(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Object get(Object target, String name) throws Exception {
        return field(target.getClass(), name).get(target);
    }

    private static Method declared(Object target, String name, Class<?>... parameterTypes) throws Exception {
        Method method = target.getClass().getDeclaredMethod(name, parameterTypes);
        method.setAccessible(true);
        return method;
    }

    private static Object call(Object target, String name) throws Exception {
        Method method = target.getClass().getDeclaredMethod(name);
        method.setAccessible(true);
        return method.invoke(target);
    }

    // endregion

    /**
     * Injected in BrowserBase.enableJavascript, in place of the app's list of sites: whether the web view of a
     * link post runs JavaScript for this page. Either all sites except the blocked ones, or only the allowed ones.
     */
    public static boolean needsJavascript(String url) {
        try {
            android.net.Uri uri = android.net.Uri.parse(url);
            String scheme = uri.getScheme();
            // Like the app: anything but a web page (an app link) runs JavaScript.
            if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)) return true;
            String host = uri.getHost();
            if (host == null) return false;
            if (Settings.LINK_PREVIEW_JAVASCRIPT.get()) {
                return !isOnSites(host, Settings.LINK_PREVIEW_JAVASCRIPT_BLOCKED.get());
            }
            return isOnSites(host, Settings.LINK_PREVIEW_JAVASCRIPT_ALLOWED.get());
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not check the site of " + url, ex);
            return false;
        }
    }

    /**
     * Whether the host is one of the sites, or a subdomain of one. Sites are separated by lines, spaces or
     * commas, and can be written as links ("https://www.example.com/page" is example.com).
     */
    static boolean isOnSites(String host, String sites) {
        host = host.toLowerCase(java.util.Locale.ROOT);
        for (String site : sites.split("[\\s,]+")) {
            site = site.trim().toLowerCase(java.util.Locale.ROOT)
                    .replaceFirst("^[a-z]+://", "").replaceFirst("[/?#:].*$", "").replaceFirst("^www\\.", "");
            if (site.isEmpty()) continue;
            if (host.equals(site) || host.endsWith("." + site)) return true;
        }
        return false;
    }
}
