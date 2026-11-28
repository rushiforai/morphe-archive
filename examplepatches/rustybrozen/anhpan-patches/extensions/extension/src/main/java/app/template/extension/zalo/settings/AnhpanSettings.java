package app.template.extension.zalo.settings;

import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.template.extension.zalo.ui.ZaloUi;

public final class AnhpanSettings {
    private static final String TITLE = "Anhpan's settings";
    private static final String ENTRY_TAG = "anhpan-settings-entry";

    private AnhpanSettings() { }

    public static void attach(View root, View anchor) {
        if (root == null || anchor == null || !(anchor.getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) anchor.getParent();
        for (int index = 0; index < parent.getChildCount(); index++) {
            if (ENTRY_TAG.equals(parent.getChildAt(index).getTag())) return;
        }
        Context context = anchor.getContext();
        boolean darkMode = ZaloUi.isDarkMode(context, anchor);
        int titleId = context.getResources().getIdentifier("list_title", "id", context.getPackageName());
        View title = titleId == 0 ? null : anchor.findViewById(titleId);
        TextView nativeTitle = title instanceof TextView ? (TextView) title : null;
        View entry = ZaloUi.row(context, TITLE, ZaloUi.gearIcon(context), true, darkMode, nativeTitle, 49);
        Drawable background = anchor.getBackground();
        if (background != null && background.getConstantState() != null) {
            entry.setBackground(background.getConstantState().newDrawable(context.getResources()).mutate());
        }
        entry.setTag(ENTRY_TAG);
        entry.setOnClickListener(view -> show(context, darkMode));
        parent.addView(entry, parent.indexOfChild(anchor) + 1);
        int dividerId = context.getResources().getIdentifier("list_divider", "id", context.getPackageName());
        View divider = dividerId == 0 ? null : anchor.findViewById(dividerId);
        if (divider != null) divider.post(() -> divider.setVisibility(View.VISIBLE));
    }

    public static boolean shouldDisableUnreadHighlight(View view, Object pupVar) {
        if (view == null || pupVar == null) return false;
        return AnhpanChatLock.shouldDisableChatHighlight(view.getContext(), pupVar);
    }

    private static void show(Context context, boolean darkMode) {
        SharedPreferences prefs = AnhpanPrefs.of(context);
        Dialog page = ZaloUi.page(context, TITLE, darkMode);
        LinearLayout list = page.findViewById(android.R.id.content).findViewWithTag("anhpan-list");

        ZaloUi.addGroup(list, context, "UI", darkMode);
        ZaloUi.toggleRow(
            list,
            context,
            "Hide search bar",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.HIDE_SEARCH_BAR, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.HIDE_SEARCH_BAR, checked).apply()
        );
        ZaloUi.toggleRow(
            list,
            context,
            "Hide QR button",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.HIDE_QR_BUTTON, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.HIDE_QR_BUTTON, checked).apply()
        );
        ZaloUi.toggleRow(
            list,
            context,
            "Hide add (+) button",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.HIDE_PLUS_BUTTON, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.HIDE_PLUS_BUTTON, checked).apply()
        );

        ZaloUi.addGroup(list, context, "Messages", darkMode);
        ZaloUi.toggleRow(
            list,
            context,
            "Chat highlight toggle",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.CHAT_HIGHLIGHT_TOGGLE, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.CHAT_HIGHLIGHT_TOGGLE, checked).apply()
        );
        ZaloUi.toggleRow(
            list,
            context,
            "Hide media quick heart",
            "heart",
            prefs.getBoolean(AnhpanPrefs.HIDE_QUICK_HEART, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.HIDE_QUICK_HEART, checked).apply()
        );
        ZaloUi.toggleRow(
            list,
            context,
            "Hide media share button",
            "share",
            prefs.getBoolean(AnhpanPrefs.HIDE_QUICK_SHARE, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.HIDE_QUICK_SHARE, checked).apply()
        );

        ZaloUi.addGroup(list, context, "Read-only", darkMode);
        ZaloUi.toggleRow(
            list,
            context,
            "Disable highlight in Read-only",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.READ_ONLY_NO_HIGHLIGHT, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.READ_ONLY_NO_HIGHLIGHT, checked).apply()
        );
        ZaloUi.toggleRow(
            list,
            context,
            "Hide member avatars in Read-only",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.READ_ONLY_HIDE_AVATAR, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.READ_ONLY_HIDE_AVATAR, checked).apply()
        );
        ZaloUi.toggleRow(
            list,
            context,
            "No colored member names in Read-only",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.READ_ONLY_NO_COLOR_NAME, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.READ_ONLY_NO_COLOR_NAME, checked).apply()
        );

        ZaloUi.addGroup(list, context, "Chat List", darkMode);
        ZaloUi.toggleRow(
            list,
            context,
            "Hide draft preview",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.HIDE_DRAFT_PREVIEW, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.HIDE_DRAFT_PREVIEW, checked).apply()
        );
        ZaloUi.toggleRow(
            list,
            context,
            "Hide chat date/time",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.HIDE_CHAT_TIME, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.HIDE_CHAT_TIME, checked).apply()
        );
        ZaloUi.toggleRow(
            list,
            context,
            "Keep recalled messages",
            "eye_off",
            prefs.getBoolean(AnhpanPrefs.KEEP_RECALLED_MESSAGES, false),
            darkMode,
            (button, checked) -> prefs.edit().putBoolean(AnhpanPrefs.KEEP_RECALLED_MESSAGES, checked).apply()
        );

        ZaloUi.addGroup(list, context, "System", darkMode);
        View resetRow = ZaloUi.row(context, "Reset all settings", ZaloUi.zdsIcon(context, "eye_off", darkMode), true, darkMode, null, 49);
        resetRow.setClickable(true);
        resetRow.setOnClickListener(v -> {
            android.util.Log.d("AnhpanDebug", "Reset all settings clicked");
            prefs.edit().clear().commit();
            android.widget.Toast.makeText(context, "Reset complete, restarting...", android.widget.Toast.LENGTH_SHORT).show();
            android.content.Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (launch != null) {
                launch.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK | android.content.Intent.FLAG_ACTIVITY_CLEAR_TASK);
                context.startActivity(launch);
            }
            android.os.Process.killProcess(android.os.Process.myPid());
        });
        list.addView(resetRow, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        page.show();
    }
}
