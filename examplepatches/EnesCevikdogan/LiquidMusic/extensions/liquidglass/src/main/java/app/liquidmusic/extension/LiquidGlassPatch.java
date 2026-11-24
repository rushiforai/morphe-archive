package app.liquidmusic.extension;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;

import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Entry point of the Liquid Glass extension, called at the start of
 * {@code eightbitlab.com.blurview.BlurView.draw(Canvas)}.
 */
@SuppressWarnings("unused")
public final class LiquidGlassPatch {

    private static final String SURFACE_BOTTOM_NAV = "bottom_nav_blur";
    private static final String SURFACE_MINI_PLAYER = "mini_player_blur";
    private static final String SURFACE_SEARCH_BAR = "floating_search_bar_blur";
    private static final String SURFACE_TOP_NAV = "top_nav_blur";
    private static final String SURFACE_SIDEBAR = "drawer_blur";

    private static final Map<Integer, String> ID_NAME_CACHE = new ConcurrentHashMap<>();
    private static final Map<String, Integer> NAME_ID_CACHE = new ConcurrentHashMap<>();
    private static final WeakHashMap<View, GlassRenderer> RENDERERS = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> ORIGINAL_BG_ALPHA = new WeakHashMap<>();

    private LiquidGlassPatch() {
    }

    // region Patch-time options (bodies replaced by Morphe during patching)

    public static int blurRadiusDp() {
        return 0;
    }

    public static int refractionHeightDp() {
        return 24;
    }

    public static int refractionAmountDp() {
        return 24;
    }

    public static int saturationPercent() {
        return 150;
    }

    public static int tintOpacityPercent() {
        return 40;
    }

    public static int highlightPercent() {
        return 100;
    }

    public static boolean chromaticAberration() {
        return false;
    }

    public static boolean applyToSearchBar() {
        return true;
    }

    public static boolean applyToSidebar() {
        return true;
    }

    public static boolean liquidTabBar() {
        return true;
    }

    public static boolean tabLabels() {
        return true;
    }

    public static boolean hideNewTab() {
        return false;
    }

    public static boolean hideRadioTab() {
        return false;
    }

    public static String startTab() {
        return "home";
    }

    public static boolean tabHaptics() {
        return true;
    }

    // endregion

    /**
     * Called from the patched {@code BlurView.draw(Canvas)}.
     *
     * @return {@code true} if Liquid Glass was drawn (caller should run {@code super.draw} and return),
     * or {@code false} to run Apple Music's original blur.
     */
    public static boolean drawBlurView(View view, Canvas canvas) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || view == null || canvas == null) {
            return false;
        }

        String name = entryName(view);
        if (name == null) {
            return false;
        }

        boolean isPill;
        String contentIdName = null;

        switch (name) {
            case SURFACE_BOTTOM_NAV:
                isPill = true;
                contentIdName = "bottom_nav_view";
                break;
            case SURFACE_MINI_PLAYER:
                isPill = false;
                contentIdName = "mini_player_content";
                break;
            case SURFACE_SEARCH_BAR:
                if (!applyToSearchBar()) return false;
                isPill = true;
                break;
            case SURFACE_TOP_NAV:
                if (!applyToSearchBar()) return false;
                isPill = false;
                break;
            case SURFACE_SIDEBAR:
                if (!applyToSidebar()) return false;
                isPill = false;
                contentIdName = "drawer_nav_view";
                break;
            default:
                return false;
        }

        Context context = view.getContext();
        LiquidPrefs.trackView(view);

        int tintPercent = LiquidPrefs.getTintOpacityPercent(context);
        if (contentIdName != null && view instanceof ViewGroup) {
            View content = findChildByName((ViewGroup) view, contentIdName);
            if (content != null) {
                applyTintOpacity(content, tintPercent);
                if (SURFACE_BOTTOM_NAV.equals(name)) {
                    LiquidTabBarOverlay.attachIfNeeded((ViewGroup) view, content);
                }
            }
        } else {
            applyTintOpacity(view, tintPercent);
        }

        GlassRenderer renderer;
        synchronized (RENDERERS) {
            renderer = RENDERERS.get(view);
            if (renderer == null) {
                renderer = new GlassRenderer();
                RENDERERS.put(view, renderer);
            }
        }

        return renderer.draw(view, canvas, isPill);
    }

    private static void applyTintOpacity(View target, int tintPercent) {
        Drawable bg = target.getBackground();
        if (bg == null) return;

        int baseAlpha;
        synchronized (ORIGINAL_BG_ALPHA) {
            Integer stored = ORIGINAL_BG_ALPHA.get(target);
            if (stored == null) {
                if (bg instanceof ColorDrawable) {
                    baseAlpha = Color.alpha(((ColorDrawable) bg).getColor());
                } else {
                    baseAlpha = bg.getAlpha();
                }
                if (baseAlpha == 0) {
                    baseAlpha = 153; // ~60% fallback if not yet initialized
                }
                ORIGINAL_BG_ALPHA.put(target, baseAlpha);
            } else {
                baseAlpha = stored;
            }
        }

        int scaledAlpha = Math.max(0, Math.min(255, Math.round(baseAlpha * (tintPercent / 100f))));
        bg.mutate().setAlpha(scaledAlpha);
    }

    private static View findChildByName(ViewGroup parent, String entryName) {
        int id = resolveId(parent.getContext(), entryName);
        if (id == 0) return null;
        return parent.findViewById(id);
    }

    private static int resolveId(Context context, String entryName) {
        Integer cached = NAME_ID_CACHE.get(entryName);
        if (cached != null) return cached;
        int id = context.getResources().getIdentifier(entryName, "id", context.getPackageName());
        NAME_ID_CACHE.put(entryName, id);
        return id;
    }

    private static String entryName(View view) {
        int id = view.getId();
        if (id == View.NO_ID || id == 0) return null;
        String cached = ID_NAME_CACHE.get(id);
        if (cached != null) {
            return cached.isEmpty() ? null : cached;
        }
        try {
            String name = view.getResources().getResourceEntryName(id);
            ID_NAME_CACHE.put(id, name != null ? name : "");
            return name;
        } catch (Resources.NotFoundException e) {
            ID_NAME_CACHE.put(id, "");
            return null;
        }
    }
}
