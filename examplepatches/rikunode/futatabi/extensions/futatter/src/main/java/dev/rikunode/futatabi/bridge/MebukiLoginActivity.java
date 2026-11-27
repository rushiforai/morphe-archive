package dev.rikunode.futatabi.bridge;

import android.app.Activity;
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
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import org.json.JSONObject;

/**
 * Owner-operated Mebuki login WebView. No real login is executed automatically.
 * Credentials are copied only after an owner-operated OAuth return or explicit check, and never logged.
 * Cookie attributes/expiry are not exposed by CookieManager.getCookie().
 */
public final class MebukiLoginActivity extends Activity {
    private static final String SITE = "https://mebuki.moe";
    private static final String PREF = "futatabi_extension_private";
    private WebView browser;
    private TextView status, navigation;
    private Button check, erase, inspect, cancel;
    private boolean busy, pageFailed, providerVisited;
    private MebukiLoginDiagnostics diagnostics;

    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        setTitle("めぶきちゃんねるログイン");
        if (getActionBar() != null) getActionBar().hide();
        if (android.os.Build.VERSION.SDK_INT >= 30) getWindow().setDecorFitsSystemWindows(false);
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setBackgroundColor(Color.WHITE);
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            layout.setOnApplyWindowInsetsListener((view, insets) -> {
                android.graphics.Insets safe = insets.getInsets(
                        android.view.WindowInsets.Type.systemBars() | android.view.WindowInsets.Type.displayCutout()
                                | android.view.WindowInsets.Type.ime());
                view.setPadding(safe.left, safe.top, safe.right, safe.bottom);
                return android.view.WindowInsets.CONSUMED;
            });
        } else layout.setFitsSystemWindows(true);
        LinearLayout controls = new LinearLayout(this);
        controls.setOrientation(LinearLayout.VERTICAL);
        android.widget.ScrollView details = new android.widget.ScrollView(this);
        details.addView(controls);
        details.setVisibility(android.view.View.GONE);
        Button toggle = new Button(this);
        toggle.setText("ログイン管理");
        toggle.setOnClickListener(view -> {
            boolean show = details.getVisibility() != android.view.View.VISIBLE;
            details.setVisibility(show ? android.view.View.VISIBLE : android.view.View.GONE);
            toggle.setText(show ? "管理を閉じる" : "ログイン管理");
        });
        layout.addView(toggle);
        layout.addView(details, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1));
        status = new TextView(this);
        status.setText("X／Discordで認証後、自動確認・保存。手動確認は管理欄から。");
        status.setPadding(12, 6, 12, 6);
        layout.addView(status, 1);

        navigation = new TextView(this);
        navigation.setText("公式サイトを読み込み中…");
        controls.addView(navigation);
        check = new Button(this);
        check.setText("ログイン済みセッションを確認して端末内へ保存");
        check.setOnClickListener(view -> verifyAndStore());
        controls.addView(check);

        erase = new Button(this);
        erase.setText("保存したセッション情報だけを削除");
        erase.setOnClickListener(view -> {
            if (busy) return;
            boolean removed = getSharedPreferences(PREF, MODE_PRIVATE).edit().remove(MebukiSession.KEY).commit();
            status.setText(removed ? "アプリ専用の保存情報を消去しました。WebView内のサイトCookieは残ります。" : "保存情報の消去に失敗しました。");
        });
        controls.addView(erase);

        EditText slug = new EditText(this);
        slug.setSingleLine(true);
        slug.setHint("スレURLの /t/ 以下のID（任意）");
        controls.addView(slug);
        inspect = new Button(this);
        inspect.setText("保存済み認証で読取契約を確認（値は記録しない）");
        inspect.setOnClickListener(view -> inspectContract(slug.getText().toString().trim()));
        controls.addView(inspect);
        cancel = new Button(this);
        cancel.setText("認証を中止してめぶきちゃんねるへ戻る");
        cancel.setOnClickListener(view -> {
            if (busy || browser == null) return;
            providerVisited = false;
            browser.stopLoading();
            status.setText("中止操作：公式サイトへ戻ります。保存済み認証は変更しません。");
            browser.loadUrl(SITE);
        });
        controls.addView(cancel);
        Button external = new Button(this);
        external.setText("通常ブラウザで公式サイトを開く");
        external.setOnClickListener(view -> {
            if (!busy) openOfficialBrowser();
        });
        controls.addView(external);

        browser = new WebView(this);
        WebSettings settings = browser.getSettings();
        settings.setJavaScriptEnabled(true); // The official Better Auth interface requires JS.
        // Discord OAuth login loop: discord/discord-api-docs#5165.
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        CookieManager.getInstance().setAcceptCookie(true);
        if (MebukiLoginDiagnostics.ENABLED) {
            diagnostics = new MebukiLoginDiagnostics();
            diagnostics.event("settings", SITE, "multiple_windows=" + settings.supportMultipleWindows()
                    + " js_auto_windows=" + settings.getJavaScriptCanOpenWindowsAutomatically());
            browser.setOnTouchListener((view, event) -> {
                if (event.getActionMasked() == android.view.MotionEvent.ACTION_DOWN)
                    diagnostics.snapshot(browser, "before_touch");
                else if (event.getActionMasked() == android.view.MotionEvent.ACTION_UP) {
                    browser.postDelayed(() -> { if (browser != null) diagnostics.snapshot(browser, "after_touch_1s"); }, 1000);
                    browser.postDelayed(() -> { if (browser != null) diagnostics.snapshot(browser, "after_touch_4s"); }, 4000);
                }
                return false; // Preserve normal input handling.
            });
        }
        browser.setWebChromeClient(new WebChromeClient() {
            @Override public boolean onCreateWindow(WebView view, boolean isDialog, boolean isUserGesture,
                                                     android.os.Message resultMsg) {
                if (diagnostics != null) diagnostics.event("create_window", view.getUrl(),
                        "dialog=" + isDialog + " user_gesture=" + isUserGesture);
                return super.onCreateWindow(view, isDialog, isUserGesture, resultMsg);
            }
            @Override public boolean onConsoleMessage(android.webkit.ConsoleMessage message) {
                if (diagnostics != null) diagnostics.console(message);
                return super.onConsoleMessage(message);
            }
        });
        browser.setWebViewClient(new WebViewClient() {
            @Override public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                Uri target = request.getUrl();
                String scheme = target.getScheme();
                if (diagnostics != null && request.isForMainFrame()) diagnostics.event("navigation_request", target.toString(),
                        "redirect=" + request.isRedirect() + " gesture=" + request.hasGesture());
                if (request.isForMainFrame() && classify(target) == MebukiLoginFlow.Page.GOOGLE_UNSUPPORTED) {
                    navigation.setText("Googleは対象外です。XまたはDiscordを選択してください。");
                    return true;
                }
                if ("https".equals(scheme)) return false;
                if ("http".equals(scheme) && "127.0.0.1".equals(target.getHost())) return false;
                if (request.isForMainFrame()) navigation.setText("未対応の遷移を中止しました。公式サイトへ戻ってください。");
                return true;
            }
            @Override public void onPageStarted(WebView view, String url, android.graphics.Bitmap icon) {
                pageFailed = false;
                if (diagnostics != null) diagnostics.event("page_started", url, "");
                MebukiLoginFlow.Page page = classify(Uri.parse(url));
                if (page == MebukiLoginFlow.Page.X || page == MebukiLoginFlow.Page.DISCORD)
                    providerVisited = true;
                if (page == MebukiLoginFlow.Page.ERROR_RETURN) providerVisited = false;
                showNavigation(url, true);
            }
            @Override public void onPageCommitVisible(WebView view,String url) {
                if("mebuki.moe".equals(Uri.parse(url).getHost()))view.evaluateJavascript(MebukiPwaBanner.SCRIPT,null);
            }
            @Override public void onPageFinished(WebView view, String url) {
                if ("mebuki.moe".equals(Uri.parse(url).getHost())) {
                    view.evaluateJavascript(MebukiPwaBanner.SCRIPT, null);
                    view.evaluateJavascript(MebukiGoogleButton.SCRIPT, null);
                }
                if (diagnostics != null) diagnostics.snapshot(view, "page_finished");
                if (!pageFailed && url.equals(view.getUrl())) {
                    showNavigation(url, false);
                    MebukiLoginFlow.Page page = classify(Uri.parse(url));
                    if (providerVisited && !busy && (page == MebukiLoginFlow.Page.SITE
                            || page == MebukiLoginFlow.Page.CALLBACK)) {
                        providerVisited = false;
                        verifyAndStore();
                    }
                }
            }
            @Override public void onReceivedError(WebView view, WebResourceRequest request, android.webkit.WebResourceError error) {
                if (request.isForMainFrame()) {
                    pageFailed = true;
                    if (diagnostics != null) diagnostics.event("network_error", request.getUrl().toString(), "code=" + error.getErrorCode());
                    navigation.setText("ページ通信エラー（" + error.getErrorCode() + "）。認証成功は未確認です。");
                    status.setText(navigation.getText());
                } else if (discordLoginRequest(view, request)) {
                    status.setText("Discord 認証通信エラー（" + error.getErrorCode()
                            + "）。認証は未確認です。");
                }
            }
            @Override public void onReceivedHttpError(WebView view, WebResourceRequest request, android.webkit.WebResourceResponse response) {
                if (request.isForMainFrame()) {
                    pageFailed = true;
                    if (diagnostics != null) diagnostics.event("http_error", request.getUrl().toString(), "status=" + response.getStatusCode());
                    navigation.setText("ページHTTPエラー（" + response.getStatusCode() + "）。認証成功は未確認です。");
                    status.setText(navigation.getText());
                } else if (discordLoginRequest(view, request)) {
                    status.setText("Discord 認証 HTTP " + response.getStatusCode()
                            + "。追加認証が表示された場合は画面の指示に従ってください。");
                }
            }
            @Override public void onReceivedSslError(WebView view, android.webkit.SslErrorHandler handler, android.net.http.SslError error) {
                handler.cancel();
                if (diagnostics != null) diagnostics.event("tls_error", view.getUrl(), "cancelled=true");
                pageFailed = true;
                navigation.setText("TLS証明書エラーで中止しました。認証成功は未確認です。");
                status.setText(navigation.getText());
            }
        });
        layout.addView(browser, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(layout);
        layout.requestApplyInsets();
        browser.loadUrl(SITE);
    }

    private static boolean discordLoginRequest(WebView view, WebResourceRequest request) {
        String current = view.getUrl();
        if (current == null || classify(Uri.parse(current)) != MebukiLoginFlow.Page.DISCORD)
            return false;
        Uri uri = request.getUrl();
        return MebukiLoginFlow.discordLoginPost(uri.getScheme(), uri.getHost(), uri.getPath(), request.getMethod());
    }

    // Browser-only fallback. The official browser owns its session;
    // never copy a browser cookie or claim that this logs in the native app.
    private void openOfficialBrowser() {
        new android.app.AlertDialog.Builder(this)
                .setMessage("公式サイトでのログイン・閲覧用です。ブラウザの認証はアプリへ取り込まれません。")
                .setNegativeButton("キャンセル", null)
                .setPositiveButton("開く", (dialog, which) -> {
                    android.content.Intent intent = new android.content.Intent(android.content.Intent.ACTION_VIEW, Uri.parse(SITE))
                            .addCategory(android.content.Intent.CATEGORY_BROWSABLE).setPackage("com.android.chrome");
                    android.content.Intent service = new android.content.Intent("android.support.customtabs.action.CustomTabsService")
                            .setPackage("com.android.chrome");
                    if (getPackageManager().resolveService(service, 0) != null) {
                        Bundle extras = new Bundle();
                        extras.putBinder("android.support.customtabs.extra.SESSION", null);
                        extras.putInt("android.support.customtabs.extra.TITLE_VISIBILITY", 1);
                        intent.putExtras(extras);
                    }
                    try { startActivity(intent); }
                    catch (android.content.ActivityNotFoundException | SecurityException ex) {
                        try {
                            startActivity(new android.content.Intent(android.content.Intent.ACTION_VIEW, Uri.parse(SITE))
                                    .addCategory(android.content.Intent.CATEGORY_BROWSABLE));
                        } catch (android.content.ActivityNotFoundException | SecurityException unavailable) {
                            status.setText("対応ブラウザがありません。");
                        }
                    }
                }).show();
    }

    private static MebukiLoginFlow.Page classify(Uri uri) {
        return MebukiLoginFlow.page(uri.getScheme(), uri.getHost(), uri.getPath(),
                "mebuki.moe".equals(uri.getHost()) && uri.isHierarchical() && uri.getQueryParameter("error") != null);
    }

    private void showNavigation(String url, boolean loading) {
        MebukiLoginFlow.Page page = classify(Uri.parse(url));
        String label;
        switch (page) {
            case X: label = "Xの公式ドメイン：認証・追加認証は本人操作。結果未確認。"; break;
            case DISCORD: label = "Discordの公式ドメイン：認証・追加認証は本人操作。結果未確認。"; break;
            case GOOGLE_UNSUPPORTED: label = "Googleは対象外です。資格情報を入力せず戻ってください。"; break;
            case CALLBACK: label = "めぶきちゃんねるへのcallbackを検出。認証成功は未確認。"; break;
            case ERROR_RETURN: label = "めぶきちゃんねるから認証エラーの戻りを検出。成功は未確認。"; break;
            case SITE: label = "めぶきちゃんねる公式サイト：自動確認が完了しない場合は管理欄で手動確認。"; break;
            default: label = "未確認のページ：資格情報を入力せず、必要に応じて戻ってください。";
        }
        navigation.setText((loading ? "読み込み中：" : "") + label);
        if (page == MebukiLoginFlow.Page.ERROR_RETURN) status.setText(label);
    }

    private void setBusy(boolean value) {
        busy = value;
        check.setEnabled(!value);
        erase.setEnabled(!value);
        inspect.setEnabled(!value);
        cancel.setEnabled(!value);
    }

    private void verifyAndStore() {
        if (busy) return;
        String current = browser.getUrl();
        Uri uri = current == null ? null : Uri.parse(current);
        if (uri == null || !"https".equals(uri.getScheme()) || !"mebuki.moe".equals(uri.getHost())) {
            status.setText("めぶきちゃんねる公式サイトに戻ってから確認してください。");
            return;
        }
        String cookies = CookieManager.getInstance().getCookie(SITE);
        if (!MebukiSession.safeCookie(cookies)) {
            status.setText("有効なCookieがありません。本人ログインが必要です。");
            return;
        }
        setBusy(true);
        status.setText("セッションを検証中…");
        new Thread(() -> {
            MebukiSession.State state = MebukiSession.verify(cookies);
            boolean saved = false;
            if (state == MebukiSession.State.AUTHENTICATED) {
                try {
                    CookieManager.getInstance().flush();
                    saved = getSharedPreferences(PREF, MODE_PRIVATE).edit()
                            .putString(MebukiSession.KEY, cookies).commit();
                } catch (RuntimeException ignored) {
                    // A storage failure must not be displayed as a successful login.
                }
            }
            final boolean persisted = saved;
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                setBusy(false);
                status.setText(persisted ? "認証済みセッションを端末内に保存しました。" :
                        state == MebukiSession.State.AUTHENTICATED ? "認証済みですが端末への保存に失敗しました。" :
                        "保存未完了：" + state.name());
                if (persisted) {
                    android.widget.Toast.makeText(this, "めぶきちゃんねるの認証を保存しました", android.widget.Toast.LENGTH_LONG).show();
                    setResult(RESULT_OK);
                    finish();
                }
            });
        }, "futatabi-mebuki-session-check").start();
    }

    private void inspectContract(String slug) {
        if (busy) return;
        if (!slug.isEmpty() && !slug.matches("[A-Za-z0-9_-]{8,24}")) {
            status.setText("スレIDの形式が不正です。");
            return;
        }
        final String cookie = MebukiSession.saved(this);
        final org.json.JSONArray names = MebukiSession.cookieNames(CookieManager.getInstance().getCookie(SITE));
        setBusy(true);
        status.setText("読取契約を確認中…");
        new Thread(() -> {
            String result;
            try {
                MebukiSession.State state = MebukiSession.verify(cookie);
                if (state != MebukiSession.State.AUTHENTICATED) {
                    JSONObject meta = new JSONObject();
                    meta.put("firstPartyCookieNames", names);
                    meta.put("session", state.name());
                    result = meta.toString(2);
                } else {
                    JSONObject meta = new JSONObject();
                    meta.put("firstPartyCookieNames", names);
                    meta.put("session", MebukiSession.inspectRead("/api/auth/get-session", cookie));
                    meta.put("catalog", MebukiSession.inspectRead("/api/catalog", cookie));
                    if (!slug.isEmpty()) meta.put("messages", MebukiSession.inspectRead("/api/thread/" + slug + "/messages", cookie));
                    result = meta.toString(2);
                }
            } catch (Exception ex) { result = "契約取得失敗：" + ex.getClass().getSimpleName(); }
            final String report = result;
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                setBusy(false);
                status.setText("読取契約確認終了。結果のHTTP状態を確認してください。");
                new android.app.AlertDialog.Builder(this).setTitle("値を含まない契約情報")
                        .setMessage(report).setPositiveButton("OK", null).show();
            });
        }, "futatabi-mebuki-contract-inspect").start();
    }

    @Override public void onBackPressed() {
        if (!busy) super.onBackPressed();
    }

    @Override protected void onDestroy() {
        if (diagnostics != null) diagnostics.stop();
        if (browser != null) {
            browser.destroy();
            browser = null;
        }
        super.onDestroy();
    }
}
