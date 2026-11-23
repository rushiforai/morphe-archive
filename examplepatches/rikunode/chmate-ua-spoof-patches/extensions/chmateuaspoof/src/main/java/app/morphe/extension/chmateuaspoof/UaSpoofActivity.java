package app.morphe.extension.chmateuaspoof;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.text.InputType;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/** Settings screen, built in code so the patch adds no resources. Launcher entry: "UA Spoof". */
public final class UaSpoofActivity extends Activity {
    private Switch enabled;
    private EditText agent;
    private TextView status;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(Build.VERSION.SDK_INT >= 29 ? android.R.style.Theme_DeviceDefault_DayNight
                : android.R.style.Theme_DeviceDefault_Light);
        super.onCreate(savedInstanceState);
        setTitle("ChMate UA Spoof");
        int pad = dp(16);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, pad);

        enabled = new Switch(this);
        enabled.setText("UA偽装を有効にする（初期値OFF）");
        root.addView(enabled);

        root.addView(label("User-Agent（全文がそのまま送信されます）"));
        agent = new EditText(this);
        agent.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        agent.setSingleLine(false);
        agent.setMinLines(2);
        root.addView(agent);

        root.addView(label("プリセット（入力欄に反映。保存で確定）"));
        preset(root, "Dalvik Android 14", UaSpoofRules.DALVIK_14);
        preset(root, "Dalvik Android 15", UaSpoofRules.DALVIK_15);
        preset(root, "Dalvik Android 16", UaSpoofRules.DALVIK_16);
        preset(root, "ブラウザ（この端末のWebView標準UA）", null);
        preset(root, "旧Dalvik（Android 4.0.3 / HT-01）", UaSpoofRules.LEGACY);

        Button save = button("保存して適用");
        save.setOnClickListener(v -> save());
        root.addView(save);
        Button reset = button("元に戻す（OFF・入力内容を消去）");
        reset.setOnClickListener(v -> {
            UaSpoofSettings.reset(this);
            load();
            toast("元の状態に戻しました。完全に反映するにはアプリを再起動してください。");
        });
        root.addView(reset);

        status = label("");
        root.addView(status);
        root.addView(label("注意: Cloudflareの確認中はUAを変更しないでください。どんぐりの育成中はUAを固定してください。"
                + "UAを変えてもIP規制は解除されません。変更はすぐに新しい通信へ反映されますが、"
                + "確実に反映するにはアプリを再起動してください。"));

        ScrollView scroll = new ScrollView(this);
        scroll.addView(root);
        scroll.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });
        setContentView(scroll);
        load();
    }

    private void load() {
        SharedPreferences prefs = UaSpoofSettings.prefs(this);
        enabled.setOnCheckedChangeListener(null);
        enabled.setChecked(prefs.getBoolean(UaSpoofSettings.KEY_ENABLED, false));
        agent.setText(prefs.getString(UaSpoofSettings.KEY_AGENT, UaSpoofRules.DALVIK_14));
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
        UaSpoofSettings.save(this, on, UaSpoofRules.valid(value) ? value : null);
        load();
        toast(on ? "保存しました（ON）" : "OFFにしました");
    }

    private void preset(LinearLayout root, String title, String value) {
        Button b = button(title);
        b.setOnClickListener(v -> {
            String text = value;
            if (text == null) {
                try { text = WebSettings.getDefaultUserAgent(this); }
                catch (RuntimeException error) { toast("WebViewのUAを取得できませんでした"); return; }
            }
            agent.setText(text);
        });
        root.addView(b);
    }

    private TextView label(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setPadding(0, dp(12), 0, dp(4));
        return view;
    }

    private Button button(String text) {
        Button b = new Button(this);
        b.setText(text);
        b.setAllCaps(false);
        b.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        return b;
    }

    private void toast(String text) { Toast.makeText(this, text, Toast.LENGTH_LONG).show(); }

    private int dp(int value) { return (int) (value * getResources().getDisplayMetrics().density + 0.5f); }
}
