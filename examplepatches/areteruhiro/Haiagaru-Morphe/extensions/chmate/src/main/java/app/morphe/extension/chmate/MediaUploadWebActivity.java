package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.net.Uri;
import android.os.Bundle;
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
        setTitle(sendvid ? "Sendvid Web送信" : "imgpile Web送信");
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
        TextView help = new TextView(this);
        help.setText((sendvid ? "Sendvid" : "imgpile") + " 手動Web送信・アクセス確認\n"
                + "標準添付からの自動送信はアップロード先設定で選択してください。このWeb画面で手動送信した場合はURLをコピーして貼り付けます。削除権限を含むCookieや管理リンクは共有しないでください。");
        root.addView(help);
        LinearLayout bar = new LinearLayout(this);root.addView(bar);
        Button close = new Button(this);close.setText("閉じる");bar.addView(close);close.setOnClickListener(v -> finish());
        Button home = new Button(this);home.setText("送信・履歴");bar.addView(home);
        home.setOnClickListener(v -> web.loadUrl(MediaUploadWebPolicy.home(provider)));
        Button copy = new Button(this);copy.setText("URLをコピー");bar.addView(copy);
        copy.setOnClickListener(v -> copyMedia());
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
                status.setText(sendvid ? "sendvid.com" : "imgpile.com");
            }
            @Override public void onPageFinished(WebView v, String url) { CookieManager.getInstance().flush(); }
            @Override public void onReceivedSslError(WebView v, SslErrorHandler h, android.net.http.SslError e) {
                h.cancel();status.setText("証明書エラーのため接続を停止しました。");
            }
        });
        web.setWebChromeClient(new WebChromeClient() {
            @Override public boolean onShowFileChooser(WebView v, ValueCallback<Uri[]> callback, FileChooserParams params) {
                if (!MediaUploadWebPolicy.page(provider, v.getUrl())) return false;
                cancelPicker();picker = callback;
                // Only URIs explicitly selected by the user; no storage-wide access or file:// URIs.
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                        .setType(sendvid ? "video/*" : "*/*")
                        .putExtra(Intent.EXTRA_MIME_TYPES, sendvid ? new String[]{"video/*"} : new String[]{"image/*", "video/*"})
                        .putExtra(Intent.EXTRA_ALLOW_MULTIPLE, params.getMode() == FileChooserParams.MODE_OPEN_MULTIPLE);
                try { startActivityForResult(intent, PICK); }
                catch (RuntimeException e) { cancelPicker();status.setText("ファイル選択画面を開けませんでした。"); }
                return true;
            }
        });
        root.addView(web, new LinearLayout.LayoutParams(-1, 0, 1));HaiagaruUi.showModel(this, "画像・動画の投稿", root);
        if (saved == null || web.restoreState(saved) == null) web.loadUrl(MediaUploadWebPolicy.home(provider));
    }
    private void cancelPicker() {
        ValueCallback<Uri[]> value = picker;picker = null;if (value != null) value.onReceiveValue(null);
    }
    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
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
            new HaiagaruDialog.Builder(this).setTitle("コピーする画像／動画URLを選択")
                    .setItems(links, (d, index) -> {
                        ((ClipboardManager)getSystemService(CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText(provider, links[index]));
                        Toast.makeText(this, "URLをコピーしました。書き込み本文へ貼り付けてください。", Toast.LENGTH_LONG).show();
                    }).setNegativeButton("閉じる", null).show();
        });
    }
    @Override protected void onSaveInstanceState(Bundle state) { if (web != null) web.saveState(state);super.onSaveInstanceState(state); }
    @Override protected void onPause() { CookieManager.getInstance().flush();super.onPause(); }
    @Override public void onBackPressed() { if (web != null && web.canGoBack()) web.goBack();else finish(); }
    @Override protected void onDestroy() {
        cancelPicker();if (web != null) { web.stopLoading();web.destroy();web = null; }super.onDestroy();
    }
}
