package app.morphe.extension.chmate;

import android.app.Activity;

import android.os.Build;
import android.os.Bundle;
import android.webkit.*;
import android.widget.*;

/** A visible, app-local login session. No JS bridge, password collection or cookie export. */
public final class ImgurWebLoginActivity extends HaiagaruComposeActivity {
    private WebView web;
    private FrameLayout browserFrame;
    private TextView location;
    private final java.util.ArrayList<WebView> windows = new java.util.ArrayList<>();
    private TextView status;
    private Button verify;
    private Switch enabled;
    private boolean updating;
    private int verificationGeneration;
    private boolean googleFlow;
    private boolean checkingCompletion;
    private int loginGeneration;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (!ImgurWebUpload.supported(this)) { finish(); return; }
        ImgurWebUpload.init(this);
        if (getIntent().getBooleanExtra("show_uploads", false)) {
            startActivity(new android.content.Intent(this, ImgurUploadsActivity.class)); finish(); return;
        }
        LinearLayout root = new LinearLayout(this); root.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (12 * getResources().getDisplayMetrics().density);
        root.setPadding(padding, padding, padding, padding);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(padding, padding + insets.getSystemWindowInsetTop(), padding,
                    padding + insets.getSystemWindowInsetBottom()); return insets;
        });
        enabled = new Switch(this); enabled.setText("Imgur Webのログイン済みアカウントで送信（開発中）");
        enabled.setChecked(ImgurWebUpload.enabled()); root.addView(enabled);
        Switch history = new Switch(this); history.setText("ログイン送信をChMateの画像アップロード履歴に残す");
        history.setChecked(ImgurUploadHistory.nativeEnabled(this)); root.addView(history);
        history.setOnCheckedChangeListener((view, checked) -> ImgurWebUpload.prefs(this).edit()
                .putBoolean("nativeUploadHistory", checked).apply());
        Switch threads = new Switch(this); threads.setText("投稿一覧にアップロード元スレを記録・表示する");
        threads.setChecked(ImgurUploadHistory.threadsEnabled(this)); root.addView(threads);
        threads.setOnCheckedChangeListener((view, checked) -> ImgurWebUpload.prefs(this).edit()
                .putBoolean("uploadThreadHistory", checked).apply());
        TextView historyNote = new TextView(this);
        historyNote.setText("変更後に成功した送信が対象です。オフでも既存履歴は削除しません。"
                + "スレ記録は端末内のみ（最大1000件）。掲示板への投稿完了を保証する記録ではありません。");
        root.addView(historyNote);
        status = new TextView(this);
        status.setText("この画面でImgurにログインしてください。Chrome等とはセッションを共有しません。"
                + "\n有効時は認証失敗でも匿名送信しません。Web仕様変更・追加認証により使えない場合があります。"
                + "\nWeb版の利用規約・制限が適用され、無料利用を保証する機能ではありません。"
                + "\nGoogleログインもWebView内で開きますが、Google側で拒否される場合があります。");
        root.addView(status);
        LinearLayout buttons = new LinearLayout(this); root.addView(buttons);
        button(buttons, "ログイン", () -> {
            loginGeneration++; googleFlow = false; checkingCompletion = false;
            verificationGeneration++; verify.setEnabled(true);
            while (windows.size() > 1) closePopup(web);
            web.setVisibility(android.view.View.VISIBLE);
            web.loadUrl("https://imgur.com/signin");
        });
        verify = button(buttons, "確認・有効化", this::verify);
        button(buttons, "解除", () -> new HaiagaruDialog.Builder(this).setMessage("Imgurのログイン情報をこのアプリから削除しますか？")
                .setNegativeButton("キャンセル", null).setPositiveButton("解除", (d, w) -> clearSession()).show());
        button(buttons, "戻る", this::finish);
        LinearLayout mediaButtons = new LinearLayout(this); root.addView(mediaButtons);
        button(mediaButtons, "投稿一覧", () -> startActivity(new android.content.Intent(this, ImgurUploadsActivity.class)));
        button(mediaButtons, "処理待ち時間", this::configureWait);
        button(mediaButtons, "Imgurへ戻る", () -> checkLoginCompletion(true));
        enabled.setOnCheckedChangeListener((view, checked) -> {
            if (updating) return;
            if (!checked) {
                verificationGeneration++;
                verify.setEnabled(true);
                ImgurWebUpload.prefs(this).edit().putBoolean("enabled", false).apply();
            }
            else { setChecked(false); verify(); }
        });
        location = new TextView(this); root.addView(location);
        browserFrame = new FrameLayout(this);
        root.addView(browserFrame, new LinearLayout.LayoutParams(-1, 0, 1));
        HaiagaruUi.showModel(this, "Imgurログイン・設定", root);
        web = newLoginWindow();
        web.loadUrl("https://imgur.com/signin");
    }
    private WebView newLoginWindow() {
        WebView view = new WebView(this);
        WebSettings settings = view.getSettings(); settings.setJavaScriptEnabled(true);
        // Keep the real WebView UA. Do not impersonate Chrome to bypass Google's browser policy.
        settings.setSupportMultipleWindows(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(false);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false); settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setSaveFormData(false); settings.setSavePassword(false);
        if (Build.VERSION.SDK_INT >= 26) settings.setSafeBrowsingEnabled(true);
        CookieManager.getInstance().setAcceptCookie(true);
        CookieManager.getInstance().setAcceptThirdPartyCookies(view, true);
        ImgurWebUpload.prefs(this).edit().putString("userAgent", settings.getUserAgentString()).apply();
        view.setWebViewClient(new WebViewClient() {
            @Override public boolean shouldOverrideUrlLoading(WebView view, String url) { return block(url); }
            @Override public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return request.isForMainFrame() && block(request.getUrl().toString());
            }
            private boolean block(String url) {
                if (ImgurWebPolicy.loginUrl(url)) return false;
                status.setText("HTTPSのログインページを開いてください。");
                return true;
            }
            @Override public void onPageStarted(WebView view, String url, android.graphics.Bitmap icon) {
                if (!"about:blank".equals(url) && !ImgurWebPolicy.loginUrl(url)) {
                    view.stopLoading(); block(url); return;
                }
                if (ImgurWebPolicy.googleLoginUrl(url)) googleFlow = true;
                if (view == web) showLocation(url);
            }
            @Override public void onPageFinished(WebView view, String url) {
                CookieManager.getInstance().flush();
                if (view == web) showLocation(url);
                // Only an actual return to Imgur (or explicit user action) may finish the flow.
                // A Google account cookie alone is not proof of an Imgur login.
                if (googleFlow && ImgurWebPolicy.imgurLoginReturnUrl(url)) checkLoginCompletion(false);
            }
        });
        view.setWebChromeClient(new WebChromeClient() {
            @Override public boolean onCreateWindow(WebView parent, boolean dialog, boolean userGesture,
                    android.os.Message result) {
                if (!userGesture || windows.size() >= 3) return false;
                WebView child = newLoginWindow();
                ((WebView.WebViewTransport) result.obj).setWebView(child);
                result.sendToTarget(); return true;
            }
            @Override public void onCloseWindow(WebView window) {
                closePopup(window);
                if (googleFlow) checkLoginCompletion(false);
            }
        });
        // Keep the opener alive and visible underneath the opaque child. GONE may suspend
        // its visibility-dependent timers/message handling during a provider popup login.
        if (web != null) web.setImportantForAccessibility(android.view.View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        view.setBackgroundColor(android.graphics.Color.WHITE);
        windows.add(view); web = view;
        browserFrame.addView(view, new FrameLayout.LayoutParams(-1, -1));
        view.bringToFront(); view.requestFocus();
        return view;
    }
    private void showLocation(String url) {
        android.net.Uri uri = android.net.Uri.parse(url);
        location.setText(ImgurWebPolicy.loginUrl(url) ? "https://" + uri.getHost() : "ログイン画面を読み込み中…");
    }
    private void closePopup(WebView window) {
        if (windows.size() <= 1 || windows.indexOf(window) <= 0) return;
        browserFrame.removeView(window); windows.remove(window);
        window.stopLoading(); window.destroy();
        web = windows.get(windows.size() - 1); web.setVisibility(android.view.View.VISIBLE);
        web.setImportantForAccessibility(android.view.View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
        web.requestFocus();
        showLocation(web.getUrl() == null ? "about:blank" : web.getUrl());
    }
    private Button button(LinearLayout parent, String title, Runnable action) {
        Button button = new Button(this); button.setText(title);
        button.setOnClickListener(v -> action.run());
        parent.addView(button, parent.getOrientation() == LinearLayout.HORIZONTAL
                ? new LinearLayout.LayoutParams(0, -2, 1) : new LinearLayout.LayoutParams(-1, -2)); return button;
    }
    private void setChecked(boolean value) { updating = true; enabled.setChecked(value); updating = false; }
    private void verify() {
        final int generation = ++verificationGeneration;
        verify.setEnabled(false); status.setText("ログイン状態を確認しています…");
        new Thread(() -> {
            try {
                String account = ImgurWebUpload.checkAccount();
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed() || generation != verificationGeneration) return;
                    ImgurWebUpload.prefs(this).edit().putBoolean("enabled", true).apply();
                    setChecked(true); verify.setEnabled(true);
                    if (googleFlow || windows.size() > 1) returnToImgur();
                    status.setText("送信先: " + account + "\n既存のImgurアップロードからこのアカウントへ送信します。");
                });
            } catch (Exception error) {
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed() || generation != verificationGeneration) return;
                    // Do not disable an already-enabled mode: it must not fall back anonymously.
                    verify.setEnabled(true);
                    status.setText("ログインを確認できません。ログイン後に再度確認してください。"
                            + "\nWeb版の仕様変更・追加認証が原因の場合もあります。");
                });
            }
        }, "Haiagaru-Imgur-session").start();
    }

    private void returnToImgur() {
        loginGeneration++; checkingCompletion = false; googleFlow = false;
        while (windows.size() > 1) closePopup(web);
        web.setVisibility(android.view.View.VISIBLE);
        web.setImportantForAccessibility(android.view.View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
        CookieManager.getInstance().flush();
        web.loadUrl("https://imgur.com/upload");
    }

    /** Never enables uploads implicitly and never reads the provider's credentials/cookies. */
    private void checkLoginCompletion(boolean requested) {
        if (checkingCompletion || !verify.isEnabled() || isFinishing() || isDestroyed()) return;
        checkingCompletion = true;
        final int generation = loginGeneration;
        CookieManager.getInstance().flush();
        if (requested) status.setText("Imgurへのログイン完了を確認しています…");
        new Thread(() -> {
            try {
                String account = ImgurWebUpload.checkAccount();
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed() || generation != loginGeneration) return;
                    checkingCompletion = false;
                    returnToImgur();
                    status.setText("Imgurへのログインを確認しました: " + account
                            + "\n送信に使う場合は「確認・有効化」を押してください。");
                });
            } catch (Exception error) {
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed() || generation != loginGeneration) return;
                    checkingCompletion = false;
                    if (requested) status.setText("Imgurへのログイン完了はまだ確認できません。"
                            + "\nGoogleへのログインだけではImgur認証が完了していない場合があります。"
                            + "\nGoogle画面が止まったままの場合は「ログイン」で画面を開き直し、Googleログインを選び直してください。"
                            + "\n追加認証やGoogle側のWebView制限は回避できません。");
                });
            }
        }, "Haiagaru-Imgur-login-return").start();
    }
    private void clearSession() {
        loginGeneration++; googleFlow = false; checkingCompletion = false;
        web.setVisibility(android.view.View.VISIBLE);
        verificationGeneration++;
        verify.setEnabled(true);
        ImgurWebUpload.prefs(this).edit().putBoolean("enabled", false).apply(); setChecked(false);
        while (windows.size() > 1) closePopup(web);
        web.stopLoading(); web.loadUrl("about:blank");
        CookieManager manager = CookieManager.getInstance();
        for (String host : new String[]{"imgur.com", "www.imgur.com", "api.imgur.com"}) {
            String cookies = manager.getCookie("https://" + host + "/");
            if (cookies == null) continue;
            for (String cookie : cookies.split(";")) {
                String name = cookie.split("=", 2)[0].trim();
                if (!name.matches("[A-Za-z0-9_!#$%&'*+.^`|~-]+")) continue;
                for (String domain : new String[]{"", "; Domain=.imgur.com", "; Domain=" + host})
                    manager.setCookie("https://" + host + "/", name + "=; Path=/; Max-Age=0; Secure" + domain);
            }
        }
        manager.flush();
        WebStorage.getInstance().deleteOrigin("https://imgur.com");
        web.clearHistory(); web.clearCache(false);
        status.setText("このアプリ内のImgurセッションを解除しました。Web送信は無効です。");
    }
    @Override public void onBackPressed() {
        if (web.canGoBack()) web.goBack();
        else if (windows.size() > 1) closePopup(web);
        else super.onBackPressed();
    }
    @Override protected void onPause() {
        CookieManager.getInstance().flush();
        super.onPause();
    }
    @Override protected void onDestroy() {
        loginGeneration++;
        verificationGeneration++;
        CookieManager.getInstance().flush();
        for (WebView window : windows) { window.stopLoading(); window.destroy(); }
        windows.clear();
        super.onDestroy();
    }

    private void configureWait() {
        EditText input = new EditText(this);
        input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        input.setText(Integer.toString(ImgurWebUpload.processingWaitSeconds()));
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(this).setTitle("Imgurの処理待ち時間（秒）")
                .setMessage("送信後の動画変換などを待つ上限です。0〜1800秒、初期値120秒。"
                        + "0は待たずに投稿一覧で確認します。通信自体のタイムアウトとは別です。"
                        + "待機中は再アップロードしません。時間切れでもImgur側の処理は継続する場合があります。")
                .setView(input).setNegativeButton("キャンセル", null).setPositiveButton("保存", null).create();
        dialog.setOnShowListener(ignored -> dialog.getButton(-1).setOnClickListener(view -> {
            int seconds;
            try { seconds = Integer.parseInt(input.getText().toString().trim()); }
            catch (NumberFormatException error) { seconds = -1; }
            if (seconds < 0 || seconds > ImgurProcessingWait.MAX_SECONDS) {
                input.setError("0〜1800秒で入力してください"); return;
            }
            ImgurWebUpload.prefs(this).edit().putInt("processingWaitSeconds", seconds).apply();
            Toast.makeText(this, "次回の送信から適用します", Toast.LENGTH_SHORT).show(); dialog.dismiss();
        }));
        dialog.show();
    }

}
