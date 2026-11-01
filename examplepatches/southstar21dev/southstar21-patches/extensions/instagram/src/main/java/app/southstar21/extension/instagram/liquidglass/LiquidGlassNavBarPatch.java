package app.southstar21.extension.instagram.liquidglass;

import android.app.Activity;
import android.content.res.Resources;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.util.WeakHashMap;

import app.southstar21.extension.instagram.InstagramHooks;
import app.southstar21.extension.instagram.settings.BooleanSetting;
import app.southstar21.extension.instagram.settings.IntSetting;
import app.southstar21.extension.instagram.settings.PatchSettings;

/**
 * Liquid Glass patch: entry point and settings.
 */
@SuppressWarnings("unused")
public final class LiquidGlassNavBarPatch {
    static final String TAG = "LiquidGlass";

    private static final WeakHashMap<View, LiquidGlassController> installed = new WeakHashMap<>();

    static final IntSetting BLUR_RADIUS = new IntSetting("liquid_glass_blur_radius",
            "Blur radius", "How frosted the glass is.", true,
            0, 40, "dp", LiquidGlassNavBarPatch::blurRadiusDp);
    static final IntSetting REFRACTION = new IntSetting("liquid_glass_refraction",
            "Refraction strength", "How strongly the glass edge bends what's behind it.", true,
            0, 100, "%", LiquidGlassNavBarPatch::refractionPercent);
    static final BooleanSetting EXTEND_CONTENT = new BooleanSetting("liquid_glass_extend_content",
            "Content behind bar", "Feeds scroll under the bar so there's something to see through the glass.", true,
            LiquidGlassNavBarPatch::extendContentBehindBar);
    static final BooleanSetting SHRINK_ON_SCROLL = new BooleanSetting("liquid_glass_shrink_on_scroll",
            "Shrink while scrolling", "Scrolling down shrinks the bar, scrolling up restores it.", false, true);
    static final BooleanSetting HAPTICS = new BooleanSetting("liquid_glass_haptics",
            "Haptics", "A tick when the selection glides over a tab.", false, true);

    public static final PatchSettings SETTINGS = new PatchSettings("liquid_glass",
            "Liquid Glass",
            "iOS 26 style glass tab bar. Defaults come from the patch options in Morphe Manager.",
            LiquidGlassNavBarPatch::isIncluded,
            BLUR_RADIUS, REFRACTION, EXTEND_CONTENT, SHRINK_ON_SCROLL, HAPTICS);

    /** The patch makes this return true, so the menu only shows patches that were applied. */
    public static boolean isIncluded() {
        return false;
    }

    // The three methods below are overwritten by the patch with the chosen option values,
    // which become the defaults of the settings above.

    public static int blurRadiusDp() {
        return 12;
    }

    public static int refractionPercent() {
        return 60;
    }

    public static boolean extendContentBehindBar() {
        return true;
    }

    /** Called by {@link InstagramHooks} when this patch is included and switched on. */
    public static void onMainActivityReady(Activity activity) {
        try {
            View bar = findView(activity, "tab_bar");
            if (!(bar instanceof ViewGroup) || installed.containsKey(bar)) return;
            if (!(bar.getParent() instanceof ViewGroup)) return;

            LiquidGlassController controller = new LiquidGlassController(
                    (ViewGroup) bar,
                    findView(activity, "tab_bar_shadow"),
                    BLUR_RADIUS.get(),
                    REFRACTION.get(),
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
