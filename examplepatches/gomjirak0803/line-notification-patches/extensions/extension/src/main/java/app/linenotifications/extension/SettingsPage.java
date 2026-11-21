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
        toggle(title, detail + (included ? "" : " · 패치 미포함"), Settings.enabled(key), included, value -> {
            Settings.setEnabled(key, value);
            return true;
        });
    }

    private void showMain() {
        mutedPage = false;
        heading.setText("알림 패치 설정");
        rows.removeAllViews();
        scroll.scrollTo(0, 0);
        group("알림 표시");
        feature("Not Too Much Silent", "채팅방의 ‘알림 끄기’를 조용히 받기로 바꿉니다.", Settings.SILENT, Settings.silentIncluded());
        View hidden = inflate("line_user_settings_text_item_view");
        text(hidden, "setting_title", "완전히 숨긴 채팅방");
        text(hidden, "setting_description", "조용한 알림도 표시하지 않을 채팅방을 관리합니다.");
        hidden.findViewById(id("id", "setting_item_container")).setOnClickListener(v -> showMuted());
        feature("More Chat Info", "최근 메시지를 대화 형식으로 펼쳐 보고 읽지 않은 메시지 수를 표시합니다.", Settings.INFO, Settings.infoIncluded());
        group("알림 버튼");
        feature("No reply", "추천 답장을 숨기고 직접 입력하는 답장은 유지합니다.", Settings.NO_REPLY, Settings.noReplyIncluded());
        feature("Mark as read", "채팅방 전체를 읽음 처리하고 알림을 지웁니다.", Settings.READ, Settings.readIncluded());
        group("적용 범위");
        description("일반 채팅방에 적용됩니다. OpenChat 알림은 기존 설정을 따릅니다.");
    }

    private void showMuted() {
        mutedPage = true;
        heading.setText("완전히 숨긴 채팅방");
        rows.removeAllViews();
        scroll.scrollTo(0, 0);
        description("채팅방 메뉴의 ‘알림 완전히 숨기기’에서 추가할 수 있습니다. 스위치를 끄면 숨김이 해제됩니다.");
        try {
            String account = NativeLine.account();
            String prefix = Settings.mutePrefix(account);
            ArrayList<Map.Entry<String, ?>> entries = new ArrayList<>();
            for (Map.Entry<String, ?> entry : Settings.prefs().getAll().entrySet()) {
                if (entry.getKey().startsWith(prefix) && entry.getValue() instanceof String) entries.add(entry);
            }
            entries.sort(Comparator.comparing(e -> (String)e.getValue()));
            if (!Settings.enabled(Settings.SILENT)) description("완전히 숨긴 방은 LINE 기본 알림도 꺼져 있습니다.");
            if (entries.isEmpty()) { description("완전히 숨긴 채팅방이 없습니다."); return; }
            for (Map.Entry<String, ?> entry : entries) {
                String name = (String)entry.getValue();
                String chat = new String(Base64.decode(entry.getKey().substring(prefix.length()), Base64.URL_SAFE), StandardCharsets.UTF_8);
                toggle(name, "알림 완전히 숨기기", true, true, value -> {
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
            description("현재 계정의 채팅방 정보를 확인할 수 없습니다.");
        }
    }
}
