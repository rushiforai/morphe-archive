package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.os.SystemClock;
import android.widget.Toast;
import java.util.Map;
import java.util.WeakHashMap;

/** Three exit confirmation modes for the normal app and Niconico Live. */
public final class ExitModeOptions {
    public static final int NONE = 0;
    public static final int DIALOG = 1;
    public static final int DOUBLE_BACK = 2;
    public static final String NORMAL_KEY = "nicoid_exit_mode";
    public static final String LIVE_KEY = "nicolive_exit_mode";
    private static final Map<Activity, Long> LAST_BACK = new WeakHashMap<>();
    private ExitModeOptions() {}

    public static int checked(int value) {
        return value >= NONE && value <= DOUBLE_BACK ? value : DOUBLE_BACK;
    }
    public static int mode(Context context, String key) {
        return checked(PreferenceManager.getDefaultSharedPreferences(context).getInt(key, DOUBLE_BACK));
    }
    public static String[] labels(Context context) {
        return new String[] {
            PanelUi.tr(context, "確認しない", "No confirmation", "不確認"),
            PanelUi.tr(context, "ダイアログ", "Dialog", "對話框"),
            PanelUi.tr(context, "戻るを2回", "Press Back twice", "返回兩次")
        };
    }
    public static String summary(Context context, int value, boolean live) {
        int mode = checked(value);
        String description;
        if (live) {
            description = mode == NONE ?
                PanelUi.tr(context, "そのまま通常画面に戻ります", "Return to the main screen immediately", "直接返回主畫面") :
                mode == DIALOG ?
                PanelUi.tr(context, "ニコ生を閉じる前に確認します", "Ask before closing Niconico Live", "關閉直播前先確認") :
                PanelUi.tr(context, "2秒以内にもう一度戻るとニコ生を閉じます",
                           "Press Back again within 2 seconds to close Niconico Live", "在2秒內再次返回即可關閉直播");
        } else {
            description = mode == NONE ?
                PanelUi.tr(context, "そのままアプリを終了します", "Exit without a prompt", "直接退出應用程式") :
                mode == DIALOG ?
                PanelUi.tr(context, "アプリを終了する前に確認します", "Ask before exiting the app", "退出應用程式前先確認") :
                PanelUi.tr(context, "2秒以内にもう一度戻るとアプリを終了します",
                           "Press Back again within 2 seconds to exit the app", "在2秒內再次返回即可退出應用程式");
        }
        return labels(context)[mode] + "：" + description;
    }

    public static void install(PreferenceActivity activity) {
        if (activity == null) return;
        Preference candidate = activity.findPreference("setting_whole");
        if (!(candidate instanceof PreferenceGroup)) return;
        PreferenceGroup group = (PreferenceGroup) candidate;
        if (activity.findPreference(NORMAL_KEY) != null) return;
        Preference old = activity.findPreference(Dev112.CONFIRM_EXIT);
        int order = old == null ? group.getPreferenceCount() : old.getOrder();
        if (old != null) group.removePreference(old);
        Preference choice = new Preference(activity);
        choice.setKey(NORMAL_KEY);
        choice.setOrder(order);
        choice.setTitle(PanelUi.tr(activity, "アプリ終了時の確認", "Confirm app exit", "退出應用程式時確認"));
        choice.setSummary(summary(activity, mode(activity, NORMAL_KEY), false));
        choice.setOnPreferenceClickListener(preference -> {
            UiDialogs.show(UiDialogs.builder(activity).setTitle(choice.getTitle())
                .setSingleChoiceItems(labels(activity), mode(activity, NORMAL_KEY), (dialog, selected) -> {
                    PreferenceManager.getDefaultSharedPreferences(activity).edit()
                        .putInt(NORMAL_KEY, selected).apply();
                    choice.setSummary(summary(activity, selected, false));
                    clear(activity);
                    dialog.dismiss();
                }).setNegativeButton(android.R.string.cancel, null).create());
            return true;
        });
        group.addPreference(choice);
    }

    public static boolean normalBack(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return false;
        try {
            boolean supported = Boolean.TRUE.equals(Dev112.staticCall("e.e.a.TabRoutes228",
                    "supported", new Class<?>[]{Activity.class}, activity));
            if (!supported) return false;
            boolean multitab = Boolean.TRUE.equals(Dev112.staticCall("e.e.a.MultiTabs227",
                    "enabled", new Class<?>[]{}));
            if (!multitab && !activity.isTaskRoot()) return false;
            if (activity.getIntent().getBooleanExtra("nicoid_local_playlists", false)
                    && Boolean.TRUE.equals(Dev112.staticCall("e.e.a.LocalPlaylists", "back",
                    new Class<?>[]{Activity.class}, activity))) return true;
            int mode = mode(activity, NORMAL_KEY);
            if (mode == NONE) {
                clear(activity);
                Dev112.exit(activity);
            } else if (mode == DIALOG) {
                clear(activity);
                AlertDialog dialog = Dev112.builder(activity)
                    .setTitle(PanelUi.tr(activity, "アプリを終了しますか？", "Exit the app?", "確定退出應用程式？"))
                    .setNegativeButton(PanelUi.tr(activity, "キャンセル", "Cancel", "取消"), null)
                    .setPositiveButton(PanelUi.tr(activity, "終了", "Exit", "退出"),
                                       (d, which) -> Dev112.exit(activity)).create();
                Dev112.show(dialog);
            } else if (doubleBack(activity, PanelUi.tr(activity,
                    "もう一度戻るとアプリを終了します", "Press Back again to exit the app",
                    "再次返回即可退出應用程式"))) {
                Dev112.exit(activity);
            }
            return true;
        } catch (Exception e) {
            android.util.Log.w("nicoid-exit", "Back routing fallback", e);
            return false;
        }
    }

    public static boolean doubleBack(Activity activity, String prompt) {
        long now = SystemClock.elapsedRealtime();
        Long first = LAST_BACK.get(activity);
        if (first != null && ExitBackPolicy.isSecondPress(first, now)) {
            LAST_BACK.remove(activity);
            return true;
        }
        LAST_BACK.put(activity, now);
        Toast.makeText(activity, prompt, Toast.LENGTH_SHORT).show();
        return false;
    }

    public static void clear(Activity activity) {
        LAST_BACK.remove(activity);
    }
}
