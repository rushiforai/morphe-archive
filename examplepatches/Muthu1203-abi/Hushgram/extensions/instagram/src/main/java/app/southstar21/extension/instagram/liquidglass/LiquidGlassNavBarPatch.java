package app.southstar21.extension.instagram.liquidglass;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.util.WeakHashMap;
import java.lang.ref.WeakReference;

import app.southstar21.extension.instagram.settings.BooleanSetting;
import app.southstar21.extension.instagram.settings.Icons;
import app.southstar21.extension.instagram.settings.IntSetting;
import app.southstar21.extension.instagram.settings.PatchSettings;
import app.southstar21.extension.instagram.settings.ProfileSettingsButton;
import app.southstar21.extension.instagram.settings.Settings;
import app.southstar21.extension.instagram.settings.SettingsGroup;
import app.hushgram.extension.instagram.settings.SettingsStatus;

/**
 * Liquid Glass patch: entry point and settings.
 */
@SuppressWarnings("unused")
public final class LiquidGlassNavBarPatch {
    static final String TAG = "LiquidGlass";

    private static final WeakHashMap<View, LiquidGlassController> installed = new WeakHashMap<>();
    private static volatile WeakReference<Activity> front = new WeakReference<>(null);
    private static volatile int navigationInset;

    static final IntSetting BLUR_RADIUS = new IntSetting("liquid_glass_blur_radius",
            "Blur radius", "How frosted the glass is.", false,
            0, 40, "dp", LiquidGlassNavBarPatch::blurRadiusDp)
            .help("How much what's behind the bar is blurred. iOS Instagram barely blurs, so you can still make out the feed; higher values frost the glass.");
    static final IntSetting REFRACTION = new IntSetting("liquid_glass_refraction",
            "Refraction", "How strongly the glass edge bends what's behind it.", false,
            0, 100, "%", LiquidGlassNavBarPatch::refractionPercent)
            .help("How strongly the rim of the glass bends what's behind it, like the edge of a thick lens.");
    static final IntSetting EDGE_COLORS = new IntSetting("liquid_glass_edge_colors",
            "Edge colors", "Rainbow fringing at the edge of the selection drop, like real glass.", false,
            0, 100, "%", () -> 50)
            .help("When the selection drop is pressed, its edge splits light into rainbow fringes, strongest at the corners, like real glass. Needs Android 13 or newer.");
    static final BooleanSetting SOUTHSTAR21_STYLE = new BooleanSetting("liquid_glass_southstar21_style",
            "southstar21 style", "Thicker glass that bends what's behind it towards the edges. A press swells "
            + "the selection into a magnifying drop of glass that wobbles and stretches as you drag it, "
            + "and the bar shrinks back, leans and glows under your finger.", false, false)
            .help("Changes how the bar moves and how thick its glass is. A press swells the selection into a magnifying drop that wobbles and stretches as you drag it, and the bar shrinks back behind it, leans and glows under your finger.");
    static final BooleanSetting GLASS_WHILE_DRAGGING = new BooleanSetting("liquid_glass_glass_while_dragging",
            "Glass while dragging", "The selection turns into clear glass while you press or drag it.", false,
            false)
            .help("On stock iOS the selected tab's grey capsule stays grey while you press and drag it along "
                    + "the bar. Turn this on and it turns into a piece of clear glass instead, with a lit rim and "
                    + "colored fringes at its edge. Applies to the iOS style; the southstar21 style always uses "
                    + "its glass drop.");
    static final BooleanSetting GLASSY_PILL = new BooleanSetting("liquid_glass_glassy_pill",
            "3D selection pill", "The selected tab's pill gets a glass body with a highlight, rim and shadow.", false,
            false)
            .help("Gives the selected tab's resting capsule a glass body: a shadow, a highlight on top and a bright rim.");
    static final BooleanSetting EXTEND_CONTENT = new BooleanSetting("liquid_glass_extend_content",
            "Content behind bar", "Feeds scroll under the bar so there's something to see through the glass.", true,
            LiquidGlassNavBarPatch::extendContentBehindBar);
    static final BooleanSetting SHRINK_ON_SCROLL = new BooleanSetting("liquid_glass_shrink_on_scroll",
            "Shrink while scrolling", "Scrolling down shrinks the bar, scrolling up restores it.", false, true)
            .help("Scrolling down a feed shrinks the bar out of the way, scrolling back up brings it back.");
    static final BooleanSetting BLUR_VIDEOS = new BooleanSetting("liquid_glass_blur_videos",
            "Blur videos behind the bar", "Plays videos so the glass can see them, and blurs them like the rest "
            + "of the feed.", true, true)
            .help("Instagram plays videos in a separate layer that apps can't read, so over a playing video the "
                    + "glass and the blur at the bottom of the screen had nothing to blur. With this on, videos "
                    + "play the other way Instagram supports, which the glass can see. Takes effect after "
                    + "Instagram restarts.");
    static final BooleanSetting HAPTICS = new BooleanSetting("liquid_glass_haptics",
            "Haptics", "A tick when the selection glides over a tab.", false, true)
            .help("A light tick each time the selection glides over another tab while you drag it.");

    static final BooleanSetting GLASS_SHEETS = new BooleanSetting("liquid_glass_sheets",
            "Glass sheets", "Comments, share and menu sheets become frosted glass, with the reel still showing behind.",
            false, true)
            .help("Sheets that slide up from the bottom, like comments, the share sheet and a post's menu, become "
                    + "frosted glass: on Android 12 and newer the reel or page behind shows through them, blurred, and "
                    + "stays visible above them under a lighter shade. Search and message boxes turn into glass pills, "
                    + "profile pictures get a glass ring and Send turns purple glass.");

    public static final PatchSettings SETTINGS = new PatchSettings("liquid_glass",
            "Liquid Glass",
            "iOS 26 style glass tab bar. Defaults come from the patch options in Morphe Manager.",
            LiquidGlassNavBarPatch::isIncluded,
            new SettingsGroup("Behavior", EXTEND_CONTENT, SHRINK_ON_SCROLL,
                    NavbarStyle.SHRUNK_SIZE.shownWhen(SHRINK_ON_SCROLL), BLUR_VIDEOS, HAPTICS, GLASS_SHEETS))
            .customize("Customize navbar", "Glass, shape and selection, with a live preview.",
                    NavbarPreview::customizer,
                    new SettingsGroup("Style", "Liquid Glass, Transparent, Material or Neon Glow. The southstar21 style "
                            + "moves differently: the bar shrinks back and leans under your finger and the "
                            + "selection becomes a drop of glass.",
                            NavbarStyle.BAR_STYLE, SOUTHSTAR21_STYLE),
                    new SettingsGroup("Glass", "Refraction needs Android 13+, blur needs Android 12+.",
                            BLUR_RADIUS, REFRACTION, NavbarStyle.OPACITY, NavbarStyle.VIBRANCY,
                            NavbarStyle.EDGE_CLARITY, NavbarStyle.RIM, NavbarStyle.GLARE,
                            NavbarStyle.SHADOW, NavbarStyle.TINT),
                    new SettingsGroup("Shape", NavbarStyle.HEIGHT, NavbarStyle.SIDE_MARGIN,
                            NavbarStyle.BOTTOM_GAP, NavbarStyle.VERTICAL_POSITION,
                            NavbarStyle.ROUNDNESS, NavbarStyle.TAB_INSET),
                    new SettingsGroup("Bottom gap by page", "Tap a tab in the preview to see its page-specific gap.",
                            NavbarStyle.FEED_BOTTOM_GAP, NavbarStyle.REELS_BOTTOM_GAP,
                            NavbarStyle.MESSAGES_BOTTOM_GAP, NavbarStyle.EXPLORE_BOTTOM_GAP,
                            NavbarStyle.PROFILE_BOTTOM_GAP),
                    new SettingsGroup("Reels", NavbarStyle.REEL_SEEK_BAR_POSITION),
                    new SettingsGroup("Selection", "Edge colors need Android 13+.",
                            NavbarStyle.INDICATOR, NavbarStyle.SELECTION_SHADE, NavbarStyle.SELECTION_WIDTH,
                            NavbarStyle.SELECTION_INSET, GLASSY_PILL, GLASS_WHILE_DRAGGING, EDGE_COLORS,
                            NavbarStyle.DROP_SIZE.shownWhen(SOUTHSTAR21_STYLE)))
            .demos(NavbarPreview::demo)
            .icon(Icons.Glyph.GLASS, 0xFF5E5CE6)
            .about("Turns the bottom tab bar into a floating glass pill in the style of iOS 26. What scrolls "
                    + "behind it is blurred and bent at the edges, the selected tab sits in a glass droplet you "
                    + "can drag along the bar, and the bar shrinks while you scroll down. Blur needs Android 12 "
                    + "and refraction Android 13, older phones get a tinted pill.",
                    "It's a look. It brings the design of Instagram on iPhone to Android, and doesn't change "
                    + "how anything works.");

    /** The patch makes this return true, so the menu only shows patches that were applied. */
    public static boolean isIncluded() {
        return false;
    }

    /** One switch in HushGram controls the bar; the source settings page keeps its own enable switch too. */
    public static boolean isActive() {
        try {
            return isIncluded() && SETTINGS.isActive() && SettingsStatus.liquidGlassNavBar()
                    && app.hushgram.extension.instagram.settings.Settings.GLASS_TAB_BAR.get();
        } catch (Throwable t) {
            Log.e(TAG, "Liquid Glass active check failed", t);
            return false;
        }
    }

    /** HushGram's Reels layout uses this switch to keep the video under the new pill. */
    public static boolean reelsBehindBar() {
        try {
            return isActive() && app.hushgram.extension.instagram.settings.Settings.GLASS_TAB_BAR_REELS_BEHIND.get();
        } catch (Throwable t) {
            return false;
        }
    }

    /** Extra vertical adjustment for the Reels seek bar; positive values lift it. */
    public static int reelSeekBarOffsetDp() {
        try {
            return NavbarStyle.REEL_SEEK_BAR_POSITION.get();
        } catch (Throwable t) {
            Log.e(TAG, "Reel seek bar position unavailable", t);
            return 0;
        }
    }

    public static Activity activityInFront() { return front.get(); }

    /** FullScreenBars asks the new floating bar whether it can take the navigation inset. */
    public static int navBarHeight(int height) {
        Activity activity = front.get();
        if (!isActive() || !extendContentBehindBar() || activity == null || !hasInstalledBar(activity)) return height;
        if (height > 0) navigationInset = height;
        return 0;
    }

    public static int navBarHeight(int height, int hidden) {
        if (height <= 0 || hidden > 0) return height;
        return navBarHeight(height);
    }

    public static int navBarHeightOverTheKeyboard(int height) { return height; }
    public static void navBarHeightTaken(int height, boolean hidden) { }
    public static void heightsTold() { }

    public static int cameraNavBarHeight(int kept) { return kept <= 0 ? navigationInset : kept; }

    public static boolean wearsGlass(View view) {
        return view != null && isActive() && installed.containsKey(view);
    }

    public static boolean wearsFloatingGlass(View view) {
        return wearsGlass(view) && extendContentBehindBar();
    }

    private static boolean hasInstalledBar(Activity activity) {
        for (View bar : installed.keySet()) {
            if (bar != null && bar.isAttachedToWindow() && bar.getVisibility() == View.VISIBLE
                    && bar.getRootView() == activity.getWindow().getDecorView()) return true;
        }
        return false;
    }

    // The three methods below are overwritten by the patch with the chosen option values,
    // which become the defaults of the settings above.

    public static int blurRadiusDp() {
        return 4;
    }

    public static int refractionPercent() {
        return 60;
    }

    public static boolean extendContentBehindBar() {
        return true;
    }

    /**
     * Called by the patch with the video player's answer to "play in a SurfaceView?". A
     * SurfaceView is a layer of its own the glass can't record, so with Blur videos on this says
     * no and Instagram uses its TextureView player, which draws with the rest of the app.
     */
    public static boolean useSurfaceView(boolean original) {
        try {
            // isActive(), not SETTINGS.isActive(): with the bar switched off in HushGram, videos
            // keep Instagram's cheaper SurfaceView player.
            if (original && isActive() && BLUR_VIDEOS.get()) return false;
        } catch (Throwable t) {
            Log.e(TAG, "SurfaceView check failed", t);
        }
        return original;
    }

    private static boolean registered;

    public static void install(Context context) {
        try {
            if (registered || !(context instanceof Application)) return;
            registered = true;
            Settings.init(context);
            ((Application) context).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}
                @Override public void onActivityStarted(Activity activity) {}
                @Override public void onActivityResumed(Activity activity) {
                    front = new WeakReference<>(activity);
                    // Sheets open over any screen, so every activity is watched; the switch is read at each look.
                    if (isIncluded()) GlassSheets.watch(activity);
                    if (isMainActivity(activity) && isIncluded()) {
                        ProfileSettingsButton.ensureInstalled(activity);
                        if (isActive()) {
                            onMainActivityReady(activity);
                        }
                    }
                }
                @Override public void onActivityPaused(Activity activity) {
                    if (front.get() == activity) front = new WeakReference<>(null);
                }
                @Override public void onActivityStopped(Activity activity) {}
                @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}
                @Override public void onActivityDestroyed(Activity activity) {
                    GlassSheets.forget(activity);
                    forgetBarsOf(activity);
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Failed to install liquid glass", t);
        }
    }

    /**
     * Each controller holds its bar strongly, so the WeakHashMap alone would never let go of a
     * bar (and with it the whole old activity) after a recreate or theme change.
     */
    private static void forgetBarsOf(Activity activity) {
        try {
            java.util.Iterator<View> bars = installed.keySet().iterator();
            while (bars.hasNext()) {
                View bar = bars.next();
                if (bar == null || activityOf(bar.getContext()) == activity) bars.remove();
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to release liquid glass bars", t);
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof android.content.ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((android.content.ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static boolean isMainActivity(Activity activity) {
        return activity != null && "com.instagram.mainactivity.InstagramMainActivity".equals(activity.getClass().getName());
    }

    /** Called by {@link InstagramHooks} when this patch is included and switched on. */
    public static void onMainActivityReady(Activity activity) {
        try {
            if (!isActive()) return;
            View bar = findView(activity, "tab_bar");
            if (!(bar instanceof ViewGroup) || installed.containsKey(bar)) return;
            if (!(bar.getParent() instanceof ViewGroup)) return;

            LiquidGlassController controller = new LiquidGlassController(
                    (ViewGroup) bar,
                    findView(activity, "tab_bar_shadow"),
                    EXTEND_CONTENT.get()
            );
            controller.install();
            installed.put(bar, controller);
        } catch (Throwable t) {
            // Never take the app down over a cosmetic patch.
            Log.e(TAG, "Failed to install liquid glass tab bar", t);
        }
    }

    static View findView(Activity activity, String name) {
        Resources res = activity.getResources();
        // Resources keep the original package name even if the app was cloned/renamed.
        int id = res.getIdentifier(name, "id", "com.instagram.android");
        if (id == 0) id = res.getIdentifier(name, "id", activity.getPackageName());
        return id == 0 ? null : activity.findViewById(id);
    }
}