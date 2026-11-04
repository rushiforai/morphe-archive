package app.proxypatches.extension;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/**
 * "Proxy settings" screen. Opened from the app icon's long-press menu, or from Morphe's settings
 * menu if present. Works offline, so it's reachable even when the proxy is wrong or down.
 * Registered in the manifest by the patch.
 */
@SuppressWarnings("deprecation")
public class ProxySettingsActivity extends Activity {
    private EditText host, port, username, password;
    private Switch direct;
    private RadioGroup typeGroup;
    private int radioHttps, radioHttp, radioSocks;
    private TextView status;

    private int radio(RadioGroup group, String label) {
        RadioButton b = new RadioButton(this);
        b.setId(android.view.View.generateViewId());
        b.setText(label);
        group.addView(b);
        return b.getId();
    }

    private String selectedType() {
        int id = typeGroup.getCheckedRadioButtonId();
        if (id == radioSocks) return ProxySettings.TYPE_SOCKS5;
        if (id == radioHttp) return ProxySettings.TYPE_HTTP;
        return ProxySettings.TYPE_HTTPS;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle("Proxy settings");

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(20);
        root.setPadding(pad, pad, pad, pad);

        TextView intro = text("All of this app's traffic goes through this proxy. " +
                "If it's wrong or unreachable, the app is offline; nothing goes direct.", 14);
        root.addView(intro);

        ProxySettings.Values v = ProxySettings.get();

        direct = new Switch(this);
        direct.setText("Run without proxy");
        direct.setTypeface(Typeface.DEFAULT_BOLD);
        direct.setChecked(v.direct);
        direct.setPadding(0, dp(16), 0, 0);
        root.addView(direct, matchWrap());
        root.addView(text("On: the app connects directly, without the proxy (your real IP is used). " +
                "Off: everything goes through the proxy below.", 12));
        TextView typeLabel = text("Proxy type", 14);
        typeLabel.setPadding(0, dp(16), 0, 0);
        typeLabel.setTypeface(Typeface.DEFAULT_BOLD);
        root.addView(typeLabel, matchWrap());
        typeGroup = new RadioGroup(this);
        typeGroup.setOrientation(RadioGroup.VERTICAL);
        radioHttps = radio(typeGroup, "HTTPS: encrypted connection to the proxy");
        radioHttp = radio(typeGroup, "HTTP: plain connection to the proxy");
        radioSocks = radio(typeGroup, "SOCKS5 (not encrypted)");
        typeGroup.check(v.isSocks() ? radioSocks : v.useTls() ? radioHttps : radioHttp);
        root.addView(typeGroup, matchWrap());

        host = field(root, "Proxy host", "proxy.example.com", v.host, InputType.TYPE_TEXT_VARIATION_URI);
        port = field(root, "Port", "443", v.port > 0 ? String.valueOf(v.port) : "", InputType.TYPE_CLASS_NUMBER);

        username = field(root, "Username (optional)", "", v.username, InputType.TYPE_CLASS_TEXT);
        password = field(root, "Password (optional)", "", v.password,
                InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        CheckBox show = new CheckBox(this);
        show.setText("Show password");
        show.setOnCheckedChangeListener((b, checked) -> {
            password.setInputType(InputType.TYPE_CLASS_TEXT | (checked
                    ? InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                    : InputType.TYPE_TEXT_VARIATION_PASSWORD));
            password.setSelection(password.getText().length());
        });
        root.addView(show, matchWrap());

        LinearLayout buttons = new LinearLayout(this);
        buttons.setOrientation(LinearLayout.VERTICAL);
        buttons.setPadding(0, dp(16), 0, 0);
        Button test = button("Test connection");
        Button save = button("Save");
        Button saveRestart = button("Save & restart app");
        buttons.addView(test, matchWrap());
        buttons.addView(save, matchWrap());
        buttons.addView(saveRestart, matchWrap());
        root.addView(buttons, matchWrap());

        status = text("", 14);
        status.setPadding(0, dp(12), 0, 0);
        status.setTypeface(Typeface.MONOSPACE);
        root.addView(status, matchWrap());

        test.setOnClickListener(x -> runTest());
        save.setOnClickListener(x -> {
            ProxySettings.Values saved = saveValues();
            if (saved != null) {
                Toast.makeText(this, saved.direct
                        ? "Saved. New connections go direct, without the proxy."
                        : "Saved. New connections use the proxy.", Toast.LENGTH_SHORT).show();
                finish();
            }
        });
        saveRestart.setOnClickListener(x -> {
            if (saveValues() != null) restartApp();
        });

        ScrollView scroll = new ScrollView(this);
        scroll.setFitsSystemWindows(true);
        scroll.addView(root);
        setContentView(scroll);
    }

    /** @param forTest true when testing the proxy, which needs a valid proxy even in direct mode. */
    private ProxySettings.Values readForm(boolean forTest) {
        String h = host.getText().toString().trim();
        String portText = port.getText().toString().trim();
        int p;
        try {
            p = Integer.parseInt(portText);
        } catch (NumberFormatException e) {
            p = -1;
        }
        boolean runDirect = direct.isChecked();
        // In direct mode the proxy fields may be left empty (they're kept for later).
        boolean checkProxy = forTest || !runDirect || !h.isEmpty() || !portText.isEmpty();
        if (checkProxy) {
            if (h.isEmpty() || h.contains("/") || h.contains(" ")) {
                status.setText("Enter a host name or IP address, without http:// or a path.");
                return null;
            }
            if (p < 1 || p > 65535) {
                status.setText("Enter a port between 1 and 65535.");
                return null;
            }
        }
        return new ProxySettings.Values(h, p, selectedType(),
                username.getText().toString(), password.getText().toString(), runDirect);
    }

    private ProxySettings.Values saveValues() {
        ProxySettings.Values v = readForm(false);
        if (v != null) ProxySettings.save(this, v);
        return v;
    }

    private void runTest() {
        ProxySettings.Values v = readForm(true);
        if (v == null) return;
        status.setText("Testing…");
        new Thread(() -> {
            String result = ProxyForwarder.testProxy(v);
            runOnUiThread(() -> status.setText(result));
        }, "proxy-test").start();
    }

    private void restartApp() {
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch != null && launch.getComponent() != null) {
            startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
        }
        finishAffinity();
        Runtime.getRuntime().exit(0);
    }

    // ---- tiny view helpers -------------------------------------------------------------------

    private EditText field(LinearLayout root, String label, String hint, String value, int inputType) {
        TextView l = text(label, 14);
        l.setPadding(0, dp(16), 0, 0);
        l.setTypeface(Typeface.DEFAULT_BOLD);
        root.addView(l, matchWrap());
        EditText e = new EditText(this);
        e.setSingleLine(true);
        e.setHint(hint);
        e.setInputType(inputType);
        e.setText(value);
        root.addView(e, matchWrap());
        return e;
    }

    private TextView text(String s, int sp) {
        TextView t = new TextView(this);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        return t;
    }

    private Button button(String s) {
        Button b = new Button(this);
        b.setText(s);
        b.setAllCaps(false);
        b.setGravity(Gravity.CENTER);
        return b;
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }
}
