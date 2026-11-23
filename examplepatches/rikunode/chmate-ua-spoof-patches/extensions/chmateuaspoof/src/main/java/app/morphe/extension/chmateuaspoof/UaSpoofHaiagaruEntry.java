package app.morphe.extension.chmateuaspoof;

import android.app.Activity;
import android.content.SharedPreferences;
import android.text.InputType;
import android.webkit.WebSettings;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Optional entry in Haiagaru 1.46.0's settings top list. Only appends one group and supplies the
 * plain Android controls for it; Haiagaru's own settings renderer draws them, so the category and
 * its detail screen use Haiagaru's existing card style. Existing groups are passed through as-is.
 * If any Haiagaru class or signature is missing, nothing is injected (the "UA Spoof" launcher
 * screen remains available either way).
 */
public final class UaSpoofHaiagaruEntry {
    static final String GROUP_ID = "chmateuaspoof";
    static final String SOURCE = "CHMATE_UA_SPOOF";
    private static final String HAIAGARU = "app.morphe.extension.chmate.";

    // Haiagaru's renderer keeps its own text-field state, so external view changes (preset text,
    // status) are shown by recreating the settings activity. Unsaved edits survive via this draft;
    // it is never persisted (only "保存して適用" writes the v0.1.0 preferences).
    private static String draftAgent;
    private static Boolean draftEnabled;

    private UaSpoofHaiagaruEntry() {}

    /** Hook: return value of HaiagaruSettingsActivityKt.settingsGroups(). */
    public static List<Object> groups(List<Object> groups) {
        try {
            if (groups == null || groups.isEmpty()) return groups;
            Class<?> type = groups.get(0).getClass();
            if (!type.getName().equals(HAIAGARU + "SettingsGroup")) {
                android.util.Log.w("ChMateUaSpoof", "Haiagaru settings entry not added: " + type.getName());
                return groups;
            }
            // SettingsGroup is package-private in Haiagaru, so its public members need setAccessible.
            Method id = type.getMethod("getId");
            id.setAccessible(true);
            for (Object group : groups) if (GROUP_ID.equals(id.invoke(group))) return groups;
            Constructor<?> create = type.getConstructor(String.class, String.class, String.class,
                    String.class, String.class, String.class, List.class);
            create.setAccessible(true);
            Object group = create.newInstance(GROUP_ID, "User-Agent 偽装", "User-Agent spoofing",
                    "UA切替・プリセット・適用設定", "Switch UA, presets and apply", "UA",
                    Collections.singletonList(SOURCE));
            List<Object> result = new ArrayList<>(groups);
            result.add(group);
            return result;
        } catch (Throwable error) {
            android.util.Log.w("ChMateUaSpoof", "Haiagaru settings entry not added", error);
            return groups;
        }
    }

    /** Hook: start of Haiagaru.settingsCategory(Activity, String). null = Haiagaru's own category. */
    public static LinearLayout category(Activity activity, String source) {
        if (!SOURCE.equals(source) || activity == null) return null;
        return new Form(activity).root;
    }

    private static final class Form {
        final Activity activity;
        final LinearLayout root;
        final Switch enabled;
        final EditText agent;
        final TextView status;

        Form(Activity activity) {
            this.activity = activity;
            root = vertical();

            enabled = new Switch(activity);
            enabled.setText("UA偽装を有効にする（初期値OFF）");
            root.addView(enabled);
            status = new TextView(activity);
            root.addView(status);

            root.addView(text("User-Agent（全文がそのまま送信されます）"));
            agent = new EditText(activity);
            agent.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                    | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            agent.setSingleLine(false);
            root.addView(agent);

            Button save = new Button(activity);
            save.setText("保存して適用");
            save.setOnClickListener(v -> save());
            root.addView(save);

            LinearLayout presets = section("プリセット", "入力欄に反映します。「保存して適用」で確定");
            preset(presets, "Dalvik Android 14", UaSpoofRules.DALVIK_14);
            preset(presets, "Dalvik Android 15", UaSpoofRules.DALVIK_15);
            preset(presets, "Dalvik Android 16", UaSpoofRules.DALVIK_16);
            preset(presets, "ブラウザ（この端末のWebView標準UA）", null);
            preset(presets, "旧Dalvik（Android 4.0.3 / HT-01）", UaSpoofRules.LEGACY);

            Button reset = new Button(activity);
            reset.setText("元に戻す（OFF・入力内容を消去）");
            reset.setOnClickListener(v -> {
                UaSpoofSettings.reset(activity);
                toast("元の状態に戻しました。完全に反映するにはアプリを再起動してください。");
                refresh(null, null);
            });
            root.addView(reset);

            LinearLayout notes = section("注意", "Cloudflare・どんぐり・IP規制");
            notes.addView(text("Cloudflareの確認中はUAを変更しないでください。どんぐりの育成中はUAを固定してください。"
                    + "UAを変えてもIP規制は解除されません。変更はすぐに新しい通信へ反映されますが、"
                    + "確実に反映するにはアプリを再起動してください。"));
            load();
        }

        private void load() {
            SharedPreferences prefs = UaSpoofSettings.prefs(activity);
            enabled.setOnCheckedChangeListener(null);
            enabled.setChecked(draftEnabled != null ? draftEnabled : prefs.getBoolean(UaSpoofSettings.KEY_ENABLED, false));
            agent.setText(draftAgent != null ? draftAgent : prefs.getString(UaSpoofSettings.KEY_AGENT, UaSpoofRules.DALVIK_14));
            draftAgent = null; // a draft is shown once, right after the recreate it triggered
            draftEnabled = null;
            enabled.setOnCheckedChangeListener((CompoundButton b, boolean on) -> { if (!on) save(); });
            String current = UaSpoof.current();
            status.setText("現在: " + (current == null ? "OFF（元のUA）" : "ON\n" + current));
        }

        private void save() {
            String value = agent.getText().toString().trim();
            boolean on = enabled.isChecked();
            if (on && !UaSpoofRules.valid(value)) {
                toast("UAは1〜1024文字の半角英数記号で入力してください（改行・全角は不可）。");
                return;
            }
            UaSpoofSettings.save(activity, on, UaSpoofRules.valid(value) ? value : null);
            toast(on ? "保存しました（ON）" : "OFFにしました");
            refresh(null, null);
        }

        private void preset(LinearLayout parent, String title, String value) {
            Button b = new Button(activity);
            b.setText(title);
            b.setOnClickListener(v -> {
                String text = value;
                if (text == null) {
                    try { text = WebSettings.getDefaultUserAgent(activity); }
                    catch (RuntimeException error) { toast("WebViewのUAを取得できませんでした"); return; }
                }
                refresh(text, enabled.isChecked());
            });
            parent.addView(b);
        }

        private void refresh(String agentDraft, Boolean enabledDraft) {
            draftAgent = agentDraft;
            draftEnabled = enabledDraft;
            activity.recreate();
        }

        /** Haiagaru's own collapsible section (public SettingsSection.add); plain group otherwise. */
        private LinearLayout section(String title, String summary) {
            try {
                Class<?> type = Class.forName(HAIAGARU + "SettingsSection", false, UaSpoofHaiagaruEntry.class.getClassLoader());
                Object section = type.getMethod("add", LinearLayout.class, String.class, String.class, boolean.class)
                        .invoke(null, root, title, summary, false);
                if (section instanceof LinearLayout) return (LinearLayout) section;
            } catch (Throwable ignored) {
            }
            LinearLayout plain = vertical();
            root.addView(text(title));
            root.addView(plain);
            return plain;
        }

        private LinearLayout vertical() {
            LinearLayout layout = new LinearLayout(activity);
            layout.setOrientation(LinearLayout.VERTICAL);
            return layout;
        }

        private TextView text(String value) {
            TextView view = new TextView(activity);
            view.setText(value);
            return view;
        }

        private void toast(String text) { Toast.makeText(activity, text, Toast.LENGTH_LONG).show(); }
    }
}
