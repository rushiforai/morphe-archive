package app.liquidmusic.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Persistent live settings for LiquidMusic.
 * Reads Morphe patch-time defaults from {@link LiquidGlassPatch} unless overridden in-app.
 */
final class LiquidPrefs {

    private static final String PREFS_NAME = "liquidmusic_prefs";

    static final String KEY_BLUR_RADIUS = "blur_radius_dp";
    static final String KEY_REFRACTION_HEIGHT = "refraction_height_dp";
    static final String KEY_REFRACTION_AMOUNT = "refraction_amount_dp";
    static final String KEY_SATURATION = "saturation_percent";
    static final String KEY_TINT_OPACITY = "tint_opacity_percent";
    static final String KEY_HIGHLIGHT = "highlight_percent";
    static final String KEY_CHROMATIC = "chromatic_aberration";
    static final String KEY_LIQUID_TAB_BAR = "liquid_tab_bar";
    static final String KEY_TAB_LABELS = "tab_labels";
    static final String KEY_TAB_HAPTICS = "tab_haptics";

    private static final Set<View> TRACKED_VIEWS =
            Collections.newSetFromMap(new WeakHashMap<>());

    private static volatile SharedPreferences cachedPrefs;

    private LiquidPrefs() {
    }

    static SharedPreferences prefs(Context context) {
        if (cachedPrefs == null) {
            synchronized (LiquidPrefs.class) {
                if (cachedPrefs == null) {
                    cachedPrefs = context.getApplicationContext()
                            .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                }
            }
        }
        return cachedPrefs;
    }

    static void trackView(View view) {
        if (view != null) {
            TRACKED_VIEWS.add(view);
        }
    }

    static void notifyChanged() {
        for (View view : TRACKED_VIEWS) {
            if (view != null && view.isAttachedToWindow()) {
                view.invalidate();
                view.requestLayout();
            }
        }
    }

    static int getBlurRadiusDp(Context context) {
        return prefs(context).getInt(KEY_BLUR_RADIUS, LiquidGlassPatch.blurRadiusDp());
    }

    static int getRefractionHeightDp(Context context) {
        return prefs(context).getInt(KEY_REFRACTION_HEIGHT, LiquidGlassPatch.refractionHeightDp());
    }

    static int getRefractionAmountDp(Context context) {
        return prefs(context).getInt(KEY_REFRACTION_AMOUNT, LiquidGlassPatch.refractionAmountDp());
    }

    static int getSaturationPercent(Context context) {
        return prefs(context).getInt(KEY_SATURATION, LiquidGlassPatch.saturationPercent());
    }

    static int getTintOpacityPercent(Context context) {
        return prefs(context).getInt(KEY_TINT_OPACITY, LiquidGlassPatch.tintOpacityPercent());
    }

    static int getHighlightPercent(Context context) {
        return prefs(context).getInt(KEY_HIGHLIGHT, LiquidGlassPatch.highlightPercent());
    }

    static boolean isChromaticAberration(Context context) {
        return prefs(context).getBoolean(KEY_CHROMATIC, LiquidGlassPatch.chromaticAberration());
    }

    static boolean isLiquidTabBar(Context context) {
        return prefs(context).getBoolean(KEY_LIQUID_TAB_BAR, LiquidGlassPatch.liquidTabBar());
    }

    static boolean isTabLabels(Context context) {
        return prefs(context).getBoolean(KEY_TAB_LABELS, LiquidGlassPatch.tabLabels());
    }

    static boolean isTabHaptics(Context context) {
        return prefs(context).getBoolean(KEY_TAB_HAPTICS, LiquidGlassPatch.tabHaptics());
    }

    static void putInt(Context context, String key, int value) {
        prefs(context).edit().putInt(key, value).apply();
        notifyChanged();
    }

    static void putBoolean(Context context, String key, boolean value) {
        prefs(context).edit().putBoolean(key, value).apply();
        notifyChanged();
    }

    static void reset(Context context) {
        prefs(context).edit().clear().apply();
        notifyChanged();
    }
}
