package app.s.chzzk.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.content.Context;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.SharedPreferences;
import android.view.Gravity;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public final class ChzzkSettings {
    private static SharedPreferences preferences;
    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static Object revision;
    private static Method readRevision;
    private static Method writeRevision;
    private static int revisionNumber;
    private static Object settingsAction;
    private static String[] keywords = new String[0];
    private static String[] blockedUsers = new String[0];
    private static final LinkedHashMap<String, ChatRecord> history = new LinkedHashMap<>();


    private ChzzkSettings() {}

    public static void attach(Activity host) {
        activity = new WeakReference<>(host);
        if (preferences == null) {
            preferences = host.getApplicationContext().getSharedPreferences("s_chzzk", Context.MODE_PRIVATE);
            keywords = lines(preferences.getString("keywords", ""));
            blockedUsers = lines(preferences.getString("blocked_users", ""));
            revision = createRevision();
            try {
                readRevision = Class.forName("androidx.compose.runtime.State").getMethod("getValue");
                writeRevision = Class.forName("androidx.compose.runtime.MutableState").getMethod("setValue", Object.class);
            } catch (ReflectiveOperationException e) {
                throw new IllegalStateException("CHZZK Compose state bridge is unavailable", e);
            }
        }
        ChatUi.attach(host);
    }

    public static Object createRevision() { return null; }
    public static String messageContent(Object message) { return ""; }
    public static String visibleContent(Object message) { return ""; }
    public static String messageNickname(Object message) { return ""; }
    public static String messageKind(Object message) { return ""; }
    public static String messageStatus(Object message) { return ""; }
    public static String messageRole(Object message) { return ""; }
    public static String messageId(Object message) { return ""; }
    public static long messageTime(Object message) { return 0L; }
    public static boolean isAdCard(Object card) { return "AD".equals(card); }
    public static boolean autoClaimAvailable() { return false; }
    public static Object kotlinUnit() { return null; }

    public static Object settingsClick() {
        if (settingsAction == null) {
            try {
                Class<?> function = Class.forName("kotlin.jvm.functions.Function0");
                settingsAction = Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[] {function},
                    (proxy, method, args) -> {
                        switch (method.getName()) {
                            case "invoke":
                                Activity host = activity.get();
                                if (host != null && !host.isFinishing() && !host.isDestroyed()) showSettings(host);
                                return kotlinUnit();
                            case "hashCode": return System.identityHashCode(proxy);
                            case "equals": return proxy == args[0];
                            case "toString": return "Morphe settings";
                            default: throw new UnsupportedOperationException(method.getName());
                        }
                    });
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException(e);
            }
        }
        return settingsAction;
    }

    public static List<?> filterClipCards(List<?> cards) {
        if (cards == null) return null;
        ArrayList<Object> filtered = new ArrayList<>(cards.size());
        for (Object card : cards) {
            if (card == null || !isAdCard(card)) filtered.add(card);
        }
        return filtered.size() == cards.size() ? cards : filtered;
    }

    private static void observe() {
        if (revision == null) return;
        try {
            readRevision.invoke(revision);
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException(e);
        }
    }

    static void changed() {
        if (revision == null) return;
        try {
            writeRevision.invoke(revision, ++revisionNumber);
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException(e);
        }
    }

    public static int settingsRevision() {
        observe();
        return revisionNumber;
    }

    static boolean enabled(String key) {
        observe();
        return preferences != null && preferences.getBoolean(key, false);
    }

    static int number(String key, int fallback) {
        observe();
        return preferences == null ? fallback : preferences.getInt(key, fallback);
    }

    public static float chatWidth(float original) {
        Activity host = activity.get();
        if (host == null || original <= 0) return original;
        if (preferences != null && !preferences.contains("chat_width_scale")) {
            int scale = 100;
            if (preferences.contains("chat_width_percent")) {
                int old = number("chat_width_percent", 0);
                if (old > 0) scale = Math.round(windowWidthDp(host) * old / original);
            } else {
                boolean tablet = host.getResources().getConfiguration().smallestScreenWidthDp >= 600;
                int old = number(tablet ? "tablet_width" : "phone_width", 0);
                if (old > 0) scale = Math.round(old * 100f / original);
            }
            preferences.edit().putInt("chat_width_scale", Math.max(50, Math.min(300, scale))).apply();
        }
        int saved = number("chat_width_scale", 100);
        int value = ChatUi.dragPercent >= 0 ? ChatUi.dragPercent : saved;
        return original * value / 100f;
    }

    static float windowWidthDp(Activity host) {
        int pixels = host.getWindow().getDecorView().getWidth();
        return pixels > 0 ? pixels / host.getResources().getDisplayMetrics().density
            : host.getResources().getConfiguration().screenWidthDp;
    }

    static void setNumber(String key, int value) {
        preferences.edit().putInt(key, value).apply();
        changed();
    }

    static boolean enabledByDefault(String key) {
        observe();
        return preferences == null || preferences.getBoolean(key, true);
    }

    public static float scaleFont(float value) {
        return value * number("font_scale", 100) / 100f;
    }

    public static float scaleLine(float value) {
        return scaleFont(value) * number("line_scale", 100) / 100f;
    }

    public static float scaleEmoji(float value) {
        return value * number("emoji_scale", 100) / 100f;
    }

    public static long scaleTextUnit(long value) {
        if ((value & 0xff00000000L) != 0x100000000L) return value;
        float scaled = scaleFont(Float.intBitsToFloat((int) value));
        return (value & 0xffffffff00000000L) | (Float.floatToRawIntBits(scaled) & 0xffffffffL);
    }

    public static long scaleBadge(long value) {
        if ((value & 0xff00000000L) != 0x100000000L) return value;
        float scaled = Float.intBitsToFloat((int) value) * number("badge_scale", 100) / 100f;
        return (value & 0xffffffff00000000L) | (Float.floatToRawIntBits(scaled) & 0xffffffffL);
    }

    public static boolean hideHeader(Object item) {
        if (item == null) return false;
        switch (item.getClass().getSimpleName()) {
            case "DonationRank": return enabled("hide_donation_rank");
            case "TongPowRank": return enabled("hide_tongpow_rank");
            case "TongPowPrediction": return enabled("hide_prediction_panel");
            case "FcOnlinePersonalized": return enabled("hide_chat_promotions");
            default: return false;
        }
    }

    public static boolean hideFollowPrompt() {
        return enabled("hide_follow_prompt");
    }

    public static boolean cleanbot(boolean original) {
        return original && !enabled("restore_cleanbot");
    }

    public static boolean autoClaim() {
        observe();
        return preferences == null || preferences.getBoolean("auto_claim", true);
    }

    public static boolean hideMessage(Object message) {
        if (message == null) return false;
        String content = messageContent(message);
        String nickname = messageNickname(message);
        String kind = messageKind(message);
        observe();
        if (matches(content, keywords, false) || matches(nickname, blockedUsers, true)) return true;
        if (("DONATION".equals(kind) || kind.startsWith("PARTY_DONATION")) && enabled("hide_donation")) return true;
        if (("SUBSCRIPTION".equals(kind) || "GIFT".equals(kind)) && enabled("hide_subscription")) return true;
        if (("SYSTEM".equals(kind) || "OPEN".equals(kind) || "WELCOME".equals(kind)) && enabled("hide_system")) return true;
        if (kind.startsWith("TONG_POW_PREDICTION") && enabled("hide_prediction")) return true;
        if ("WATCH_PARTY_PLUS".equals(kind) && enabled("hide_party")) return true;
        if ("STREAMER_SHOP_PURCHASE".equals(kind) && enabled("hide_shop")) return true;
        if (enabled("keep_history") && "USER".equals(kind) && content != null) {
            String id = messageId(message);
            if (id != null && !id.isEmpty()) {
                synchronized (history) {
                    history.put(id, new ChatRecord(messageTime(message), nickname,
                        restoreBlindText(visibleContent(message), content, messageStatus(message))));
                    while (history.size() > 200) history.remove(history.keySet().iterator().next());
                }
            }
        }
        return false;
    }

    public static String decorateMessage(String original, Object message) {
        String text = original == null ? "" : original;
        return enabled("multiline") ? "\n" + text : text;
    }

    public static String displayMessage(Object message) {
        String visible = restoreBlindText(visibleContent(message), messageContent(message), messageStatus(message));
        return decorateMessage(visible, message);
    }

    public static String restoreBlindText(String visible, String raw, String status) {
        if (enabled("restore_blind") && raw != null && !raw.isEmpty()
                && ("BLIND".equals(status) || "HIDDEN".equals(status) || "RECLAIM".equals(status))) {
            return raw;
        }
        return visible;
    }

    private static final class ChatRecord {
        final long timestamp;
        final String nickname;
        final String content;
        ChatRecord(long timestamp, String nickname, String content) {
            this.timestamp = timestamp;
            this.nickname = nickname == null ? "" : nickname;
            this.content = content;
        }
    }

    static String chatTime(long timestamp) {
        if (timestamp <= 0) return "";
        String[] formats = {"HH:mm", "HH:mm:ss", "a h:mm", "a h:mm:ss"};
        int format = Math.max(0, Math.min(formats.length - 1, number("timestamp_format", 0)));
        return new SimpleDateFormat(formats[format], Locale.KOREAN).format(new Date(timestamp));
    }

    private static boolean matches(String value, String[] patterns, boolean exact) {
        if (value == null) return false;
        String folded = value.toLowerCase(Locale.ROOT);
        for (String pattern : patterns) {
            if (exact ? folded.equals(pattern) : folded.contains(pattern)) return true;
        }
        return false;
    }

    private static String[] lines(String value) {
        ArrayList<String> result = new ArrayList<>();
        for (String line : value.split("\\R")) {
            String text = line.trim().toLowerCase(Locale.ROOT);
            if (!text.isEmpty() && text.length() <= 100 && result.size() < 100) result.add(text);
        }
        return result.toArray(new String[0]);
    }

    private static int dp(Context context, float value) {
        return Math.round(context.getResources().getDisplayMetrics().density * value);
    }

    private static final int BACKGROUND = 0xff141619;
    private static final int SURFACE = 0xff202327;
    private static final int TEXT = 0xffeff1f4;
    private static final int MUTED = 0xff9ba2ae;
    private static final int GREEN = 0xff00efa3;

    private static GradientDrawable background(Context context, int color, int radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(context, radius));
        return drawable;
    }

    private static LinearLayout panel(Context context) {
        LinearLayout panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(dp(context, 20), dp(context, 8), dp(context, 20), dp(context, 20));
        return panel;
    }

    private static TextView text(Context context, String value, int size, int color) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setIncludeFontPadding(false);
        return view;
    }

    private static void label(LinearLayout panel, String value) {
        TextView view = text(panel.getContext(), value, 12, MUTED);
        view.setLineSpacing(dp(panel.getContext(), 3), 1);
        view.setPadding(0, dp(panel.getContext(), 8), 0, dp(panel.getContext(), 14));
        panel.addView(view);
    }

    private static void slider(LinearLayout panel, String title, String key, int min, int max, int fallback, String unit) {
        Context context = panel.getContext();
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(context, 16), 0, dp(context, 4));
        row.addView(text(context, title, 14, TEXT), new LinearLayout.LayoutParams(0, -2, 1));
        int current = number(key, fallback);
        TextView value = text(context, current + unit + ("chat_width_scale".equals(key) && current == 100 ? " · 기본" : ""), 13, GREEN);
        value.setTypeface(null, Typeface.BOLD);
        row.addView(value);
        panel.addView(row);
        SeekBar seek = new SeekBar(context);
        seek.setMax(max - min);
        seek.setProgress(Math.max(0, current - min));
        seek.setProgressTintList(ColorStateList.valueOf(GREEN));
        seek.setProgressBackgroundTintList(ColorStateList.valueOf(0xff434950));
        seek.setThumbTintList(ColorStateList.valueOf(GREEN));
        seek.setContentDescription(title);
        panel.addView(seek, new LinearLayout.LayoutParams(-1, dp(context, 44)));
        if ("chat_width_scale".equals(key)) {
            value.setGravity(Gravity.CENTER);
            value.setMinWidth(dp(context, 96));
            for (int delta : new int[] {-5, 5}) {
                TextView step = text(context, delta < 0 ? "−" : "+", 24, GREEN);
                step.setGravity(Gravity.CENTER);
                step.setContentDescription(delta < 0 ? "채팅 폭 5% 줄이기" : "채팅 폭 5% 늘리기");
                row.addView(step, delta < 0 ? 1 : row.getChildCount(),
                    new LinearLayout.LayoutParams(dp(context, 40), dp(context, 40)));
                step.setOnClickListener(view -> {
                    int next = Math.max(min, Math.min(max, number(key, fallback) + delta));
                    seek.setProgress(next - min);
                    value.setText(next + unit + (next == 100 ? " · 기본" : ""));
                    setNumber(key, next);
                });
            }
        }
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                if (!fromUser) return;
                int next = progress + min;
                value.setText(next + unit + ("chat_width_scale".equals(key) && next == 100 ? " · 기본" : ""));
                setNumber(key, next);
            }
            public void onStartTrackingTouch(SeekBar bar) {}
            public void onStopTrackingTouch(SeekBar bar) {}
        });
    }

    private static Switch toggle(LinearLayout panel, String title, String key, boolean fallback) {
        Context context = panel.getContext();
        Switch control = new Switch(context);
        control.setText(title);
        control.setTextColor(TEXT);
        control.setTextSize(14);
        control.setSwitchPadding(dp(context, 18));
        control.setMinHeight(dp(context, 54));
        control.setPadding(0, dp(context, 10), 0, dp(context, 10));
        int[][] states = {new int[] {android.R.attr.state_checked}, new int[0]};
        control.setThumbTintList(new ColorStateList(states, new int[] {GREEN, 0xffa6abb3}));
        control.setTrackTintList(new ColorStateList(states, new int[] {0xff196b54, 0xff41464e}));
        control.setChecked(preferences.getBoolean(key, fallback));
        control.setOnCheckedChangeListener((button, checked) -> {
            preferences.edit().putBoolean(key, checked).apply();
            if ("keep_history".equals(key) && !checked) synchronized (history) { history.clear(); }
            changed();
        });
        panel.addView(control, new LinearLayout.LayoutParams(-1, -2));
        return control;
    }

    private static void action(LinearLayout panel, String title, Runnable callback) {
        navigation(panel, title, null, callback);
    }

    private static void navigation(LinearLayout panel, String title, String subtitle, Runnable callback) {
        Context context = panel.getContext();
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(context, 16), dp(context, 15), dp(context, 16), dp(context, 15));
        row.setBackground(background(context, SURFACE, 12));
        android.util.TypedValue ripple = new android.util.TypedValue();
        context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true);
        row.setForeground(context.getDrawable(ripple.resourceId));
        LinearLayout words = new LinearLayout(context);
        words.setOrientation(LinearLayout.VERTICAL);
        TextView name = text(context, title, 15, TEXT);
        words.addView(name);
        if (subtitle != null) {
            TextView detail = text(context, subtitle, 12, MUTED);
            detail.setPadding(0, dp(context, 6), dp(context, 8), 0);
            words.addView(detail);
        }
        row.addView(words, new LinearLayout.LayoutParams(0, -2, 1));
        row.addView(text(context, "›", 23, MUTED));
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(-1, -2);
        layout.bottomMargin = dp(context, 8);
        panel.addView(row, layout);
        row.setOnClickListener(view -> callback.run());
    }

    private static final class Sheet extends Dialog {
        final Activity host;
        final LinearLayout content;
        final TextView title;
        final TextView back;
        final ScrollView scroll;
        Runnable onBack;
        int heightDp = 720;

        Sheet(Activity host, String heading) {
            super(host);
            this.host = host;
            requestWindowFeature(Window.FEATURE_NO_TITLE);
            LinearLayout root = new LinearLayout(host);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackground(background(host, BACKGROUND, 22));
            LinearLayout header = new LinearLayout(host);
            header.setGravity(Gravity.CENTER_VERTICAL);
            header.setPadding(dp(host, 8), dp(host, 8), dp(host, 8), 0);
            back = text(host, "‹", 30, TEXT);
            back.setGravity(Gravity.CENTER);
            back.setContentDescription("이전 설정 화면");
            back.setVisibility(View.GONE);
            back.setOnClickListener(view -> { if (onBack != null) onBack.run(); });
            header.addView(back, new LinearLayout.LayoutParams(dp(host, 44), dp(host, 48)));
            title = text(host, heading, 20, TEXT);
            title.setTypeface(null, Typeface.BOLD);
            title.setPadding(dp(host, 12), 0, 0, 0);
            header.addView(title, new LinearLayout.LayoutParams(0, dp(host, 56), 1));
            title.setGravity(Gravity.CENTER_VERTICAL);
            TextView close = text(host, "×", 27, MUTED);
            close.setGravity(Gravity.CENTER);
            close.setContentDescription("닫기");
            close.setOnClickListener(view -> dismiss());
            header.addView(close, new LinearLayout.LayoutParams(dp(host, 48), dp(host, 48)));
            root.addView(header);
            scroll = new ScrollView(host);
            scroll.setFillViewport(false);
            scroll.setClipToPadding(false);
            content = panel(host);
            scroll.addView(content);
            root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
            setContentView(root);
            setOnKeyListener((dialog, key, event) -> {
                if (key == android.view.KeyEvent.KEYCODE_BACK && onBack != null) {
                    if (event.getAction() == android.view.KeyEvent.ACTION_UP) onBack.run();
                    return true;
                }
                return false;
            });
        }

        void page(String heading, Runnable backAction) {
            title.setText(heading);
            onBack = backAction;
            back.setVisibility(backAction == null ? View.GONE : View.VISIBLE);
            content.removeAllViews();
            scroll.scrollTo(0, 0);
        }

        @Override public void show() {
            super.show();
            Window window = getWindow();
            window.setBackgroundDrawableResource(android.R.color.transparent);
            android.graphics.Rect frame = new android.graphics.Rect();
            host.getWindow().getDecorView().getWindowVisibleDisplayFrame(frame);
            int width = frame.width() > 0 ? frame.width() : host.getResources().getDisplayMetrics().widthPixels;
            int height = frame.height() > 0 ? frame.height() : host.getResources().getDisplayMetrics().heightPixels;
            window.setLayout(Math.min(dp(host, 480), width - dp(host, 24)), Math.min(dp(host, heightDp), height - dp(host, 40)));
            window.setDimAmount(0.55f);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
    }

    public static void showQuickSettings(Activity host) {
        Sheet sheet = new Sheet(host, "채팅 빠른 조절");
        sheet.heightDp = 440;
        quickControls(sheet);
        sheet.show();
    }

    private static void quickControls(Sheet sheet) {
        LinearLayout content = sheet.content;
        label(content, "변경 사항은 바로 적용되고 저장됩니다.");
        slider(content, "채팅 폭", "chat_width_scale", 50, 300, 100, "%");
        slider(content, "글자 크기", "font_scale", 80, 200, 100, "%");
        action(content, "채팅 폭을 기본값으로", () -> {
            setNumber("chat_width_scale", 100);
            content.removeAllViews();
            quickControls(sheet);
        });
        action(content, "모든 설정", () -> { sheet.dismiss(); showSettings(sheet.host); });
    }

    private static EditText input(Sheet sheet, String hint) {
        EditText field = new EditText(sheet.host);
        field.setTextColor(TEXT);
        field.setHintTextColor(MUTED);
        field.setTextSize(14);
        field.setMinLines(5);
        field.setMaxLines(10);
        field.setGravity(Gravity.TOP);
        field.setHint(hint);
        field.setPadding(dp(sheet.host, 14), dp(sheet.host, 12), dp(sheet.host, 14), dp(sheet.host, 12));
        field.setBackground(background(sheet.host, SURFACE, 12));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.bottomMargin = dp(sheet.host, 16);
        sheet.content.addView(field, params);
        return field;
    }

    private static void editList(Activity host, String title, String key) {
        Sheet sheet = new Sheet(host, title);
        sheet.heightDp = 440;
        label(sheet.content, "한 줄에 하나씩, 최대 100개");
        EditText field = input(sheet, "단어나 닉네임을 입력하세요");
        field.setText(preferences.getString(key, ""));
        action(sheet.content, "저장", () -> {
            String[] parsed = lines(field.getText().toString());
            preferences.edit().putString(key, String.join("\n", parsed)).apply();
            if ("keywords".equals(key)) keywords = parsed;
            else blockedUsers = parsed;
            changed();
            sheet.dismiss();
        });
        sheet.show();
    }

    private static void showHistory(Sheet sheet) {
        sheet.page("최근 채팅", () -> home(sheet));
        LinearLayout content = sheet.content;
        Switch remember = toggle(content, "최근 채팅 기억하기", "keep_history", false);
        remember.setOnCheckedChangeListener((button, checked) -> {
            preferences.edit().putBoolean("keep_history", checked).apply();
            if (!checked) synchronized (history) { history.clear(); }
            changed();
            showHistory(sheet);
        });
        ArrayList<ChatRecord> records;
        synchronized (history) { records = new ArrayList<>(history.values()); }
        label(content, records.size() + " / 200개 · 앱을 종료하면 지워집니다.");
        if (records.isEmpty()) {
            TextView empty = text(sheet.host, "아직 기록된 채팅이 없어요", 16, TEXT);
            empty.setGravity(Gravity.CENTER);
            empty.setPadding(0, dp(sheet.host, 48), 0, dp(sheet.host, 12));
            content.addView(empty);
            label(content, "기억하기를 켜면 화면에 표시된 일반 채팅을 이곳에서 다시 볼 수 있습니다.");
            return;
        }
        action(content, "기록 지우기", () -> {
            synchronized (history) { history.clear(); }
            showHistory(sheet);
        });
        for (int i = records.size() - 1; i >= 0; i--) {
            ChatRecord record = records.get(i);
            LinearLayout row = new LinearLayout(sheet.host);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setPadding(dp(sheet.host, 14), dp(sheet.host, 13), dp(sheet.host, 14), dp(sheet.host, 13));
            row.setBackground(background(sheet.host, SURFACE, 12));
            LinearLayout meta = new LinearLayout(sheet.host);
            meta.setGravity(Gravity.CENTER_VERTICAL);
            TextView name = text(sheet.host, record.nickname, 13, GREEN);
            name.setSingleLine(true);
            name.setEllipsize(android.text.TextUtils.TruncateAt.END);
            name.setTypeface(null, Typeface.BOLD);
            meta.addView(name, new LinearLayout.LayoutParams(0, -2, 1));
            TextView time = text(sheet.host, chatTime(record.timestamp), 11, MUTED);
            time.setPadding(dp(sheet.host, 12), 0, 0, 0);
            meta.addView(time);
            row.addView(meta);
            TextView body = text(sheet.host, record.content == null ? "" :
                record.content.replaceAll("\\{:[^{}\\s]+:\\}", "［이모티콘］"), 15, TEXT);
            body.setLineSpacing(dp(sheet.host, 4), 1);
            body.setPadding(0, dp(sheet.host, 8), 0, 0);
            body.setTextIsSelectable(true);
            row.addView(body);
            LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(-1, -2);
            layout.bottomMargin = dp(sheet.host, 7);
            content.addView(row, layout);
        }
    }

    private static boolean booleanKey(String key) {
        switch (key) {
            case "timestamps": case "multiline": case "hide_nickname": case "restore_cleanbot": case "restore_blind":
            case "hide_donation": case "hide_subscription": case "hide_system": case "hide_prediction":
            case "hide_party": case "hide_shop": case "hide_donation_rank": case "hide_tongpow_rank":
            case "hide_prediction_panel": case "hide_chat_promotions": case "hide_follow_prompt":
            case "auto_claim": case "keep_history":
            case "drag_chat_width": case "device_icons": case "hide_role_badge":
            case "hide_subscription_badge": case "hide_donation_badge": case "hide_activity_badge":
            case "hide_verified_badge": case "hide_channel_badge": case "hide_clip_button":
            case "live_catch_up":
            case "hide_cast_button": case "hide_share_button":
                return true;
            default: return false;
        }
    }

    private static int[] bounds(String key) {
        switch (key) {
            case "phone_width": case "tablet_width": return new int[] {120, 600};
            case "chat_width_percent": return new int[] {10, 70};
            case "chat_width_scale": return new int[] {50, 300};
            case "font_scale": case "emoji_scale": case "badge_scale": return new int[] {80, 200};
            case "line_scale": return new int[] {80, 160};
            case "timestamp_format": return new int[] {0, 3};
            case "timestamp_size": return new int[] {60, 100};
            default: return null;
        }
    }

    private static Map<String, Object> parseSettings(String text) throws JSONException {
        if (text.length() > 65536) throw new IllegalArgumentException("설정 내용이 너무 큽니다.");
        JSONObject envelope = new JSONObject(text);
        Object version = envelope.opt("version");
        if (!"s-chzzk-settings".equals(envelope.optString("format"))
                || !(version instanceof Integer) || (Integer) version != 1) {
            throw new IllegalArgumentException("지원하는 치지직 설정 형식이 아닙니다.");
        }
        JSONObject settings = envelope.getJSONObject("settings");
        LinkedHashMap<String, Object> result = new LinkedHashMap<>();
        java.util.Iterator<String> keys = settings.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            Object value = settings.get(key);
            int[] range = bounds(key);
            if (booleanKey(key)) {
                if (!(value instanceof Boolean)) throw new IllegalArgumentException(key + ": 켜기/끄기 값이 필요합니다.");
            } else if (range != null) {
                if (!(value instanceof Integer)) throw new IllegalArgumentException(key + ": 정수가 필요합니다.");
                int number = (Integer) value;
                if (!((key.endsWith("_width") || key.equals("chat_width_percent")) && number == 0)
                        && (number < range[0] || number > range[1])) {
                    throw new IllegalArgumentException(key + ": 설정 범위를 벗어났습니다.");
                }
            } else if ("keywords".equals(key) || "blocked_users".equals(key)) {
                if (!(value instanceof String)) throw new IllegalArgumentException(key + ": 텍스트가 필요합니다.");
                value = String.join("\n", lines((String) value));
            } else {
                throw new IllegalArgumentException("알 수 없는 설정: " + key);
            }
            result.put(key, value);
        }
        return result;
    }

    private static void copySettings(Activity host) {
        try {
            JSONObject envelope = new JSONObject().put("format", "s-chzzk-settings").put("version", 1)
                .put("settings", new JSONObject(preferences.getAll()));
            ClipboardManager clipboard = (ClipboardManager) host.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText("Morphe 치지직 설정", envelope.toString(2)));
            Toast.makeText(host, "설정을 복사했습니다.", Toast.LENGTH_SHORT).show();
        } catch (JSONException e) {
            Toast.makeText(host, "설정을 복사하지 못했습니다.", Toast.LENGTH_SHORT).show();
        }
    }

    private static void pasteSettings(Activity host, Dialog parent) {
        Sheet dialog = new Sheet(host, "설정 붙여넣기");
        label(dialog.content, "적용하면 현재 설정이 교체됩니다. 최근 채팅 기록은 복사되지 않습니다.");
        EditText input = input(dialog, "복사한 설정을 붙여넣으세요");
        ClipboardManager clipboard = (ClipboardManager) host.getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clip = clipboard.getPrimaryClip();
        if (clip != null && clip.getItemCount() > 0) {
            CharSequence copied = clip.getItemAt(0).getText();
            if (copied != null && copied.length() <= 65536) input.setText(copied);
        }
        action(dialog.content, "설정 적용", () -> {
            try {
                Map<String, Object> settings = parseSettings(input.getText().toString());
                SharedPreferences.Editor editor = preferences.edit().clear();
                for (Map.Entry<String, Object> entry : settings.entrySet()) {
                    Object value = entry.getValue();
                    if (value instanceof Boolean) editor.putBoolean(entry.getKey(), (Boolean) value);
                    else if (value instanceof Integer) editor.putInt(entry.getKey(), (Integer) value);
                    else editor.putString(entry.getKey(), (String) value);
                }
                editor.apply();
                keywords = lines(preferences.getString("keywords", ""));
                blockedUsers = lines(preferences.getString("blocked_users", ""));
                if (!preferences.getBoolean("keep_history", false)) synchronized (history) { history.clear(); }
                changed();
                dialog.dismiss();
                parent.dismiss();
                showSettings(host);
                Toast.makeText(host, "설정을 적용했습니다.", Toast.LENGTH_SHORT).show();
            } catch (JSONException | IllegalArgumentException e) {
                input.setError("설정을 적용하지 않았습니다. " + e.getMessage());
            }
        });
        dialog.show();
    }

    public static void showSettings(Activity host) {
        Sheet sheet = new Sheet(host, "Morphe");
        home(sheet);
        sheet.show();
    }

    private static void home(Sheet sheet) {
        sheet.page("Morphe", null);
        label(sheet.content, "치지직을 내 화면에 맞게 · 변경 즉시 저장");
        navigation(sheet.content, "채팅 화면", "폭 · 글자 · 간격 · 전송 시각", () -> chatPage(sheet));
        navigation(sheet.content, "닉네임과 배지", "닉네임과 각 배지를 따로 표시", () -> badgePage(sheet));
        navigation(sheet.content, "메시지와 채팅 주변", "원문 표시 · 안내 메시지 · 순위", () -> messagePage(sheet));
        navigation(sheet.content, "플레이어", "실시간 따라잡기 · 버튼 표시", () -> playerPage(sheet));
        navigation(sheet.content, "최근 채팅", "화면에 표시된 대화 다시 보기", () -> showHistory(sheet));
        navigation(sheet.content, "설정 관리", "설정 복사 · 붙여넣기 · 초기화", () -> managePage(sheet));
    }

    private static LinearLayout page(Sheet sheet, String title) {
        sheet.page(title, () -> home(sheet));
        return sheet.content;
    }

    private static void chatPage(Sheet sheet) {
        LinearLayout content = page(sheet, "채팅 화면");
        toggle(content, "드래그로 채팅 폭 조절", "drag_chat_width", true);
        label(content, "영상과 채팅 사이 손잡이를 좌우로 움직이세요. 가볍게 누르면 폭과 글자 크기를 바로 조절할 수 있습니다.");
        slider(content, "채팅 폭", "chat_width_scale", 50, 300, 100, "%");
        action(content, "채팅 폭을 기본값으로", () -> { setNumber("chat_width_scale", 100); chatPage(sheet); });
        label(content, "100%가 앱 기본 폭입니다. 영상과 채팅이 나란히 있을 때 적용되며, 영상 공간을 남기도록 화면 크기에 따라 최대 폭이 제한됩니다.");
        slider(content, "글자 크기", "font_scale", 80, 200, 100, "%");
        slider(content, "이모티콘 크기", "emoji_scale", 80, 200, 100, "%");
        slider(content, "줄 간격", "line_scale", 80, 160, 100, "%");
        toggle(content, "닉네임과 본문 줄 분리", "multiline", false);
        toggle(content, "닉네임 앞에 시각 표시", "timestamps", false);
        String[] formats = {"17:41 · 시:분", "17:41:09 · 시:분:초", "오후 5:41", "오후 5:41:09"};
        navigation(content, "시각 형식", formats[number("timestamp_format", 0)], () -> {
            LinearLayout choices = page(sheet, "시각 형식");
            sheet.onBack = () -> chatPage(sheet);
            for (int i = 0; i < formats.length; i++) {
                final int format = i;
                action(choices, (number("timestamp_format", 0) == i ? "✓  " : "") + formats[i], () -> {
                    setNumber("timestamp_format", format);
                    chatPage(sheet);
                });
            }
        });
        slider(content, "시각 크기 · 닉네임 대비", "timestamp_size", 60, 100, 80, "%");
        toggle(content, "PC·모바일·iOS 아이콘 표시", "device_icons", false);
        label(content, "PC는 모니터, 안드로이드는 휴대폰, iOS는 Apple 아이콘으로 표시합니다. 접속 기기 정보가 있는 채팅에만 적용됩니다.");
    }

    private static void badgePage(Sheet sheet) {
        LinearLayout content = page(sheet, "닉네임과 배지");
        toggle(content, "닉네임만 숨기기", "hide_nickname", false);
        label(content, "닉네임과 배지는 서로 독립적으로 설정됩니다.");
        toggle(content, "구독 배지 숨기기", "hide_subscription_badge", false);
        toggle(content, "후원 순위 배지 숨기기", "hide_donation_badge", false);
        toggle(content, "활동·이벤트 배지 숨기기", "hide_activity_badge", false);
        toggle(content, "인증 마크 숨기기", "hide_verified_badge", false);
        toggle(content, "채널 배지 숨기기", "hide_channel_badge", false);
        toggle(content, "스트리머·관리자 배지 숨기기", "hide_role_badge", false);
        slider(content, "배지 크기", "badge_scale", 80, 200, 100, "%");
        label(content, "글자 크기에 배지 배율을 추가로 적용합니다.");
    }

    private static void messagePage(Sheet sheet) {
        LinearLayout content = page(sheet, "메시지와 채팅 주변");
        toggle(content, "클린봇 원문 표시", "restore_cleanbot", false);
        toggle(content, "임시차단·블라인드 원문 표시", "restore_blind", false);
        label(content, "앱에 남아 있는 원문을 표시합니다. 서버에서 보내지 않은 내용은 복원할 수 없습니다.");
        toggle(content, "후원·파티 후원 숨기기", "hide_donation", false);
        toggle(content, "구독·선물 메시지 숨기기", "hide_subscription", false);
        toggle(content, "입장·환영·시스템 메시지 숨기기", "hide_system", false);
        toggle(content, "승부예측 메시지 숨기기", "hide_prediction", false);
        toggle(content, "같이보기 안내 숨기기", "hide_party", false);
        toggle(content, "스트리머샵 구매 메시지 숨기기", "hide_shop", false);
        label(content, "채팅 주변 요소");
        toggle(content, "후원 순위 숨기기", "hide_donation_rank", false);
        toggle(content, "통나무 순위 숨기기", "hide_tongpow_rank", false);
        toggle(content, "승부예측 패널 숨기기", "hide_prediction_panel", false);
        toggle(content, "게임 프로모션 숨기기", "hide_chat_promotions", false);
        toggle(content, "팔로우 권유 팝업 숨기기", "hide_follow_prompt", false);
        action(content, "숨길 단어", () -> editList(sheet.host, "본문에 포함된 단어", "keywords"));
        action(content, "숨길 닉네임", () -> editList(sheet.host, "정확히 일치하는 닉네임", "blocked_users"));
    }

    private static void playerPage(Sheet sheet) {
        LinearLayout content = page(sheet, "플레이어");
        toggle(content, "실시간 따라잡기 버튼", "live_catch_up", true);
        label(content, "동심원 버튼을 누르면 플레이어가 제공하는 실시간 위치로 이동합니다.");
        toggle(content, "클립 만들기 버튼 숨기기", "hide_clip_button", false);
        toggle(content, "크롬캐스트 버튼 숨기기", "hide_cast_button", false);
        toggle(content, "공유 버튼 숨기기", "hide_share_button", false);
        if (autoClaimAvailable()) toggle(content, "통나무 파워 자동 수령", "auto_claim", true);
    }

    private static void managePage(Sheet sheet) {
        LinearLayout content = page(sheet, "설정 관리");
        label(content, "현재 설정을 복사해 다른 기기에도 적용할 수 있습니다.");
        action(content, "설정 복사", () -> copySettings(sheet.host));
        action(content, "설정 붙여넣기", () -> pasteSettings(sheet.host, sheet));
        action(content, "설정 초기화", () -> {
            LinearLayout confirm = page(sheet, "설정 초기화");
            sheet.onBack = () -> managePage(sheet);
            label(confirm, "모든 채팅·플레이어 설정과 최근 채팅을 초기화합니다.");
            action(confirm, "기본 설정으로 되돌리기", () -> {
                preferences.edit().clear().apply();
                keywords = new String[0];
                blockedUsers = new String[0];
                synchronized (history) { history.clear(); }
                changed();
                home(sheet);
            });
            action(confirm, "취소", () -> managePage(sheet));
        });
    }
}
