package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.webkit.*;
import android.widget.*;
import org.json.JSONArray;
import java.util.LinkedHashSet;

/** API-key-free, user-operated uploads; WebView keeps each site's cookies and library. */
public final class MediaUploadWebActivity extends HaiagaruComposeActivity {
    private static final int PICK = 6131;
    private WebView web;
    private ValueCallback<Uri[]> picker;
    private TextView status;
    private String provider;
    private GigaFileUploadForm gigaUpload;
    public static void open(Activity activity) {
        open(activity, "imgpile");
    }
    public static void open(Activity activity, String provider) {
        activity.startActivity(new Intent(activity, MediaUploadWebActivity.class)
                .putExtra("provider", MediaUploadWebPolicy.provider(provider)));
    }
    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        provider = MediaUploadWebPolicy.provider(getIntent().getStringExtra("provider"));
        final boolean sendvid = "sendvid".equals(provider);
        final boolean giga = "gigafile".equals(provider);
        final String label = giga ? "ギガファイル便" : sendvid ? "Sendvid" : "imgpile";
        final String requested = getIntent().getStringExtra("sharePage");
        final boolean receiving = giga && MediaUploadWebPolicy.gigaShare(requested);
        setTitle(label);
        LinearLayout root = new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(android.view.WindowInsets.Type.systemBars()
                        | android.view.WindowInsets.Type.displayCutout());
                v.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            } else v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });
        if (giga && !receiving) {
            ScrollView scroll = new ScrollView(this);
            LinearLayout form = new LinearLayout(this);
            form.setOrientation(LinearLayout.VERTICAL);
            int padding = Math.round(16 * getResources().getDisplayMetrics().density);
            form.setPadding(padding,padding,padding,padding);
            scroll.addView(form);
            root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
            gigaUpload = new GigaFileUploadForm(this,form,saved,this::showGigaHistory);
            HaiagaruUi.showModel(this,label,root);
            return;
        }
        if (receiving && getIntent().getBooleanExtra("directGiga",false)) {
            if (saved == null) {
                setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_LOCKED);
                new GigaFileDownload(this,root,requested,() -> openGigaBrowser(requested));
            } else {
                Button reopen = new Button(this);
                reopen.setText("アプリ内ブラウザで開く");
                reopen.setOnClickListener(view -> openGigaBrowser(requested));
                root.addView(reopen);
            }
            HaiagaruUi.showModel(this,label,root);
            return;
        }
        TextView help = new TextView(this);
        if (giga) help.setText("ダウンロードキーが必要な場合はページ内で入力してください。");
        else help.setText(label + " 手動Web送信・アクセス確認\n"
                + "標準添付からの自動送信はアップロード先設定で選択してください。このWeb画面で手動送信した場合はURLをコピーして貼り付けます。削除権限を含むCookieや管理リンクは共有しないでください。");
        root.addView(help);
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(android.view.Gravity.CENTER_VERTICAL);
        root.addView(bar);
        Button close = new Button(this);close.setText("閉じる");bar.addView(close);close.setOnClickListener(v -> finish());
        if (!receiving) {
            if (giga) addGigaButtonSeparator(bar);
            Button home = new Button(this);home.setText(giga ? "アップロード" : "送信・履歴");bar.addView(home);
            home.setOnClickListener(v -> web.loadUrl(MediaUploadWebPolicy.home(provider)));
        }
        if (giga) addGigaButtonSeparator(bar);
        Button copy = new Button(this);copy.setText("URLをコピー");bar.addView(copy);
        copy.setOnClickListener(v -> copyMedia());
        if (giga) {
            addGigaButtonSeparator(bar);
            Button history = new Button(this);history.setText("履歴");bar.addView(history);
            history.setOnClickListener(v -> showGigaHistory());
        }
        status = new TextView(this);root.addView(status);
        web = new WebView(this);WebSettings settings = web.getSettings();
        settings.setJavaScriptEnabled(true);settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setJavaScriptCanOpenWindowsAutomatically(false);
        CookieManager.getInstance().setAcceptCookie(true);
        CookieManager.getInstance().setAcceptThirdPartyCookies(web, false);
        web.setWebViewClient(new WebViewClient() {
            private boolean block(String url) {
                if (MediaUploadWebPolicy.page(provider, url)) return false;
                status.setText("HTTPSのページを開いてください。");return true;
            }
            @Override public boolean shouldOverrideUrlLoading(WebView v, String url) { return block(url); }
            @Override public boolean shouldOverrideUrlLoading(WebView v, WebResourceRequest r) {
                return r.isForMainFrame() && block(r.getUrl().toString());
            }
            @Override public void onPageStarted(WebView v, String url, android.graphics.Bitmap icon) {
                if (block(url)) { v.stopLoading();return; }
                status.setText(giga ? "gigafile.nu" : sendvid ? "sendvid.com" : "imgpile.com");
            }
            @Override public void onPageFinished(WebView v, String url) {
                if (giga && MediaUploadWebPolicy.gigaShare(url)) {
                    v.evaluateJavascript("(() => { const style=document.createElement('style');"
                            + "style.textContent='#bnr_float,#smarttag-adx-inst,#wrap_banner_billboard,.adsbygoogle,"
                            + "[id^=div-gpt-ad],[id^=gigafile-slot-],[class^=gf-slot-],.banner_type_sky,.banner_type_468,.banner_type_336,a[rel=sponsored]{display:none!important}';"
                            + "document.head.appendChild(style); })()", null);
                }
                CookieManager.getInstance().flush();
            }
            @Override public WebResourceResponse shouldInterceptRequest(WebView v, WebResourceRequest request) {
                if (giga && !request.isForMainFrame()) {
                    Uri resource = request.getUrl();
                    boolean essentialStatic = "https".equals(resource.getScheme()) && resource.getUserInfo() == null
                            && resource.getPort() == -1 && "src.gigafile.nu".equals(resource.getHost())
                            && resource.getPath() != null && !resource.getPath().contains("nuAdsDisplay");
                    if (!essentialStatic && !MediaUploadWebPolicy.page("gigafile", resource.toString()))
                        return new WebResourceResponse("text/plain", "UTF-8", new java.io.ByteArrayInputStream(new byte[0]));
                }
                return null;
            }
            @Override public void onReceivedSslError(WebView v, SslErrorHandler h, android.net.http.SslError e) {
                h.cancel();status.setText("証明書エラーのため接続を停止しました。");
            }
        });
        web.setWebChromeClient(new WebChromeClient() {
            @Override public boolean onShowFileChooser(WebView v, ValueCallback<Uri[]> callback, FileChooserParams params) {
                if (giga || !MediaUploadWebPolicy.page(provider, v.getUrl())) return false;
                cancelPicker();picker = callback;
                // Only URIs explicitly selected by the user; no storage-wide access or file:// URIs.
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                        .setType(sendvid ? "video/*" : "*/*")
                        .putExtra(Intent.EXTRA_ALLOW_MULTIPLE, params.getMode() == FileChooserParams.MODE_OPEN_MULTIPLE);
                intent.putExtra(Intent.EXTRA_MIME_TYPES,
                        sendvid ? new String[]{"video/*"} : new String[]{"image/*", "video/*"});
                try { startActivityForResult(intent, PICK); }
                catch (RuntimeException e) { cancelPicker();status.setText("ファイル選択画面を開けませんでした。"); }
                return true;
            }
        });
        if (giga) web.setDownloadListener((url, ua, disposition, mime, length) -> downloadGiga(url, ua, disposition, mime));
        root.addView(web, new LinearLayout.LayoutParams(-1, 0, 1));HaiagaruUi.showModel(this, giga ? label : "画像・動画の投稿", root);
        if (saved == null || web.restoreState(saved) == null) web.loadUrl(receiving ? requested : MediaUploadWebPolicy.home(provider));
    }

    private void addGigaButtonSeparator(LinearLayout bar) {
        View divider = new View(this);
        divider.setBackgroundColor(0x66808080);
        int density = Math.round(getResources().getDisplayMetrics().density);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(Math.max(density,1),Math.round(24*density));
        params.setMargins(Math.round(4*density),0,Math.round(4*density),0);
        bar.addView(divider,params);
    }

    private void openGigaBrowser(String url) {
        startActivity(new Intent(this,MediaUploadWebActivity.class)
                .putExtra("provider","gigafile").putExtra("sharePage",url));
        finish();
    }

    private void downloadGiga(String url, String ua, String disposition, String mime) {
        if (!MediaUploadWebPolicy.page("gigafile", url) || web == null
                || !MediaUploadWebPolicy.page("gigafile", web.getUrl())) return;
        Uri target = Uri.parse(url);
        if (!target.getHost().equalsIgnoreCase(Uri.parse(web.getUrl()).getHost())) return;
        String pageUrl = web.getUrl();
        String fileToken = target.getQueryParameter("file");
        new Thread(() -> {
            String pageName = "";
            if (fileToken != null) {
                try { pageName = GigaFileDownload.fetchFilename(pageUrl,fileToken); }
                catch (Exception ignored) { }
            }
            String name = GigaFileDownload.downloadName(disposition,mime,pageName,url);
            String resolvedName = name;
            runOnUiThread(() -> enqueueGigaDownload(target,ua,mime,resolvedName));
        },"Haiagaru-GigaFile-name").start();
    }

    private void enqueueGigaDownload(Uri target,String ua,String mime,String name) {
        if (isFinishing() || isDestroyed()) return;
        try {
            DownloadManager.Request request = new DownloadManager.Request(target);
            if (ua != null) request.addRequestHeader("User-Agent", ua);
            request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(android.os.Environment.DIRECTORY_DOWNLOADS, name)
                    .setTitle(name);
            ((DownloadManager)getSystemService(DOWNLOAD_SERVICE)).enqueue(request);
            status.setText("ダウンロードを開始しました。");
        } catch (RuntimeException failure) {
            status.setText("ダウンロードを開始できませんでした。");
        }
    }
    void showGigaCompleted(String url, String password) {
        new HaiagaruDialog.Builder(this).setTitle("アップロード完了")
                .setMessage(url+(password.isEmpty()?"":"\nダウンロードパスワード："+password))
                .setPositiveButton("共有情報をコピー",(dialog,which) -> {
                    String share=url+(password.isEmpty()?"":"\nダウンロードパスワード："+password);
                    ((ClipboardManager)getSystemService(CLIPBOARD_SERVICE))
                            .setPrimaryClip(ClipData.newPlainText("ギガファイル便",share));
                }).setNegativeButton("閉じる",null).show();
    }

    void showGigaHistory() {
        JSONArray history = GigaFileUploadHistory.load(this);
        HaiagaruDialog.Builder dialog = new HaiagaruDialog.Builder(this).setTitle("ギガファイル便のアップロード履歴");
        if (history.length() == 0) {
            dialog.setMessage("保存済みのアップロードはありません。");
        } else {
            String[] labels = new String[history.length()];
            java.text.DateFormat format = java.text.DateFormat.getDateTimeInstance();
            for (int i = 0; i < labels.length; i++) {
                org.json.JSONObject item = history.optJSONObject(labels.length - i - 1);
                String name = item.optString("name");
                labels[i] = (name.isEmpty() ? item.optString("url") : name) + "\n"
                        + format.format(new java.util.Date(item.optLong("saved")));
            }
            dialog.setItems(labels, (d, index) -> showGigaUpload(history.optJSONObject(labels.length - index - 1)));
        }
        dialog.setNegativeButton("閉じる", null).show();
    }

    private void showGigaUpload(org.json.JSONObject item) {
        String url = item.optString("url"), key = item.optString("key");
        if (!MediaUploadWebPolicy.gigaShare(url)) return;
        String name = item.optString("name");
        new HaiagaruDialog.Builder(this).setTitle(name.isEmpty() ? "アップロードの詳細" : name)
                .setMessage(url + "\n\n削除キー  " + key)
                .setItems(new String[]{"共有URLをコピー", "削除キーをコピー", "ダウンロードページを開く"}, (d, index) -> {
                    if (index == 2) {
                        if (web != null) web.loadUrl(url);
                        else startActivity(new Intent(this,MediaUploadWebActivity.class)
                                .putExtra("provider","gigafile").putExtra("sharePage",url));
                        return;
                    }
                    ClipData clip = ClipData.newPlainText(index == 0 ? "ギガファイル便" : "削除キー",
                            index == 0 ? url : key);
                    if (index == 1) {
                        android.os.PersistableBundle extras = new android.os.PersistableBundle();
                        extras.putBoolean("android.content.extra.IS_SENSITIVE", true);
                        clip.getDescription().setExtras(extras);
                    }
                    ((ClipboardManager)getSystemService(CLIPBOARD_SERVICE)).setPrimaryClip(clip);
                }).setNegativeButton("閉じる", null).show();
    }

    private void cancelPicker() {
        ValueCallback<Uri[]> value = picker;picker = null;if (value != null) value.onReceiveValue(null);
    }
    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request == GigaFileUploadForm.PICK && gigaUpload != null) {
            gigaUpload.result(result,data);
            return;
        }
        if (request != PICK || picker == null) return;
        ValueCallback<Uri[]> value = picker;picker = null;
        LinkedHashSet<Uri> uris = new LinkedHashSet<>();
        if (result == RESULT_OK && data != null && web != null && MediaUploadWebPolicy.page(provider, web.getUrl())) {
            if (data.getData() != null) uris.add(data.getData());
            if (data.getClipData() != null) for (int i = 0; i < data.getClipData().getItemCount() && i < 50; i++)
                uris.add(data.getClipData().getItemAt(i).getUri());
        }
        uris.removeIf(uri -> uri == null || !"content".equals(uri.getScheme()));
        value.onReceiveValue(uris.isEmpty() ? null : uris.toArray(new Uri[0]));
    }
    private void copyMedia() {
        if (web == null || !MediaUploadWebPolicy.page(provider, web.getUrl())) return;
        final String page = web.getUrl();
        // Read-only DOM inspection on an explicit tap; no JS interface, cookies or network interception.
        web.evaluateJavascript("JSON.stringify(Array.from(document.querySelectorAll('a[href],img[src],video[src],source[src],input[readonly],textarea[readonly]')).slice(0,1000).map(e=>e.href||e.src||e.value))", raw -> {
            if (isFinishing() || web == null || !page.equals(web.getUrl()) || !MediaUploadWebPolicy.page(provider, web.getUrl())) return;
            LinkedHashSet<String> urls = new LinkedHashSet<>();
            if (MediaUploadWebPolicy.share(provider, page)) urls.add(page);
            try {
                Object decoded = new org.json.JSONTokener(raw).nextValue();
                JSONArray values = new JSONArray((String) decoded);
                for (int i = 0; i < values.length(); i++) {
                    String url = values.optString(i);if (MediaUploadWebPolicy.share(provider, url)) urls.add(url);
                }
            } catch (Exception ignored) { }
            if (urls.isEmpty()) { status.setText("URLが見つかりません。送信結果の対象画像／動画ページを開いてください。");return; }
            String[] links = urls.toArray(new String[0]);
            new HaiagaruDialog.Builder(this).setTitle("gigafile".equals(provider) ? "コピーする共有URLを選択" : "コピーする画像／動画URLを選択")
                    .setItems(links, (d, index) -> {
                        ((ClipboardManager)getSystemService(CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText(provider, links[index]));
                        Toast.makeText(this, "URLをコピーしました。書き込み本文へ貼り付けてください。", Toast.LENGTH_LONG).show();
                    }).setNegativeButton("閉じる", null).show();
        });
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        if (web != null) web.saveState(state);
        if (gigaUpload != null) gigaUpload.save(state);
        super.onSaveInstanceState(state);
    }
    @Override protected void onPostResume() {
        super.onPostResume();
        if (gigaUpload != null) gigaUpload.resume();
    }
    @Override protected void onPause() {
        if (web != null) CookieManager.getInstance().flush();
        super.onPause();
    }
    @Override public void onBackPressed() { if (web != null && web.canGoBack()) web.goBack();else finish(); }
    @Override protected void onDestroy() {
        if (gigaUpload != null) gigaUpload.destroy();
        if (isFinishing()) GigaFilePosting.clearUpload(getIntent().getStringExtra("postingUpload"));
        cancelPicker();if (web != null) { web.stopLoading();web.destroy();web = null; }super.onDestroy();
    }
}
