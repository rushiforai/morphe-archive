package dev.skulldogged.cobalt.extension;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.webkit.CookieManager;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import org.json.JSONArray;
import org.json.JSONObject;

@SuppressLint({"SetJavaScriptEnabled", "SetTextI18n", "GestureBackNavigation"})
public final class CobaltTurnstileActivity extends Activity {
    private static final String ORIGINAL_PACKAGE = "com.google.android.youtube";
    static final String EXTRA_SOURCE_URL = "source_url";
    static final String EXTRA_RECORD_ID = "record_id";

    private static final long POLL_INTERVAL_MS = 250;
    private static final long MANUAL_FALLBACK_DELAY_MS = 10_000;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Runnable pollTask = new Runnable() {
        @Override
        public void run() {
            pollForSession();
        }
    };
    private final Runnable manualFallbackTask = new Runnable() {
        @Override
        public void run() {
            offerManualVerification();
        }
    };

    private WebView webView;
    private LinearLayout loadingOverlay;
    private TextView status;
    private ProgressBar progress;
    private Button retry;
    private Button showVerification;
    private String sourceUrl;
    private String recordId;
    private String apiUrl;
    private String turnstileUrl;
    private boolean completed;
    private boolean pageReady;
    private boolean verificationVisible;
    private Object backCallback;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Boolean morpheDarkMode = morpheDarkMode();
        boolean dark = morpheDarkMode != null
                ? morpheDarkMode
                : (getResources().getConfiguration().uiMode
                & android.content.res.Configuration.UI_MODE_NIGHT_MASK)
                == android.content.res.Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark
                ? android.R.style.Theme_Material_NoActionBar
                : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);

        sourceUrl = getIntent().getStringExtra(EXTRA_SOURCE_URL);
        recordId = getIntent().getStringExtra(EXTRA_RECORD_ID);
        apiUrl = CobaltSettings.apiUrl();
        turnstileUrl = CobaltSettings.turnstileUrl();

        if (sourceUrl == null || sourceUrl.isEmpty() || recordId == null || recordId.isEmpty()
                || apiUrl.isEmpty() || turnstileUrl.isEmpty()) {
            cancelAuthorization("Cobalt authorization is not configured");
            return;
        }

        buildUi(dark);
        registerBackCallback();
        configureWebView();
        loadAuthorizationPage();
    }

    private void buildUi(boolean dark) {
        int background = namedColor(
                dark ? "yt_black1" : "yt_white1",
                dark ? Color.BLACK : Color.WHITE
        );
        int primary = dark ? Color.WHITE : Color.rgb(20, 20, 20);
        int secondary = dark ? Color.rgb(190, 190, 190) : Color.rgb(90, 90, 90);

        getWindow().setBackgroundDrawable(new ColorDrawable(background));
        getWindow().setStatusBarColor(background);
        getWindow().setNavigationBarColor(background);
        int systemUi = getWindow().getDecorView().getSystemUiVisibility();
        int lightBars = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        if (dark) {
            systemUi &= ~lightBars;
        } else {
            systemUi |= lightBars;
        }
        getWindow().getDecorView().setSystemUiVisibility(systemUi);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background);
        root.setPadding(dp(16), dp(12), dp(16), dp(12));

        FrameLayout content = new FrameLayout(this);
        root.addView(content, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                0,
                1
        ));

        webView = new WebView(this);
        webView.setBackgroundColor(background);
        webView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        content.addView(webView, match());

        loadingOverlay = new LinearLayout(this);
        loadingOverlay.setOrientation(LinearLayout.VERTICAL);
        loadingOverlay.setGravity(Gravity.CENTER);
        loadingOverlay.setBackgroundColor(background);
        loadingOverlay.setPadding(dp(24), dp(24), dp(24), dp(24));

        TextView title = new TextView(this);
        title.setText("Verifying with cobalt");
        title.setTextColor(primary);
        title.setTextSize(22);
        title.setTypeface(android.graphics.Typeface.DEFAULT, android.graphics.Typeface.BOLD);
        title.setGravity(Gravity.CENTER);
        loadingOverlay.addView(title, wrap());

        status = new TextView(this);
        status.setText("Loading secure verification…");
        status.setTextColor(secondary);
        status.setTextSize(14);
        status.setGravity(Gravity.CENTER);
        status.setPadding(0, dp(8), 0, dp(18));
        loadingOverlay.addView(status, wrap());

        progress = new ProgressBar(this);
        progress.setIndeterminate(true);
        LinearLayout.LayoutParams progressParams = new LinearLayout.LayoutParams(dp(28), dp(28));
        progressParams.gravity = Gravity.CENTER_HORIZONTAL;
        loadingOverlay.addView(progress, progressParams);
        content.addView(loadingOverlay, match());

        LinearLayout actions = new LinearLayout(this);
        actions.setGravity(Gravity.END);

        showVerification = new Button(this);
        showVerification.setText("Show verification");
        showVerification.setAllCaps(false);
        showVerification.setVisibility(View.GONE);
        showVerification.setOnClickListener(ignored -> showVerificationPage());
        actions.addView(showVerification);

        retry = new Button(this);
        retry.setText("Reload");
        retry.setAllCaps(false);
        retry.setVisibility(View.GONE);
        retry.setOnClickListener(ignored -> loadAuthorizationPage());
        actions.addView(retry);

        Button cancel = new Button(this);
        cancel.setText("Cancel");
        cancel.setAllCaps(false);
        cancel.setOnClickListener(ignored -> cancelAuthorization("Authorization cancelled"));
        actions.addView(cancel);
        root.addView(actions, wrap());

        setContentView(root);
    }

    private void configureWebView() {
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setSafeBrowsingEnabled(true);

        CookieManager cookies = CookieManager.getInstance();
        cookies.setAcceptCookie(true);
        cookies.setAcceptThirdPartyCookies(webView, true);

        webView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return request.isForMainFrame()
                        && !sameOrigin(request.getUrl(), Uri.parse(turnstileUrl));
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                if (!sameOrigin(Uri.parse(url), Uri.parse(turnstileUrl))) {
                    return;
                }
                pageReady = true;
                retry.setVisibility(View.GONE);
                status.setText("Waiting for cobalt verification…");
                handler.removeCallbacks(pollTask);
                handler.removeCallbacks(manualFallbackTask);
                handler.post(pollTask);
                handler.postDelayed(manualFallbackTask, MANUAL_FALLBACK_DELAY_MS);
            }

            @Override
            public void onReceivedError(
                    WebView view,
                    WebResourceRequest request,
                    WebResourceError error
            ) {
                if (request.isForMainFrame()) {
                    showLoadError("Could not load the verification page");
                }
            }
        });
    }

    private void loadAuthorizationPage() {
        pageReady = false;
        handler.removeCallbacks(pollTask);
        handler.removeCallbacks(manualFallbackTask);
        hideVerificationPage(false);
        showVerification.setVisibility(View.GONE);
        retry.setVisibility(View.GONE);
        progress.setVisibility(View.VISIBLE);
        status.setText("Loading secure verification…");
        webView.loadUrl(turnstileUrl);
    }

    private void offerManualVerification() {
        if (completed || !pageReady || verificationVisible) {
            return;
        }
        status.setText("Still verifying…");
        showVerification.setVisibility(View.VISIBLE);
    }

    private void showVerificationPage() {
        handler.removeCallbacks(manualFallbackTask);
        verificationVisible = true;
        loadingOverlay.setVisibility(View.GONE);
        showVerification.setVisibility(View.GONE);
        webView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
        webView.setFocusable(true);
        webView.setFocusableInTouchMode(true);
        webView.requestFocus();
    }

    private void hideVerificationPage(boolean scheduleFallback) {
        verificationVisible = false;
        if (loadingOverlay != null) {
            loadingOverlay.setVisibility(View.VISIBLE);
        }
        if (webView != null) {
            webView.clearFocus();
            webView.setImportantForAccessibility(
                    View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS
            );
        }
        if (showVerification != null) {
            showVerification.setVisibility(View.GONE);
        }
        if (scheduleFallback && pageReady && !completed) {
            handler.removeCallbacks(manualFallbackTask);
            handler.postDelayed(manualFallbackTask, MANUAL_FALLBACK_DELAY_MS);
        }
    }

    private void pollForSession() {
        if (completed || !pageReady || webView == null) {
            return;
        }

        String sessionEndpoint = apiUrl + "session";
        String script = "(function(){try{"
                + "if(window.__cobaltMorpheResult)return window.__cobaltMorpheResult;"
                + "if(window.__cobaltMorpheStarted)return '';"
                + "var token='';"
                + "var widget=document.getElementById('turnstile-widget');"
                + "if(window.turnstile&&widget)token=window.turnstile.getResponse(widget)||'';"
                + "if(!token){var input=document.querySelector('[name=\"cf-turnstile-response\"]');"
                + "if(input)token=input.value||'';}"
                + "if(!token)return '';"
                + "window.__cobaltMorpheStarted=true;"
                + "fetch(" + JSONObject.quote(sessionEndpoint) + ",{method:'POST',headers:{"
                + "'Accept':'application/json','cf-turnstile-response':token}})"
                + ".then(function(r){return r.text().then(function(body){"
                + "window.__cobaltMorpheResult=body||JSON.stringify({status:'error',error:{code:'empty_session_response'}});"
                + "});}).catch(function(){window.__cobaltMorpheResult=JSON.stringify({status:'error',error:{code:'session_request_failed'}});});"
                + "return '';"
                + "}catch(e){return '';} })();";

        webView.evaluateJavascript(script, value -> {
            if (completed) {
                return;
            }
            String result = decodeJavaScriptString(value);
            if (result.isEmpty()) {
                handler.postDelayed(pollTask, POLL_INTERVAL_MS);
                return;
            }
            handleSessionResponse(result);
        });
    }

    private void handleSessionResponse(String raw) {
        try {
            JSONObject response = new JSONObject(raw);
            if ("error".equals(response.optString("status"))) {
                JSONObject error = response.optJSONObject("error");
                String code = error == null ? "unknown" : error.optString("code", "unknown");
                showLoadError("Cobalt authorization failed: " + code);
                return;
            }

            String token = response.optString("token");
            long expiresIn = response.optLong("exp", 0);
            CobaltSessionManager.store(apiUrl, token, expiresIn);
            completed = true;
            handler.removeCallbacks(manualFallbackTask);
            progress.setVisibility(View.GONE);
            status.setText("Authorized. Starting download…");
            CobaltDownloader.onAuthorizationSucceeded(sourceUrl, recordId);
            finish();
        } catch (Exception exception) {
            showLoadError("Cobalt returned an invalid authorization response");
        }
    }

    private void showLoadError(String message) {
        pageReady = false;
        handler.removeCallbacks(pollTask);
        handler.removeCallbacks(manualFallbackTask);
        hideVerificationPage(false);
        progress.setVisibility(View.GONE);
        retry.setVisibility(View.VISIBLE);
        status.setText(message);
    }

    private String decodeJavaScriptString(String value) {
        if (value == null || "null".equals(value)) {
            return "";
        }
        try {
            return new JSONArray("[" + value + "]").optString(0, "");
        } catch (Exception ignored) {
            return "";
        }
    }

    private boolean sameOrigin(Uri left, Uri right) {
        return left != null && right != null
                && "https".equalsIgnoreCase(left.getScheme())
                && left.getScheme().equalsIgnoreCase(right.getScheme())
                && left.getHost() != null
                && left.getHost().equalsIgnoreCase(right.getHost())
                && effectivePort(left) == effectivePort(right);
    }

    private int effectivePort(Uri uri) {
        return uri.getPort() < 0 ? 443 : uri.getPort();
    }

    private void cancelAuthorization(String message) {
        if (!completed) {
            completed = true;
            CobaltDownloader.onAuthorizationFailed(recordId, message);
            Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
        }
        finish();
    }

    private void registerBackCallback() {
        if (Build.VERSION.SDK_INT >= 33) {
            OnBackInvokedCallback callback = this::handleBackPressed;
            backCallback = callback;
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                    callback
            );
        }
    }

    @Override
    public void onBackPressed() {
        handleBackPressed();
    }

    private void handleBackPressed() {
        if (verificationVisible) {
            hideVerificationPage(true);
            return;
        }
        cancelAuthorization("Authorization cancelled");
    }

    @Override
    protected void onDestroy() {
        handler.removeCallbacks(pollTask);
        handler.removeCallbacks(manualFallbackTask);
        if (Build.VERSION.SDK_INT >= 33 && backCallback instanceof OnBackInvokedCallback) {
            getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(
                    (OnBackInvokedCallback) backCallback
            );
            backCallback = null;
        }
        if (webView != null) {
            webView.stopLoading();
            webView.destroy();
            webView = null;
        }
        super.onDestroy();
    }

    private LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
    }

    private FrameLayout.LayoutParams match() {
        return new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
        );
    }

    private int namedColor(String name, int fallback) {
        int identifier = getResources().getIdentifier(name, "color", getPackageName());
        if (identifier == 0) {
            identifier = getResources().getIdentifier(name, "color", ORIGINAL_PACKAGE);
        }
        if (identifier == 0) {
            return fallback;
        }
        try {
            return getResources().getColor(identifier, getTheme());
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    private Boolean morpheDarkMode() {
        try {
            Class<?> utils = Class.forName("app.morphe.extension.shared.Utils");
            Object value = utils.getMethod("isDarkModeEnabled").invoke(null);
            return value instanceof Boolean ? (Boolean) value : null;
        } catch (Exception ignored) {
            return null;
        }
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
