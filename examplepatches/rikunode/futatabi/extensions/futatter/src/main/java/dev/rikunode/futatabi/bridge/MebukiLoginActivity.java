package dev.rikunode.futatabi.bridge;

import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import org.json.JSONObject;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

/**
 * Owner-operated Mebuki login WebView. No real login is executed automatically.
 * Credentials are copied only after an explicit session-check action, and never logged.
 * Cookie attributes/expiry are not exposed by CookieManager.getCookie().
 */
public final class MebukiLoginActivity extends Activity {
    private static final String SITE = "https://mebuki.moe";
    private static final String PREF = "futatabi_extension_private";
    private WebView browser;
    private TextView status;

    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        setTitle("めぶきログイン");
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setBackgroundColor(Color.WHITE);
        status = new TextView(this);
        status.setText("本人操作でログイン後、セッション確認を押してください。Cookie属性と期限は未確定です。");
        status.setPadding(20, 16, 20, 16);
        layout.addView(status);

        Button check = new Button(this);
        check.setText("ログイン済みセッションを確認して端末内へ保存");
        check.setOnClickListener(view -> verifyAndStore());
        layout.addView(check);

        Button erase = new Button(this);
        erase.setText("保存したセッション情報だけを削除");
        erase.setOnClickListener(view -> {
            getSharedPreferences(PREF, MODE_PRIVATE).edit().remove("mebuki_cookie_header").commit();
            status.setText("アプリ専用の保存情報を消去しました。WebView内のサイトCookieは残ります。");
        });
        layout.addView(erase);

        browser = new WebView(this);
        WebSettings settings = browser.getSettings();
        settings.setJavaScriptEnabled(true); // The official Better Auth interface requires JS.
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        CookieManager.getInstance().setAcceptCookie(true);
        browser.setWebChromeClient(new WebChromeClient());
        browser.setWebViewClient(new WebViewClient() {
            @Override public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                Uri target = request.getUrl();
                String scheme = target.getScheme();
                if ("https".equals(scheme)) return false; // OAuth providers have their own HTTPS domains.
                if ("http".equals(scheme) && "127.0.0.1".equals(target.getHost())) return false;
                return true; // No file:, javascript:, data:, or external app scheme navigation.
            }
        });
        layout.addView(browser, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(layout);
        browser.loadUrl(SITE);
    }

    private void verifyAndStore() {
        String current = browser.getUrl();
        Uri uri = current == null ? null : Uri.parse(current);
        if (uri == null || !"https".equals(uri.getScheme()) || !"mebuki.moe".equals(uri.getHost())) {
            status.setText("めぶき公式ドメイン内で確認してください。");
            return;
        }
        String cookies = CookieManager.getInstance().getCookie(SITE);
        if (cookies == null || cookies.isEmpty() || cookies.length() > 8192) {
            status.setText("Cookie???????????????????");
            return;
        }
        status.setText("??????????????????");
        new Thread(() -> {
            boolean confirmed = false;
            try {
                URL endpoint = new URL(SITE + "/api/auth/get-session");
                HttpURLConnection connection = (HttpURLConnection) endpoint.openConnection();
                connection.setInstanceFollowRedirects(false);
                connection.setConnectTimeout(7000);
                connection.setReadTimeout(8000);
                connection.setRequestProperty("Accept", "application/json");
                connection.setRequestProperty("Cookie", cookies);
                try {
                    if (connection.getResponseCode() == 200) {
                        try (InputStream in = connection.getInputStream()) {
                            byte[] response = AimogeWriteClient.bounded(in, 24576);
                            JSONObject session = new JSONObject(new String(response, StandardCharsets.UTF_8));
                            confirmed = session.optJSONObject("user") != null &&
                                    session.optJSONObject("session") != null;
                        }
                    }
                } finally { connection.disconnect(); }
            } catch (Exception ignored) {
                // Never log response bodies, cookies, user identifiers or OAuth state.
            }
            final boolean validSession = confirmed;
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                if (!validSession) {
                    status.setText("????????????????????????????");
                    return;
                }
                boolean saved = getSharedPreferences(PREF, MODE_PRIVATE).edit()
                        .putString("mebuki_cookie_header", cookies).commit();
                status.setText(saved
                        ? "?????????????????????Cookie????????????"
                        : "???????????????????");
            });
        }, "futatabi-mebuki-session-check").start();
    }

    @Override protected void onDestroy() {
        if (browser != null) {
            browser.destroy();
            browser = null;
        }
        super.onDestroy();
    }
}
