/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.extension;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.os.Build;
import android.util.Log;
import android.view.View;

import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Entry point of the "Liquid Glass" patch.
 * <p>
 * The patch inserts a call to {@link #drawBlurView(View, Canvas)} at the start of
 * {@code eightbitlab.com.blurview.BlurView.draw(Canvas)}. When it returns true the glass has been
 * drawn, and the patched method only draws the background and the children of the BlurView
 * (super.draw), skipping the original blur.
 * <p>
 * The configuration methods below return the defaults of the patch options. The patch replaces
 * their bodies with the values chosen in Morphe, so they must keep their names and signatures.
 */
@SuppressWarnings("unused")
public final class LiquidGlassPatch {

    static final String TAG = "LiquidGlass";

    // region Patch options (bodies replaced while patching)

    /** Blur radius of the content behind the glass, in dp. 0 keeps the glass clear. */
    public static int blurRadiusDp() {
        return 0;
    }

    /** Width of the bent band along the edges, in dp. 0 disables the refraction. */
    public static int refractionHeightDp() {
        return 24;
    }

    /** How far the content is displaced at the very edge, in dp. */
    public static int refractionAmountDp() {
        return 24;
    }

    /** Saturation of the content behind the glass, in percent (100 = unchanged). */
    public static int saturationPercent() {
        return 150;
    }

    /** Opacity kept from Apple's translucent material over the glass, in percent. */
    public static int tintOpacityPercent() {
        return 40;
    }

    /** Intensity of the specular rim, in percent. */
    public static int highlightPercent() {
        return 100;
    }

    /** Splits the refracted edge into colors. */
    public static boolean chromaticAberration() {
        return false;
    }

    /** Also applies the glass to the floating search bar and the tablet top bar. */
    public static boolean applyToSearchBar() {
        return true;
    }

    /** Also applies the glass to the sidebar of tablets. */
    public static boolean applyToSidebar() {
        return true;
    }

    /** Draws the tab bar with LiquidBottomTabs, the liquid tab bar of Backdrop, and its drop. */
    public static boolean liquidTabBar() {
        return true;
    }

    /** Shows the names of the tabs under their icons, in the liquid tab bar. */
    public static boolean tabLabels() {
        return true;
    }

    /** Hides the New tab from the liquid tab bar. */
    public static boolean hideNewTab() {
        return false;
    }

    /** Hides the Radio tab from the liquid tab bar. */
    public static boolean hideRadioTab() {
        return false;
    }

    /** Tab selected when the app starts: home, new, radio, library or search. */
    public static String startTab() {
        return "home";
    }

    /** Light haptic feedback when the active tab changes. */
    public static boolean tabHaptics() {
        return true;
    }

    // endregion

    /**
     * A BlurView of Apple Music that gets the glass, by resource entry name.
     */
    static final class Surface {
        /** Resource entry name of the view drawn over the BlurView, whose tint is faded. */
        final String contentIdName;
        final boolean optional;

        Surface(String contentIdName, boolean optional) {
            this.contentIdName = contentIdName;
            this.optional = optional;
        }
    }

    private static final String SIDEBAR = "drawer_blur";
    private static final Map<String, Surface> SURFACES = new HashMap<>();

    static {
        // fragment_music_content.xml: floating tab bar (BottomNavigationView) and mini player.
        SURFACES.put("bottom_nav_blur", new Surface("bottom_nav_view", false));
        SURFACES.put("mini_player_blur", new Surface("mini_player_content", false));
        // fragment_landing_search.xml and the tablet layouts.
        SURFACES.put("floating_search_bar_blur", new Surface(null, true));
        SURFACES.put("top_nav_blur", new Surface(null, true));
        // layout-w600dp/activity_main.xml: the sidebar of tablets, with the navigation over it.
        SURFACES.put(SIDEBAR, new Surface("drawer_nav_view", false));
    }

    private static final WeakHashMap<View, GlassRenderer> RENDERERS = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> SKIPPED = new WeakHashMap<>();
    private static final Map<String, Integer> IDS = new HashMap<>();

    private LiquidGlassPatch() {
    }

    /**
     * Injected at the start of BlurView.draw(Canvas).
     *
     * @return true if the glass was drawn, false to run the original BlurView code.
     */
    public static boolean drawBlurView(View blurView, Canvas canvas) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return false;
        if (blurView == null || canvas == null || !canvas.isHardwareAccelerated()) return false;

        try {
            if (SKIPPED.containsKey(blurView)) return false;
            LiquidSettings.init(blurView.getContext());

            GlassRenderer renderer = RENDERERS.get(blurView);
            if (renderer == null) {
                Surface surface = surfaceOf(blurView);
                if (surface == null) {
                    SKIPPED.put(blurView, Boolean.TRUE);
                    return false;
                }
                renderer = new GlassRenderer(blurView, surface);
                RENDERERS.put(blurView, renderer);
            }
            return renderer.draw(blurView, canvas);
        } catch (Throwable t) {
            // Never break the app: fall back to Apple's blur for this view.
            Log.e(TAG, "Liquid Glass disabled for " + blurView, t);
            SKIPPED.put(blurView, Boolean.TRUE);
            RENDERERS.remove(blurView);
            return false;
        }
    }

    private static Surface surfaceOf(View view) {
        final int id = view.getId();
        if (id == View.NO_ID) return null;
        final String name;
        try {
            name = view.getResources().getResourceEntryName(id);
        } catch (Resources.NotFoundException e) {
            return null;
        }
        Surface surface = SURFACES.get(name);
        if (surface == null || (surface.optional && !LiquidSettings.applyToSearchBar())) return null;
        if (SIDEBAR.equals(name) && !LiquidSettings.applyToSidebar()) return null;
        return surface;
    }

    /**
     * Resolves an id of Apple Music by name, in the resource package of {@code anchor}
     * (works even if the package name of the app was changed by another patch).
     */
    static int idOf(View anchor, String name) {
        Integer cached = IDS.get(name);
        if (cached != null) return cached;
        int id = 0;
        try {
            Resources resources = anchor.getResources();
            String packageName = resources.getResourcePackageName(anchor.getId());
            id = resources.getIdentifier(name, "id", packageName);
        } catch (Resources.NotFoundException ignored) {
            // Leave 0: the view is not themed.
        }
        IDS.put(name, id);
        return id;
    }
}
