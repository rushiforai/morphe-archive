package dev.rikunode.futatabi.bridge;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceError;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Arrays;
import java.util.UUID;

/** Official same-origin form. Only the person using the WebView submits the post. */
public final class MebukiNewThreadActivity extends Activity {
    private static final String SITE = MebukiSession.SITE;
    private static final String EXTRA = "draft_id";
    private static final int CHUNK = 96 * 1024;
    private static Pending pending;
    private static String active;
    private static final class Pending {
        final String id = UUID.randomUUID().toString();
        final MebukiNewThreadDraft draft;
        Pending(MebukiNewThreadDraft draft) { this.draft = draft; }
    }

    static String open(Context context,MebukiNewThreadDraft draft) {
        if (!MebukiSession.safeCookie(MebukiSession.saved(context)))
            return "めぶきのログインが必要です。既存のログイン画面で認証してください。未送信です。";
        Pending p;
        synchronized (MebukiNewThreadActivity.class) {
            if (pending != null || active != null)
                return "めぶきの確認画面が開いています。二重投稿せず、そちらで確認してください。";
            pending = p = new Pending(draft);
        }
        try {
            context.startActivity(new Intent(context,MebukiNewThreadActivity.class)
                    .putExtra(EXTRA,p.id).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            new Handler(Looper.getMainLooper()).postDelayed(()->{
                synchronized (MebukiNewThreadActivity.class) { if (pending == p) pending = null; }
            },30_000);
        } catch (RuntimeException ex) {
            synchronized (MebukiNewThreadActivity.class) { if (pending == p) pending = null; }
            return "めぶきの確認画面を開けませんでした。未送信です。";
        }
        // Never return the stock JSON success before the official action.
        return "めぶきの確認画面で投稿を完了してください。まだ送信していません。";
    }

    private WebView browser;
    private TextView status;
    private Pending claimed;
    private boolean failed, preparing, transferred, checkingThread;
    private String checkedCookie;
    private long startedAt;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        String id = getIntent().getStringExtra(EXTRA);
        synchronized (MebukiNewThreadActivity.class) {
            if (pending != null && pending.id.equals(id) && active == null) {
                claimed = pending;
                pending = null;
                active = id;
            }
        }
        if (claimed == null) { finish(); return; }
        startedAt = System.currentTimeMillis();
        if (getActionBar()!=null) getActionBar().hide();
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            getWindow().setDecorFitsSystemWindows(false);
            root.setOnApplyWindowInsetsListener((v,insets)->{
                android.graphics.Insets safe=insets.getInsets(android.view.WindowInsets.Type.systemBars()|
                        android.view.WindowInsets.Type.displayCutout()|android.view.WindowInsets.Type.ime());
                v.setPadding(safe.left,safe.top,safe.right,safe.bottom);
                return android.view.WindowInsets.CONSUMED;
            });
        } else root.setFitsSystemWindows(true);
        status = new TextView(this);
        status.setPadding(12,8,12,8);
        status.setText("めぶきの認証済みセッションを確認中…");
        root.addView(status);
        Button close = new Button(this);
        close.setText("ふたたびに戻る");
        close.setOnClickListener(v->finish());
        root.addView(close);
        browser = new WebView(this);
        WebSettings settings=browser.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setUseWideViewPort(true);
        settings.setLoadWithOverviewMode(true);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        CookieManager.getInstance().setAcceptCookie(true);
        CookieManager.getInstance().setAcceptThirdPartyCookies(browser,true);
        // Standard WebView UA and official challenge. No JS bridge or token handling.
        browser.setWebChromeClient(new WebChromeClient());
        browser.setOnTouchListener((v,e)->!transferred || failed);
        browser.setWebViewClient(new WebViewClient() {
            @Override public boolean shouldOverrideUrlLoading(WebView v,WebResourceRequest request) {
                if (!request.isForMainFrame()) return false; // Turnstile iframe and normal resources
                String target=request.getUrl().toString();
                if (allowed(target)) return false;
                fail("公式のスレ立て画面以外への遷移を中止しました。未確認です。");
                return true;
            }
            @Override public void onPageStarted(WebView v,String url,android.graphics.Bitmap icon) {
                if (!allowed(url)) { v.stopLoading(); fail("公式のスレ立て画面を確認できません。"); }
            }
            @Override public void onPageFinished(WebView v,String url) {
                if (MebukiNewThreadDraft.URL.equals(url) && !preparing && !transferred && !failed) {
                    preparing=true;
                    awaitForm(0);
                } else observeThread(url);
            }
            @Override public void doUpdateVisitedHistory(WebView v,String url,boolean reload) {
                observeThread(url);
            }
            @Override public void onReceivedError(WebView v,WebResourceRequest req,WebResourceError err) {
                if(req.isForMainFrame())fail("公式ページの読み込みに失敗しました。投稿結果は未確認です。");
            }
            @Override public void onReceivedHttpError(WebView v,WebResourceRequest req,WebResourceResponse response) {
                if(req.isForMainFrame())fail("公式ページ HTTP "+response.getStatusCode()+"。投稿結果は未確認です。");
            }
            @Override public void onReceivedSslError(WebView v,android.webkit.SslErrorHandler h,android.net.http.SslError err) {
                h.cancel();fail("TLSエラーで中止しました。");
            }
        });
        root.addView(browser,new LinearLayout.LayoutParams(-1,0,1));
        setContentView(root);
        root.requestApplyInsets();
        verifyAccount(()->browser.loadUrl(MebukiNewThreadDraft.URL));
    }

    private static String threadSlug(String url) {
        if (url == null) return null;
        try {
            Uri u=Uri.parse(url);
            if (!"https".equals(u.getScheme()) || !"mebuki.moe".equals(u.getHost()) ||
                    u.getUserInfo()!=null || (u.getPort()!=-1 && u.getPort()!=443)) return null;
            String path=u.getPath();
            return path!=null && path.matches("/app/t/[A-Za-z0-9_-]{8,24}/?")
                    ? path.split("/")[3] : null;
        } catch (RuntimeException ex) { return null; }
    }
    private boolean allowed(String url) {
        return MebukiNewThreadDraft.URL.equals(url) || (transferred && threadSlug(url)!=null);
    }
    private boolean alive() { return browser!=null && !isFinishing() && !isDestroyed() && !failed; }
    private boolean onForm() { return alive() && MebukiNewThreadDraft.URL.equals(browser.getUrl()); }
    private void fail(String message) {
        if (browser==null || isFinishing() || isDestroyed()) return;
        failed=true;
        status.setText(message+" 元画面からむやみに再送しないでください。");
    }

    private void verifyAccount(Runnable continuation) {
        final String saved=MebukiSession.saved(this);
        final String current=CookieManager.getInstance().getCookie(SITE);
        new Thread(()->{
            boolean ok=MebukiSession.sameAccount(saved,current);
            runOnUiThread(()->{
                if (!alive())return;
                if (!ok || !saved.equals(MebukiSession.saved(this)) ||
                        !current.equals(CookieManager.getInstance().getCookie(SITE))) {
                    fail("保存済み認証とWebViewのアカウントを照合できません。既存のログイン画面で確認してください。");
                    return;
                }
                checkedCookie=current;
                continuation.run();
            });
        },"futatabi-mebuki-new-session").start();
    }

    private void awaitForm(int attempt) {
        if (!onForm())return;
        if(attempt>=30){fail("公式フォームの入力欄を確認できませんでした。未送信です。");return;}
        browser.evaluateJavascript(MebukiNewThreadDraft.readyScript(),r->{
            if(!onForm())return;
            if(!"true".equals(r)){browser.postDelayed(()->awaitForm(attempt+1),500);return;}
            // The site may have refreshed its cookies while loading.
            if (!checkedCookie.equals(CookieManager.getInstance().getCookie(SITE)))
                verifyAccount(this::prefill);
            else prefill();
        });
    }
    private void prefill() {
        if(!onForm())return;
        status.setText("題名・本文・画像を公式フォームへ引き継ぎ中…");
        browser.evaluateJavascript(claimed.draft.beginScript(claimed.id),r->{
            if(!onForm())return;
            if(!"true".equals(r)){fail("下書きの引き継ぎに失敗しました。未送信です。");return;}
            sendImageChunk(0);
        });
    }
    private void sendImageChunk(int offset) {
        if(!onForm())return;
        byte[] image=claimed.draft.image;
        if(offset==image.length){
            browser.evaluateJavascript(claimed.draft.finishScript(claimed.id),r->{
                if(!onForm())return;
                if(!"true".equals(r)){fail("画像の引き継ぎに失敗しました。未送信です。");return;}
                transferred=true;
                status.setText("題名・本文・画像を確認し、タグとスレ落ちを選択してください。本人確認後、公式の作成ボタンで送信します。");
            });
            return;
        }
        int end=Math.min(offset+CHUNK,image.length);
        String chunk=android.util.Base64.encodeToString(Arrays.copyOfRange(image,offset,end),android.util.Base64.NO_WRAP);
        browser.evaluateJavascript(MebukiNewThreadDraft.chunkScript(claimed.id,chunk),r->{
            if(!onForm())return;
            if(!"true".equals(r)){fail("画像の引き継ぎに失敗しました。未送信です。");return;}
            sendImageChunk(end);
        });
    }

    private void observeThread(String url) {
        String slug=threadSlug(url);
        if (!transferred || !alive() || slug==null || checkingThread) return;
        checkingThread=true;
        final String cookie=CookieManager.getInstance().getCookie(SITE);
        final String saved=MebukiSession.saved(this);
        final String body=claimed.draft.body;
        status.setText("公式スレ画面へ移動しました。投稿結果を確認中…");
        new Thread(()->{
            boolean confirmed=false;
            try {
                if (MebukiSession.sameAccount(saved,cookie))
                    confirmed=MebukiSession.readThread(slug,cookie).matchesNewThread(body,startedAt);
            }catch(Exception ignored){}
            final boolean matched=confirmed;
            runOnUiThread(()->{
                if(!alive())return;
                status.setText(matched?"作成したスレの本文と投稿者を確認しました。元画面で再送しないでください。":
                        "公式スレ画面で結果を確認してください。アプリでの照合は未確定です。再送にご注意ください。");
            });
        },"futatabi-mebuki-new-confirm").start();
    }

    @Override protected void onDestroy() {
        if(browser!=null){browser.destroy();browser=null;}
        synchronized(MebukiNewThreadActivity.class){
            if(claimed!=null && claimed.id.equals(active))active=null;
        }
        claimed=null;
        checkedCookie=null;
        super.onDestroy();
    }
}
