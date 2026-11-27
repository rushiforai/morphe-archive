package app.template.extension.zalo.appearance;

import android.content.Context;
import android.content.res.Configuration;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.settings.NezumiPrefs;

/**
 * Remaps server-driven Zinstant background colors (Me tab and other Zinstant
 * screens) to the AMOLED palette. Zinstant layouts carry their own dark palette,
 * so the resource-level AMOLED patch does not reach them.
 *
 * Also dims the bright blue call screen background in dark mode, or blacks it out
 * entirely when the "True-black call screen" Nezumi option is on.
 */
@SuppressWarnings("unused")
public final class AmoledTheme {
    private AmoledTheme() { }

    /** Zalo's stock dark layer background (ng95), used for Zinstant cards. */
    private static final int DARK_LAYER = 0xFF171717;

    private static final int BLACK = 0xFF000000;

    /** 60% black scrim drawn over the call background (#0068FF becomes #002A66). */
    private static final int CALL_SCRIM = 0x99000000;

    /** Opaque scrim used when the true-black call screen option is enabled. */
    private static final int CALL_SCRIM_TRUE_BLACK = BLACK;

    /** Called with every Zinstant background color before it is stored. */
    public static int zinstantBackground(int color) {
        return color == DARK_LAYER ? BLACK : color;
    }

    /** Group call: the root has no children yet, so the scrim goes to the bottom. */
    public static void dimCallBackground(ViewGroup root) {
        dimCallBackground(root, null);
    }

    /**
     * Inserts a full-screen, non-interactive scrim right above {@code background}
     * (or at the bottom when it is null / not a child). Later children such as
     * video and call controls are appended above it. The scrim is 60% black by
     * default and fully opaque when {@link NezumiPrefs#TRUE_BLACK_CALL_SCREEN} is on.
     */
    public static void dimCallBackground(ViewGroup root, View background) {
        try {
            Context context = root.getContext();
            if (!isZaloDarkTheme(context)) return;

            View scrim = new View(context);
            boolean trueBlack = NezumiPrefs.bool(context, NezumiPrefs.TRUE_BLACK_CALL_SCREEN, false);
            scrim.setBackgroundColor(trueBlack ? CALL_SCRIM_TRUE_BLACK : CALL_SCRIM);
            scrim.setClickable(false);
            scrim.setFocusable(false);
            scrim.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);

            int index = background == null ? 0 : root.indexOfChild(background) + 1; // -1 -> 0
            root.addView(scrim, index, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        } catch (Exception failure) {
            // Never break the call screen.
            NezumiLog.swallowedOnce(Patch.AMOLED_DARK_THEME, "AmoledTheme", "call screen scrim failed", failure);
        }
    }

    /** Zalo's own Light/Dark/System choice, exposed as the {@code themeId} attr (1 = dark). */
    private static boolean isZaloDarkTheme(Context context) {
        int attr = context.getResources().getIdentifier("themeId", "attr", context.getPackageName());
        if (attr != 0) {
            TypedValue value = new TypedValue();
            if (context.getTheme().resolveAttribute(attr, value, true)
                    && value.type >= TypedValue.TYPE_FIRST_INT
                    && value.type <= TypedValue.TYPE_LAST_INT) {
                return value.data == 1;
            }
        }
        int night = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return night == Configuration.UI_MODE_NIGHT_YES;
    }
}
