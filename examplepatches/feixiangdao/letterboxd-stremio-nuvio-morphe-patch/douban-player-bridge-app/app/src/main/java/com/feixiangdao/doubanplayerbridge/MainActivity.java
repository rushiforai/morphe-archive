package com.feixiangdao.doubanplayerbridge;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;
import android.text.InputType;
import android.text.TextUtils;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
    static final String SETTINGS_PREFS = "bridge_settings";
    static final String TMDB_CREDENTIAL_KEY = "tmdb_credential";

    private TextView statusView;
    private TextView tmdbStatusView;
    private EditText tmdbKeyInput;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ScrollView scroll = new ScrollView(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(24), dp(42), dp(24), dp(32));
        scroll.addView(root);

        TextView title = text("Douban Player Bridge", 28, true);
        root.addView(title);

        TextView version = text("v0.2.0", 13, false);
        version.setTextColor(Color.GRAY);
        version.setPadding(0, dp(4), 0, dp(8));
        root.addView(version);

        TextView subtitle = text(
                "官方豆瓣保持原样。Bridge 在影视详情页读取标题和年份，后台预先用 TMDB 精确匹配，再提供 Stremio / Nuvio 快捷按钮。",
                16, false);
        subtitle.setPadding(0, dp(8), 0, dp(20));
        root.addView(subtitle);

        statusView = text("", 16, true);
        statusView.setPadding(dp(14), dp(14), dp(14), dp(14));
        root.addView(statusView, matchWrap());

        TextView tmdbTitle = text("TMDB API Key / Read Access Token", 16, true);
        tmdbTitle.setPadding(0, dp(24), 0, dp(6));
        root.addView(tmdbTitle);

        TextView tmdbHelp = text(
                "为避免中文片名被错误匹配，Nuvio 跳转从本版开始使用 TMDB 精确 ID。可以填写 TMDB v3 API Key，或 v4 Read Access Token。密钥只保存在本机。",
                14, false);
        tmdbHelp.setTextColor(Color.DKGRAY);
        root.addView(tmdbHelp);

        tmdbKeyInput = new EditText(this);
        tmdbKeyInput.setSingleLine(true);
        tmdbKeyInput.setHint("粘贴 TMDB Key / Token");
        tmdbKeyInput.setInputType(
                InputType.TYPE_CLASS_TEXT |
                InputType.TYPE_TEXT_VARIATION_PASSWORD
        );
        tmdbKeyInput.setText(settings().getString(TMDB_CREDENTIAL_KEY, ""));
        root.addView(tmdbKeyInput, matchWrapWithTop(8));

        Button saveKey = button("保存 TMDB 设置");
        saveKey.setOnClickListener(v -> saveTmdbKey());
        root.addView(saveKey, matchWrapWithTop(8));

        Button testKey = button("验证 TMDB Key");
        testKey.setOnClickListener(v -> testTmdbKey(testKey));
        root.addView(testKey, matchWrapWithTop(6));

        tmdbStatusView = text("", 14, true);
        tmdbStatusView.setPadding(0, dp(8), 0, 0);
        root.addView(tmdbStatusView);

        Button accessibility = button("1. 开启无障碍服务");
        accessibility.setOnClickListener(v ->
                startActivity(new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)));
        root.addView(accessibility, matchWrapWithTop(22));

        Button openDouban = button("2. 打开豆瓣");
        openDouban.setOnClickListener(v -> openDouban());
        root.addView(openDouban, matchWrapWithTop(10));

        TextView instructions = text(
                "使用方法\n\n" +
                "① 填写并验证 TMDB Key。\n" +
                "② 开启“豆瓣播放器桥接”无障碍服务。\n" +
                "③ 正常打开官方豆瓣 App。\n" +
                "④ 进入电影或电视剧详情页。\n" +
                "⑤ 悬浮条先显示“匹配中…”，成功后才启用 Nuvio。\n" +
                "⑥ Nuvio 使用 TMDB ID 直接打开；Stremio 优先使用 IMDb ID。\n\n" +
                "长按按钮可以查看当前识别的标题、年份和最终 TMDB / IMDb ID。\n\n" +
                "隐私说明：服务只在豆瓣页面读取可见的无障碍节点；TMDB Key 与匹配缓存只保存在本机。",
                15, false);
        instructions.setPadding(0, dp(26), 0, 0);
        root.addView(instructions);

        setContentView(scroll);
        refreshStatus();
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshStatus();
    }

    private void saveTmdbKey() {
        String key = tmdbKeyInput.getText().toString().trim();
        settings().edit().putString(TMDB_CREDENTIAL_KEY, key).apply();

        getSharedPreferences("douban_player_bridge_cache", MODE_PRIVATE)
                .edit().clear().apply();

        refreshTmdbStatus();
        Toast.makeText(
                this,
                TextUtils.isEmpty(key) ? "已清除 TMDB 设置" : "TMDB 设置已保存",
                Toast.LENGTH_SHORT
        ).show();
    }

    private void testTmdbKey(Button button) {
        String key = tmdbKeyInput.getText().toString().trim();
        if (TextUtils.isEmpty(key)) {
            Toast.makeText(this, "请先输入 TMDB Key / Token", Toast.LENGTH_SHORT).show();
            return;
        }

        button.setEnabled(false);
        tmdbStatusView.setText("TMDB：正在验证…");
        tmdbStatusView.setTextColor(Color.DKGRAY);

        new Thread(() -> {
            boolean ok = false;
            String error = null;
            try {
                ok = TmdbResolver.testCredential(key);
            } catch (Throwable t) {
                error = t.getMessage();
                if (TextUtils.isEmpty(error)) {
                    error = t.getClass().getSimpleName();
                }
            }

            final boolean success = ok;
            final String failure = error;
            runOnUiThread(() -> {
                button.setEnabled(true);
                if (success) {
                    settings().edit()
                            .putString(TMDB_CREDENTIAL_KEY, key)
                            .apply();
                    getSharedPreferences(
                            "douban_player_bridge_cache",
                            MODE_PRIVATE
                    ).edit().clear().apply();

                    tmdbStatusView.setText("TMDB：连接正常 ✓");
                    tmdbStatusView.setTextColor(Color.rgb(0, 140, 60));
                } else {
                    tmdbStatusView.setText(
                            "TMDB：验证失败" +
                                    (TextUtils.isEmpty(failure)
                                            ? ""
                                            : " · " + failure)
                    );
                    tmdbStatusView.setTextColor(Color.rgb(180, 45, 45));
                }
            });
        }, "TmdbCredentialTest").start();
    }

    private void refreshStatus() {
        boolean enabled = isServiceEnabled();
        statusView.setText(enabled ? "无障碍状态：已开启 ✓" : "无障碍状态：尚未开启");
        statusView.setTextColor(
                enabled ? Color.rgb(0, 140, 60) : Color.rgb(180, 45, 45));
        statusView.setBackgroundColor(
                enabled ? 0xFFE7F7EC : 0xFFFFEEEE);
        refreshTmdbStatus();
    }

    private void refreshTmdbStatus() {
        if (tmdbStatusView == null) return;
        String value = settings().getString(TMDB_CREDENTIAL_KEY, "");
        if (TextUtils.isEmpty(value)) {
            tmdbStatusView.setText("TMDB：未设置（Nuvio 精确跳转将禁用）");
            tmdbStatusView.setTextColor(Color.rgb(180, 45, 45));
        } else {
            tmdbStatusView.setText("TMDB：已设置 ✓");
            tmdbStatusView.setTextColor(Color.rgb(0, 140, 60));
        }
    }

    private SharedPreferences settings() {
        return getSharedPreferences(SETTINGS_PREFS, MODE_PRIVATE);
    }

    private boolean isServiceEnabled() {
        String enabled = Settings.Secure.getString(
                getContentResolver(),
                Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES);
        if (TextUtils.isEmpty(enabled)) return false;

        ComponentName component = new ComponentName(
                this, DoubanAccessibilityService.class);
        String full = component.flattenToString();
        String shortName = component.flattenToShortString();

        for (String item : enabled.split(":")) {
            if (full.equalsIgnoreCase(item) ||
                    shortName.equalsIgnoreCase(item)) {
                return true;
            }
        }
        return false;
    }

    private void openDouban() {
        Intent launch = getPackageManager()
                .getLaunchIntentForPackage("com.douban.frodo");
        if (launch != null) {
            startActivity(launch);
            return;
        }
        try {
            startActivity(new Intent(
                    Intent.ACTION_VIEW,
                    Uri.parse("market://details?id=com.douban.frodo")));
        } catch (Exception ignored) {
        }
    }

    private TextView text(String value, int sp, boolean bold) {
        TextView tv = new TextView(this);
        tv.setText(value);
        tv.setTextSize(sp);
        tv.setTextColor(Color.rgb(32, 32, 32));
        if (bold) {
            tv.setTypeface(tv.getTypeface(), android.graphics.Typeface.BOLD);
        }
        tv.setLineSpacing(0, 1.15f);
        return tv;
    }

    private Button button(String value) {
        Button b = new Button(this);
        b.setText(value);
        b.setTextSize(16);
        b.setAllCaps(false);
        return b;
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams matchWrapWithTop(int topDp) {
        LinearLayout.LayoutParams lp = matchWrap();
        lp.topMargin = dp(topDp);
        return lp;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
