package app.morphe.extension.chmate;

import android.app.Activity;

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
import java.util.HashSet;
import java.util.Set;

/** User-operated authentication only. Never auto-submits a code or reposts a draft. */
public final class ExternalBoardAuthActivity extends HaiagaruComposeActivity {
    private WebView web;
    private String board;
    private TextView location;
    private final Set<String> allowed = new HashSet<>();
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        final String auth;
        try {
            board=BoardAuthRules.validate(getIntent().getStringExtra("board"));
            auth=BoardAuthRules.validate(getIntent().getStringExtra("auth"));
        } catch(Exception e) { finish();return; }
        allowed.add(BoardAuthRules.origin(auth));allowed.add(BoardAuthRules.origin(board));
        LinearLayout root=new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);
        root.setOnApplyWindowInsetsListener((view,insets)->{
            if(android.os.Build.VERSION.SDK_INT>=30){
                android.graphics.Insets bars=insets.getInsets(android.view.WindowInsets.Type.systemBars()|android.view.WindowInsets.Type.displayCutout());
                view.setPadding(bars.left,bars.top,bars.right,bars.bottom);
            } else view.setPadding(insets.getSystemWindowInsetLeft(),insets.getSystemWindowInsetTop(),insets.getSystemWindowInsetRight(),insets.getSystemWindowInsetBottom());
            return insets;
        });
        location=new TextView(this);root.addView(location);
        LinearLayout actions=new LinearLayout(this);root.addView(actions);
        Button complete=new Button(this);complete.setText("認証を反映して戻る");actions.addView(complete);
        complete.setOnClickListener(v->{
            CookieManager.getInstance().flush();
            ExternalBoardAuth.prefs(this).edit().putBoolean("enabled:"+BoardAuthRules.origin(board),true).apply();
            android.widget.Toast.makeText(this,"認証Cookieの連携を有効にしました。投稿は自動再送信されません。",android.widget.Toast.LENGTH_LONG).show();
            finish();
        });
        Button reload=new Button(this);reload.setText("再読込");actions.addView(reload);reload.setOnClickListener(v->web.reload());
        web=new WebView(this);WebSettings settings=web.getSettings();
        settings.setJavaScriptEnabled(true);settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setSavePassword(false);settings.setSaveFormData(false);
        settings.setJavaScriptCanOpenWindowsAutomatically(false);
        CookieManager.getInstance().setAcceptCookie(true);
        CookieManager.getInstance().setAcceptThirdPartyCookies(web,false);
        android.widget.CheckBox captchaCookies=new android.widget.CheckBox(this);
        captchaCookies.setText("CAPTCHA用のサードパーティCookieを許可");
        captchaCookies.setChecked(false);
        captchaCookies.setOnCheckedChangeListener((button,enabled)->{
            if(!enabled){CookieManager.getInstance().setAcceptThirdPartyCookies(web,false);return;}
            new HaiagaruDialog.Builder(this).setTitle("サードパーティCookieを許可しますか？")
                .setMessage("認証サービスなど、表示中のサイト以外からのCookieもこの認証画面で受け入れます。信頼する認証先で必要な場合だけ許可してください。")
                .setNegativeButton("キャンセル",(d,w)->captchaCookies.setChecked(false))
                .setOnCancelListener(d->captchaCookies.setChecked(false))
                .setPositiveButton("許可して再読込",(d,w)->{CookieManager.getInstance().setAcceptThirdPartyCookies(web,true);web.reload();}).show();
        });
        root.addView(captchaCookies);
        web.setWebChromeClient(new WebChromeClient());
        web.setWebViewClient(new WebViewClient(){
            private boolean navigate(WebView view,String url) {
                String origin=BoardAuthRules.origin(url);
                if(origin.isEmpty()) {location.setText("HTTPS以外の移動を停止しました。");return true;}
                if(allowed.contains(origin)) return false;
                new HaiagaruDialog.Builder(ExternalBoardAuthActivity.this).setTitle("別のサイトへ移動します")
                    .setMessage(origin+"\nこの認証先を信頼できる場合のみ続行してください。")
                    .setNegativeButton("キャンセル",null).setPositiveButton("移動",(d,w)->{allowed.add(origin);view.loadUrl(url);}).show();
                return true;
            }
            @Override public boolean shouldOverrideUrlLoading(WebView view,String url){return navigate(view,url);}
            @Override public boolean shouldOverrideUrlLoading(WebView view,WebResourceRequest request){return request.isForMainFrame()&&navigate(view,request.getUrl().toString());}
            @Override public void onPageStarted(WebView view,String url,android.graphics.Bitmap icon){
                if(!allowed.contains(BoardAuthRules.origin(url))) {view.stopLoading();navigate(view,url);return;}
                location.setText("認証先: "+BoardAuthRules.origin(url));
            }
            @Override public void onPageFinished(WebView view,String url){CookieManager.getInstance().flush();}
            @Override public void onReceivedSslError(WebView view,android.webkit.SslErrorHandler handler,android.net.http.SslError error){
                handler.cancel();location.setText("証明書を確認できないため接続を停止しました。");
            }
            @Override public void onReceivedError(WebView view,WebResourceRequest request,android.webkit.WebResourceError error){
                if(request.isForMainFrame()) location.setText("認証ページを開けませんでした: "+error.getDescription());
            }
        });
        root.addView(web,new LinearLayout.LayoutParams(-1,0,1));HaiagaruUi.showModel(this, "外部板の認証", root);
        if(state==null || web.restoreState(state)==null)
            ExternalBoardAuth.prepareWebSession(this,board,auth,()->web.loadUrl(auth));
    }
    @Override protected void onSaveInstanceState(Bundle state){if(web!=null)web.saveState(state);super.onSaveInstanceState(state);}
    @Override public void onBackPressed(){finish();}
    @Override protected void onDestroy(){if(web!=null){web.stopLoading();web.destroy();web=null;}super.onDestroy();}
}
