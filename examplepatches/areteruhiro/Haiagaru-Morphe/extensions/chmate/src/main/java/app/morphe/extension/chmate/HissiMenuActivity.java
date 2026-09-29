package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
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
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.nio.charset.StandardCharsets;
import java.io.ByteArrayInputStream;
import java.util.Calendar;
import java.util.ArrayList;
import java.util.List;

/** Displays the Hissi menu destination inside ChMate's task. */
public final class HissiMenuActivity extends Activity {
    private static final String LOG_TAG = "HaiagaruHissi";
    private static final String HISSI_SCHEME = "haiagaru-hissi";
    private static final String HISSI_SECURE_SCHEME = "haiagaru-hissis";
    /** Internal scheme used when ChMate hands the Edge archive to this viewer. */
    private static final String EDDI_SCHEME = "haiagaru-eddi";
    private static final String EDDI_ARCHIVE_HOST = "eddiarchive3rd.boy.jp";
    private static final String CHECKER_CHOICE_PREFS = "haiagaru_checker_choice";
    private String sourceHost;
    private String sourceBoard;
    private Uri incomingUri;
    private boolean eddiArchiveMode;
    private String hissiTarget;
    private String kyodemoTarget;
    private boolean currentUsesKyodemo;
    private LinearLayout rootLayout;
    private TextView threadStartCountView;
    private long lastPostDialogAt;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        Uri incoming = getIntent() == null ? null : getIntent().getData();
        incomingUri = incoming;
        eddiArchiveMode = isEddiArchiveUri(incoming);
        sourceHost = incoming == null ? null : incoming.getQueryParameter("haiagaru_host");
        sourceBoard = incoming == null ? null : boardFromMenuPath(incoming);
        // Read the current setting again here. ChMate may cache an expanded
        // menu template, so the mode embedded in its URL can be stale.
        int checkerMode = Haiagaru.hissiCheckerMode();
        String target;
        if (eddiArchiveMode) {
            // The archive is a normal HTML search site. Keep its query intact
            // so a saved search can be opened directly in ChMate as well.
            currentUsesKyodemo = false;
            hissiTarget = null;
            kyodemoTarget = null;
            target = toEddiArchiveUrl(incoming);
        } else {
            boolean automaticKyodemo = sourceHost != null && !isHissiHost(sourceHost);
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
        if (target == null) {
            TextView error = new TextView(this);
            error.setText(currentUsesKyodemo
                    ? "この板のID検索先を特定できませんでした"
                    : "必死チェッカーのURLを開けませんでした");
            error.setTextColor(Color.WHITE);
            error.setPadding(32, 32, 32, 32);
            setContentView(error);
            return;
        }

        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        rootLayout = layout;
        boolean fullscreen = Haiagaru.hissiViewerFullscreen();
        if (fullscreen) {
            getWindow().setFlags(
                    android.view.WindowManager.LayoutParams.FLAG_FULLSCREEN,
                    android.view.WindowManager.LayoutParams.FLAG_FULLSCREEN
            );
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
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
        title.setText(eddiArchiveMode
                ? "‹   エッヂ過去ログ  ·  ChMateビュー"
                : currentUsesKyodemo
                        ? "‹   ID検索  ·  Kyodemoビュー"
                        : "‹   必死チェッカー  ·  ChMateビュー");
        title.setTextColor(darkViewer ? Color.WHITE : Color.rgb(30, 30, 30));
        title.setTextSize(18);
        title.setGravity(Gravity.CENTER_VERTICAL);
        title.setPadding(24, 12, 24, 12);
        title.setOnClickListener(view -> finish());
        layout.addView(title, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 56 * getResources().getDisplayMetrics().densityDpi / 160));
        TextView hint = new TextView(this);
        hint.setText(eddiArchiveMode
                ? "エッヂの過去ログを検索できます。スレをタップするとChMateで開きます。"
                : "IDごとの投稿を見やすく整理。リンクはChMateでそのまま開けます。");
        hint.setTextColor(darkViewer ? Color.rgb(190, 190, 198) : Color.rgb(90, 90, 100));
        hint.setTextSize(12);
        hint.setPadding(24, 0, 24, 8);
        layout.addView(hint, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView countView = new TextView(this);
        threadStartCountView = countView;
        countView.setTextSize(12);
        countView.setTextColor(darkViewer ? Color.rgb(190, 190, 198) : Color.rgb(90, 90, 100));
        countView.setPadding(24, 0, 24, 8);
        countView.setVisibility(View.GONE);
        layout.addView(countView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        WebView webView = new WebView(this);
        webView.addJavascriptInterface(new ViewerBridge(), "HaiagaruBridge");
        webView.setOnLongClickListener(view -> {
            // Some WebView builds consume touch events before the page-level
            // listener runs. The page records the last response under the
            // finger, so use it as a native fallback.
            webView.evaluateJavascript(
                    "(function(){return window.haiagaruLongPressData||'';})()",
                    value -> {
                        String data = decodeJavascriptString(value);
                        if (data != null && !data.trim().isEmpty()) showPostCopyDialog(data);
                    });
            return true;
        });
        WebSettings settings = webView.getSettings();
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
                if (request != null && request.getUrl() != null
                        && isAdvertisingResource(request.getUrl().toString())) {
                    return emptyResource();
                }
                return super.shouldInterceptRequest(view, request);
            }

            @Override
            public WebResourceResponse shouldInterceptRequest(WebView view, String url) {
                try {
                    if (isAdvertisingResource(url)) return emptyResource();
                } catch (Throwable ignored) { }
                return super.shouldInterceptRequest(view, url);
            }

            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                if (request.isForMainFrame()) {
                    title.setText("‹   読み込みエラー · " + error.getDescription());
                }
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                applyViewerTheme(rootLayout, view, Haiagaru.hissiViewerTheme());
                updateThreadStartCount(view);
            }

            @Override
            public void onPageStarted(WebView view, String url, android.graphics.Bitmap icon) {
                threadStartCountView.setVisibility(View.GONE);
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
                WebView popup = new WebView(HissiMenuActivity.this);
                popup.setVisibility(View.INVISIBLE);
                layout.addView(popup, new LinearLayout.LayoutParams(1, 1));
                popup.setWebViewClient(new WebViewClient() {
                    private boolean dispatched;

                    private void dispatch(String url) {
                        if (dispatched) return;
                        dispatched = true;
                        if (!openThreadInChMate(url)) source.loadUrl(url);
                        popup.post(() -> {
                            layout.removeView(popup);
                            popup.destroy();
                        });
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
                popup.postDelayed(() -> {
                    if (popup.getParent() != null) {
                        layout.removeView(popup);
                        popup.destroy();
                    }
                }, 10000);
                return true;
            }
        });
        LinearLayout toolbar = createViewerToolbar(webView);
        layout.addView(toolbar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                48 * getResources().getDisplayMetrics().densityDpi / 160
        ));
        if (!eddiArchiveMode && checkerMode == 3) {
            TextView alternate = new TextView(this);
            alternate.setText(currentUsesKyodemo ? "hissi.orgで開く" : "Kyodemoで開く");
            alternate.setTextColor(Color.BLUE);
            alternate.setGravity(Gravity.CENTER);
            alternate.setPadding(20, 12, 20, 12);
            alternate.setOnClickListener(view -> {
                boolean nextUsesKyodemo = !currentUsesKyodemo;
                String nextTarget = nextUsesKyodemo ? kyodemoTarget : hissiTarget;
                if (nextTarget == null) {
                    Toast.makeText(this, "この板では選択した検索先を利用できません", Toast.LENGTH_SHORT).show();
                    return;
                }
                currentUsesKyodemo = nextUsesKyodemo;
                threadStartCountView.setVisibility(View.GONE);
                getSharedPreferences(CHECKER_CHOICE_PREFS, Context.MODE_PRIVATE)
                        .edit().putBoolean(choiceKey(), currentUsesKyodemo).apply();
                alternate.setText(currentUsesKyodemo ? "hissi.orgで開く" : "Kyodemoで開く");
                title.setText(currentUsesKyodemo
                        ? "‹   ID検索  ·  Kyodemoビュー"
                        : "‹   必死チェッカー  ·  ChMateビュー");
                hint.setText(currentUsesKyodemo
                        ? "Kyodemoで板内の投稿を確認できます。結果のリンクは元の板として開きます。"
                        : "hissi.orgで投稿の流れを確認できます。結果のリンクはChMateで開きます。");
                webView.loadUrl(nextTarget);
            });
            layout.addView(alternate, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 52 * getResources().getDisplayMetrics().densityDpi / 160));
        }
        webView.loadUrl(target);
        layout.addView(webView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(layout);
        if (!fullscreen && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            layout.requestApplyInsets();
        }
    }

    private LinearLayout createViewerToolbar(final WebView webView) {
        LinearLayout toolbar = new LinearLayout(this);
        toolbar.setOrientation(LinearLayout.HORIZONTAL);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setPadding(8, 2, 8, 2);
        toolbar.setBackgroundColor(Haiagaru.hissiViewerTheme() == 2 ? Color.BLACK : Color.TRANSPARENT);

        Button copyUrl = toolbarButton("URL");
        copyUrl.setOnClickListener(view -> copyToClipboard("URL", webView.getUrl()));
        toolbar.addView(copyUrl, buttonParams());

        Button copyAll = toolbarButton("全レス");
        copyAll.setOnClickListener(view -> webView.evaluateJavascript(
                "(function(){var a=document.querySelectorAll('#rlist .clmess,.post .clmess,article .res,article .response,.res-body,dl dd');"
                        + "if(!a.length)a=document.querySelectorAll('#rlist .post,.post,article,dl');"
                        + "var out=Array.prototype.map.call(a,function(e){return (e.innerText||e.textContent||'').trim();})"
                        + ".filter(function(e){return e.length>0;});return out.join('\\n\\n');})()",
                value -> copyToClipboard("全レス本文", decodeJavascriptString(value))
        ));
        toolbar.addView(copyAll, buttonParams());

        Button copyBody = toolbarButton("本文");
        copyBody.setOnClickListener(view -> webView.evaluateJavascript(
                "(function(){var e=document.querySelector('#rlist,main,.content');"
                        + "return e ? (e.innerText||e.textContent||'') : (document.body ? document.body.innerText : '');})()",
                value -> copyToClipboard("一覧本文", decodeJavascriptString(value))
        ));
        toolbar.addView(copyBody, buttonParams());

        Button date = toolbarButton("日付");
        date.setOnClickListener(view -> showDatePicker(webView));
        toolbar.addView(date, buttonParams());

        Button zoom = toolbarButton("文字");
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
        theme.setOnClickListener(view -> {
            int next = (Haiagaru.hissiViewerTheme() + 1) % 3;
            Haiagaru.setHissiViewerTheme(next);
            applyViewerTheme(rootLayout, webView, next);
            Toast.makeText(this, next == 0 ? "端末設定" : next == 1 ? "ダーク" : "AMOLEDブラック",
                    Toast.LENGTH_SHORT).show();
        });
        toolbar.addView(theme, buttonParams());
        return toolbar;
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
        new DatePickerDialog(this, (picker, year, month, day) -> {
            String date = String.format(java.util.Locale.ROOT, "%04d%02d%02d",
                    year, month + 1, day);
            String nextUrl = checkerUrlForDate(date);
            if (nextUrl == null) {
                Toast.makeText(this, "選択した日付の検索URLを作成できませんでした", Toast.LENGTH_SHORT).show();
                return;
            }
            webView.loadUrl(nextUrl);
        }, initial.get(Calendar.YEAR), initial.get(Calendar.MONTH), initial.get(Calendar.DAY_OF_MONTH)).show();
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

    /** Receives a response's copy fields from the WebView long-press handler. */
    private final class ViewerBridge {
        @JavascriptInterface
        public void copyPost(String data) {
            runOnUiThread(() -> showPostCopyDialog(data));
        }

        @JavascriptInterface
        public void reportThreadStartCount(int count, int postCount) {
            runOnUiThread(() -> {
                if (threadStartCountView == null) return;
                if (postCount <= 0) {
                    threadStartCountView.setVisibility(View.GONE);
                    return;
                }
                threadStartCountView.setText("スレ立て (" + Math.max(0, count)
                        + ") · 表示中の日付の検索結果から集計");
                threadStartCountView.setVisibility(View.VISIBLE);
            });
        }
    }

    /** Counts distinct threads whose first response belongs to the displayed ID. */
    private void updateThreadStartCount(WebView webView) {
        String script = "(function(){var h=location.hostname,p=location.pathname;"
                + "var isHissi=/(^|\\.)hissi\\.org$/.test(h)&&p.indexOf('/read.php/')===0;"
                + "var isKyodemo=h==='www.kyodemo.net'&&p.indexOf('/sdemo/b/')===0"
                + "&&new URLSearchParams(location.search).has('hi');if(!isHissi&&!isKyodemo)return;"
                + "if(isKyodemo){var wanted=new URLSearchParams(location.search).get('hi')||'';"
                + "var links=[],seenLinks={};document.querySelectorAll('#blist article a[href*=\"/sdemo/r/\"]').forEach(function(a){"
                + "var u=new URL(a.href,location.href).href;if(!seenLinks[u]){seenLinks[u]=true;links.push(u);}});"
                + "Promise.all(links.slice(0,50).map(function(u){return fetch(u,{credentials:'same-origin'}).then(function(r){return r.text();})"
                + ".then(function(t){var d=new DOMParser().parseFromString(t,'text/html'),first=d.querySelector('#rlist .post .clid');"
                + "return first&&(first.textContent||'').trim()===wanted?1:0;}).catch(function(){return 0;});}))"
                + ".then(function(values){if(window.HaiagaruBridge)window.HaiagaruBridge.reportThreadStartCount(values.reduce(function(a,b){return a+b;},0),links.length);});return;}"
                + "function count(){var seen={},posts=0;"
                + "document.querySelectorAll('#rlist .post,.post,dl').forEach(function(n){"
                + "if(n.tagName==='DL'&&n.closest('.post'))return;"
                + "var head=n.querySelector('.r-head,dt');if(!head)return;"
                + "var numberNode=n.querySelector('.r-head strong');"
                + "var text=numberNode?(numberNode.textContent||''):(head.innerText||head.textContent||'');"
                + "var match=numberNode?text.match(/^\\s*#?(\\d+)/):text.match(/(?:^|\\n)\\s*(\\d+)\\s*[:：]/);"
                + "if(!match)return;posts++;if(match[1]!=='1')return;"
                + "var link=head.querySelector('a[href*=\"read.cgi\"],a[href*=\"/sdemo/r/\"]');"
                + "if(!link)link=n.querySelector('a[href*=\"read.cgi\"],a[href*=\"/sdemo/r/\"]');"
                + "if(!link)return;var path=link.pathname||'';"
                + "var key=path.match(/\\/(?:test|bbs)\\/read\\.cgi\\/[^/]+\\/(\\d{9,})(?:\\/|$)/)"
                + "||path.match(/\\/sdemo\\/r\\/[^/]+\\/(\\d{9,})(?:\\/|$)/);"
                + "if(key)seen[key[1]]=true;});"
                + "if(window.HaiagaruBridge)window.HaiagaruBridge.reportThreadStartCount(Object.keys(seen).length,posts);"
                + "}var timer;function schedule(){clearTimeout(timer);timer=setTimeout(count,150);}"
                + "if(window.haiagaruThreadCountObserver)window.haiagaruThreadCountObserver.disconnect();"
                + "window.haiagaruThreadCountObserver=new MutationObserver(schedule);"
                + "window.haiagaruThreadCountObserver.observe(document.body,{childList:true,subtree:true});"
                + "schedule();})()";
        webView.evaluateJavascript(script, null);
    }

    private void showPostCopyDialog(String data) {
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
        addCopyChoice(labels, values, "本文", body);
        if (!url.isEmpty()) addCopyChoice(labels, values, "レスのURL", url);
        addCopyChoice(labels, values, "ヘッダー＋本文", full);
        labels.add("選択");
        final String selectableText = full;
        new AlertDialog.Builder(this)
                .setTitle("レスをコピー")
                .setItems(labels.toArray(new String[0]), (dialog, which) -> {
                    if (which == values.size()) {
                        showSelectablePost(selectableText);
                    } else {
                        copyToClipboard(labels.get(which), values.get(which));
                    }
                })
                .setNegativeButton("キャンセル", null)
                .show();
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
        AlertDialog dialog = new AlertDialog.Builder(this)
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

    private boolean isDarkTheme(int theme) {
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
            webView.setBackgroundColor(background);
            String bg = theme == 2 ? "#000000" : dark ? "#1e1e20" : "#ffffff";
            String fg = dark ? "#ebebf0" : "#1e1e1e";
            String link = dark ? "#8ab4f8" : "#1558a6";
            String script = "javascript:(function(){var hissi=location.hostname==='hissi.org'||location.hostname==='www.hissi.org';"
                    + "var eddi=location.hostname==='eddiarchive3rd.boy.jp'||location.hostname.endsWith('.eddiarchive3rd.boy.jp');"
                    + "if(hissi){document.body.setAttribute('data-haiagaru-hissi','');"
                    + "if(!document.querySelector('meta[name=viewport]')){var m=document.createElement('meta');"
                    + "m.name='viewport';m.content='width=device-width,initial-scale=1';document.head.appendChild(m);}}"
                    + "if(eddi){document.body.setAttribute('data-haiagaru-eddi','');"
                    + "if(!document.querySelector('meta[name=viewport]')){var m2=document.createElement('meta');"
                    + "m2.name='viewport';m2.content='width=device-width,initial-scale=1';document.head.appendChild(m2);}}"
                    + "var s=document.getElementById('haiagaru-viewer-style');"
                    + "if(!s){s=document.createElement('style');s.id='haiagaru-viewer-style';document.head.appendChild(s);}"
                    + "s.textContent='html,body{background:" + bg + " !important;color:" + fg + " !important;"
                    + "font-family:sans-serif;font-size:16px;line-height:1.55;padding:0 6px;}"
                    + "#rlist,#rlist *,.post,.post *,dl,dt,dd{color:" + fg + " !important;}"
                    + "a{color:" + link + " !important;}"
                    + "header,.navbar,.footer,.right-column,.d-panel{display:none !important;}"
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
                    + "body[data-haiagaru-eddi] a[href*='bbs.eddibb.cc']{display:block;"
                    + "padding:10px 12px;margin:7px 0;border:1px solid " + (dark ? "#363b43" : "#e1e1e6") + ";"
                    + "border-radius:10px;background:" + (dark ? "#1c1c1f" : "#f7f7fa") + ";"
                    + "text-decoration:none;line-height:1.5;}"
                    + "body[data-haiagaru-eddi] a[href*='bbs.eddibb.cc']:active{background:"
                    + (dark ? "#30343b" : "#e9eefb") + ";}"
                    + (dark ? "body[data-haiagaru-hissi] table,body[data-haiagaru-hissi] tr,"
                    + "body[data-haiagaru-hissi] td,body[data-haiagaru-hissi] th{background:#24272b !important;"
                    + "color:#ebebf0 !important;border-color:#41454c !important;}"
                    + "body[data-haiagaru-hissi] tr:nth-child(even) td{background:#1b1d21 !important;}"
                    + "body[data-haiagaru-hissi] font[color]{color:#ebebf0 !important;}" : "")
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
                    + "if(!body)return '';var number='',name='',id='',url='';"
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
                    + "return JSON.stringify({number:number,name:name,id:id,body:body,url:url,header:header});}"
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

    private static String toKyodemoUrl(Uri uri, String sourceHost, String dateOverride) {
        if (uri == null || !"hissi.org".equalsIgnoreCase(uri.getHost())) return null;
        List<String> path = uri.getPathSegments();
        if (path.size() < 4 || !"read.php".equals(path.get(0))) return null;
        String encodedId = path.get(path.size() - 1);
        if (!encodedId.endsWith(".html")) return null;
        encodedId = encodedId.substring(0, encodedId.length() - 5);
        String id;
        try {
            id = new String(Base64.decode(encodedId, Base64.URL_SAFE | Base64.NO_WRAP),
                    StandardCharsets.UTF_8);
        } catch (IllegalArgumentException error) {
            return null;
        }
        return KyodemoRouting.idSearchUrl(sourceHost, boardFromMenuPath(uri), id,
                uri.getQueryParameter("haiagaru_key"), dateOverride == null
                        ? path.get(path.size() - 2) : dateOverride);
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

    private String choiceKey() {
        return (sourceHost == null ? "" : sourceHost.toLowerCase(java.util.Locale.ROOT))
                + "/" + (sourceBoard == null ? "" : sourceBoard);
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
