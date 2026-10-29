package io.github.sabopura.morphe.extension.youtube.ambient;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.ref.WeakReference;

import io.github.sabopura.morphe.extension.youtube.shared.VideoSurfaceTracker;
import io.github.sabopura.morphe.extension.youtube.shared.Views;

/**
 * Installs the ambient light layer inside YouTube's player, directly above the video and
 * below every player control, so it can paint the letterbox/pillarbox bars without ever
 * covering buttons, captions, or the picture itself.
 */
@SuppressWarnings("unused")
public final class AmbientLightController {
    static final String TAG = "AmbientLight";
    private static final String VIEW_TAG = "sabopura_ambient_light_layer";
    private static final String PAGE_TAG = "sabopura_ambient_page_glow";
    private static final int MAX_ANCESTOR_LEVELS = 8;
    private static final long INSTALL_CHECK_INTERVAL_MS = 1_000L;
    private static final long HIDDEN_CHECK_INTERVAL_MS = 5_000L;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    private static WeakReference<ViewGroup> controlsRef = new WeakReference<>(null);
    private static WeakReference<AmbientLightView> viewRef = new WeakReference<>(null);
    private static WeakReference<AmbientPageGlowView> pageRef = new WeakReference<>(null);
    private static volatile long lastInstallCheckMs;
    private static int retryCount;

    /** Bumped with every bundle release so the settings screen can prove what is installed. */
    static final String BUILD_VERSION = "1.10.0";
    /** 1 = last capture succeeded, 0 = none yet, negative = failing (PixelCopy code). */
    static volatile int statusCapture;
    /** How the page light was drawn most recently. */
    static volatile String statusRenderer = "";
    /** Page background colour the theater key is using, and where it was read from. */
    static volatile String statusBackground = "";
    /** Inline preview players that were kept from taking over the light. */
    static volatile int ignoredPreviews;

    private AmbientLightController() {
    }

    private static volatile int attachCount;

    /** One compact line for the on-screen diagnostics of the danmaku statistics. */
    private static volatile long lastDiagnosticsUptime;
    private static String cachedPainters = "-";
    private static long cachedPaintersUptime;

    /** True while the on-screen diagnostics or the status row were looked at recently. */
    static boolean diagnosticsShown() {
        return SystemClock.uptimeMillis() - lastDiagnosticsUptime < 2_000L;
    }

    public static String debugLine() {
        lastDiagnosticsUptime = SystemClock.uptimeMillis();
        long sinceDraw = AmbientPageGlowView.lastDrawUptime == 0 ? -1
                : (SystemClock.uptimeMillis() - AmbientPageGlowView.lastDrawUptime) / 100;
        ViewGroup controls = controlsRef.get();
        // What paints the page half-way between the player and the bottom of the screen.
        String painters = cachedPainters;
        AmbientPageGlowView page = pageRef.get();
        long uptime = SystemClock.uptimeMillis();
        // Walking the whole window is too much for every frame; twice a second is plenty.
        if (page != null && controls != null && uptime - cachedPaintersUptime >= 500L) {
            cachedPaintersUptime = uptime;
            int[] location = new int[2];
            controls.getLocationInWindow(location);
            int playerBottom = location[1] + controls.getHeight();
            View root = page.getRootView();
            int y = (playerBottom + root.getHeight()) / 2;
            painters = SeeThroughPage.paintersAt(root, root.getWidth() * 3 / 4, y);
            cachedPainters = painters;
        }
        return "amb " + AmbientLightView.debugState + " cap" + statusCapture
                + "\n" + AmbientPageGlowView.debugState + " draw" + sinceDraw
                + "\natt" + attachCount
                + (controls == null ? " noctl" : (Views.isInlinePreview(controls) ? " PREV" : " W")
                + (controls.isAttachedToWindow() ? "" : " ctlgone"))
                + " pv" + ignoredPreviews + " st" + SeeThroughPage.statusClearedViews
                + " hid" + SeeThroughPage.statusHiddenViews + " re" + SeeThroughPage.restoredCount
                + (SeeThroughPage.isActive() ? "" : " stoff")
                + "\n" + painters;
    }

    /** Human-readable state for the settings screen. */
    static String statusText(boolean japanese) {
        // The renderer is only known after the next frame is drawn on the video screen.
        boolean theaterSelected = AmbientLightSettings.getProfile().videoBackdrop;
        boolean theaterDrawn = statusRenderer.contains("theater")
                || statusRenderer.contains("シアター");
        String renderer;
        if (statusRenderer.isEmpty()) {
            renderer = japanese ? "まだ描画していません（動画を再生してから開いてください）"
                    : "nothing drawn yet (play a video first)";
        } else if (theaterSelected != theaterDrawn) {
            renderer = (japanese ? "動画画面に戻ると切り替わります（前回: "
                    : "switches when you return to the video (last: ") + statusRenderer + ")";
        } else {
            renderer = statusRenderer;
        }
        int capture = statusCapture;
        String captureText = capture > 0 ? "OK"
                : capture == 0 ? (japanese ? "未実行" : "not yet")
                : (japanese ? "失敗 (" : "failing (") + capture + ")";
        return (japanese ? "パッチ " : "Patch ") + BUILD_VERSION
                + " / Android API " + android.os.Build.VERSION.SDK_INT + "\n"
                + (japanese ? "描画方式: " : "Renderer: ") + renderer + "\n"
                + (japanese ? "背景色: " : "Background: ")
                + (statusBackground.isEmpty() ? "-" : statusBackground) + "\n"
                + (japanese ? "背景の透明化: " : "See-through page: ")
                + (!SeeThroughPage.isAvailable() ? (japanese ? "フックなし" : "hook missing")
                : (SeeThroughPage.isActive() ? "ON" : "OFF") + " / views "
                + SeeThroughPage.statusClearedViews + " / yt-ambient "
                + SeeThroughPage.statusHiddenViews + " / litho "
                + SeeThroughPage.trackedLithoBackgrounds()) + "\n"
                + (japanese ? "画面: " : "Display: ") + displayText() + "\n"
                + (japanese ? "光: " : "Light: ") + AmbientPageGlowView.statusLight()
                + (japanese ? " / 無視したプレビュー " : " / ignored previews ") + ignoredPreviews
                + "\n"
                + (japanese ? "映像の取得: " : "Frame capture: ") + captureText;
    }

    /** Refresh rate and how often YouTube reports the media time (affects comment motion). */
    private static String displayText() {
        String rate = "?";
        try {
            ViewGroup controls = controlsRef.get();
            android.view.Display display = controls == null ? null : controls.getDisplay();
            if (display != null) {
                StringBuilder modes = new StringBuilder();
                for (android.view.Display.Mode mode : display.getSupportedModes()) {
                    String value = String.valueOf(Math.round(mode.getRefreshRate()));
                    if (modes.indexOf(value) < 0) modes.append(modes.length() > 0 ? "/" : "")
                            .append(value);
                }
                rate = Math.round(display.getRefreshRate()) + "Hz (" + modes + ")";
            }
        } catch (Throwable ignored) {
            // Diagnostics only.
        }
        long silent = io.github.sabopura.morphe.extension.youtube.shared.PlayerHooks
                .millisSinceLastReport();
        return rate + ", clock " + io.github.sabopura.morphe.extension.youtube.shared.PlayerHooks
                .clockIntervalMs() + "ms (last " + (silent == Long.MAX_VALUE ? "-"
                : silent + "ms") + ")";
    }

    /**
     * Status plus a compact description of the watch page's view tree (which views paint
     * what), so display problems on a particular device or patch combination can be
     * diagnosed from real data. Contains no account or video information.
     */
    static String diagnostics() {
        StringBuilder out = new StringBuilder(statusText(false)).append("\n--- views ---\n");
        ViewGroup controls = controlsRef.get();
        View root = controls == null ? null : controls.getRootView();
        if (root == null) return out.append("(player not open)").toString();
        out.append("window ").append(root.getWidth()).append('x').append(root.getHeight())
                .append(" density ").append(root.getResources().getDisplayMetrics().density)
                .append('\n');
        describe(root, 0, out);
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            int id = Views.resource(root.getContext(), "id", "watch_list");
            out.append("--- fills ---\n");
            SeeThroughPage.probe(id == 0 ? null : root.findViewById(id), out);
        }
        return out.toString();
    }

    private static final int MAX_DIAGNOSTIC_CHARS = 16_000;

    private static void describe(View view, int depth, StringBuilder out) {
        if (view == null || depth > 40 || out.length() > MAX_DIAGNOSTIC_CHARS) return;
        // The player window is marked invisible while the settings screen covers it.
        boolean visible = depth == 0 || view.getVisibility() == View.VISIBLE;
        android.graphics.drawable.Drawable background = view.getBackground();
        boolean large = view.getWidth() >= 120 && view.getHeight() >= 60;
        String id = "";
        if (view.getId() != View.NO_ID) {
            try {
                id = view.getResources().getResourceEntryName(view.getId());
            } catch (Throwable ignored) {
                id = "?";
            }
        }
        if (visible && large && (background != null || !id.isEmpty() || !view.willNotDraw())) {
            int[] location = new int[2];
            view.getLocationInWindow(location);
            String paint = "-";
            if (background instanceof android.graphics.drawable.ColorDrawable) {
                paint = String.format("#%08X", ((android.graphics.drawable.ColorDrawable)
                        background).getColor());
            } else if (background != null) {
                paint = background.getClass().getSimpleName() + "@" + background.getAlpha();
            }
            String name = view.getClass().getName();
            out.append(depth).append(' ')
                    .append(name.substring(name.lastIndexOf('.') + 1))
                    .append(id.isEmpty() ? "" : " #" + id)
                    .append(' ').append(location[0]).append(',').append(location[1])
                    .append(' ').append(view.getWidth()).append('x').append(view.getHeight())
                    .append(" bg=").append(paint)
                    .append(view.getAlpha() < 1f ? " a=" + view.getAlpha() : "")
                    .append(view.willNotDraw() ? "" : " draws")
                    .append('\n');
        }
        if (visible && view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                describe(group.getChildAt(index), depth + 1, out);
            }
        }
    }

    /** Called whenever YouTube builds the player overlay. */
    public static void attach(ViewGroup controlsParent) {
        if (controlsParent == null) return;
        AmbientLightSettings.initialize(controlsParent.getContext());
        attachCount++;
        if (!Views.shouldAdoptPlayer(controlsRef.get(), controlsParent)) {
            // A muted inline preview among the related videos: moving the light to it
            // switched the light off until the main player was touched.
            ignoredPreviews++;
            if (Log.isLoggable(TAG, Log.DEBUG)) Log.d(TAG, "Ignored an inline preview player");
            return;
        }
        controlsRef = new WeakReference<>(controlsParent);
        retryCount = 0;
        mainHandler.post(AmbientLightController::ensureInstalled);
        mainHandler.removeCallbacks(maintenance);
        mainHandler.postDelayed(maintenance, INSTALL_CHECK_INTERVAL_MS);
    }

    /**
     * Keeps the light installed and the see-through page up to date about once a second.
     * This used to ride on YouTube's media-time reports, which stop at times while the video
     * plays on (for example once the comments are scrolled out of view); the page then kept
     * newly shown backgrounds opaque and the light did not come back until the player was
     * touched.
     */
    private static final Runnable maintenance = new Runnable() {
        @Override public void run() {
            ViewGroup controls = controlsRef.get();
            if (controls == null || !controls.isAttachedToWindow()) return;
            if (!controls.isShown()) {
                // Background playback or a covered player: check back now and then.
                mainHandler.postDelayed(this, HIDDEN_CHECK_INTERVAL_MS);
                return;
            }
            ensureInstalled();
            AmbientLightView view = viewRef.get();
            if (view != null) view.onPlaybackTick();
            mainHandler.postDelayed(this, INSTALL_CHECK_INTERVAL_MS);
        }
    };

    private static final long TIME_BAR_RECHECK_MS = 700L;
    private static WeakReference<View> playButtonRef = new WeakReference<>(null);
    private static int playButtonId;

    /**
     * Time bar hook: true skips drawing YouTube's thin progress line along the bottom of the
     * player while the page light shows and the controls are hidden, so nothing separates
     * the video from its light. With the controls shown the bar draws as usual.
     */
    public static boolean hideTimeBar(View timeBar) {
        try {
            if (!AmbientLightSettings.isEnabled() || !AmbientLightSettings.isHideTimeBarEnabled()) {
                return false;
            }
            AmbientLightView view = viewRef.get();
            if (view == null || !view.isPageLightShown()) return false;
            if (!controlsVisible(timeBar)) return true;
            // The bar is not always redrawn once the controls fade out (while paused, for
            // one), so look again shortly; this stops as soon as the bar is hidden.
            timeBar.postInvalidateDelayed(TIME_BAR_RECHECK_MS);
            return false;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Whether the player's play/pause button is on screen, i.e. the controls are showing. */
    private static boolean controlsVisible(View timeBar) {
        View button = playButtonRef.get();
        if (button == null || !button.isAttachedToWindow()
                || button.getRootView() != timeBar.getRootView()) {
            if (playButtonId == 0) {
                playButtonId = Views.resource(timeBar.getContext(), "id",
                        "player_control_play_pause_replay_button");
            }
            // Without the resource the controls cannot be told apart: never hide then.
            if (playButtonId == 0) return true;
            // YouTube builds the controls the first time they are shown.
            button = timeBar.getRootView().findViewById(playButtonId);
            if (button == null) return false;
            playButtonRef = new WeakReference<>(button);
        }
        if (!button.isShown()) return false;
        // The controls fade in and out by alpha.
        float alpha = 1f;
        for (View current = button; current != null && alpha > 0.01f;
             current = current.getParent() instanceof View ? (View) current.getParent() : null) {
            alpha *= current.getAlpha();
        }
        return alpha > 0.01f;
    }

    /**
     * With debug logging on for this tag (adb shell setprop log.tag.AmbientLight DEBUG), the
     * diagnostics are written to the log every 15 seconds, so a device's view tree can be
     * read without asking its owner to copy anything.
     */
    private static void logTreeForDebugging() {
        if (!Log.isLoggable(TAG, Log.DEBUG)) return;
        long now = SystemClock.uptimeMillis();
        if (now - lastTreeLogUptime < 15_000L) return;
        lastTreeLogUptime = now;
        String text = diagnostics();
        // Logcat cuts long lines; send the report in pieces.
        for (int start = 0; start < text.length(); start += 3000) {
            Log.d(TAG, "tree " + text.substring(start, Math.min(text.length(), start + 3000)));
        }
    }

    /** Media clock tick; may arrive on a player thread. */
    public static void onVideoTime() {
        long now = SystemClock.uptimeMillis();
        AmbientLightView view = viewRef.get();
        if (view != null) view.onPlaybackTick();
        if (now - lastInstallCheckMs >= INSTALL_CHECK_INTERVAL_MS) {
            lastInstallCheckMs = now;
            ViewGroup controls = controlsRef.get();
            // Media time keeps arriving during background playback; nothing to install then.
            if (controls != null && !controls.isShown()) return;
            mainHandler.post(AmbientLightController::ensureInstalled);
            // Restart the maintenance timer if the player was rebuilt without attach().
            mainHandler.removeCallbacks(maintenance);
            mainHandler.postDelayed(maintenance, INSTALL_CHECK_INTERVAL_MS);
        }
    }

    static void onSettingsChanged() {
        mainHandler.post(() -> {
            ensureInstalled();
            AmbientLightView view = viewRef.get();
            if (view != null) view.onSettingsChanged();
        });
    }

    private static long lastTreeLogUptime;

    private static void ensureInstalled() {
        ViewGroup controls = controlsRef.get();
        if (controls == null || !controls.isAttachedToWindow()) return;
        logTreeForDebugging();
        if (!AmbientLightSettings.isEnabled()) {
            AmbientLightView existing = viewRef.get();
            if (existing != null) existing.onSettingsChanged();
            AmbientPageGlowView existingPage = pageRef.get();
            if (existingPage != null) existingPage.updateSeeThrough();
            return;
        }
        try {
            View surface = null;
            ViewGroup container = null;
            ViewParent parent = controls.getParent();
            for (int level = 0; level < MAX_ANCESTOR_LEVELS && parent instanceof ViewGroup;
                 level++, parent = parent.getParent()) {
                // Related-video autoplay cards have their own (often larger) surfaces; only a
                // surface that sits under the player controls is the playing video.
                surface = findPlayerSurface((ViewGroup) parent, controls);
                if (surface != null) {
                    container = Views.commonAncestor(surface, controls);
                    break;
                }
            }
            if (surface == null || container == null) {
                if (retryCount++ < 10) {
                    mainHandler.postDelayed(AmbientLightController::ensureInstalled, 500L);
                }
                return;
            }
            View videoBranch = Views.childContaining(container, surface);
            if (videoBranch == null) return;

            AmbientLightView view = findExisting(container);
            int targetIndex = container.indexOfChild(videoBranch) + 1;
            if (view == null) {
                AmbientLightView old = viewRef.get();
                if (old != null && old.getParent() instanceof ViewGroup) {
                    ((ViewGroup) old.getParent()).removeView(old);
                }
                view = new AmbientLightView(container.getContext());
                view.setTag(VIEW_TAG);
                container.addView(view, targetIndex, new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT));
                if (Log.isLoggable(TAG, Log.DEBUG)) {
                    Log.d(TAG, "Installed in " + container.getClass().getSimpleName()
                            + " above " + videoBranch.getClass().getSimpleName()
                            + " index=" + targetIndex);
                }
            } else {
                int currentIndex = container.indexOfChild(view);
                int expectedIndex = container.indexOfChild(videoBranch) + 1;
                // The bars' light surfaces sit between the video and this layer.
                while (expectedIndex < currentIndex
                        && Views.isOwnSurface(container.getChildAt(expectedIndex))) {
                    expectedIndex++;
                }
                if (currentIndex != expectedIndex) {
                    // Keep the layer directly above the video even if YouTube reorders.
                    container.removeView(view);
                    container.addView(view, Math.min(container.indexOfChild(videoBranch) + 1,
                            container.getChildCount()));
                }
            }
            view.setVideoSurface(surface);
            AmbientPageGlowView page = ensurePageGlow(container);
            view.setPageGlowView(page);
            if (page != null) {
                View host = findWatchPage(page.getRootView(), surface);
                page.setWatchPage(host, host instanceof ViewGroup
                        ? Views.childContaining((ViewGroup) host, surface) : null);
            }
            viewRef = new WeakReference<>(view);
        } catch (Throwable throwable) {
            Log.w(TAG, "Unable to install ambient light", throwable);
        }
    }

    /**
     * Window-level layer for the light that spills out of the regular player. It is added to
     * the DecorView below the danmaku overlay (lower Z) and above all page content.
     */
    private static AmbientPageGlowView ensurePageGlow(View anchor) {
        Activity activity = Views.findActivity(anchor.getContext());
        if (activity == null || activity.getWindow() == null) return null;
        View decor = activity.getWindow().getDecorView();
        if (!(decor instanceof ViewGroup)) return null;
        ViewGroup root = (ViewGroup) decor;
        AmbientPageGlowView page = pageRef.get();
        if (page == null || page.getContext() != root.getContext()) page = findPageGlow(root);
        if (page == null) {
            page = new AmbientPageGlowView(root.getContext());
            page.setTag(PAGE_TAG);
            page.setOutlineProvider(null);
        }
        pageRef = new WeakReference<>(page);
        if (page.getParent() != root) {
            if (page.getParent() instanceof ViewGroup) {
                ((ViewGroup) page.getParent()).removeView(page);
            }
            root.addView(page, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
        // Above the page (Z 0), below the danmaku overlay (Z 10000).
        page.setElevation(9_000f);
        page.setTranslationZ(9_000f);
        return page;
    }

    private static final String[] WATCH_PAGE_IDS = {
            "next_gen_watch_layout_no_player_fragment_container", "next_gen_watch_layout",
            "watch_while_layout"
    };

    /** The view that holds the whole watch page: the player and everything around it. */
    private static View findWatchPage(View root, View surface) {
        if (root == null) return null;
        for (String name : WATCH_PAGE_IDS) {
            int id = Views.resource(root.getContext(), "id", name);
            View found = id == 0 ? null : root.findViewById(id);
            if (found instanceof ViewGroup
                    && Views.childContaining((ViewGroup) found, surface) != null) {
                return found;
            }
        }
        return null;
    }

    private static AmbientPageGlowView findPageGlow(View view) {
        if (view instanceof AmbientPageGlowView && PAGE_TAG.equals(view.getTag())) {
            return (AmbientPageGlowView) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                AmbientPageGlowView found = findPageGlow(group.getChildAt(index));
                if (found != null) return found;
            }
        }
        return null;
    }


    private static View findPlayerSurface(ViewGroup root, View controls) {
        int[] location = new int[2];
        controls.getLocationInWindow(location);
        float centerX = location[0] + controls.getWidth() / 2f;
        float centerY = location[1] + controls.getHeight() / 2f;
        return findSurfaceContaining(root, centerX, centerY, location, null);
    }

    private static View findSurfaceContaining(View view, float x, float y, int[] location,
                                              View best) {
        if (view == null || view.getVisibility() != View.VISIBLE) return best;
        if ((view instanceof SurfaceView || view instanceof TextureView) && view.isShown()
                && !Views.isOwnSurface(view)
                && view.getWidth() > 0 && view.getHeight() > 0) {
            view.getLocationInWindow(location);
            boolean contains = x >= location[0] && x <= location[0] + view.getWidth()
                    && y >= location[1] && y <= location[1] + view.getHeight();
            long area = (long) view.getWidth() * view.getHeight();
            long bestArea = best == null ? -1L : (long) best.getWidth() * best.getHeight();
            if (contains && area > bestArea) best = view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                best = findSurfaceContaining(group.getChildAt(index), x, y, location, best);
            }
        }
        return best;
    }

    private static AmbientLightView findExisting(ViewGroup container) {
        for (int index = 0; index < container.getChildCount(); index++) {
            View child = container.getChildAt(index);
            if (child instanceof AmbientLightView && VIEW_TAG.equals(child.getTag())) {
                return (AmbientLightView) child;
            }
        }
        return null;
    }

    public static boolean configEnabledByDefault() { return true; }
    public static int configBlurPercent() { return 60; }
    public static int configSpreadPercent() { return 30; }
    public static int configBrightnessPercent() { return 100; }
    public static int configSaturationPercent() { return 120; }
    public static int configFrameRate() { return 30; }
}
