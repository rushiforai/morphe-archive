package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.nio.charset.StandardCharsets;

/**
 * The AI switch inside the native player's flyout menu. It has the same state as the settings; only
 * the player's recognised top menu receives the entry. Methods marked "bound at patch time" are
 * stubs the patch replaces with accesses to the player's menu classes.
 */
public final class CaptionQuickToggle {
    private static final long SHORTS_MENU_WINDOW_MS = 1500;

    private static long shortsMenuAt;
    private static String shortsVideo = "";

    private CaptionQuickToggle() {}

    /** Notes when the Shorts menu is about to show its captions entry. */
    public static void observeMenuPath(CharSequence path, byte[] buffer) {
        if (path != null) observeMenuPath(path.toString(), buffer);
    }

    public static void observeMenuPath(String path, byte[] buffer) {
        if (!shortsOpen()
                || path == null
                || buffer == null
                || !path.startsWith("overflow_menu_item.e")
                || path.contains("captions_sheet")
                || path.contains("quality_sheet")) return;
        String data = new String(buffer, StandardCharsets.ISO_8859_1);
        if (data.contains("closed_caption") || data.contains("closed_captions")) {
            shortsMenuAt = SystemClock.uptimeMillis();
            shortsVideo = CaptionActions.currentVideoIdSnapshot();
        }
    }

    /** Adds the entry to the menu [panel] at [index]; returns the index after it. */
    public static int onMenu(Object panel, int index) {
        Activity a = CaptionAddonSupport.activity();
        if (a == null || !CaptionAddonSupport.aiInstalled()) return index;
        // The setting is chosen by the player state, not by the broad top-menu signal: Shorts can
        // also report topMenu. A disabled Shorts row must not leak through it.
        boolean inShorts = shortsOpen();
        if (!(inShorts
                ? DeepSeekConfig.shortsFlyoutMenuEnabled(a)
                : DeepSeekConfig.flyoutMenuEnabled(a))) {
            shortsMenuAt = 0;
            shortsVideo = "";
            return index;
        }
        boolean shortsMenu =
                inShorts
                        && shortsMenuAt > 0
                        && SystemClock.uptimeMillis() - shortsMenuAt < SHORTS_MENU_WINDOW_MS
                        && shortsVideo.equals(CaptionActions.currentVideoIdSnapshot());
        if (!topMenu() && !shortsMenu) return index;
        shortsMenuAt = 0;
        String text =
                CaptionStrings.get(
                        a,
                        DeepSeekConfig.enabled(a) ? "ai_quick_toggle_on" : "ai_quick_toggle_off");
        int id =
                a.getResources()
                        .getIdentifier("deepseek_caption_settings", "drawable", a.getPackageName());
        int next =
                addNativeRow(
                        panel,
                        id == 0 ? null : a.getDrawable(id),
                        text,
                        v -> {
                            if (toggle(a)) dismissNative();
                        },
                        index);
        if (next < 0) return index;
        normalizeNativeGap(nativeContainer(panel));
        return next;
    }

    static boolean toggle(Context context) {
        return setEngine(context, !DeepSeekConfig.enabled(context));
    }

    /** Only the known native list's top inset: the Morphe group already clears the drag handle. */
    static void normalizeNativeGap(LinearLayout container) {
        if (container == null || container.getChildCount() < 2) return;
        View list = container.getChildAt(container.getChildCount() - 1);
        if (!(list instanceof ViewGroup)) return;
        if (list.getPaddingTop() > 0)
            list.setPadding(
                    list.getPaddingLeft(), 0, list.getPaddingRight(), list.getPaddingBottom());
        if (list.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams params =
                    (ViewGroup.MarginLayoutParams) list.getLayoutParams();
            if (params.topMargin > 0) {
                params.topMargin = 0;
                list.setLayoutParams(params);
            }
        }
    }

    /**
     * Turns the engine on or off. The switch is a user act: it is written to the session intent
     * first, independently of any native player or track reference, and the reconciler applies it.
     * OFF must never be rolled back to ON by a stale Shorts manager, and ON keeps the target the
     * native caption menu already had.
     */
    static boolean setEngine(Context context, boolean enabled) {
        if (enabled && !DeepSeekConfig.load(context).hasCredential) {
            toast(context, "configure_api");
            return false;
        }
        if (!CaptionSessionReconciler.onUserSwitched(context, enabled)) return false;
        CaptionSessionIntent intent = CaptionSessionIntent.load(context);
        // A switch-on without a target cannot start anything: the target only ever comes from
        // YouTube's own caption menu. Roll the whole act back so an unusable switch cannot suppress
        // the native captions either; the caller sees a switch-on that did not take effect.
        if (enabled && !intent.hasTarget()) {
            CaptionSessionIntent.userToggled(context, false);
            DeepSeekConfig.saveEnabled(context, false);
            toast(context, "choose_translation");
            return false;
        }
        CaptionActions.refreshConfiguration(context);
        CaptionMusicSuppressor.forceNativeRendererScan();
        CaptionMusicSuppressor.kick();
        CaptionDiagnostics.mark(
                context,
                "ENGINE_MODE_SAVED",
                "enabled="
                        + enabled
                        + ";target="
                        + (intent.hasTarget() ? intent.targetLanguage : "none")
                        + ";translate="
                        + intent.translateTarget
                        + ";revision="
                        + intent.revision
                        + ";session="
                        + CaptionActions.isVisibleActive());
        return true;
    }

    private static void toast(Context context, String key) {
        Toast.makeText(context, CaptionStrings.get(context, key), Toast.LENGTH_LONG).show();
    }

    // ---- Bound at patch time ----

    public static LinearLayout nativeContainer(Object panel) {
        return null;
    }

    public static boolean shortsOpen() {
        return false;
    }

    public static boolean topMenu() {
        return false;
    }

    public static int addNativeRow(
            Object panel, Drawable icon, String label, View.OnClickListener click, int index) {
        return -1;
    }

    public static void dismissNative() {}
}
