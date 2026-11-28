package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.host.AiCaptionHook;
import app.yydarlinker.aicaptions.host.CaptionActions;
import app.yydarlinker.aicaptions.host.CaptionAddonSupport;
import app.yydarlinker.aicaptions.host.CaptionSession;

import androidx.annotation.Nullable;

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

    /** Called after Morphe commits its Shorts state; reads the final value, never a queued copy. */
    public static void onShortsStateChanged() {
        try {
            AiCaptionHook.onShortsStateChanged(shortsOpen());
        } catch (RuntimeException | LinkageError error) {
            CaptionSettingsDialogs.log("shorts_state", error);
        }
    }

    /** Notes when the Shorts menu is about to show its captions entry. */
    public static void observeMenuPath(@Nullable CharSequence path, @Nullable byte[] buffer) {
        if (path == null || buffer == null) return;
        Context context = CaptionAddonSupport.context();
        if (context == null || !CaptionAddonSupport.aiInstalled()) return;
        try {
            if (!shortsOpen() || !CaptionSettingsSwitch.menuVisible(context, true)) {
                shortsMenuAt = 0;
                return;
            }
            String menuPath = path.toString();
            if (!menuPath.startsWith("overflow_menu_item.e")
                    || menuPath.contains("captions_sheet")
                    || menuPath.contains("quality_sheet")) return;
            if (new String(buffer, StandardCharsets.ISO_8859_1).contains("closed_caption")) {
                shortsMenuAt = SystemClock.uptimeMillis();
                shortsVideo = CaptionActions.currentVideoIdSnapshot();
            }
        } catch (RuntimeException | LinkageError error) {
            CaptionSettingsDialogs.log("observe_menu", error);
        }
    }

    /** Returns the next native insertion index, or the original index when no row was added. */
    public static int onMenu(@Nullable Object panel, int index) {
        Activity activity = CaptionAddonSupport.activity();
        if (activity == null || panel == null || !CaptionAddonSupport.aiInstalled()) return index;
        try {
            return insert(activity, panel, index);
        } catch (RuntimeException | LinkageError error) {
            CaptionSettingsDialogs.log("insert_menu", error);
            return index;
        }
    }

    private static int insert(Activity a, Object panel, int index) {
        boolean inShorts = shortsOpen();
        if (!CaptionSettingsSwitch.menuVisible(a, inShorts)) {
            shortsMenuAt = 0;
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
                        AiCaptionConfig.enabled(a) ? "ai_quick_toggle_on" : "ai_quick_toggle_off");
        int id =
                a.getResources()
                        .getIdentifier("ai_caption_settings", "drawable", a.getPackageName());
        int next =
                addNativeRow(
                        panel,
                        id == 0 ? null : a.getDrawable(id),
                        text,
                        v -> CaptionSettingsDialogs.run(a, () -> {
                            if (toggle(a)) dismissNative();
                        }),
                        index);
        if (next < 0) return index;
        try {
            normalizeNativeGap(nativeContainer(panel));
        } catch (RuntimeException | LinkageError error) {
            CaptionSettingsDialogs.log("inset_menu", error);
        }
        return next;
    }

    static boolean toggle(Context context) {
        return setEngine(context, !AiCaptionConfig.enabled(context));
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
     * OFF must never be rolled back to ON by a stale Shorts manager. ON follows the current native
     * selection, or waits until the player supplies it.
     */
    public static boolean setEngine(Context context, boolean enabled) {
        if (enabled && !AiCaptionConfig.forUserEnable(context).hasCredential) {
            toast(context, "configure_api");
            return false;
        }
        return CaptionSession.onUserSwitched(context, enabled);
    }

    private static void toast(Context context, String key) {
        Toast.makeText(context, CaptionStrings.get(context, key), Toast.LENGTH_LONG).show();
    }

    // ---- Bound at patch time ----

    @Nullable public static LinearLayout nativeContainer(Object panel) {
        return null;
    }

    public static boolean shortsOpen() {
        return false;
    }

    public static boolean topMenu() {
        return false;
    }

    public static int addNativeRow(
            Object panel, @Nullable Drawable icon, String label, View.OnClickListener click, int index) {
        return -1;
    }

    public static void dismissNative() {}
}
