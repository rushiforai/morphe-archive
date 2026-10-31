// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.detailvideo;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ViewFlipper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.joancomasfdz.extension.baconreader.GlideUtils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.postmedia.PostMediaPatch;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;

/**
 * With "Autoplay videos in Detail View" off, the detail view of a post shows the post's preview image with
 * a play button in place of the video, which isn't loaded. Tapping it hands the video back to the app,
 * which starts it as it would have. PostMediaHandler is also used by the full-screen photo viewer and the
 * browser, which keep autoplaying.
 */
@SuppressWarnings("unused")
public final class DetailVideoPatch {
    /** The listener DetailLinkFragment gives its PostMediaHandler. PhotoSlide and BrowserActivity give their own. */
    private static final String DETAIL_LISTENER = "com.onelouder.baconreader.adapters.DetailLinkFragment$6";

    /** The preview page each PostMediaHandler has in its ViewFlipper while it holds a video. */
    private static final Map<Object, PreviewPage> PAGES = new WeakHashMap<>();

    /** Set while the app shows the video the user tapped, so the hook lets it through. */
    private static boolean showing;

    private DetailVideoPatch() {
    }

    /**
     * Injected at the start of PostMediaHandler.displayVideo(Context, String): whether the app's display of a
     * video is skipped for a preview, so the method must return.
     */
    public static boolean deferVideo(Object handler, Context context, String url) {
        try {
            if (showing || handler == null || context == null) return false;
            if (Settings.AUTOPLAY_VIDEOS_IN_DETAIL_VIEW.get()) return false;
            Object listener = get(handler, "listener");
            if (listener == null || !DETAIL_LISTENER.equals(listener.getClass().getName())) return false;
            // GIFs, and videos the app doesn't show with its video player, aren't affected.
            if (get(handler, "videoHandler") == null) return false;
            ViewFlipper flipper = (ViewFlipper) get(handler, "viewFlipper");
            if (flipper == null) return false;

            PreviewPage old = PAGES.remove(handler);
            if (old != null) flipper.removeView(old);
            PreviewPage page = new PreviewPage(context, PostMediaPatch.stillPreviewUrl(get(handler, "link")));
            page.setOnClickListener(v -> play(handler, flipper, page, context, url));
            PAGES.put(handler, page);
            flipper.addView(page);
            // The app shows the flipper with its first page (DetailLinkFragment).
            flipper.setVisibility(View.VISIBLE);
            flipper.setDisplayedChild(flipper.indexOfChild(page));
            return true;
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "Could not show the video preview", t);
            return false;
        }
    }

    private static void play(Object handler, ViewFlipper flipper, PreviewPage page, Context context, String url) {
        PAGES.remove(handler);
        showing = true;
        try {
            Method displayVideo = handler.getClass().getDeclaredMethod("displayVideo", Context.class, String.class);
            displayVideo.setAccessible(true);
            displayVideo.invoke(handler, context, url);
            flipper.removeView(page);
            GlideUtils.clear(page.image);
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "Could not play the video", t);
        } finally {
            showing = false;
        }
    }

    private static Object get(Object target, String name) throws Exception {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static int dp(Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density);
    }

    /** The post's preview image with a play button, as a page of the media's ViewFlipper. */
    private static final class PreviewPage extends FrameLayout {
        final ImageView image;

        PreviewPage(Context context, String previewUrl) {
            super(context);
            image = new ImageView(context);
            setBackgroundColor(0xFF000000);
            setMinimumHeight(dp(context, 200));
            setContentDescription(str("revanced_baconreader_detail_video_play"));
            image.setAdjustViewBounds(true);
            image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            addView(image, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
            int size = dp(context, 64);
            addView(new PlayButton(context), new LayoutParams(size, size, Gravity.CENTER));
            if (previewUrl != null) {
                try {
                    GlideUtils.load(image, previewUrl, null, null);
                } catch (Exception ex) {
                    ErrorDialog.printException(() -> "Could not load the video preview", ex);
                }
            }
        }
    }

    private static final class PlayButton extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path triangle = new Path();

        PlayButton(Context context) {
            super(context);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float radius = Math.min(getWidth(), getHeight()) / 2f;
            float x = getWidth() / 2f;
            float y = getHeight() / 2f;
            paint.setColor(0xB3000000);
            canvas.drawCircle(x, y, radius, paint);
            triangle.reset();
            triangle.moveTo(x - radius * 0.25f, y - radius * 0.4f);
            triangle.lineTo(x - radius * 0.25f, y + radius * 0.4f);
            triangle.lineTo(x + radius * 0.45f, y);
            triangle.close();
            paint.setColor(0xFFFFFFFF);
            canvas.drawPath(triangle, paint);
        }
    }
}
