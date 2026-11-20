package app.southstar21.extension.instagram.liquidglass;

import android.app.Activity;
import android.content.res.Resources;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.util.WeakHashMap;

import app.southstar21.extension.instagram.InstagramHooks;
import app.southstar21.extension.instagram.settings.BooleanSetting;
import app.southstar21.extension.instagram.settings.Icons;
import app.southstar21.extension.instagram.settings.IntSetting;
import app.southstar21.extension.instagram.settings.PatchSettings;
import app.southstar21.extension.instagram.settings.SettingsGroup;

/**
 * Liquid Glass patch: entry point and settings.
 */
@SuppressWarnings("unused")
public final class LiquidGlassNavBarPatch {
    static final String TAG = "LiquidGlass";

    private static final WeakHashMap<View, LiquidGlassController> installed = new WeakHashMap<>();

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
    static final BooleanSetting HEADER_BLUR = new BooleanSetting("liquid_glass_header_blur",
            "Blur under the header", "Home and Explore scroll under a frosted header, up to the top of the "
            + "screen.", true, true)
            .help("Like the blur behind the bar at the bottom: on Home and Explore the feed runs under the "
                    + "header and the status bar, and is blurred and faded towards the top edge of the "
                    + "screen. Takes effect after Instagram restarts.");
    static final BooleanSetting GLASS_HEADER_BUTTONS = new BooleanSetting("liquid_glass_header_buttons",
            "Glass header buttons", "The header's icons get glass circles once you scroll, like iOS.", true, true)
            .help("On iOS 26 the buttons in the Home and Explore headers (new post, notifications, saved, "
                    + "more) blend into the header at the top of the feed and get round pieces of glass once "
                    + "it scrolls. Takes effect after Instagram restarts.");
    static final BooleanSetting TILT_LIGHT = new BooleanSetting("liquid_glass_tilt_light",
            "Tilt light", "The glass catches the light as you tilt the phone.", false, false)
            .help("Like on iOS 26, a glint of light slides along the edge of the glass as you tilt the phone. It "
                    + "uses the motion sensor while the glass is on screen, which costs a little battery. Held at "
                    + "any angle, the glint slowly settles back to the top left.");
    static final BooleanSetting GLASS_SHARE_MENU = new BooleanSetting("liquid_glass_share_menu",
            "Glass share menu", "The share sheet becomes a sheet of frosted glass, like on iOS 26.", true, true)
            .help("The menu that opens from the paper plane on a post or reel becomes a sheet of frosted "
                    + "glass with the feed blurred behind it, reaching down to the bottom of the screen. Its "
                    + "search field and the grey share buttons (Add to story, Copy link and the rest) get "
                    + "glass too. Other menus stay as they are. Takes effect the next time you open the menu.");
    static final BooleanSetting HAPTICS = new BooleanSetting("liquid_glass_haptics",
            "Haptics", "A tick when the selection glides over a tab.", false, true)
            .help("A light tick each time the selection glides over another tab while you drag it.");

    public static final PatchSettings SETTINGS = new PatchSettings("liquid_glass",
            "Liquid Glass",
            "iOS 26 style glass tab bar. Defaults come from the patch options in Morphe Manager.",
            LiquidGlassNavBarPatch::isIncluded,
            new SettingsGroup("Behavior", EXTEND_CONTENT, SHRINK_ON_SCROLL,
                    NavbarStyle.SHRUNK_SIZE.shownWhen(SHRINK_ON_SCROLL), HEADER_BLUR, GLASS_HEADER_BUTTONS.shownWhen(HEADER_BLUR), GLASS_SHARE_MENU, BLUR_VIDEOS, HAPTICS))
            .customize("Customize navbar", "Glass, shape and selection, with a live preview.",
                    NavbarPreview::customizer,
                    new SettingsGroup("Style", "The southstar21 style moves differently: the bar shrinks back "
                            + "and leans under your finger and the selection becomes a drop of glass.",
                            SOUTHSTAR21_STYLE),
                    new SettingsGroup("Glass", "Refraction needs Android 13+, blur needs Android 12+.",
                            BLUR_RADIUS, REFRACTION, NavbarStyle.OPACITY, NavbarStyle.VIBRANCY,
                            NavbarStyle.EDGE_CLARITY, NavbarStyle.RIM, NavbarStyle.GLARE,
                            NavbarStyle.SHADOW, NavbarStyle.TINT, TILT_LIGHT),
                    new SettingsGroup("Shape", NavbarStyle.HEIGHT, NavbarStyle.SIDE_MARGIN,
                            NavbarStyle.BOTTOM_GAP, NavbarStyle.ROUNDNESS, NavbarStyle.TAB_INSET),
                    new SettingsGroup("Selection", "Edge colors need Android 13+.",
                            NavbarStyle.SELECTION_SHADE, NavbarStyle.SELECTION_WIDTH,
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
            if (original && SETTINGS.isActive() && BLUR_VIDEOS.get()) return false;
        } catch (Throwable t) {
            Log.e(TAG, "SurfaceView check failed", t);
        }
        return original;
    }

    /** Called by {@link InstagramHooks} when this patch is included and switched on. */
    public static void onMainActivityReady(Activity activity) {
        try {
            ShareSheetGlass.watch(activity);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to watch for the share sheet", t);
        }
        try {
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
