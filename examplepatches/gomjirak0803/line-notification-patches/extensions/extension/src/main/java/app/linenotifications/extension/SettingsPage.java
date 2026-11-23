package app.linenotifications.extension;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.drawable.ColorDrawable;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.CheckedTextView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Map;

/** Full-page settings using LINE's own header, rows, typography and switch drawables. */
final class SettingsPage extends Dialog {
    private LinearLayout rows;
    private TextView heading;
    private ScrollView scroll;
    private final int background;
    private boolean mutedPage;

    SettingsPage(Context context) throws ReflectiveOperationException {
        super(context, windowTheme(context));
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setCanceledOnTouchOutside(false);
        background = context.getColor(id("color", "primaryBackground"));
        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(background);

        Class<?> headerType = NativeLine.type("jp.naver.line.android.common.view.header.Header");
        View header = (View) headerType.getConstructor(Context.class).newInstance(context);
        heading = (TextView) headerType.getMethod("getTitleTextView").invoke(header);
        headerType.getMethod("setUpButtonVisibility$LINE_Android_migrant_common_libs", boolean.class).invoke(header, true);
        headerType.getMethod("setUpButtonImageResource", int.class).invoke(header, id("drawable", "navi_top_back"));
        View back = (View) headerType.getMethod("getUpButtonBackgroundLayout").invoke(header);
        back.setOnClickListener(v -> onBackPressed());
        page.addView(header, new LinearLayout.LayoutParams(-1, -2));

        scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        rows = new LinearLayout(context);
        rows.setOrientation(LinearLayout.VERTICAL);
        rows.setPadding(0, 0, 0, dp(24));
        scroll.addView(rows, new ScrollView.LayoutParams(-1, -2));
        page.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        page.setOnApplyWindowInsetsListener((view, insets) -> {
            Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            return WindowInsets.CONSUMED;
        });
        setContentView(page);
        Window window = getWindow();
        window.setBackgroundDrawable(new ColorDrawable(background));
        window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND
                | WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS | WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.setStatusBarColor(background);
        window.setNavigationBarColor(background);
        window.setDecorFitsSystemWindows(false);
        showMain();
    }

    private static int windowTheme(Context context) {
        int theme = context.getResources().getIdentifier("LineNotificationSettingsWindow", "style", context.getPackageName());
        if (theme == 0) throw new IllegalStateException("Required settings window theme unavailable");
        return theme;
    }

    @Override public void show() {
        super.show();
        Window window = getWindow();
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        window.getDecorView().requestApplyInsets();
        applyBarAppearance(window);
        // Floating-dialog theme flags can be reapplied on attach. Set system-bar contrast
        // after show, when this full-page window owns the inset controller.
        window.getDecorView().post(() -> applyBarAppearance(window));
    }

    private void applyBarAppearance(Window window) {
        WindowInsetsController controller = window.getInsetsController();
        if (controller == null) return;
        boolean light = Color.red(background) * 299 + Color.green(background) * 587 + Color.blue(background) * 114 > 128000;
        int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
        controller.setSystemBarsAppearance(light ? mask : 0, mask);
    }

    @Override public void onBackPressed() {
        if (mutedPage) showMain();
        else dismiss();
    }

    private int id(String type, String name) {
        int result = getContext().getResources().getIdentifier(name, type, getContext().getPackageName());
        if (result == 0) throw new IllegalStateException("Required native settings resource unavailable");
        return result;
    }

    private int dp(int value) { return Math.round(value * getContext().getResources().getDisplayMetrics().density); }

    private View inflate(String layout) {
        View view = LayoutInflater.from(getContext()).inflate(id("layout", layout), rows, false);
        rows.addView(view);
        return view;
    }

    private void text(View view, String name, String value) {
        TextView label = view.findViewById(id("id", name));
        if (label == null) throw new IllegalStateException("Required native settings view unavailable");
        label.setText(value);
        label.setVisibility(value == null || value.isEmpty() ? View.GONE : View.VISIBLE);
    }

    private void group(String title) {
        TextView label = (TextView) inflate("line_user_settings_group_header_item");
        label.setText(title);
    }

    private void description(String value) {
        text(inflate("line_user_settings_description_item"), "setting_description", value);
    }

    private interface ToggleAction { boolean set(boolean value); }

    private void toggle(String title, String detail, boolean checked, boolean available, ToggleAction action) {
        View row = inflate("line_user_settings_switch_item_view");
        text(row, "setting_title", title);
        text(row, "setting_description", detail);
        CheckedTextView control = row.findViewById(id("id", "setting_switch"));
        CheckedTextView label = row.findViewById(id("id", "setting_title"));
        control.setChecked(checked);
        label.setChecked(checked);
        control.setEnabled(available);
        label.setEnabled(available);
        View container = row.findViewById(id("id", "setting_item_container"));
        container.setEnabled(available);
        container.setFocusable(available);
        row.setAlpha(available ? 1f : 0.45f);
        container.setContentDescription(title + ", " + detail);
        container.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName("android.widget.Switch");
                info.setCheckable(true);
                info.setChecked(control.isChecked());
            }
        });
        container.setOnClickListener(v -> {
            boolean next = !control.isChecked();
            if (available && action != null && action.set(next)) {
                control.setChecked(next);
                label.setChecked(next);
                container.sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED);
            }
        });
        // The whole native row is the click target, just as in LINE's own settings.
        control.setClickable(false);
        control.setFocusable(false);
    }

    private void feature(String title, String detail, String key, boolean included) {
        String suffix = included ? "" : " · " + Strings.get(getContext(), "line_notify_patch_not_included", "Patch not included");
        toggle(title, detail + suffix, Settings.enabled(key), included, value -> {
            Settings.setEnabled(key, value);
            return true;
        });
    }

    private String str(String name, String fallback) {
        return Strings.get(getContext(), name, fallback);
    }

    private void showMain() {
        mutedPage = false;
        heading.setText(str("line_notify_settings", "Notification patch settings"));
        rows.removeAllViews();
        scroll.scrollTo(0, 0);
        group(str("line_notify_group_display", "Notification display"));
        feature("Not Too Much Silent",
                str("line_notify_desc_silent", "Turns a chat’s “Mute” toggle into quiet local delivery."),
                Settings.SILENT, Settings.silentIncluded());
        View hidden = inflate("line_user_settings_text_item_view");
        text(hidden, "setting_title", str("line_notify_hidden_chats_title", "Completely hidden chats"));
        text(hidden, "setting_description",
                str("line_notify_hidden_chats_desc", "Manage chats that should not show even silent notifications."));
        hidden.findViewById(id("id", "setting_item_container")).setOnClickListener(v -> showMuted());
        feature("More Chat Info",
                str("line_notify_desc_info", "Expands recent unread messages in conversation style and shows the total unread count."),
                Settings.INFO, Settings.infoIncluded());
        group(str("line_notify_group_actions", "Notification actions"));
        feature("No reply",
                str("line_notify_desc_no_reply", "Hides suggested replies while keeping manual inline reply."),
                Settings.NO_REPLY, Settings.noReplyIncluded());
        feature("Mark as read",
                str("line_notify_desc_read", "Marks the entire chat as read and clears its notification."),
                Settings.READ, Settings.readIncluded());
        group(str("line_notify_group_scope", "Scope"));
        description(str("line_notify_scope_desc", "Applies to regular chats. OpenChat notifications follow LINE’s original settings."));
    }

    private void showMuted() {
        mutedPage = true;
        heading.setText(str("line_notify_hidden_chats_title", "Completely hidden chats"));
        rows.removeAllViews();
        scroll.scrollTo(0, 0);
        description(str("line_notify_hidden_chats_guide",
                "Add chats via “Hide notifications completely” in the chat menu. Turn a switch off to unhide."));
        try {
            String account = NativeLine.account();
            String prefix = Settings.mutePrefix(account);
            ArrayList<Map.Entry<String, ?>> entries = new ArrayList<>();
            for (Map.Entry<String, ?> entry : Settings.prefs().getAll().entrySet()) {
                if (entry.getKey().startsWith(prefix) && entry.getValue() instanceof String) entries.add(entry);
            }
            entries.sort(Comparator.comparing(e -> (String)e.getValue()));
            if (!Settings.enabled(Settings.SILENT)) {
                description(str("line_notify_hidden_chats_silent_off_note",
                        "Completely hidden chats also have LINE’s native notifications turned off."));
            }
            if (entries.isEmpty()) {
                description(str("line_notify_hidden_chats_empty", "No completely hidden chats."));
                return;
            }
            String hideLabel = str("line_notify_hide_chat", "Hide notifications completely");
            for (Map.Entry<String, ?> entry : entries) {
                String name = (String)entry.getValue();
                String chat = new String(Base64.decode(entry.getKey().substring(prefix.length()), Base64.URL_SAFE), StandardCharsets.UTF_8);
                toggle(name, hideLabel, true, true, value -> {
                    try {
                        if (!account.equals(NativeLine.account())) return false;
                        ChatNotifications.change(getContext(), chat,
                                Settings.quiet(account, chat) ? ChatNotifications.QUIET : ChatNotifications.NORMAL,
                                null, () -> { if (isShowing()) showMuted(); });
                        return false;
                    } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
                });
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            description(str("line_notify_account_unavailable", "Could not read chat information for the current account."));
        }
    }
}
