package app.morphe.extension.chmate;

import android.app.Activity;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.content.Context;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Message;
import android.util.Base64;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceError;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.WebResourceResponse;
import android.webkit.CookieManager;
import android.webkit.JavascriptInterface;
import android.widget.LinearLayout;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.SeekBar;
import android.widget.Toast;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.nio.charset.StandardCharsets;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.ArrayList;
import java.util.List;

/** Displays the Hissi menu destination inside ChMate's task. */
public final class HissiMenuController extends ToolScreenController {
    public static final int CHECKER_LAYOUT_TAG=0x48690b07;
    public static final int TOOLBAR_HEIGHT_TAG=0x48690b08;
    public static final int RESULT_TABS_TAG=0x48690b09;
    HissiMenuController(Activity host,Intent intent,boolean embedded,Runnable back,java.util.function.Consumer<View> render){
        super(host,intent,embedded,back,render);
    }
    private int restoredScroll=-1;
    private static final String LOG_TAG = "HaiagaruHissi";
    private static final String HISSI_SCHEME = "haiagaru-hissi";
    private static final String HISSI_SECURE_SCHEME = "haiagaru-hissis";
    /** Internal scheme used when ChMate hands the Edge archive to this viewer. */
    private static final String EDDI_SCHEME = "haiagaru-eddi";
    private static final String EDDI_ARCHIVE_HOST = "eddiarchive3rd.boy.jp";
    private static final String CHECKER_CHOICE_PREFS = "haiagaru_checker_choice";
    private static final String MONA_FONT_PATH = "/__haiagaru__/MonaLite.ttf";
    private String sourceHost;
    private String sourceBoard;
    private Uri incomingUri;
    private boolean eddiArchiveMode;
    private WebView viewerWebView;
    private String hissiTarget;
    private String kyodemoTarget;
    private boolean currentUsesKyodemo;
    private LinearLayout rootLayout;
    private LinearLayout hissiTabs;
    private Button[] hissiTabButtons;
    private long lastPostDialogAt;
    private float lastTouchX;
    private float lastTouchY;
    private float historySwipeStartX;
    private float historySwipeStartY;
    private String initialWacchoiQuery;
    private TextView wacchoiConditionView;
    private String lastArchiveErrorKey;
    private Button kyodemoAnalysisButton;
    private Button viewerAdjustButton;
    private String analysisRecoveryAttempt;
    private String pendingAnalysisResult;
    private String analysisAutoOpenedUrl;
    private String lastAnalysisFailureUrl;
    private EddiArchiveSearchUi archiveSearchUi;

    @Override void create(Bundle state) {
        restoredScroll=state==null?-1:state.getInt("haiagaru.checker.scroll",-1);
        Uri incoming = getIntent() == null ? null : getIntent().getData();
        incomingUri = incoming;
        boolean wacchoiSearchLaunch = getIntent() != null
                && getIntent().getBooleanExtra("haiagaru.wacchoi.search", false);
        initialWacchoiQuery = getIntent() == null ? null
                : getIntent().getStringExtra("haiagaru.wacchoi.query");
        eddiArchiveMode = isEddiArchiveUri(incoming);
        if (eddiArchiveMode && Haiagaru.dedicatedViewerEnabled()
                && !getIntent().getBooleanExtra("haiagaru.eddi.web", false)) {
            try {
                archiveSearchUi = EddiArchiveSearchUi.embed(host, incoming, this::openThreadInChMate, state, this::finish);
                showArchive((LinearLayout)archiveSearchUi.rootView());
            } catch (RuntimeException error) {
                Haiagaru.reportEddiArchiveError(this, "VIEWER_START_FAILED",
                        "Native Edge archive viewer could not start", error);
                TextView failure = new TextView(this);
                failure.setText("エッヂ過去ログを開けませんでした（VIEWER_START_FAILED）。\n"
                        + "Download/Haiagaru の診断ログを確認してください。");
                failure.setPadding(32, 48, 32, 32);
                showModel("投稿検索・結果", failure);
            }
            return;
        }
        sourceHost = getIntent() == null ? null
                : getIntent().getStringExtra("haiagaru.wacchoi.host");
        if ((sourceHost == null || sourceHost.trim().isEmpty()) && incoming != null) {
            sourceHost = incoming.getQueryParameter("haiagaru_host");
        }
        // ChMate's built-in long-press action can launch a plain Hissi URL
        // without the source-host query parameter. Hissi is the 5ch checker;
        // use the current 5ch.io host so Kyodemo links return to the live board.
        if ((sourceHost == null || sourceHost.trim().isEmpty())
                && incoming != null && "hissi.org".equalsIgnoreCase(incoming.getHost())) {
            sourceHost = "5ch.io";
        }
        sourceBoard = getIntent() == null ? null
                : getIntent().getStringExtra("haiagaru.wacchoi.board");
        if ((sourceBoard == null || sourceBoard.trim().isEmpty()) && incoming != null) {
            sourceBoard = boardFromMenuPath(incoming);
        }
        // Read the current setting again here. ChMate may cache an expanded
        // menu template, so the mode embedded in its URL can be stale.
        int checkerMode = Haiagaru.hissiCheckerMode();
        int fullMode=SettingsProfiles.prefs(this).getInt(HissiScanTemplate.PROVIDER,0);
        String target;
        if (wacchoiSearchLaunch && FullWacchoiProvider.full(initialWacchoiQuery)) {
            // Non-Edge external boards use the 5ch checker namespace, as requested.
            boolean edge=FullWacchoiProvider.edge(sourceHost);
            if(!edge&&(sourceHost==null||!isHissiHost(sourceHost))){
                sourceHost="5ch.io";getIntent().putExtra("haiagaru.wacchoi.host",sourceHost);
            }
            boolean explicit=getIntent().getBooleanExtra("haiagaru.wacchoi.providerChosen",false);
            boolean previous=getSharedPreferences(CHECKER_CHOICE_PREFS,Context.MODE_PRIVATE).getBoolean(choiceKey(),false);
            boolean kyodemo=explicit?getIntent().getBooleanExtra("haiagaru.wacchoi.kyodemo",false)
                    :FullWacchoiProvider.kyodemo(fullMode,edge,previous);
            if(edge)kyodemo=true;
            getIntent().putExtra("haiagaru.wacchoi.providerChosen",true).putExtra("haiagaru.wacchoi.kyodemo",kyodemo)
                    .putExtra("haiagaru.wacchoi.useTemplate",!kyodemo);
        }
        if (wacchoiSearchLaunch) {
            if (initialWacchoiQuery != null && initialWacchoiQuery.matches("-[^\\s()（）<>]{4}")) {
                startActivity(HissiScanTemplate.applyPartial(this,new android.content.Intent(this, HissiWacchoiSearchActivity.class)
                        .putExtra("haiagaru.wacchoi.query", initialWacchoiQuery)
                        .putExtra("haiagaru.wacchoi.host", sourceHost)
                        .putExtra("haiagaru.wacchoi.board", sourceBoard)));
                finish();
                return;
            }
            if (!getIntent().getBooleanExtra("haiagaru.wacchoi.kyodemo", false)
                    && getIntent().getBooleanExtra("haiagaru.wacchoi.useTemplate",false) && openHissiWacchoiSearch()) {
                finish();
                return;
            }
            currentUsesKyodemo = true;
            if(FullWacchoiProvider.full(initialWacchoiQuery))getSharedPreferences(CHECKER_CHOICE_PREFS,Context.MODE_PRIVATE)
                    .edit().putBoolean(choiceKey(),true).apply();
            hissiTarget = null;
            kyodemoTarget = KyodemoRouting.wacchoiSearchUrl(sourceHost, sourceBoard,
                    initialWacchoiQuery);
            target = kyodemoTarget;
        } else if (isKyodemoBoardSearch(incoming)) {
            currentUsesKyodemo = true;
            hissiTarget = null;
            kyodemoTarget = incoming.buildUpon().scheme("https").build().toString();
            target = kyodemoTarget;
        } else if (eddiArchiveMode) {
            // The archive is a normal HTML search site. Keep its query intact
            // so a saved search can be opened directly in ChMate as well.
            currentUsesKyodemo = false;
            hissiTarget = null;
            kyodemoTarget = null;
            target = toEddiArchiveUrl(incoming);
        } else {
            boolean automaticKyodemo = sourceHost != null && (!isHissiHost(sourceHost)
                    || KyodemoRouting.prefersKyodemo(sourceHost, sourceBoard));
            currentUsesKyodemo = checkerMode == 2 || (checkerMode == 0 && automaticKyodemo)
                    || (checkerMode == 3 && getSharedPreferences(CHECKER_CHOICE_PREFS,
                            Context.MODE_PRIVATE).getBoolean(choiceKey(), automaticKyodemo));
            hissiTarget = toHttpsUrl(incoming);
            kyodemoTarget = toKyodemoUrl(incoming, sourceHost);
            if (currentUsesKyodemo && kyodemoTarget == null && hissiTarget != null) {
                currentUsesKyodemo = false;
            } else if (!currentUsesKyodemo && hissiTarget == null && kyodemoTarget != null) {
                currentUsesKyodemo = true;
            }
            target = currentUsesKyodemo ? kyodemoTarget : hissiTarget;
        }
        if(getIntent().getBooleanExtra("haiagaru.checker.forceKyodemo",false)&&incoming!=null
                &&"www.kyodemo.net".equalsIgnoreCase(incoming.getHost())){currentUsesKyodemo=true;target=incoming.toString();}
        if (target == null) {
            TextView error = new TextView(this);
            error.setText(currentUsesKyodemo
                    ? "この板のID検索先を特定できませんでした"
                    : "必死チェッカーのURLを開けませんでした");
            int theme = Haiagaru.hissiViewerTheme();
            boolean dark = isDarkTheme(theme);
            error.setTextColor(dark ? Color.rgb(235, 235, 240) : Color.rgb(30, 30, 30));
            error.setBackgroundColor(theme == 2 ? Color.BLACK
                    : dark ? Color.rgb(30, 30, 32) : Color.WHITE);
            error.setPadding(32, 32, 32, 32);
            showModel("投稿検索・結果", error);
            return;
        }

        // Resolve the checker first so OFF still preserves the selected service,
        // source board, ID/ﾜｯﾁｮｲ and custom-scheme links cached by ChMate.
        // Every entry point (including explicit launches) reaches this boundary.
        if (!Haiagaru.dedicatedViewerEnabled()) {
            Intent standardWeb = new Intent(Intent.ACTION_VIEW, Uri.parse(target));
            standardWeb.setClassName(this, "jp.syoboi.a2chMate.activity.WebViewActivity");
            startActivity(standardWeb);
            finish();
            return;
        }

        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setTag(CHECKER_LAYOUT_TAG, Boolean.TRUE);
        rootLayout = layout;
        boolean fullscreen = Haiagaru.hissiViewerFullscreen();
        if (!embedded && fullscreen) {
            getWindow().setFlags(
                    android.view.WindowManager.LayoutParams.FLAG_FULLSCREEN,
                    android.view.WindowManager.LayoutParams.FLAG_FULLSCREEN
            );
        } else if (!embedded && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            // Android 15+ places activity content behind system bars. Own the
            // insets here so the viewer toolbar never overlaps the clock.
            getWindow().setDecorFitsSystemWindows(false);
            layout.setOnApplyWindowInsetsListener((view, insets) -> {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                view.setPadding(0, bars.top, 0, bars.bottom);
                return insets;
            });
        }
        applyViewerTheme(layout, null, Haiagaru.hissiViewerTheme());
        boolean darkViewer = isDarkTheme(Haiagaru.hissiViewerTheme());
        TextView title = new TextView(this);
        boolean compactCheckerBackHeader = !eddiArchiveMode && !wacchoiSearchLaunch && !currentUsesKyodemo;
        title.setText(eddiArchiveMode
                ? "‹   エッヂ過去ログ  ·  ChMateビュー"
                : wacchoiSearchLaunch ? "‹   ワッチョイ全文検索  ·  Kyodemo"
                : currentUsesKyodemo
                        ? "‹   ID検索  ·  Kyodemoビュー"
                        : "‹   必死チェッカー · ChMateビュー");
        title.setTextColor(darkViewer ? Color.WHITE : Color.rgb(30, 30, 30));
        title.setTextSize(compactCheckerBackHeader ? 16 : 18);
        title.setGravity(Gravity.CENTER_VERTICAL);
        title.setPadding(compactCheckerBackHeader ? 12 : 24, 0, 24, 0);
        title.setOnClickListener(view -> finish());
        if (Haiagaru.hissiViewerCompactHeader()) title.setVisibility(View.GONE);
        layout.addView(title, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                Math.round((compactCheckerBackHeader ? 36 : 56) * getResources().getDisplayMetrics().density)));
        TextView hint = new TextView(this);
        hint.setText(wacchoiSearchLaunch
                ? "検索条件：" + initialWacchoiQuery + "  ·  " + sourceBoard : "");
        hint.setTextColor(darkViewer ? Color.rgb(190, 190, 198) : Color.rgb(90, 90, 100));
        hint.setTextSize(12);
        if (wacchoiSearchLaunch) wacchoiConditionView = hint;
        hint.setPadding(24, 0, 24, 8);
        if (!wacchoiSearchLaunch) hint.setVisibility(View.GONE);
        layout.addView(hint, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        WebView webView = new WebView(this);
        viewerWebView = webView;
        webView.addJavascriptInterface(new ViewerBridge(), "HaiagaruBridge");
        webView.setOnTouchListener((view, event) -> {
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                lastTouchX = event.getX();
                lastTouchY = event.getY();
                historySwipeStartX = lastTouchX;
                historySwipeStartY = lastTouchY;
            } else if (event.getActionMasked() == MotionEvent.ACTION_UP
                    && Haiagaru.hissiViewerSwipeHistory() != 0
                    && !NativeToolTabSwipeLayout.ownsHistoryGesture(view)
                    && event.getPointerCount() == 1) {
                float dx = event.getX() - historySwipeStartX;
                float dy = event.getY() - historySwipeStartY;
                float minimum = 96 * getResources().getDisplayMetrics().density;
                if (Math.abs(dx) >= minimum && Math.abs(dy) < Math.abs(dx) * 0.45f) {
                    boolean goForward = (dx > 0) == (Haiagaru.hissiViewerSwipeHistory() == 1);
                    // We consume UP; explicitly finish WebView's gesture before
                    // changing history or removing its owning tab. Chromium must
                    // not be destroyed while dispatchTouchEvent is on the stack.
                    MotionEvent cancel=MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    try{webView.onTouchEvent(cancel);}finally{cancel.recycle();}
                    webView.post(()->{
                        if(isDestroyed()||isFinishing()||viewerWebView!=webView)return;
                        if(goForward){if(webView.canGoForward())webView.goForward();}
                        else if(webView.canGoBack())webView.goBack();
                        else finish();
                    });
                    return true;
                }
            }
            return false;
        });
        webView.setOnLongClickListener(view -> {
            float scale = Math.max(0.1f, webView.getScale());
            int x = Math.round(lastTouchX / scale);
            int y = Math.round(lastTouchY / scale);
            webView.evaluateJavascript(
                    "(function(){return (window.haiagaruPostDataAt&&"
                            + "window.haiagaruPostDataAt(" + x + "," + y + "))||"
                            + "window.haiagaruLongPressData||'';})()",
                    value -> {
                        String data = decodeJavascriptString(value);
                        if (data != null && !data.trim().isEmpty()) showPostCopyDialog(data);
                    });
            return true;
        });
        WebSettings settings = webView.getSettings();
        configureWebViewColorScheme(settings);
        // Kyodemo's analysis and screenshot actions are implemented by its
        // same-origin fetch handlers. Hissi's static pages do not need JS.
        // Kyodemo analysis is implemented in its page scripts. The viewer
        // additionally applies its own small stylesheet after navigation.
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setLoadsImagesAutomatically(true);
        settings.setSupportMultipleWindows(true);
        if (!eddiArchiveMode && (currentUsesKyodemo || checkerMode == 3)) {
            CookieManager.getInstance().setAcceptCookie(true);
            CookieManager.getInstance().setAcceptThirdPartyCookies(webView, true);
        }
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return request.isForMainFrame() && openThreadInChMate(request.getUrl().toString());
            }

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                return openThreadInChMate(url);
            }

            @Override
            public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
                WebResourceResponse font = request == null ? null : monaFont(request.getUrl());
                if (font != null) return font;
                WebResourceResponse hissi = HissiWebResponse.intercept(request);
                if (hissi != null) return hissi;
                if (request != null && request.getUrl() != null
                        && isAdvertisingResource(request.getUrl().toString())) {
                    return emptyResource();
                }
                return super.shouldInterceptRequest(view, request);
            }

            @Override
            public WebResourceResponse shouldInterceptRequest(WebView view, String url) {
                try {
                    WebResourceResponse font = monaFont(Uri.parse(url));
                    if (font != null) return font;
                    WebResourceResponse hissi = HissiWebResponse.intercept(url, java.util.Collections.emptyMap());
                    if (hissi != null) return hissi;
                    if (isAdvertisingResource(url)) return emptyResource();
                } catch (Throwable ignored) { }
                return super.shouldInterceptRequest(view, url);
            }

            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                if (request.isForMainFrame()) {
                    title.setText("‹   読み込みエラー · " + error.getDescription());
                    if (eddiArchiveMode) {
                        showArchiveWebError("WEBVIEW_" + Math.abs(error.getErrorCode()),
                                String.valueOf(error.getDescription()), request.getUrl().toString());
                    }
                }
            }

            @Override
            public void onReceivedHttpError(WebView view, WebResourceRequest request,
                    WebResourceResponse response) {
                if (request.isForMainFrame() && response.getStatusCode() >= 400
                        && KyodemoRouting.analysisResultUrl(request.getUrl().toString()) != null) {
                    showAnalysisFailure(request.getUrl().toString());
                }
                if (request.isForMainFrame()
                        && recoverKyodemoAnalysis(view, request.getUrl().toString())) return;
                if (eddiArchiveMode && request.isForMainFrame()) {
                    showArchiveWebError("HTTP_" + response.getStatusCode(),
                            response.getReasonPhrase(), request.getUrl().toString());
                }
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                if (!url.equals(view.getUrl())) return;
                if(restoredScroll>=0){final int scroll=restoredScroll;restoredScroll=-1;view.post(()->{if(!isDestroyed())view.scrollTo(0,scroll);});}
                if (recoverKyodemoAnalysis(view, url)) return;
                applyViewerTheme(rootLayout, view, Haiagaru.hissiViewerTheme());
                if (kyodemoAnalysisButton != null) {
                    kyodemoAnalysisButton.setVisibility((isKyodemoAnalysisUrl(url)||"hissi.org".equalsIgnoreCase(Uri.parse(url).getHost()))
                            && Haiagaru.hissiViewerToolbarButtonVisible(
                                    Haiagaru.HISSI_TOOLBAR_ANALYSIS)
                            ? View.VISIBLE : View.GONE);
                    kyodemoAnalysisButton.setText("分析");
                }
                configureHissiTabs(view);
                if (url.equals(pendingAnalysisResult)
                        || ("wt".equals(Uri.parse(url).getFragment())
                                && !url.equals(analysisAutoOpenedUrl))) {
                    pendingAnalysisResult = null;
                    analysisAutoOpenedUrl = url;
                    view.evaluateJavascript(
                            "!!document.querySelector('#blist .d-myChart, #b>.right-column #toggle-w-tawindow .d-box')",
                            result -> {
                                if (!url.equals(view.getUrl())) return;
                                if ("true".equals(result) && kyodemoAnalysisButton != null) {
                                    kyodemoAnalysisButton.performClick();
                                } else {
                                    Toast.makeText(HissiMenuController.this,
                                            "分析結果はまだ取得できません。投稿一覧に戻りました。",
                                            Toast.LENGTH_LONG).show();
                                }
                            });
                }
            }

            @Override
            public void onPageStarted(WebView view, String url, android.graphics.Bitmap icon) {
                lastArchiveErrorKey = null;
                if (hissiTabs != null) hissiTabs.setVisibility(View.GONE);
            }
        });
        webView.setWebChromeClient(new WebChromeClient() {
            @Override
            public boolean onCreateWindow(WebView source, boolean isDialog,
                    boolean isUserGesture, Message resultMsg) {
                if (!isUserGesture) return false;
                WebView.HitTestResult hit = source.getHitTestResult();
                String selectedUrl = hit == null ? null : hit.getExtra();
                if (selectedUrl != null && !selectedUrl.isEmpty()) {
                    if (!openThreadInChMate(selectedUrl)) source.loadUrl(selectedUrl);
                    return false;
                }
                if (resultMsg == null || !(resultMsg.obj instanceof WebView.WebViewTransport)) {
                    return false;
                }

                // Some WebView builds omit the hit-test URL for target=_blank.
                // Receive that first navigation in a temporary hidden window.
                WebView popup = new WebView(HissiMenuController.this);
                popup.setVisibility(View.INVISIBLE);
                boolean[] disposed = {false};
                Runnable disposePopup = () -> {
                    if (disposed[0]) return;
                    disposed[0] = true;
                    popup.destroy();
                };
                popup.setWebViewClient(new WebViewClient() {
                    private boolean dispatched;

                    private void dispatch(String url) {
                        if (dispatched) return;
                        dispatched = true;
                        if (!openThreadInChMate(url)) source.loadUrl(url);
                        new android.os.Handler(android.os.Looper.getMainLooper()).post(disposePopup);
                    }

                    @Override
                    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                        if (request.isForMainFrame()) dispatch(request.getUrl().toString());
                        return true;
                    }

                    @Override
                    public boolean shouldOverrideUrlLoading(WebView view, String url) {
                        dispatch(url);
                        return true;
                    }

                    @Override
                    public void onPageStarted(WebView view, String url, android.graphics.Bitmap favicon) {
                        dispatch(url);
                    }
                });
                WebView.WebViewTransport transport = (WebView.WebViewTransport) resultMsg.obj;
                transport.setWebView(popup);
                resultMsg.sendToTarget();
                new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(disposePopup, 10000);
                return true;
            }
        });
        LinearLayout toolbar = createViewerToolbar(webView);
        layout.addView(toolbar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                Math.round(Haiagaru.hissiViewerToolbarHeightDp() * getResources().getDisplayMetrics().density)
        ));
        if (wacchoiSearchLaunch && fullMode==3 && sourceHost != null && isHissiHost(sourceHost)) {
            LinearLayout providers = new LinearLayout(this);
            providers.setTag(CheckerBarOptions.PROVIDERS_TAG, Boolean.TRUE);
            providers.setPadding(16, 8, 16, 8);
            Button selected = toolbarButton("✓ Kyodemo");
            selected.setContentDescription("現在の検索先：Kyodemo");
            selected.setEnabled(false);
            providers.addView(selected, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            Button hissi = toolbarButton("Hissiに切替");
            hissi.setContentDescription("ワッチョイ全文を引き継いでHissiで検索");
            hissi.setOnClickListener(view -> { if (openHissiWacchoiSearch()) finish(); });
            providers.addView(hissi, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            layout.addView(providers);
        } else if (!wacchoiSearchLaunch && !eddiArchiveMode && checkerMode == 3
                && hissiTarget != null && kyodemoTarget != null) {
            Button alternate = toolbarButton(currentUsesKyodemo ? "hissi.orgで開く" : "Kyodemoで開く");
            alternate.setText(currentUsesKyodemo ? "hissi.orgで開く" : "Kyodemoで開く");
            alternate.setTextColor(Color.BLUE);
            alternate.setGravity(Gravity.CENTER);
            alternate.setPadding(20, 12, 20, 12);
            alternate.setOnClickListener(view -> {
                boolean nextUsesKyodemo = !currentUsesKyodemo;
                // Hissi has no Kyodemo-style full-SLIP result URL. Use our existing
                // Hissi daily-index search, preserving the source board and both halves.
                if (!nextUsesKyodemo && wacchoiSearchLaunch && openHissiWacchoiSearch()) return;
                String nextTarget = nextUsesKyodemo ? kyodemoTarget : hissiTarget;
                if (nextTarget == null) {
                    Toast.makeText(this, "この板では選択した検索先を利用できません", Toast.LENGTH_SHORT).show();
                    return;
                }
                currentUsesKyodemo = nextUsesKyodemo;
                getSharedPreferences(CHECKER_CHOICE_PREFS, Context.MODE_PRIVATE)
                        .edit().putBoolean(choiceKey(), currentUsesKyodemo).apply();
                alternate.setText(currentUsesKyodemo ? "hissi.orgで開く" : "Kyodemoで開く");
                title.setText(currentUsesKyodemo
                        ? "‹   ID検索  ·  Kyodemoビュー"
                        : "‹   必死チェッカー · ChMateビュー");
                webView.loadUrl(nextTarget);
            });
            LinearLayout providers = new LinearLayout(this);
            providers.setTag(CheckerBarOptions.PROVIDERS_TAG, Boolean.TRUE);
            providers.addView(alternate, new LinearLayout.LayoutParams(-1,-2));
            layout.addView(providers);
        }
        String restoredUrl=state==null?null:state.getString("haiagaru.checker.url");
        if(restoredUrl!=null){String hostName=Uri.parse(restoredUrl).getHost();if("hissi.org".equalsIgnoreCase(hostName)||"www.kyodemo.net".equalsIgnoreCase(hostName)||"kyodemo.net".equalsIgnoreCase(hostName))target=restoredUrl;}
        webView.loadUrl(target);
        layout.addView(webView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        if (!eddiArchiveMode) {
            hissiTabs = createHissiTabs(webView);
            hissiTabs.setVisibility(View.GONE);
            // Keep result navigation next to the controls, above the scrolling content.
            layout.addView(hissiTabs, layout.indexOfChild(webView), new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    48 * getResources().getDisplayMetrics().densityDpi / 160));
        }
        showModel("投稿検索・結果", layout);
        if (!fullscreen && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            layout.requestApplyInsets();
        }
    }

    private boolean recoverKyodemoAnalysis(WebView view, String url) {
        String resultUrl = KyodemoRouting.analysisResultUrl(url);
        if (resultUrl == null || url.equals(analysisRecoveryAttempt)) return false;
        view.post(() -> {
            // HTTP errors can arrive before WebView publishes its new URL.
            // Do not consume the one-shot recovery unless we actually navigate.
            if (!url.equals(view.getUrl()) || url.equals(analysisRecoveryAttempt)) return;
            analysisRecoveryAttempt = url;
            pendingAnalysisResult = resultUrl;
            Log.i(LOG_TAG, "Kyodemo analysis: returning to result page");
            view.loadUrl(resultUrl);
        });
        return true;
    }

    private void showAnalysisFailure(String url) {
        if (isFinishing() || url.equals(lastAnalysisFailureUrl)) return;
        lastAnalysisFailureUrl = url;
        new HaiagaruDialog.Builder(this).setTitle("AI解析")
                .setMessage("しばらくしてもう一度お試しください")
                .setPositiveButton("OK", null).show();
    }

    private LinearLayout createViewerToolbar(final WebView webView) {
        LinearLayout toolbar = new LinearLayout(this);
        toolbar.setTag(TOOLBAR_HEIGHT_TAG, Haiagaru.hissiViewerToolbarHeightDp());
        toolbar.setOrientation(LinearLayout.HORIZONTAL);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        int compactPadding = Math.max(0, Math.round((Haiagaru.hissiViewerToolbarHeightDp() - 32) / 8f));
        toolbar.setPadding(8, compactPadding, 8, compactPadding);
        toolbar.setBackgroundColor(Haiagaru.hissiViewerTheme() == 2 ? Color.BLACK : Color.TRANSPARENT);

        Button refresh = toolbarButton("更新");
        refresh.setVisibility(Haiagaru.hissiViewerToolbarButtonVisible(
                Haiagaru.HISSI_TOOLBAR_REFRESH) ? View.VISIBLE : View.GONE);
        refresh.setContentDescription("表示中のページを再読み込み");
        refresh.setOnClickListener(view -> {
            if (webView.getUrl() != null) webView.reload();
        });
        toolbar.addView(refresh, buttonParams());

        Button copyUrl = toolbarButton("URL");
        copyUrl.setVisibility(Haiagaru.hissiViewerToolbarButtonVisible(
                Haiagaru.HISSI_TOOLBAR_COPY_URL) ? View.VISIBLE : View.GONE);
        copyUrl.setOnClickListener(view -> copyToClipboard("URL", webView.getUrl()));
        toolbar.addView(copyUrl, buttonParams());

        Button copyAll = toolbarButton("全レス");
        copyAll.setVisibility(Haiagaru.hissiViewerToolbarButtonVisible(
                Haiagaru.HISSI_TOOLBAR_COPY_ALL) ? View.VISIBLE : View.GONE);
        copyAll.setOnClickListener(view -> webView.evaluateJavascript(
                "(function(){var a=document.querySelectorAll('#rlist .clmess,.post .clmess,article .res,article .response,.res-body,dl dd');"
                        + "if(!a.length)a=document.querySelectorAll('#rlist .post,.post,article,dl');"
                        + "var out=Array.prototype.map.call(a,function(e){return (e.innerText||e.textContent||'').trim();})"
                        + ".filter(function(e){return e.length>0;});return out.join('\\n\\n');})()",
                value -> copyToClipboard("全レス本文", decodeJavascriptString(value))
        ));
        toolbar.addView(copyAll, buttonParams());

        Button copyBody = toolbarButton("本文");
        copyBody.setVisibility(Haiagaru.hissiViewerToolbarButtonVisible(
                Haiagaru.HISSI_TOOLBAR_COPY_BODY) ? View.VISIBLE : View.GONE);
        copyBody.setOnClickListener(view -> webView.evaluateJavascript(
                "(function(){var e=document.querySelector('#rlist,main,.content');"
                        + "return e ? (e.innerText||e.textContent||'') : (document.body ? document.body.innerText : '');})()",
                value -> copyToClipboard("一覧本文", decodeJavascriptString(value))
        ));
        toolbar.addView(copyBody, buttonParams());

        Button date = toolbarButton("日付");
        date.setVisibility(Haiagaru.hissiViewerToolbarButtonVisible(
                Haiagaru.HISSI_TOOLBAR_DATE) ? View.VISIBLE : View.GONE);
        date.setOnClickListener(view -> showDatePicker(webView));
        toolbar.addView(date, buttonParams());

        if (!eddiArchiveMode && kyodemoTarget != null) {
            Button search = toolbarButton("ID/ﾜｯﾁｮｲ");
            search.setVisibility(Haiagaru.hissiViewerToolbarButtonVisible(
                    Haiagaru.HISSI_TOOLBAR_SEARCH) ? View.VISIBLE : View.GONE);
            search.setOnClickListener(view -> showPosterSearch());
            toolbar.addView(search, buttonParams());
        }
        if (!eddiArchiveMode) {
            Button analysis = toolbarButton("分析");
            kyodemoAnalysisButton = analysis;
            analysis.setVisibility(View.GONE);
            analysis.setContentDescription("投稿分析を表示。長押しで分析リクエスト");
            analysis.setOnLongClickListener(view -> {
                requestKyodemoAnalysis(webView);
                return true;
            });
            analysis.setOnClickListener(view -> {
                if("hissi.org".equalsIgnoreCase(Uri.parse(webView.getUrl()).getHost())){webView.evaluateJavascript(HissiActivityGraph.SCRIPT,null);return;}
                webView.evaluateJavascript(
                    "(function(){if(location.hostname!=='www.kyodemo.net'"
                            + "||!location.pathname.startsWith('/sdemo/b/'))return 'unavailable';"
                            + "var panel=document.querySelector('#b>.right-column');"
                            + "var chart=document.querySelector('#blist .d-myChart');"
                            + "var trend=panel&&panel.querySelector('#toggle-w-tawindow .d-box');"
                            + "var inline=!!chart&&!trend;"
                            + "if(!inline&&!trend)return 'unavailable';"
                            + "var opened=document.body.hasAttribute('data-haiagaru-analysis');"
                            + "if(opened)document.body.removeAttribute('data-haiagaru-analysis');"
                            + "else document.body.setAttribute('data-haiagaru-analysis',inline?'inline':'sidebar');"
                            + "if(inline){var summary=document.getElementById('haiagaru-analysis-summary');"
                            + "var source=document.getElementById('copy-mess');"
                            + "if(!summary&&source){summary=document.createElement('pre');"
                            + "summary.id='haiagaru-analysis-summary';summary.textContent=source.value;"
                            + "chart.parentNode.insertBefore(summary,chart.nextSibling);}"
                            + "requestAnimationFrame(function(){if(window.myChart&&typeof window.myChart.resize==='function')window.myChart.resize();});}"
                            + "window.scrollTo(0,0);return opened?'closed':'opened';})()",
                    result -> {
                        if ("\"unavailable\"".equals(result)) {
                            Toast.makeText(this, "分析結果はまだありません。長押しで分析をリクエストできます。",
                                    Toast.LENGTH_LONG).show();
                        } else {
                            analysis.setText("\"opened\"".equals(result) ? "投稿" : "分析");
                        }
                    });
            });
            toolbar.addView(analysis, buttonParams());
        }

        Button zoom = toolbarButton("文字");
        zoom.setVisibility(Haiagaru.hissiViewerToolbarButtonVisible(
                Haiagaru.HISSI_TOOLBAR_TEXT_ZOOM) ? View.VISIBLE : View.GONE);
        zoom.setOnClickListener(view -> {
            int current = webView.getSettings().getTextZoom();
            int next = current < 110 ? 115 : current < 125 ? 130 : 100;
            webView.getSettings().setTextZoom(next);
            Haiagaru.setHissiViewerTextZoom(next);
            Toast.makeText(this, "文字サイズ " + next + "%", Toast.LENGTH_SHORT).show();
        });
        webView.getSettings().setTextZoom(Haiagaru.hissiViewerTextZoom());
        toolbar.addView(zoom, buttonParams());

        Button theme = toolbarButton("配色");
        theme.setVisibility(Haiagaru.hissiViewerToolbarButtonVisible(
                Haiagaru.HISSI_TOOLBAR_THEME) ? View.VISIBLE : View.GONE);
        theme.setOnClickListener(view -> {
            int next = (Haiagaru.hissiViewerTheme() + 1) % 4;
            Haiagaru.setHissiViewerTheme(next);
            applyViewerTheme(rootLayout, webView, next);
            String[] themeNames = {"端末設定", "ダーク", "AMOLEDブラック", "ライト"};
            Toast.makeText(this, themeNames[next], Toast.LENGTH_SHORT).show();
        });
        toolbar.addView(theme, buttonParams());

        Button displaySettings = toolbarButton("調整");
        viewerAdjustButton = displaySettings;
        displaySettings.setVisibility(Haiagaru.hissiViewerShowAdjust() ? View.VISIBLE : View.GONE);
        displaySettings.setContentDescription("Hissi／Kyodemoの表示設定");
        displaySettings.setOnClickListener(view -> showViewerDisplaySettings(webView, toolbar));
        toolbar.addView(displaySettings, buttonParams());
        return toolbar;
    }

    private void showViewerDisplaySettings(WebView webView, LinearLayout toolbar) {
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int pad = Math.round(16 * getResources().getDisplayMetrics().density);
        content.setPadding(pad, pad / 2, pad, 0);

        int currentZoom = webView.getSettings().getTextZoom();
        SeekBar zoom = addViewerSlider(content, "文字サイズ: " + currentZoom + "%", 30,
                Math.max(0, Math.min(30, currentZoom - 100)), progress -> "文字サイズ: " + (100 + progress) + "%");
        int currentSpacing = Haiagaru.hissiViewerResponseSpacingDp();
        SeekBar spacing = addViewerSlider(content, "レス上下余白: " + currentSpacing + "dp", 20,
                currentSpacing, progress -> "レス上下余白: " + progress + "dp");
        int currentHeight = Haiagaru.hissiViewerToolbarHeightDp();
        SeekBar height = addViewerSlider(content, "上部操作バー: " + currentHeight + "dp", 60,
                currentHeight - 20, progress -> "上部操作バー: " + (20 + progress) + "dp");
        int currentTabsHeight = CheckerBarOptions.height(this, CheckerBarOptions.TABS, 40);
        SeekBar tabsHeight = addViewerSlider(content, "レス・スレ・名前バー: " + currentTabsHeight + "dp", 60,
                currentTabsHeight - 20, progress -> "レス・スレ・名前バー: " + (20 + progress) + "dp");
        int currentProvidersHeight = CheckerBarOptions.height(this, CheckerBarOptions.PROVIDERS, 32);
        SeekBar providersHeight = addViewerSlider(content, "検索先切替バー: " + currentProvidersHeight + "dp", 60,
                currentProvidersHeight - 20, progress -> "検索先切替バー: " + (20 + progress) + "dp");
        android.widget.Switch handles = new android.widget.Switch(this);
        handles.setText("高さ調整のつまみを表示（オフで高さを固定）");
        handles.setChecked(SettingsProfiles.prefs(this).getBoolean(CheckerBarOptions.HANDLES, true));
        content.addView(handles);

        new HaiagaruDialog.Builder(this).setTitle("Hissi／Kyodemoの表示調整")
                .setView(content)
                .setNeutralButton("標準に戻す", (dialog, which) -> {
                    webView.getSettings().setTextZoom(100);
                    Haiagaru.setHissiViewerTextZoom(100);
                    Haiagaru.setHissiViewerResponseSpacingDp(7);
                    Haiagaru.setHissiViewerToolbarHeightDp(32);
                    CheckerBarOptions.save(this, CheckerBarOptions.TABS, 40);
                    CheckerBarOptions.save(this, CheckerBarOptions.PROVIDERS, 32);
                    SettingsProfiles.prefs(this).edit().putBoolean(CheckerBarOptions.HANDLES, true).apply();
                    updateViewerToolbarHeight(toolbar, 32);
                    applyViewerTheme(rootLayout, webView, Haiagaru.hissiViewerTheme());
                })
                .setNegativeButton("キャンセル", null)
                .setPositiveButton("適用", (dialog, which) -> {
                    int textZoom = 100 + zoom.getProgress();
                    int responseSpacing = spacing.getProgress();
                    int toolbarHeight = 20 + height.getProgress();
                    webView.getSettings().setTextZoom(textZoom);
                    Haiagaru.setHissiViewerTextZoom(textZoom);
                    Haiagaru.setHissiViewerResponseSpacingDp(responseSpacing);
                    Haiagaru.setHissiViewerToolbarHeightDp(toolbarHeight);
                    CheckerBarOptions.save(this, CheckerBarOptions.TABS, 20 + tabsHeight.getProgress());
                    CheckerBarOptions.save(this, CheckerBarOptions.PROVIDERS, 20 + providersHeight.getProgress());
                    SettingsProfiles.prefs(this).edit().putBoolean(CheckerBarOptions.HANDLES, handles.isChecked()).apply();
                    updateViewerToolbarHeight(toolbar, toolbarHeight);
                    applyViewerTheme(rootLayout, webView, Haiagaru.hissiViewerTheme());
                }).show();
    }

    private interface ViewerSliderLabel { String text(int progress); }

    private SeekBar addViewerSlider(LinearLayout content, String initial, int max, int progress,
            ViewerSliderLabel labelText) {
        TextView label = new TextView(this);
        label.setText(initial);
        content.addView(label);
        SeekBar slider = new SeekBar(this);
        slider.setMax(max);
        slider.setProgress(progress);
        slider.setContentDescription(initial.substring(0, initial.indexOf(':')));
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int value, boolean fromUser) {
                label.setText(labelText.text(value));
            }
            @Override public void onStartTrackingTouch(SeekBar bar) { }
            @Override public void onStopTrackingTouch(SeekBar bar) { }
        });
        content.addView(slider);
        return slider;
    }

    private void updateViewerToolbarHeight(LinearLayout toolbar, int heightDp) {
        toolbar.setTag(TOOLBAR_HEIGHT_TAG, heightDp);
        int px = Math.round(heightDp * getResources().getDisplayMetrics().density);
        ViewGroup.LayoutParams params = toolbar.getLayoutParams();
        if (params != null) { params.height = px; toolbar.setLayoutParams(params); }
        int pad = Math.max(0, Math.round((heightDp - 32) / 8f));
        toolbar.setPadding(8, pad, 8, pad);
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof Button) ((Button) child).setMinHeight(px);
        }
        toolbar.requestLayout();
    }

    private LinearLayout createHissiTabs(WebView webView) {
        LinearLayout tabs = new LinearLayout(this);
        tabs.setOrientation(LinearLayout.HORIZONTAL);
        tabs.setTag(RESULT_TABS_TAG, 0);
        tabs.setPadding(0, 0, 0, 0);
        String[] labels = {"レス", "スレ", "名前"};
        hissiTabButtons = new Button[labels.length];
        for (int index = 0; index < labels.length; index++) {
            final int tab = index;
            Button button = toolbarButton(labels[index]);
            button.setContentDescription(new String[]{"書き込んだレス", "書き込んだスレ", "使用した名前"}[index]);
            button.setOnClickListener(view -> {
                webView.evaluateJavascript("window.haiagaruSelectHissiTab&&"
                        + "window.haiagaruSelectHissiTab(" + tab + ")", null);
                selectHissiTab(tab);
            });
            hissiTabButtons[index] = button;
            tabs.addView(button, buttonParams());
        }
        return tabs;
    }

    private void showUnsupportedSuffixSearch(String suffix) {
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = (int)(20 * getResources().getDisplayMetrics().density);
        content.setPadding(padding, padding, padding, padding);
        TextView note = new TextView(this);
        note.setText("Kyodemoは下4桁だけ（" + suffix + "）の検索を受け付けません。検索結果が0件という意味ではありません。\n\nIDまたは完全なワッチョイを入力して検索できます。下4桁のNG登録はChMate側で利用できます。");
        content.addView(note);
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setHint("例：L20 abcd-EFGH / ﾜｯﾁｮｲ abcd-EFGH");
        content.addView(input);
        Button search = new Button(this);
        search.setText("入力したID／ﾜｯﾁｮｲで検索");
        search.setOnClickListener(view -> {
            String query = input.getText().toString().trim();
            if (query.isEmpty() || query.matches("-[^\\s()（）<>]{4}")) {
                input.setError("IDまたは完全なワッチョイを入力してください");
                return;
            }
            Intent next = new Intent(getIntent());
            next.putExtra("haiagaru.wacchoi.query", query);
            startActivity(next);
            finish();
        });
        content.addView(search);
        showModel("投稿検索・結果", content);
    }

    private void showPosterSearch(){
        EditText input=new EditText(this);input.setSingleLine(true);input.setHint("ID:投稿ID または ワッチョイ");
        String id=selectedCheckerId(incomingUri);
        if(id==null&&incomingUri!=null){List<String> p=incomingUri.getPathSegments();if(!p.isEmpty())id=decodeHissiId(p.get(p.size()-1));}
        input.setText(initialWacchoiQuery!=null?initialWacchoiQuery:id==null?"":id.startsWith("ID:")?id:"ID:"+id);
        LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);form.addView(input);
        String today=new java.text.SimpleDateFormat("yyyyMMdd",java.util.Locale.US).format(new java.util.Date());
        EditText from=new EditText(this),to=new EditText(this);
        from.setSingleLine(true);to.setSingleLine(true);from.setHint("開始日 YYYYMMDD");to.setHint("終了日 YYYYMMDD");
        from.setText(today);to.setText(today);form.addView(from);form.addView(to);
        addPosterCalendar(form, from, "開始日をカレンダーで選択");
        addPosterCalendar(form, to, "終了日をカレンダーで選択");
        android.widget.Spinner provider=new android.widget.Spinner(this);
        provider.setAdapter(new android.widget.ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,new String[]{"hissi.org","Kyodemo"}));
        provider.setSelection(FullWacchoiProvider.edge(sourceHost)?1:0);form.addView(provider);
        new HaiagaruDialog.Builder(this).setTitle("ID／ワッチョイを検索・日付範囲").setView(form)
            .setPositiveButton("検索",(dialog,which)->{
                String query=input.getText().toString().trim();if(query.isEmpty())return;
                String start=from.getText().toString().replace("-",""),end=to.getText().toString().replace("-","");
                if(!validPosterDate(start)||!validPosterDate(end)||start.compareTo(end)>0){Toast.makeText(this,"日付範囲を確認してください",Toast.LENGTH_SHORT).show();return;}
                boolean edge=FullWacchoiProvider.edge(sourceHost);
                if(provider.getSelectedItemPosition()==1){
                    String term=KyodemoRouting.isWacchoiToken(query)?query:query.regionMatches(true,0,"ID:",0,3)?query:"ID:"+query;
                    String url=KyodemoRouting.wacchoiSearchUrl(sourceHost,sourceBoard,term);
                    if(url==null)return;
                    Uri range=Uri.parse(url).buildUpon().appendQueryParameter("fr",start.substring(0,4)+"-"+start.substring(4,6)+"-"+start.substring(6))
                        .appendQueryParameter("to",end.substring(0,4)+"-"+end.substring(4,6)+"-"+end.substring(6)).build();
                    currentUsesKyodemo=true;updateWacchoiQuery(term);viewerWebView.loadUrl(range.toString());return;
                }
                Intent intent=new Intent(this,HissiWacchoiSearchActivity.class)
                    .putExtra("haiagaru.wacchoi.query",query)
                    .putExtra("haiagaru.wacchoi.host",sourceHost)
                    .putExtra("haiagaru.wacchoi.board",sourceBoard)
                    .putExtra("haiagaru.search.allowCrossBoard",true).putExtra("haiagaru.search.from",start).putExtra("haiagaru.search.to",end);
                if(!edge&&!WacchoiSearch.SLIP.matcher(WacchoiSearch.normalizeSlipText(query)).find()){
                    String value=query.regionMatches(true,0,"ID:",0,3)?query.substring(3).trim():query;
                    if(!value.matches("[A-Za-z0-9._+/-]{1,32}")){Toast.makeText(this,"IDを確認してください",Toast.LENGTH_SHORT).show();return;}
                    intent.putExtra("haiagaru.wacchoi.query","ID:"+value);
                }
                if(!edge)intent.putExtra("haiagaru.wacchoi.hissi",true);
                WacchoiLongPressMenu.launchSearch(this,intent);
            }).setNeutralButton("エッヂで検索",(dialog,which)->{
                String query=input.getText().toString().trim();if(query.isEmpty())return;
                String start=from.getText().toString().replace("-",""),end=to.getText().toString().replace("-","");
                if(!validPosterDate(start)||!validPosterDate(end)||start.compareTo(end)>0){Toast.makeText(this,"日付範囲を確認してください",Toast.LENGTH_SHORT).show();return;}
                String term=KyodemoRouting.isWacchoiToken(query)?query:query.regionMatches(true,0,"ID:",0,3)?"ID:"+query.substring(3).trim():"ID:"+query;
                String address=KyodemoRouting.wacchoiSearchUrl("bbs.eddibb.cc","liveedge",term);
                if(address==null)return;
                Uri range=Uri.parse(address).buildUpon()
                    .appendQueryParameter("fr",start.substring(0,4)+"-"+start.substring(4,6)+"-"+start.substring(6))
                    .appendQueryParameter("to",end.substring(0,4)+"-"+end.substring(4,6)+"-"+end.substring(6)).build();
                Intent intent=new Intent(this,HissiMenuActivity.class).setData(range)
                    .putExtra("haiagaru.wacchoi.query",term).putExtra("haiagaru.wacchoi.host","bbs.eddibb.cc")
                    .putExtra("haiagaru.wacchoi.board","liveedge").putExtra("haiagaru.checker.forceKyodemo",true);
                WacchoiLongPressMenu.launchSearch(this,intent);
            }).setNegativeButton("キャンセル",null).show();
    }

    private static boolean validPosterDate(String value) {
        if(!value.matches("[0-9]{8}"))return false;
        java.text.SimpleDateFormat format=new java.text.SimpleDateFormat("yyyyMMdd",java.util.Locale.US);
        format.setLenient(false);
        try{return format.parse(value)!=null;}catch(java.text.ParseException invalid){return false;}
    }

    private void addPosterCalendar(LinearLayout form, EditText field, String label) {
        android.widget.Button calendar=new android.widget.Button(this);calendar.setText(label);
        calendar.setOnClickListener(view->{
            Calendar initial=Calendar.getInstance();String value=field.getText().toString().replace("-","");
            if(validPosterDate(value))initial.set(Integer.parseInt(value.substring(0,4)),Integer.parseInt(value.substring(4,6))-1,Integer.parseInt(value.substring(6)));
            HaiagaruDates.show(host,initial,(year,month,day)->field.setText(String.format(java.util.Locale.US,"%04d%02d%02d",year,month+1,day)));
        });form.addView(calendar);
    }

    private void showKyodemoSearch(WebView webView, String initialValue) {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setHint("bbs.eddibb.cc".equals(sourceHost)
                ? "IDまたは L20 abcd-EFGH のような表記" : "IDまたはﾜｯﾁｮｲ");
        String selectedId = selectedCheckerId(incomingUri);
        if ((selectedId == null || selectedId.trim().isEmpty()) && incomingUri != null) {
            List<String> path = incomingUri.getPathSegments();
            if (!path.isEmpty()) selectedId = decodeHissiId(path.get(path.size() - 1));
        }
        if (initialValue != null && !initialValue.trim().isEmpty()) {
            input.setText(initialValue.trim());
        } else if (selectedId != null && !selectedId.trim().isEmpty()) {
            input.setText(selectedId.regionMatches(true,0,"ID:",0,3)?selectedId:"ID:"+selectedId);
        }
        int padding = (int) (20 * getResources().getDisplayMetrics().density);
        input.setPadding(padding, input.getPaddingTop(), padding, input.getPaddingBottom());
        new HaiagaruDialog.Builder(this)
                .setTitle("KyodemoでID/ﾜｯﾁｮｲを検索")
                .setView(input)
                .setNegativeButton("キャンセル", null)
                .setPositiveButton("検索", (dialog, which) -> {
                    String query = input.getText().toString().trim();
                    if (getIntent().getBooleanExtra("haiagaru.wacchoi.search", false)
                            && !WacchoiSearch.SLIP.matcher(query).find()) {
                        Toast.makeText(this, "ワッチョイ全文を入力してください", Toast.LENGTH_LONG).show();
                        return;
                    }
                    if (query.matches("-[^\\s()（）<>]{4}")) {
                        Toast.makeText(this, "Kyodemoは下4桁だけの検索には対応していません。IDまたは完全なﾜｯﾁｮｲを入力してください", Toast.LENGTH_LONG).show();
                        return;
                    }
                    String url = KyodemoRouting.wacchoiSearchUrl(sourceHost,
                            sourceBoard, query);
                    if (url == null) {
                        Toast.makeText(this, "ID/ﾜｯﾁｮｲと板を確認してください", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    currentUsesKyodemo = true;
                    updateWacchoiQuery(query);
                    webView.loadUrl(url);
                }).show();
    }

    /** Request only the action offered by the current result, never invent its token. */
    private void requestKyodemoAnalysis(WebView webView) {
        final String pageUrl = webView.getUrl();
        webView.evaluateJavascript("(function(){"
                + "if(location.hostname!=='www.kyodemo.net'||!location.pathname.startsWith('/sdemo/b/'))return '';"
                + "for(var a of document.querySelectorAll('a[href],a[data-url]')){try{"
                + "var u=new URL(a.getAttribute('data-url')||a.href,location.href);"
                + "var current=new URL(location.href);"
                + "var same=['k','wc','id','key','date','fr','to'].every(function(k){return !current.searchParams.has(k)||current.searchParams.get(k)===u.searchParams.get(k);});"
                + "if(same&&u.origin===location.origin&&u.pathname===location.pathname&&u.searchParams.get('fetch')==='a')return u.href;"
                + "}catch(e){}}return '';})()", result -> {
            if (!java.util.Objects.equals(pageUrl, webView.getUrl()) || isFinishing()) return;
            String executionUrl = decodeJavascriptString(result);
            if (KyodemoRouting.analysisResultUrl(executionUrl) == null) {
                new HaiagaruDialog.Builder(this).setTitle("分析リクエスト")
                        .setMessage("この検索結果にはKyodemoの分析リクエスト用リンクがありません。"
                                + "分析済みの場合は「分析」で結果を表示できます。"
                                + "未分析の場合は、サイト側の対象条件や利用制限によって実行できないことがあります。")
                        .setPositiveButton("OK", null).show();
                return;
            }
            new HaiagaruDialog.Builder(this).setTitle("分析リクエスト")
                    .setMessage("表示中のID・ﾜｯﾁｮｲについて、Kyodemoへ分析をリクエストします。"
                            + "完了後に結果を再取得します。サイトの混雑や利用制限で失敗する場合があります。")
                    .setNegativeButton("キャンセル", null)
                    .setPositiveButton("リクエスト", (dialog, which) -> {
                        if (!java.util.Objects.equals(pageUrl, webView.getUrl())) return;
                        analysisRecoveryAttempt = null;
                        lastAnalysisFailureUrl = null;
                        if (kyodemoAnalysisButton != null) kyodemoAnalysisButton.setText("分析中");
                        webView.loadUrl(executionUrl);
                    }).show();
        });
    }

    private void selectHissiTab(int selected) {
        if (hissiTabButtons == null) return;
        if (hissiTabs != null) hissiTabs.setTag(RESULT_TABS_TAG, selected);
        for (int index = 0; index < hissiTabButtons.length; index++) {
            hissiTabButtons[index].setSelected(index == selected);
            hissiTabButtons[index].setAlpha(index == selected ? 1f : 0.7f);
        }
    }

    private void configureHissiTabs(WebView webView) {
        if (hissiTabs == null) return;
        if (Haiagaru.kyodemoEnhancedViewer()) {
            webView.evaluateJavascript("(function(){"
                    + "if(location.hostname!=='www.kyodemo.net'||!location.search.includes('bs=hi'))return false;"
                    + "var list=document.querySelector('#blist');if(!list)return false;"
                    + "var posts=list.querySelectorAll('.post');if(!posts.length)return false;"
                    + "document.body.setAttribute('data-haiagaru-kyodemo','');"
                    + "var threads=list.querySelectorAll('.box.content');"
                    + "var summary=document.getElementById('haiagaru-kyodemo-summary');"
                    + "if(!summary){summary=document.createElement('div');summary.id='haiagaru-kyodemo-summary';"
                    + "list.insertBefore(summary,list.firstChild);}"
                    + "var names=document.getElementById('haiagaru-kyodemo-names');"
                    + "if(!names){names=document.createElement('div');names.id='haiagaru-kyodemo-names';"
                    + "list.insertBefore(names,summary.nextSibling);}"
                    + "summary.textContent='';names.textContent='';"
                    + "Array.from(threads).forEach(function(box){var a=box.querySelector('h2 a[href]');"
                    + "if(!a)return;var item=document.createElement('div');item.className='haiagaru-kyodemo-item';"
                    + "var link=a.cloneNode(true);item.appendChild(link);"
                    + "var count=document.createElement('small');count.textContent='  '+box.querySelectorAll('.post').length+'レス';"
                    + "item.appendChild(count);summary.appendChild(item);});"
                    + "var counts={};Array.from(posts).forEach(function(post){var head=post.querySelector('.r-head');"
                    + "if(!head)return;var text=(head.innerText||head.textContent||'').replace(/^\\s*\\d+[^:：]*[:：]/,'');"
                    + "var match=text.match(/^(.*?)\\s+\\d{4}\\/\\d{2}\\/\\d{2}/);"
                    + "var name=match?match[1].trim():'';if(name)counts[name]=(counts[name]||0)+1;});"
                    + "Object.keys(counts).forEach(function(name){var item=document.createElement('div');"
                    + "item.className='haiagaru-kyodemo-item';item.textContent=name+'  ('+counts[name]+')';"
                    + "names.appendChild(item);});"
                    + "window.haiagaruSelectHissiTab=function(tab){document.body.setAttribute('data-haiagaru-tab',tab);"
                    + "summary.style.display=tab===1?'':'none';names.style.display=tab===2?'':'none';"
                    + "Array.from(list.children).forEach(function(child){if(child===summary||child===names)return;"
                    + "child.style.display=tab===0?'':'none';});list.scrollIntoView({block:'start'});};"
                    + "window.haiagaruSelectHissiTab(0);return true;})()", result -> {
                boolean available = "true".equals(result);
                if (available) {
                    hissiTabs.setVisibility(View.VISIBLE);
                    selectHissiTab(0);
                    return;
                }
                configureClassicHissiTabs(webView);
            });
            return;
        }
        configureClassicHissiTabs(webView);
    }

    private void configureClassicHissiTabs(WebView webView) {
        webView.evaluateJavascript("(function(){"
                + "if(!/(^|\\.)hissi\\.org$/.test(location.hostname))return false;"
                + "var body=document.body,post=Array.from(body.querySelectorAll('dl'))"
                + ".find(function(n){return n.querySelector('dt')&&n.querySelector('dd');});"
                + "if(!post)return false;"
                + "function top(n){while(n&&n.parentElement!==body)n=n.parentElement;return n;}"
                + "var response=top(post),metadata=Array.from(body.children).find(function(n){"
                + "return n.tagName==='TABLE'&&n!==response&&"
                + "(n.textContent||'').indexOf('使用した名前一覧')>=0&&"
                + "(n.textContent||'').indexOf('書き込んだスレッド一覧')>=0;});"
                + "if(!response||!metadata)return false;"
                + "metadata.classList.add('haiagaru-hissi-metadata');"
                + "var heading=Array.from(body.children).find(function(n){return n.tagName==='H4'&&"
                + "(n.textContent||'').indexOf('書き込みレス一覧')>=0;});"
                + "if(heading){for(var n=heading;n;n=n.nextElementSibling){"
                + "if(n===response.nextElementSibling&&n.tagName!=='A')break;"
                + "n.classList.add('haiagaru-hissi-responses');"
                + "if(n===response.nextElementSibling)break;}}"
                + "else response.classList.add('haiagaru-hissi-responses');"
                + "var inner=Array.from(metadata.querySelectorAll('table')).find(function(n){"
                + "return Array.from(n.querySelectorAll('th')).some(function(h){"
                + "return (h.textContent||'').indexOf('使用した名前一覧')>=0;});});"
                + "if(!inner)return false;"
                + "Array.from(inner.rows).forEach(function(row){if(row.cells.length<2)return;"
                + "row.cells[0].classList.add('haiagaru-hissi-name');"
                + "row.cells[1].classList.add('haiagaru-hissi-thread');});"
                + "document.querySelectorAll('dl dd').forEach(function(dd){"
                + "var t=(dd.innerText||dd.textContent||'').trim(),lines=t.split(/\\n/);"
                + "var marks=(t.match(/[|\\\\_＿￣／＼／ヽノ┌┐└┘┬┴┼＜＞<>]/g)||[]).length;"
                + "if(lines.length>=3&&marks>=4&&marks/Math.max(1,t.length)>.12)"
                + "dd.classList.add('haiagaru-hissi-aa');});"
                + "window.haiagaruSelectHissiTab=function(tab){"
                + "body.setAttribute('data-haiagaru-tab',String(tab));"
                + "metadata.style.display=tab===0?'none':'';"
                + "document.querySelectorAll('.haiagaru-hissi-responses').forEach(function(n){"
                + "n.style.display=tab===0?'':'none';});"
                + "document.querySelectorAll('.haiagaru-hissi-name').forEach(function(n){"
                + "n.style.display=tab===1?'none':'';});"
                + "document.querySelectorAll('.haiagaru-hissi-thread').forEach(function(n){"
                + "n.style.display=tab===2?'none':'';});"
                + "if(tab===0)response.scrollIntoView({block:'start'});"
                + "else metadata.scrollIntoView({block:'start'});};"
                + "window.haiagaruSelectHissiTab(0);return true;})()", result -> {
            boolean available = "true".equals(result);
            hissiTabs.setVisibility(available ? View.VISIBLE : View.GONE);
            if (available) selectHissiTab(0);
        });
    }

    private void showDatePicker(WebView webView) {
        Calendar initial = Calendar.getInstance();
        List<String> segments = incomingUri == null ? java.util.Collections.emptyList()
                : incomingUri.getPathSegments();
        if (segments.size() >= 2) {
            String candidate = segments.get(segments.size() - 2);
            if (candidate.matches("[0-9]{8}")) {
                try {
                    initial.set(Integer.parseInt(candidate.substring(0, 4)),
                            Integer.parseInt(candidate.substring(4, 6)) - 1,
                            Integer.parseInt(candidate.substring(6, 8)));
                } catch (RuntimeException ignored) { }
            }
        }
        HaiagaruDates.show(host, initial, (year, month, day) -> {
            String date = String.format(java.util.Locale.ROOT, "%04d%02d%02d",
                    year, month + 1, day);
            String nextUrl = checkerUrlForDate(date);
            if (nextUrl == null) {
                Toast.makeText(this, "選択した日付の検索URLを作成できませんでした", Toast.LENGTH_SHORT).show();
                return;
            }
            webView.loadUrl(nextUrl);
        });
    }

    private String checkerUrlForDate(String date) {
        if (incomingUri == null) return null;
        int mode = Haiagaru.hissiCheckerMode();
        if (currentUsesKyodemo) return toKyodemoUrl(incomingUri, sourceHost, date);
        String current = toHttpsUrl(incomingUri);
        if (current == null) return null;
        return current.replaceFirst("/[0-9]{8}/([^/?#]+\\.html)(?=\\?|#|$)", "/" + date + "/$1");
    }

    private Button toolbarButton(String label) {
        Button button = new Button(this);
        button.setText(label);
        button.setTextSize(11);
        button.setAllCaps(false);
        button.setMinHeight(0);
        button.setMinWidth(0);
        button.setPadding(5, 0, 5, 0);
        button.setMinHeight(Math.round(Haiagaru.hissiViewerToolbarHeightDp() * getResources().getDisplayMetrics().density));
        button.setTextColor(isDarkTheme(Haiagaru.hissiViewerTheme())
                ? Color.rgb(235, 235, 240) : Color.rgb(35, 35, 40));
        button.setStateListAnimator(null);
        GradientDrawable chip = new GradientDrawable();
        chip.setColor(Haiagaru.hissiViewerTheme() == 2
                ? Color.rgb(28, 28, 31)
                : isDarkTheme(Haiagaru.hissiViewerTheme())
                        ? Color.rgb(55, 55, 60) : Color.rgb(242, 242, 247));
        chip.setCornerRadius(18 * getResources().getDisplayMetrics().density);
        button.setBackground(chip);
        return button;
    }

    private LinearLayout.LayoutParams buttonParams() {
        return new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f);
    }

    private void copyToClipboard(String label, String value) {
        if (value == null || value.trim().isEmpty()) {
            Toast.makeText(this, label + "がありません", Toast.LENGTH_SHORT).show();
            return;
        }
        ClipboardManager manager = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
        if (manager != null) manager.setPrimaryClip(ClipData.newPlainText(label, value));
        Toast.makeText(this, label + "をコピーしました", Toast.LENGTH_SHORT).show();
    }

    private void appendToClipboard(String value) {
        ClipboardManager manager = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
        if (manager == null || value == null || value.trim().isEmpty()) return;
        CharSequence previous = manager.hasPrimaryClip() && manager.getPrimaryClip() != null
                && manager.getPrimaryClip().getItemCount() > 0
                ? manager.getPrimaryClip().getItemAt(0).coerceToText(this) : "";
        String prefix = previous == null ? "" : previous.toString().trim();
        manager.setPrimaryClip(ClipData.newPlainText("レス",
                prefix.isEmpty() ? value : prefix + "\n\n" + value));
        Toast.makeText(this, "レスを追加コピーしました", Toast.LENGTH_SHORT).show();
    }

    private void showClipboard() {
        ClipboardManager manager = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
        CharSequence value = manager != null && manager.hasPrimaryClip()
                && manager.getPrimaryClip() != null && manager.getPrimaryClip().getItemCount() > 0
                ? manager.getPrimaryClip().getItemAt(0).coerceToText(this) : null;
        if (value == null || value.length() == 0) {
            Toast.makeText(this, "クリップボードは空です", Toast.LENGTH_SHORT).show();
        } else {
            showSelectablePost(value.toString());
        }
    }

    /** Receives viewer events from the WebView. */
    private final class ViewerBridge {
        @JavascriptInterface
        public void copyPost(String data) {
            runOnUiThread(() -> showPostCopyDialog(data));
        }

        @JavascriptInterface
        public void reportThreadStartCount(int count, int postCount) {
            // Kept as a no-op for pages with an already injected script; the
            // thread-start summary is intentionally no longer part of the UI.
        }
    }

    /** Counts distinct threads whose first response belongs to the displayed ID. */
    private void updateThreadStartCount(WebView webView) {
        // Thread-start counting was removed from the checker viewer.
    }

    private void showPostCopyDialog(String data) {
        // WebView JavaScript callbacks can arrive after Back has finished this
        // Activity. Do not try to attach a dialog to a window whose token has
        // already been removed from WindowManager.
        if (!canShowViewerDialog()) return;
        if (data == null || data.trim().isEmpty()) return;
        long now = System.currentTimeMillis();
        if (now - lastPostDialogAt < 700) return;
        lastPostDialogAt = now;
        final JSONObject post;
        try {
            post = new JSONObject(data);
        } catch (Exception invalid) {
            return;
        }
        String number = post.optString("number", "");
        String name = post.optString("name", "");
        String id = post.optString("id", "");
        String wacchoi = post.optString("wacchoi", "");
        String body = post.optString("body", "");
        String header = post.optString("header", "");
        String url = post.optString("url", "");
        if (body.trim().isEmpty()) return;
        String sourceUrl = KyodemoRouting.sourceThreadUrl(sourceHost, sourceBoard, url);
        if (sourceUrl != null) url = sourceUrl;
        String full = header.isEmpty() ? body : header + "\n" + body;
        List<String> labels = new ArrayList<>();
        List<String> values = new ArrayList<>();
        if (!number.isEmpty()) addCopyChoice(labels, values, "レス番号", ">>" + number);
        if (!name.isEmpty()) addCopyChoice(labels, values, "名前", name);
        if (!id.isEmpty()) addCopyChoice(labels, values, "ID", id);
        final boolean hasWacchoiSearch = !wacchoi.isEmpty() && kyodemoTarget != null;
        addCopyChoice(labels, values, "本文", body);
        if (!url.isEmpty()) addCopyChoice(labels, values, "レスのURL", url);
        addCopyChoice(labels, values, "ヘッダー＋本文", full);
        final int copyCount = values.size();
        if (hasWacchoiSearch) labels.add("ﾜｯﾁｮｲを検索");
        if (!url.isEmpty()) labels.add("リンクをChMateで開く");
        labels.add("追加コピー");
        labels.add("クリップボード確認");
        labels.add("選択");
        final String selectableText = full;
        final String postUrl = url;
        HaiagaruDialog postCopyDialog = new HaiagaruDialog.Builder(this)
                .setTitle("レスをコピー")
                .setItems(labels.toArray(new String[0]), (dialog, which) -> {
                    if (which < copyCount) {
                        copyToClipboard(labels.get(which), values.get(which));
                    } else {
                        int action = which - copyCount;
                        if (hasWacchoiSearch) {
                            if (action == 0) {
                                String searchUrl = KyodemoRouting.wacchoiSearchUrl(
                                        sourceHost, sourceBoard, wacchoi);
                                if (searchUrl != null) {
                                    currentUsesKyodemo = true;
                                    updateWacchoiQuery(wacchoi);
                                    viewerWebView.loadUrl(searchUrl);
                                } else {
                                    Toast.makeText(this, "ﾜｯﾁｮｲと板を確認してください",
                                            Toast.LENGTH_SHORT).show();
                                }
                                return;
                            }
                            action--;
                        }
                        if (!postUrl.isEmpty()) {
                            if (action == 0) {
                                openThreadInChMate(postUrl);
                                return;
                            }
                            action--;
                        }
                        if (action == 0) appendToClipboard(selectableText);
                        else if (action == 1) showClipboard();
                        else showSelectablePost(selectableText);
                    }
                })
                .setNegativeButton("キャンセル", null)
                .create();
        // The lifecycle may change between parsing the WebView payload and
        // building the dialog. Check again on the UI thread and keep a final
        // BadTokenException guard for OEM window-manager races.
        if (!canShowViewerDialog()) return;
        try {
            postCopyDialog.show();
        } catch (android.view.WindowManager.BadTokenException invalidWindowToken) {
            Log.w(LOG_TAG, "Skip post-copy dialog after viewer window was detached",
                    invalidWindowToken);
        }
    }

    private boolean canShowViewerDialog() {
        if (isFinishing() || isDestroyed()) return false;
        android.view.Window window = getWindow();
        return window != null && window.getDecorView().isAttachedToWindow();
    }

    private static void addCopyChoice(List<String> labels, List<String> values,
            String label, String value) {
        labels.add(label);
        values.add(value);
    }

    private void showSelectablePost(String text) {
        TextView preview = new TextView(this);
        preview.setText(text);
        preview.setTextSize(16);
        preview.setTextIsSelectable(true);
        int padding = (int) (20 * getResources().getDisplayMetrics().density);
        preview.setPadding(padding, padding / 2, padding, padding / 2);
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(this)
                .setTitle("文字を選択")
                .setView(preview)
                .setNegativeButton("閉じる", null)
                .setPositiveButton("全文コピー", (d, which) ->
                        copyToClipboard("レス", text))
                .create();
        android.content.res.TypedArray colors = dialog.getContext().obtainStyledAttributes(
                new int[] {android.R.attr.textColorPrimary});
        try {
            preview.setTextColor(colors.getColor(0, Color.WHITE));
        } finally {
            colors.recycle();
        }
        dialog.show();
    }

    private static String decodeJavascriptString(String value) {
        if (value == null || "null".equals(value)) return "";
        try {
            Object parsed = new JSONTokener(value).nextValue();
            return parsed instanceof String ? (String) parsed : value;
        } catch (Throwable ignored) {
            return value;
        }
    }

    private static WebResourceResponse emptyResource() {
        return new WebResourceResponse(
                "text/plain",
                "UTF-8",
                new ByteArrayInputStream(new byte[0])
        );
    }

    private static boolean isAdvertisingResource(String requestUrl) {
        if (requestUrl == null || requestUrl.isEmpty()) return false;
        String value = requestUrl.toLowerCase(java.util.Locale.ROOT);
        String host;
        try {
            host = Uri.parse(requestUrl).getHost();
        } catch (Throwable ignored) {
            host = null;
        }
        if (host == null) host = "";
        return value.contains("doubleclick.net")
                || host.equals("adm.shinobi.jp") || host.endsWith(".adm.shinobi.jp")
                || value.contains("admax.jp")
                || value.contains("googlesyndication.com")
                || value.contains("googletagmanager.com")
                || value.contains("google-analytics.com")
                || value.contains("pagead2.googlesyndication.com")
                || value.contains("googleadservices.com")
                || value.contains("adservice.google.com")
                || value.contains("adsystem.com")
                || value.contains("adnxs.com")
                || value.contains("criteo.com")
                || value.contains("openx.net")
                || value.contains("medibaad.com")
                || value.contains("mediba.jp")
                || (value.contains("unity3d.com") && value.contains("mediation"))
                || value.contains("unityads.unity3d.com")
                || value.contains("/ad/") || value.contains("/ads/")
                || value.contains("/advert") || value.contains("/banner")
                || host.equals("openx.net") || host.endsWith(".openx.net")
                || host.equals("mediba.jp") || host.endsWith(".mediba.jp");
    }

    private static boolean isKyodemoAnalysisUrl(String url) {
        if (url == null) return false;
        Uri uri = Uri.parse(url);
        return "www.kyodemo.net".equalsIgnoreCase(uri.getHost())
                && uri.getPath() != null && uri.getPath().startsWith("/sdemo/b/");
    }

    private boolean isDarkTheme(int theme) {
        if (theme == 3) return false;
        if (theme == 1 || theme == 2) return true;
        return (getResources().getConfiguration().uiMode
                & android.content.res.Configuration.UI_MODE_NIGHT_MASK)
                == android.content.res.Configuration.UI_MODE_NIGHT_YES;
    }

    private void applyViewerTheme(LinearLayout layout, WebView webView, int theme) {
        boolean dark = isDarkTheme(theme);
        int background = theme == 2 ? Color.BLACK : dark ? Color.rgb(30, 30, 32) : Color.WHITE;
        int foreground = dark ? Color.rgb(235, 235, 240) : Color.rgb(30, 30, 30);
        if (layout != null) layout.setBackgroundColor(background);
        if (webView != null) {
            configureWebViewColorScheme(webView.getSettings());
            webView.setBackgroundColor(background);
            String bg = theme == 2 ? "#000000" : dark ? "#1e1e20" : "#ffffff";
            String fg = dark ? "#ebebf0" : "#1e1e1e";
            String link = dark ? "#8ab4f8" : "#1558a6";
            int responseSpacing = Haiagaru.hissiViewerResponseSpacingDp();
            String script = "javascript:(function(){var hissi=location.hostname==='hissi.org'||location.hostname==='www.hissi.org';"
                    + "var kyodemo=location.hostname==='www.kyodemo.net'||location.hostname==='kyodemo.net';"
                    + "var eddi=location.hostname==='eddiarchive3rd.boy.jp'||location.hostname.endsWith('.eddiarchive3rd.boy.jp');"
                    + "if(hissi){document.body.setAttribute('data-haiagaru-hissi','');"
                    + "if(!document.querySelector('meta[name=viewport]')){var m=document.createElement('meta');"
                    + "m.name='viewport';m.content='width=device-width,initial-scale=1';document.head.appendChild(m);}}"
                    + "if(kyodemo){document.body.setAttribute('data-haiagaru-kyodemo','');}"
                    + "if(eddi){document.body.setAttribute('data-haiagaru-eddi','');"
                    + "if(!document.querySelector('meta[name=viewport]')){var m2=document.createElement('meta');"
                    + "m2.name='viewport';m2.content='width=device-width,initial-scale=1';document.head.appendChild(m2);}}"
                    + "var s=document.getElementById('haiagaru-viewer-style');"
                    + "if(!s){s=document.createElement('style');s.id='haiagaru-viewer-style';document.head.appendChild(s);}"
                    + "s.textContent='@font-face{font-family:HaiagaruMona;src:url(\""
                    + MONA_FONT_PATH + "\") format(\"truetype\");font-display:swap;}"
                    + "html,body{background:" + bg + " !important;color:" + fg + " !important;"
                    + "font-family:sans-serif;font-size:16px;line-height:1.55;padding:0 6px;}"
                    // Hissi's older pages put the response text directly in table
                    // cells and <font> nodes rather than under #rlist.  Applying
                    // the foreground to every descendant prevents an inline
                    // light-theme color from winning when the viewer is dark.
                    + "body[data-haiagaru-hissi] *,#rlist,#rlist *,.post,.post *,dl,dt,dd{color:" + fg + " !important;}"
                    + "body[data-haiagaru-hissi] a,a{color:" + link + " !important;}"
                    + "body[data-haiagaru-kyodemo] #blist .box.content{border:0;background:transparent;box-shadow:none;padding:0;}"
                    + "body[data-haiagaru-kyodemo] #blist .post{background:"
                    + (dark ? "#1c1c1f" : "#f7f7fa") + " !important;color:" + fg
                    + " !important;border:1px solid " + (dark ? "#36363b" : "#e1e1e6") + " !important;}"
                    + "body[data-haiagaru-kyodemo] #blist .r-head{color:" + fg + " !important;}"
                    + "body[data-haiagaru-kyodemo] #blist .haiagaru-kyodemo-item{padding:12px;margin:8px 0;"
                    + "background:" + (dark ? "#1c1c1f" : "#f7f7fa") + ";border-radius:10px;}"
                    + "header,.navbar,.footer,.right-column,.d-panel{display:none !important;}"
                    + "body[data-haiagaru-analysis] #b>.left-column{display:none !important;}"
                    + "body[data-haiagaru-analysis] #b>.right-column{display:block !important;"
                    + "box-sizing:border-box;width:100% !important;max-width:100% !important;"
                    + "flex:none !important;padding:12px !important;}"
                    + "body[data-haiagaru-analysis] #b>.right-column>div:not(#toggle-w-tawindow):not(#wt),"
                    + "body[data-haiagaru-analysis] #b>.right-column>#pw,"
                    + "body[data-haiagaru-analysis] #b>.right-column>#hb,"
                    + "body[data-haiagaru-analysis] #b>.right-column>#hk{display:none !important;}"
                    + "body[data-haiagaru-analysis] #b>.right-column>#wt{display:block !important;"
                    + "color:" + fg + " !important;margin:8px 0 12px;}"
                    + "body[data-haiagaru-analysis] #toggle-w-tawindow{display:block !important;"
                    + "max-width:100%;overflow-wrap:anywhere;}"
                    + "body[data-haiagaru-analysis] #toggle-w-tawindow *{color:" + fg
                    + " !important;max-width:100%;box-sizing:border-box;}"
                    + "body[data-haiagaru-analysis] #toggle-w-tawindow .box{background:"
                    + (dark ? "#1c1c1f" : "#f7f7fa") + " !important;color:" + fg
                    + " !important;border:1px solid " + (dark ? "#36363b" : "#e1e1e6")
                    + " !important;border-radius:12px;}"
                    + "#haiagaru-analysis-summary{display:none;white-space:pre-wrap;overflow-wrap:anywhere;}"
                    + "body[data-haiagaru-analysis=inline] #b>.right-column{display:none !important;}"
                    + "body[data-haiagaru-analysis=inline] #b>.left-column{display:block !important;width:100%;}"
                    + "body[data-haiagaru-analysis=inline] #blist>*{display:none !important;}"
                    + "body[data-haiagaru-analysis=inline] #blist>.d-myChart,"
                    + "body[data-haiagaru-analysis=inline] #haiagaru-analysis-summary{display:block !important;"
                    + "background:" + bg + " !important;color:" + fg + " !important;max-width:100%;}"
                    // Kyodemo puts empty-result and request errors in this header.
                    + "#b>.left-column>header{display:block !important;}"
                    + "#b>.left-column>header>.breadcrumb{display:none !important;}"
                    + "#b>.left-column>header .message{display:block !important;background:" + bg
                    + " !important;color:" + fg + " !important;}"
                    + "#b>.left-column>header .message *{color:" + fg + " !important;}"
                    + "#rlist{padding:8px 4px !important;}"
                    + "#rlist .post,.post{background:" + (dark ? "#1c1c1f" : "#f7f7fa") + ";"
                    + "border:1px solid " + (dark ? "#36363b" : "#e1e1e6") + ";border-radius:12px;"
                    + "padding:10px 12px;margin:0 0 9px 0;box-shadow:0 1px 3px rgba(0,0,0,.12);}"
                    + "#rlist .r-head,.r-head{align-items:center;gap:4px;font-size:12px;}"
                    + "#rlist .r-head strong,.r-head strong{color:" + (dark ? "#9ecbff" : "#125bb5") + ";font-size:15px;}"
                    + ".clname{font-weight:600;} .cldate{opacity:.75;margin-left:4px;}"
                    + ".clid{font-weight:700;} #rlist .clmess,.clmess{font-size:16px;line-height:1.65;margin-top:6px;word-break:break-word;}"
                    + "[class*=id],[id*=id]{font-weight:700;letter-spacing:.03em;}"
                    + "button,input,select{border-radius:6px;}"
                    + "body[data-haiagaru-hissi]{box-sizing:border-box;width:100%;max-width:100vw;overflow-x:hidden;}"
                    + "body[data-haiagaru-hissi] table{max-width:100%;}"
                    + "body[data-haiagaru-hissi] td,body[data-haiagaru-hissi] th,"
                    + "body[data-haiagaru-hissi] dl,body[data-haiagaru-hissi] dt,"
                    + "body[data-haiagaru-hissi] dd{overflow-wrap:anywhere;word-break:normal;white-space:normal;}"
                    + "body[data-haiagaru-hissi] dd{margin-left:12px;}"
                    + "body[data-haiagaru-hissi] dl{margin:0;padding:" + responseSpacing + "px 5px " + (responseSpacing + 2) + "px;"
                    + "border-bottom:1px solid " + (dark ? "#38383d" : "#d8d8dc") + ";}"
                    + "body[data-haiagaru-hissi] dl dt{font-size:11px;line-height:1.4;"
                    + "color:" + (dark ? "#b4b4ba" : "#66666c") + " !important;}"
                    + "body[data-haiagaru-hissi] dl dt>a:first-child{display:block;"
                    + "font-size:14px;line-height:1.35;margin-bottom:3px;color:"
                    + (dark ? "#adff2f" : "#39731a") + " !important;}"
                    + "body[data-haiagaru-hissi] dl dd{margin:" + responseSpacing + "px 5px 0;"
                    + "font-size:14px;line-height:1.5;overflow-wrap:anywhere;}"
                    + "body[data-haiagaru-hissi] dl dd.haiagaru-hissi-aa{"
                    + "font-family:HaiagaruMona,monospace;font-size:14px;"
                    + "line-height:1.15;white-space:pre-wrap;overflow-wrap:normal;}"
                    + "body[data-haiagaru-hissi][data-haiagaru-tab=\"0\"]"
                    + " .haiagaru-hissi-metadata{display:none !important;}"
                    + "body[data-haiagaru-hissi][data-haiagaru-tab=\"1\"]"
                    + " .haiagaru-hissi-responses,"
                    + "body[data-haiagaru-hissi][data-haiagaru-tab=\"2\"]"
                    + " .haiagaru-hissi-responses{display:none !important;}"
                    + "body[data-haiagaru-hissi][data-haiagaru-tab=\"1\"]"
                    + " .haiagaru-hissi-name,"
                    + "body[data-haiagaru-hissi][data-haiagaru-tab=\"2\"]"
                    + " .haiagaru-hissi-thread{display:none !important;}"
                    + "body[data-haiagaru-hissi] .haiagaru-hissi-metadata,"
                    + "body[data-haiagaru-hissi] .haiagaru-hissi-metadata table{width:100% !important;}"
                    + "body[data-haiagaru-hissi] > table:last-of-type,"
                    + "body[data-haiagaru-hissi] > table:last-of-type table{width:100% !important;table-layout:fixed;}"
                    + "@media(max-width:600px){body[data-haiagaru-hissi] > table:first-of-type,"
                    + "body[data-haiagaru-hissi] > table:first-of-type table{width:100% !important;table-layout:fixed;}"
                    + "body[data-haiagaru-hissi] > table:first-of-type td{width:auto !important;"
                    + "padding:0 !important;font-size:9px !important;letter-spacing:-.04em;}"
                    + "body[data-haiagaru-hissi] > table:first-of-type font{font-size:11px !important;}"
                    + "body[data-haiagaru-hissi] > table:first-of-type td[rowspan]{width:48px !important;}"
                    + "body[data-haiagaru-hissi] > table:first-of-type td[bgcolor]{max-width:38px;}"
                    + "}"
                    + "body[data-haiagaru-eddi]{box-sizing:border-box;width:100%;max-width:760px;"
                    + "margin:0 auto;overflow-x:hidden;}"
                    + "body[data-haiagaru-eddi] #myForm{box-sizing:border-box;width:100% !important;"
                    + "max-width:720px;margin:10px auto 14px !important;padding:12px !important;"
                    + "border:1px solid " + (dark ? "#41454c" : "#d8d8de") + " !important;"
                    + "border-radius:12px;background:" + (dark ? "#24272b" : "#f7f7fa") + " !important;}"
                    + "body[data-haiagaru-eddi] #myForm input[type=text],body[data-haiagaru-eddi] #myForm input[type=number],"
                    + "body[data-haiagaru-eddi] #myForm input[type=date],body[data-haiagaru-eddi] #myForm select{"
                    + "box-sizing:border-box;min-height:38px;padding:7px 9px;margin:3px 0;max-width:100%;"
                    + "background:" + (dark ? "#1c1c1f" : "#ffffff") + ";color:" + fg + ";"
                    + "border:1px solid " + (dark ? "#525761" : "#c9c9d0") + ";border-radius:8px;}"
                    + "body[data-haiagaru-eddi] #searchButton{min-height:40px;padding:7px 18px;"
                    + "border:0;border-radius:9px;background:" + (dark ? "#477bb5" : "#2d6cdf") + ";"
                    + "color:#fff;font-weight:700;}"
                    + "body[data-haiagaru-eddi] a[href*=\"bbs.eddibb.cc\"]{display:block;"
                    + "padding:10px 12px;margin:7px 0;border:1px solid " + (dark ? "#363b43" : "#e1e1e6") + ";"
                    + "border-radius:10px;background:" + (dark ? "#1c1c1f" : "#f7f7fa") + ";"
                    + "text-decoration:none;line-height:1.5;}"
                    + "body[data-haiagaru-eddi] a[href*=\"bbs.eddibb.cc\"]:active{background:"
                    + (dark ? "#30343b" : "#e9eefb") + ";}"
                    // The source archive uses fixed light-theme colors on some
                    // pages. Override descendant text as well as the body so
                    // dark mode remains readable when its inline styles win.
                    + "body[data-haiagaru-eddi] *{color:" + fg + " !important;"
                    + "border-color:" + (dark ? "#41454c" : "#d8d8de") + " !important;}"
                    + "body[data-haiagaru-eddi] a,body[data-haiagaru-eddi] a *{color:" + link + " !important;}"
                    // The archive's .thread wrapper keeps its fixed #f5f5f5
                    // background in dark mode. The global foreground override
                    // then makes its .date nearly white on white. Theme the
                    // whole result card, not just the title link.
                    + "body[data-haiagaru-eddi] #threadContainer .thread{background:"
                    + (dark ? "#24272b" : "#f7f7fa") + " !important;"
                    + "border:1px solid " + (dark ? "#41454c" : "#d8d8de")
                    + " !important;border-radius:10px;padding:10px 12px;margin:8px 0;}"
                    + "body[data-haiagaru-eddi] #threadContainer .thread .title{display:block;"
                    + "background:transparent !important;border:0 !important;"
                    + "padding:0 !important;margin:0 !important;max-width:100%;}"
                    + "body[data-haiagaru-eddi] #threadContainer .thread .date{color:"
                    + (dark ? "#b9bcc6" : "#5f636c") + " !important;"
                    + "margin:5px 0 0;font-size:12px;}"
                    + "body[data-haiagaru-eddi] input,body[data-haiagaru-eddi] select,"
                    + "body[data-haiagaru-eddi] textarea{background:" + (dark ? "#1c1c1f" : "#ffffff")
                    + " !important;color:" + fg + " !important;}"
                    + "body[data-haiagaru-eddi] input::placeholder,body[data-haiagaru-eddi] textarea::placeholder{color:"
                    + (dark ? "#a6a6ad" : "#707078") + " !important;}"
                    + "body[data-haiagaru-eddi] pre{white-space:pre-wrap;overflow-wrap:anywhere;}"
                    + (dark ? "body[data-haiagaru-hissi] table,body[data-haiagaru-hissi] tr,"
                    + "body[data-haiagaru-hissi] td,body[data-haiagaru-hissi] th{background:#24272b !important;"
                    + "color:#ebebf0 !important;border-color:#41454c !important;}"
                    + "body[data-haiagaru-hissi] tr:nth-child(even) td{background:#1b1d21 !important;}"
                    + "body[data-haiagaru-hissi] font[color]{color:#ebebf0 !important;}" : "")
                    + CheckerResultStyle.css(dark, responseSpacing)
                    + "#ad,.ad,.ads,.advertisement,.advertising,.banner,.sponsor,.sponsored,"
                    + ".google-auto-placed,.adsbygoogle,[data-ad],[data-ad-slot],[aria-label*=広告],"
                    + "iframe[src*=doubleclick],iframe[src*=googlesyndication],iframe[src*=adservice],"
                    + "iframe[src*=adsystem],iframe[src*=openx],iframe[src*=mediba],"
                    + "script[src*=\"adm.shinobi.jp\"],"
                    + "script[src*=googletagmanager],script[src*=google-analytics],ins.adsbygoogle{display:none !important;}';"
                    + "function clean(){if(!window.haiagaruLongPress){window.haiagaruLongPress=true;var timer=null,last=null,copiedAt=0;"
                    + "function postNode(e){return e.closest ? e.closest('#rlist .post,.post,.res,article,dl') : null;}"
                    + "function postData(e){var n=postNode(e);if(!n)return '';var b=n.querySelector('.clmess,.res-body,.response,.message-body,dd');"
                    + "var h=n.querySelector('.r-head,dt')||n;"
                    + "var header=(h.innerText||h.textContent||'').trim();"
                    + "var body=b?(b.innerText||b.textContent||'').trim():(n.innerText||n.textContent||'').trim();"
                    + "if(!b&&body.indexOf(header)===0)body=body.substring(header.length).trim();"
                    + "if(!body)return '';var number='',name='',id='',url='',wacchoi='';"
                    + "var wm=header.match(/(?:[\\uFF66-\\uFF9F\\u30A0-\\u30FF]+[a-z]*|ﾜｯﾁｮｲ[a-z]*)\\s+[a-z0-9]{4}[-‐‑–—][a-z0-9+\\/]{4,}(?![a-z0-9+\\/])/i);"
                    + "if(wm)wacchoi=wm[0];"
                    + "var em=header.match(/\\bL([0-9]+)\\s+([a-z0-9]{4}[-‐‑–—][a-z0-9]{4,})/i);"
                    + "if(em)wacchoi='L'+em[1]+' '+em[2];"
                    + "if(n.tagName==='DL'){var m=header.match(/(?:^|\\n)\\s*(\\d+)\\s*[：:]/);number=m?m[1]:'';"
                    + "var first=h.querySelector('b');name=first?(first.innerText||first.textContent||'').trim():'';"
                    + "m=header.match(/ID:([^\\s]+)/i);id=m?m[1]:'';"
                    + "var link=h.querySelector('a[href*=\"read.cgi\"]');url=link?link.href:'';}"
                    + "else{var q=n.querySelector('.r-head strong');number=q?(q.innerText||q.textContent||'').trim():'';"
                    + "q=n.querySelector('.clname');name=q?(q.innerText||q.textContent||'').trim():'';"
                    + "q=n.querySelector('.clid');id=q?(q.innerText||q.textContent||'').trim():'';"
                    + "if(!name){var m=header.match(/:\\s*(.*?)\\s+\\d{4}\\/\\d{2}\\/\\d{2}/);name=m?m[1]:'';}"
                    + "if(!id){var m=header.match(/ID:([^\\s]+)/i);id=m?m[1]:'';}"
                    + "q=n.querySelector('.r-head strong a[href]');if(q)url=q.href;"
                    + "var p=location.pathname.split('/');if(p[1]==='sdemo'&&p[2]==='r'&&p[4]&&number)"
                    + "url=location.origin+'/'+p.slice(1,5).join('/')+'/'+number;}"
                    + "return JSON.stringify({number:number,name:name,id:id,wacchoi:wacchoi,body:body,url:url,header:header});}"
                    + "window.haiagaruPostDataAt=function(x,y){"
                    + "var e=document.elementFromPoint(x,y);return e?postData(e):'';};"
                    + "document.addEventListener('click',function(e){"
                    + "if(!(document.body.hasAttribute('data-haiagaru-hissi')||"
                    + "document.body.hasAttribute('data-haiagaru-kyodemo'))||"
                    + "(e.target.closest&&e.target.closest('a,button,input,select')))return;"
                    + "var selection=window.getSelection();if(selection&&String(selection).length)return;"
                    + "var t=postData(e.target);if(t&&window.HaiagaruBridge&&Date.now()-copiedAt>700){"
                    + "copiedAt=Date.now();window.HaiagaruBridge.copyPost(t);}},false);"
                    + "document.addEventListener('touchstart',function(e){last=e.target;window.haiagaruLongPressData=postData(last);timer=setTimeout(function(){"
                    + "var t=postData(last);if(t&&window.HaiagaruBridge&&Date.now()-copiedAt>1000){copiedAt=Date.now();window.HaiagaruBridge.copyPost(t);}},650);},{passive:true});"
                    + "document.addEventListener('touchend',function(){if(timer)clearTimeout(timer);timer=null;});"
                    + "document.addEventListener('touchmove',function(){if(timer)clearTimeout(timer);timer=null;},{passive:true});"
                    + "document.addEventListener('contextmenu',function(e){var t=postData(e.target);if(t){e.preventDefault();"
                    + "if(window.HaiagaruBridge&&Date.now()-copiedAt>1000){copiedAt=Date.now();window.HaiagaruBridge.copyPost(t);}}},false);"
                    + "}var q='#ad,.ad,.ads,.advertisement,.advertising,.banner,.sponsor,.sponsored,"
                    + ".google-auto-placed,.adsbygoogle,[data-ad],[data-ad-slot],[aria-label*=広告],"
                    + "iframe[src*=doubleclick],iframe[src*=googlesyndication],iframe[src*=adservice],"
                    + "iframe[src*=adsystem],iframe[src*=openx],iframe[src*=mediba],"
                    + "script[src*=\"adm.shinobi.jp\"],"
                    + "script[src*=googletagmanager],script[src*=google-analytics],ins.adsbygoogle';"
                    + "document.querySelectorAll('script[src*=\"adm.shinobi.jp\"]').forEach(function(e){"
                    + "var a=e.previousElementSibling,b=e.nextElementSibling;if(a&&a.tagName==='BR')a.remove();"
                    + "if(b&&b.tagName==='BR')b.remove();e.remove();});"
                    + "document.querySelectorAll(q).forEach(function(e){e.remove();});"
                    + "document.querySelectorAll('iframe,ins').forEach(function(e){e.remove();});"
                    + "document.querySelectorAll('[id],[class]').forEach(function(e){var n=((e.id||'')+' '+(e.className||'')).toLowerCase();"
                    + "if(/(^|[-_ .])(ad|ads|advert|banner|sponsor)([-_ .]|$)/.test(n))e.remove();});"
                    + "document.querySelectorAll('body *').forEach(function(e){var t=(e.textContent||'').trim();"
                    + "if(t==='広告' || t==='スポンサー広告')e.remove();});"
                    + "}clean();"
                    + "if(!window.haiagaruAdObserver&&window.MutationObserver){window.haiagaruAdObserver=new MutationObserver(clean);"
                    + "window.haiagaruAdObserver.observe(document.documentElement,{childList:true,subtree:true});}})()";
            String javascript = script.startsWith("javascript:")
                    ? script.substring("javascript:".length()) : script;
            webView.evaluateJavascript(javascript, null);
        }
    }

    private static void configureWebViewColorScheme(WebSettings settings) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            // The viewer owns its palette through CSS. Android WebView's
            // automatic darkening otherwise transforms the page after CSS,
            // making the explicit Light option appear dark on dark-mode devices.
            settings.setForceDark(WebSettings.FORCE_DARK_OFF);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            settings.setAlgorithmicDarkeningAllowed(false);
        }
    }

    private void showArchiveWebError(String code, String detail, String url) {
        String key = code + "|" + url;
        if (key.equals(lastArchiveErrorKey)) return;
        lastArchiveErrorKey = key;
        Haiagaru.reportEddiArchiveError(this, code,
                "Web viewer failed: " + detail + " (" + url + ")", null);
        Toast.makeText(this, "エッヂ過去ログを開けませんでした（" + code
                + "）。診断ログを保存しました。", Toast.LENGTH_LONG).show();
    }

    @Override void pause() {
        if (archiveSearchUi != null) archiveSearchUi.saveState(null);
        if(viewerWebView!=null)viewerWebView.onPause();
    }
    @Override void resume(){
        if(viewerWebView!=null)viewerWebView.onResume();
        if(viewerAdjustButton!=null)viewerAdjustButton.setVisibility(Haiagaru.hissiViewerShowAdjust()?View.VISIBLE:View.GONE);
    }

    @Override void save(Bundle state) {
        if (archiveSearchUi != null) archiveSearchUi.saveState(state);
        if(viewerWebView!=null){state.putString("haiagaru.checker.url",viewerWebView.getUrl());state.putInt("haiagaru.checker.scroll",viewerWebView.getScrollY());}
    }

    @Override void close() {
        if (archiveSearchUi != null) archiveSearchUi.dispose();
        super.close();
        if(viewerWebView!=null){viewerWebView.stopLoading();viewerWebView.removeJavascriptInterface("HaiagaruBridge");
            if(viewerWebView.getParent() instanceof ViewGroup)((ViewGroup)viewerWebView.getParent()).removeView(viewerWebView);
            viewerWebView.destroy();viewerWebView=null;}
    }

    private boolean openThreadInChMate(String url) {
        if (openEddiThreadInChMate(url)) return true;
        String original = KyodemoRouting.sourceThreadUrl(sourceHost, sourceBoard, url);
        if (original != null) url = original;
        if (!HissiLinkRouting.isThreadUrl(url)) return false;
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.setClass(this, OpenUrlActivity.class);
            startActivity(intent);
            return true;
        } catch (RuntimeException error) {
            Log.e(LOG_TAG, "Could not open Hissi thread link in ChMate: " + url, error);
            return false;
        }
    }

    /**
     * The Edge archive links point at bbs.eddibb.cc.  HissiLinkRouting already
     * knows that host as a board source, so keeping this method small avoids
     * duplicating its URL grammar while making the intent explicit in this
     * viewer.
     */
    private boolean openEddiThreadInChMate(String url) {
        if (!eddiArchiveMode || !HissiLinkRouting.isThreadUrl(url)) return false;
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.setClass(this, OpenUrlActivity.class);
            // Optional child screen keeps search in the back stack. Otherwise
            // leave native tablet forwarding untouched (TabletHome is singleTask).
            if (Haiagaru.archiveThreadStandalone(this)) {
                intent.putExtra("haiagaru.archive.return", true);
            }
            startActivity(intent);
            return true;
        } catch (RuntimeException error) {
            Log.e(LOG_TAG, "Could not open Edge archive thread in ChMate: " + url, error);
            return false;
        }
    }

    private static String toHttpsUrl(Uri uri) {
        if (uri == null || (!HISSI_SCHEME.equalsIgnoreCase(uri.getScheme())
                && !HISSI_SECURE_SCHEME.equalsIgnoreCase(uri.getScheme())
                && !"http".equalsIgnoreCase(uri.getScheme())
                && !"https".equalsIgnoreCase(uri.getScheme()))
                || !"hissi.org".equalsIgnoreCase(uri.getHost())) return null;
        String path = uri.getEncodedPath();
        if (path == null || !path.startsWith("/read.php/")) return null;
        String scheme = (HISSI_SECURE_SCHEME.equalsIgnoreCase(uri.getScheme())
                || "https".equalsIgnoreCase(uri.getScheme())) ? "https" : "http";
        StringBuilder result = new StringBuilder(scheme).append("://hissi.org").append(path);
        if (uri.getEncodedQuery() != null && uri.getQueryParameter("haiagaru_host") == null) {
            result.append('?').append(uri.getEncodedQuery());
        }
        return result.toString();
    }

    private static String toEddiArchiveUrl(Uri uri) {
        if (!isEddiArchiveUri(uri)) return null;
        String path = uri.getEncodedPath();
        if (path == null || path.isEmpty()) path = "/";
        StringBuilder result = new StringBuilder("https://")
                .append(EDDI_ARCHIVE_HOST).append(path);
        if (uri.getEncodedQuery() != null && !uri.getEncodedQuery().isEmpty()) {
            result.append('?').append(uri.getEncodedQuery());
        }
        if (uri.getEncodedFragment() != null && !uri.getEncodedFragment().isEmpty()) {
            result.append('#').append(uri.getEncodedFragment());
        }
        return result.toString();
    }

    private static boolean isEddiArchiveUri(Uri uri) {
        if (uri == null || (!EDDI_SCHEME.equalsIgnoreCase(uri.getScheme())
                && !"http".equalsIgnoreCase(uri.getScheme())
                && !"https".equalsIgnoreCase(uri.getScheme()))) return false;
        String host = uri.getHost();
        return host != null && (EDDI_ARCHIVE_HOST.equalsIgnoreCase(host)
                || host.toLowerCase(java.util.Locale.ROOT).endsWith("." + EDDI_ARCHIVE_HOST));
    }

    private static String toKyodemoUrl(Uri uri, String sourceHost) {
        return toKyodemoUrl(uri, sourceHost, null);
    }

    private static boolean isKyodemoBoardSearch(Uri uri) {
        if (uri == null || !("www.kyodemo.net".equalsIgnoreCase(uri.getHost())
                || "kyodemo.net".equalsIgnoreCase(uri.getHost()))) return false;
        String path = uri.getPath();
        return path != null && path.matches("/sdemo/b/[A-Za-z0-9_-]+/")
                && uri.getQueryParameter("k") != null;
    }

    private static String toKyodemoUrl(Uri uri, String sourceHost, String dateOverride) {
        if (uri != null && isKyodemoAnalysisUrl(uri.toString())) return uri.toString();
        if (uri == null || !"hissi.org".equalsIgnoreCase(uri.getHost())) return null;
        List<String> path = uri.getPathSegments();
        if (path.size() < 4 || !"read.php".equals(path.get(0))) return null;
        String id = selectedCheckerId(uri);
        if (id == null || id.trim().isEmpty()) id = decodeHissiId(path.get(path.size() - 1));
        if (id == null || id.trim().isEmpty()) return null;
        return KyodemoRouting.idSearchUrl(sourceHost, boardFromMenuPath(uri), id,
                uri.getQueryParameter("haiagaru_key"), dateOverride == null
                        ? path.get(path.size() - 2) : dateOverride);
    }

    private static String decodeHissiId(String pathSegment) {
        if (pathSegment == null || !pathSegment.endsWith(".html")) return null;
        String encoded = pathSegment.substring(0, pathSegment.length() - 5);
        try {
            return new String(Base64.decode(encoded, Base64.URL_SAFE | Base64.NO_WRAP),
                    StandardCharsets.UTF_8);
        } catch (IllegalArgumentException error) {
            return null;
        }
    }

    /** ChMate expands {$id} into a raw query value; Uri.getQueryParameter treats '+' as a space. */
    private static String selectedCheckerId(Uri uri) {
        if (uri == null || uri.getEncodedQuery() == null) return null;
        for (String part : uri.getEncodedQuery().split("&")) {
            int separator = part.indexOf('=');
            if (separator < 0 || !"haiagaru_id".equals(Uri.decode(part.substring(0, separator)))) {
                continue;
            }
            return Uri.decode(part.substring(separator + 1).replace("+", "%2B"));
        }
        return null;
    }

    private static String boardFromMenuPath(Uri uri) {
        List<String> path = uri.getPathSegments();
        if (path.size() < 4 || !"read.php".equals(path.get(0))) return null;
        StringBuilder board = new StringBuilder();
        for (int index = 1; index < path.size() - 2; index++) {
            if (board.length() > 0) board.append('/');
            board.append(path.get(index));
        }
        return board.toString();
    }

    private void updateWacchoiQuery(String query) {
        initialWacchoiQuery = query;
        getIntent().putExtra("haiagaru.wacchoi.query", query);
        if (wacchoiConditionView != null) wacchoiConditionView.setText("検索条件：" + query
                + "  ·  " + sourceBoard);
    }

    private boolean openHissiWacchoiSearch() {
        if (sourceHost == null || !isHissiHost(sourceHost) || sourceBoard == null
                || !sourceBoard.matches("[A-Za-z0-9_-]+")) return false;
        java.util.regex.Matcher slip = WacchoiSearch.SLIP.matcher(WacchoiSearch.normalizeSlipText(
                initialWacchoiQuery == null ? "" : initialWacchoiQuery));
        if (!slip.find()) return false;
        startActivity(HissiScanTemplate.apply(this,new Intent(this, HissiWacchoiSearchActivity.class)
                .putExtra("haiagaru.wacchoi.hissi", true)
                .putExtra("haiagaru.wacchoi.query", slip.group())
                .putExtra("haiagaru.wacchoi.original", initialWacchoiQuery)
                .putExtra("haiagaru.wacchoi.host", sourceHost)
                .putExtra("haiagaru.wacchoi.form", (Intent) getIntent().getParcelableExtra("haiagaru.wacchoi.form"))
                .putExtra("haiagaru.wacchoi.board", sourceBoard)));
        getSharedPreferences(CHECKER_CHOICE_PREFS, Context.MODE_PRIVATE)
                .edit().putBoolean(choiceKey(), false).apply();
        return true;
    }

    private String choiceKey() {
        if(getIntent().getBooleanExtra("haiagaru.wacchoi.search",false))return FullWacchoiProvider.choiceKey(sourceHost,sourceBoard);
        return (sourceHost == null ? "" : sourceHost.toLowerCase(java.util.Locale.ROOT))
                + "/" + (sourceBoard == null ? "" : sourceBoard);
    }

    private WebResourceResponse monaFont(Uri uri) {
        if (uri == null || !MONA_FONT_PATH.equals(uri.getPath())) return null;
        String host = uri.getHost();
        if (host == null || !(host.equalsIgnoreCase("hissi.org")
                || host.equalsIgnoreCase("www.hissi.org"))) return null;
        try {
            return new WebResourceResponse("font/ttf", null,
                    getAssets().open("haiagaru/MonaLite.ttf"));
        } catch (IOException error) {
            Log.w(LOG_TAG, "MonaLite font asset is unavailable", error);
            return null;
        }
    }

    private static boolean isHissiHost(String sourceHost) {
        String host = sourceHost.toLowerCase(java.util.Locale.ROOT);
        return host.equals("2ch.net") || host.endsWith(".2ch.net")
                || host.equals("5ch.net") || host.endsWith(".5ch.net")
                || host.equals("5ch.io") || host.endsWith(".5ch.io")
                || host.equals("bbspink.com") || host.endsWith(".bbspink.com");
    }

    private static int parseCheckerMode(String value) {
        try {
            int mode = Integer.parseInt(value);
            return mode < 0 || mode > 3 ? 0 : mode;
        } catch (RuntimeException ignored) {
            return 0;
        }
    }
}
