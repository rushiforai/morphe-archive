package app.southstar21.extension.instagram.liquidglass;

import android.app.Activity;
import android.content.res.Resources;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

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
            "Content behind bar", "Pages run on under the bar, so it floats over them.", true,
            LiquidGlassNavBarPatch::extendContentBehindBar)
            .help("Pages reach down to the bottom of the screen and scroll on under the bar, so it floats "
                    + "over them like on iOS, and the liquid glass has something to show through it. Off, "
                    + "pages stop above the bar as they do on stock Instagram. Takes effect after Instagram "
                    + "restarts.");
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
    static final BooleanSetting WHITE_HEADER_TITLE = new BooleanSetting("liquid_glass_header_white_title",
            "White title", "The Home header's title turns white once posts scroll under it.", false, true)
            .help("The header on Home sits right over the feed, so Instagram's dark \"For you\" all but "
                    + "disappeared over dark photos. With this on it turns white, with a soft shadow, once "
                    + "posts scroll under it, and keeps Instagram's own color at the top of the feed and "
                    + "while the stories tray hangs below the header.");
    static final BooleanSetting GLASS_HEADER_BUTTONS = new BooleanSetting("liquid_glass_header_buttons",
            "Glass header buttons", "The header's icons get glass circles once you scroll, like iOS.", true, true)
            .help("On iOS 26 the buttons in the Home and Explore headers (new post, notifications, saved, "
                    + "more) blend into the header at the top of the feed and get round pieces of glass once "
                    + "it scrolls. Takes effect after Instagram restarts.");
    static final BooleanSetting REELS_BLUR = new BooleanSetting("liquid_glass_reels_blur",
            "Blur under Reels", "Reels run behind the bar, with a frosted strip under the caption that "
            + "scrolls with each reel.", true, true)
            .help("Like on iOS 26: on the Reels tab each reel reaches down behind the bar, and the strip of "
                    + "it under the caption is a frosted copy of the video. The strip is part of the reel, so "
                    + "it slides away with it while you scroll. Needs the liquid glass bar and Blur videos "
                    + "behind the bar. Takes effect after Instagram restarts.");
    static final BooleanSetting REELS_FULL_SCREEN = new BooleanSetting("liquid_glass_reels_full_screen",
            "Full screen", "Reels fill the whole screen, up behind the status bar, like on iOS 26.", false, true)
            .help("Like on iOS 26: each reel is zoomed to fill the screen from top to bottom, so the video "
                    + "also shows behind the status bar and the clock, and only a little of its sides is cut "
                    + "off. While you swipe between reels the strip behind the status bar holds still, blurred, "
                    + "and comes into focus on the next reel as it arrives. Off, reels fill the page below the "
                    + "status bar, which stays black.");
    static final BooleanSetting REELS_CLEAR_GLASS = new BooleanSetting("liquid_glass_reels_clear_glass",
            "Clear glass on Reels", "The bar turns to clearer glass over Reels, so the video shows "
            + "through it.", false, true)
            .help("Like on iOS 26: over a reel the bar is much clearer glass than over the feed, and the video "
                    + "plays on visibly through it. Off, the bar keeps the same tint on every tab, set by "
                    + "Opacity on the bar's page.");
    /** The bar's style, picked with the two cards on its page: a solid pill, or liquid glass. */
    static final BooleanSetting SOLID = new BooleanSetting("liquid_glass_solid",
            "Solid", "A plain floating bar: by far the lightest, recommended for older phones.", false,
            LiquidGlassNavBarPatch::solidByDefault);

    /**
     * Solid is the default on fresh installs, the lightest bar on any phone. Installs that had the
     * patch before this choice existed keep the liquid glass they had. Decided on first run and
     * stored, so later updates and resetting don't flip it.
     */
    private static boolean solidByDefault() {
        Boolean solid = app.southstar21.extension.instagram.settings.Settings.decideOnce(
                "liquid_glass_solid_default", () -> {
                    android.content.Context context =
                            app.southstar21.extension.instagram.settings.Settings.applicationOrNull();
                    if (context == null) throw new IllegalStateException("No application yet");
                    android.content.pm.PackageInfo info =
                            context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
                    // Never updated since it was installed: a fresh install.
                    return info.lastUpdateTime - info.firstInstallTime < 1000;
                });
        return solid == null || solid;
    }
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
    static final BooleanSetting GLASS_COMMENTS = new BooleanSetting("liquid_glass_comments",
            "Glass comments", "The comments become a sheet of frosted glass, like the share menu.", false, false)
            .help("The comments that open from the speech bubble on a reel or a post become a sheet of "
                    + "frosted glass with the reel or the feed blurred behind it, reaching down to the bottom "
                    + "of the screen, like the share menu. The field you type a comment in gets glass too. "
                    + "Takes effect the next time you open the comments.");
    static final BooleanSetting SWITCH_AFTER_GLIDE = new BooleanSetting("liquid_glass_switch_after_glide",
            "Switch after the glide", "A tapped tab opens once the selection has glided to it, so the "
            + "page switch doesn't stutter the glide.", false, true)
            .help("Instagram pauses for a moment while it builds the page you tapped. Normally that pause "
                    + "lands right as the selection starts gliding and makes it stutter. With this on, the "
                    + "selection glides over first and the page opens as it arrives, a fraction of a second "
                    + "later. Taps on the selected tab and long presses work as before.");
    static final BooleanSetting HAPTICS = new BooleanSetting("liquid_glass_haptics",
            "Haptics", "A tick when the selection glides over a tab.", false, true)
            .help("A light tick each time the selection glides over another tab while you drag it.");

    public static final PatchSettings SETTINGS = new PatchSettings("liquid_glass",
            "Navigation bar",
            "A floating tab bar: a solid pill, or iOS 26 style liquid glass.",
            LiquidGlassNavBarPatch::isIncluded,
            new SettingsGroup("Behavior", EXTEND_CONTENT, SHRINK_ON_SCROLL,
                    NavbarStyle.SHRUNK_SIZE.shownWhen(SHRINK_ON_SCROLL), SWITCH_AFTER_GLIDE, HAPTICS))
            .header(NavbarPreview::styleCards)
            .unlisted(SOLID)
            .customize("Customize solid bar", "Color, shape and selection, with a live preview.",
                    NavbarPreview::solidCustomizer,
                    new SettingsGroup("Bar", NavbarStyle.TINT, NavbarStyle.RIM, NavbarStyle.SHADOW),
                    new SettingsGroup("Shape", NavbarStyle.HEIGHT, NavbarStyle.SIDE_MARGIN,
                            NavbarStyle.BOTTOM_GAP, NavbarStyle.ROUNDNESS, NavbarStyle.TAB_INSET),
                    new SettingsGroup("Selection", NavbarStyle.SELECTION_SHADE, NavbarStyle.SELECTION_WIDTH,
                            NavbarStyle.SELECTION_INSET))
            .customize("Customize liquid glass", "Glass, shape and selection, with a live preview.",
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
                            NavbarStyle.DROP_SIZE.shownWhen(SOUTHSTAR21_STYLE)),
                    new SettingsGroup("Videos", BLUR_VIDEOS))
            .chooseCustomize(() -> SOLID.get() ? 0 : 1)
            .demos(NavbarPreview::demo)
            .icon(Icons.Glyph.GLASS, 0xFF5E5CE6)
            .about("Turns the bottom tab bar into a pill floating over the page, in one of two styles. Solid "
                    + "is a plain bar in the material color, by far the lightest on the phone and the one to pick "
                    + "on an older phone. Liquid Glass is the "
                    + "iOS 26 look: what scrolls behind it is blurred and bent at the edges and the selected "
                    + "tab sits in a glass droplet you can drag along the bar (blur needs Android 12, "
                    + "refraction Android 13). Either way the bar shrinks while you scroll down.",
                    "It's a look. It brings the design of Instagram on iPhone to Android, and doesn't change "
                    + "how anything works.");

    /**
     * The glass beyond the tab bar: the header, Reels and the sheets. Its own entry in the menu, but
     * part of the same patch, and it works together with the navigation bar.
     */
    public static final PatchSettings EFFECTS = new PatchSettings("glass_effects",
            "Liquid Glass",
            "iOS 26 style glass on the header, Reels, the share menu and comments.",
            LiquidGlassNavBarPatch::isIncluded,
            new SettingsGroup("Header", "Works together with the navigation bar, which needs to be on.",
                    HEADER_BLUR, GLASS_HEADER_BUTTONS.shownWhen(HEADER_BLUR),
                    WHITE_HEADER_TITLE.shownWhen(HEADER_BLUR)),
            new SettingsGroup("Reels", REELS_BLUR, REELS_FULL_SCREEN.shownWhen(REELS_BLUR),
                    REELS_CLEAR_GLASS.shownWhen(REELS_BLUR)),
            new SettingsGroup("Sheets", GLASS_SHARE_MENU, GLASS_COMMENTS))
            .demos(NavbarPreview::demo)
            .icon(Icons.Glyph.DROP, 0xFF32ADE6)
            .about("Brings iOS 26's glass to more of Instagram. On Home and Explore the feed runs on under the "
                    + "header and the status bar and is blurred towards the top of the screen, and the "
                    + "header's buttons get round pieces of glass once you scroll. On Reels each reel runs "
                    + "behind the bar with a frosted strip under its caption that scrolls with it, filling "
                    + "the screen up behind the status bar, and the bar turns to clearer glass. The share "
                    + "menu, and if you like the comments, become "
                    + "sheets of frosted glass.",
                    "It's a look, like the navigation bar's. It doesn't change how anything works.");

    /** Whether one of the {@link #EFFECTS} is switched on, with the entry itself on. */
    static boolean effect(BooleanSetting setting) {
        return EFFECTS.isActive() && setting.get();
    }

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
            // A solid bar can't see videos anyway: keep Instagram's lighter SurfaceView player.
            if (original && SETTINGS.isActive() && BLUR_VIDEOS.get() && !SOLID.get()) return false;
        } catch (Throwable t) {
            Log.e(TAG, "SurfaceView check failed", t);
        }
        return original;
    }

    /** Called by {@link InstagramHooks} when the navigation bar or the other glass is switched on. */
    public static void onMainActivityReady(Activity activity) {
        try {
            if (EFFECTS.isActive()) ShareSheetGlass.watch(activity);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to watch for the share sheet", t);
        }
        if (!SETTINGS.isActive()) return;
        installTabBar(activity);
    }

    /**
     * Installs on the tab bar before Instagram draws it, so its own bar never shows at launch
     * (issue #14). Called when the main activity starts: its layout is set, but the tab bar may
     * still be on its way, so each frame looks for it until it's there. The frame it turns up in
     * is skipped and drawn again with the pill's layout. {@link #onMainActivityReady} stays as
     * the fallback.
     */
    public static void installBeforeFirstDraw(Activity activity) {
        // Looked up once: until the bar turns up (the whole login screen, say) this runs every frame.
        int barId = findId(activity, "tab_bar");
        if (barId == 0) return;
        View decor = activity.getWindow().getDecorView();
        decor.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                try {
                    if (activity.isFinishing() || activity.isDestroyed()) {
                        decor.getViewTreeObserver().removeOnPreDrawListener(this);
                        return true;
                    }
                    View bar = activity.findViewById(barId);
                    if (bar == null) return true;
                    decor.getViewTreeObserver().removeOnPreDrawListener(this);
                    if (installed.containsKey(bar)) return true;
                    // Skip this frame only if the pill went in: it still has the stock layout.
                    return !installTabBar(activity);
                } catch (Throwable t) {
                    decor.getViewTreeObserver().removeOnPreDrawListener(this);
                    Log.e(TAG, "Early tab bar install failed", t);
                    return true;
                }
            }
        });
    }

    /** @return whether the glass was installed now (false if it already was, or failed) */
    private static boolean installTabBar(Activity activity) {
        try {
            View bar = findView(activity, "tab_bar");
            if (!(bar instanceof ViewGroup) || installed.containsKey(bar)) return false;
            if (!(bar.getParent() instanceof ViewGroup)) return false;

            LiquidGlassController controller = new LiquidGlassController(
                    (ViewGroup) bar,
                    findView(activity, "tab_bar_shadow"),
                    EXTEND_CONTENT.get()
            );
            controller.install();
            installed.put(bar, controller);
            return true;
        } catch (Throwable t) {
            // Never take the app down over a cosmetic patch.
            Log.e(TAG, "Failed to install liquid glass tab bar", t);
            return false;
        }
    }

    static View findView(Activity activity, String name) {
        int id = findId(activity, name);
        return id == 0 ? null : activity.findViewById(id);
    }

    private static int findId(Activity activity, String name) {
        Resources res = activity.getResources();
        // Resources keep the original package name even if the app was cloned/renamed.
        int id = res.getIdentifier(name, "id", "com.instagram.android");
        if (id == 0) id = res.getIdentifier(name, "id", activity.getPackageName());
        return id;
    }
}
