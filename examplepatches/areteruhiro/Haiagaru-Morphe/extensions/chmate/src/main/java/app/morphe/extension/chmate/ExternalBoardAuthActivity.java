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
    private boolean captchaDialog;
    private boolean postingCompleted;
    private long navigation;
    private TextView location;
    private String challengeToken;
    private BoardChallengeSession.Page challenge;
    private final java.util.concurrent.atomic.AtomicReference<BoardChallengeSession.Page> firstResponse = new java.util.concurrent.atomic.AtomicReference<>();
    private final java.util.concurrent.atomic.AtomicBoolean sendAllowed = new java.util.concurrent.atomic.AtomicBoolean();
    private final Set<String> allowed = new HashSet<>();
    @Override public void onCreate(Bundle state) {
        // Select the floating Activity theme before ComponentActivity creates its window.
        try {
            String target=BoardAuthRules.validate(getIntent().getStringExtra("board"));
            BoardChallengeSession.Page pending=BoardChallengeSession.find(getIntent().getStringExtra("challenge"),target);
            captchaDialog=pending!=null&&(pending.captcha||pending.calculation);
        } catch(IllegalArgumentException ignored) { }
        setTheme(captchaDialog?android.R.style.Theme_Material_Light_Dialog_NoActionBar
                :android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(state);
        final String auth;
        try {
            board=BoardAuthRules.validate(getIntent().getStringExtra("board"));
            challengeToken=getIntent().getStringExtra("challenge");
            if(challengeToken!=null){
                if(android.os.Build.VERSION.SDK_INT<21)throw new IllegalArgumentException("Web confirmation needs Android 5 or later");
                challenge=BoardChallengeSession.find(challengeToken,board);
                if(challenge==null)throw new IllegalArgumentException("Expired confirmation page");
                auth=challenge.base;
            }else auth=BoardAuthRules.validateAuthPage(getIntent().getStringExtra("auth"));
        } catch(Exception e) {
            android.widget.Toast.makeText(this,getIntent().hasExtra("challenge")
                    ?"確認ページの期限が切れました。新しい投稿確認ページを取得してください。"
                    :"認証ページのURLを確認してください。CSSや投稿先のURLは開けません。",android.widget.Toast.LENGTH_LONG).show();
            finish();return;
        }
        sendAllowed.set(captchaDialog);
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
        Button complete=new Button(this);complete.setText(challenge==null?"認証を反映して戻る":"書き込みへ戻る");actions.addView(complete,new LinearLayout.LayoutParams(0,-2,1));
        complete.setOnClickListener(v->completeAuth());
        Button reload=new Button(this);reload.setText(challenge==null?"再読込":"再表示");actions.addView(reload,new LinearLayout.LayoutParams(0,-2,1));
        reload.setOnClickListener(v->reloadPage());
        LinearLayout details=new LinearLayout(this);details.setOrientation(LinearLayout.VERTICAL);
        details.setVisibility(android.view.View.GONE);
        if(challenge!=null&&!captchaDialog){
            TextView note=new TextView(this);
            note.setText((challenge.calculation?"サイトの「計算を開始」「認証する」を操作してください。":"サイトのCAPTCHAを画面上で解いて認証してください。")
                    +"認証・送信ボタンで今回の投稿が送信される場合があります。ChMateから自動再送信は行いません。");details.addView(note);
            android.widget.CheckBox allowSend=new android.widget.CheckBox(this);
            allowSend.setText("サイトからの認証・投稿送信を許可する");
            allowSend.setChecked(false);
            allowSend.setOnCheckedChangeListener((button,checked)->sendAllowed.set(checked));
            root.addView(allowSend);
        }
        web=new WebView(this);WebSettings settings=web.getSettings();
        String browserAgent=ViewingUserAgent.browserAgent(this);
        if(browserAgent!=null)settings.setUserAgentString(browserAgent);
        if(challenge!=null)settings.setCacheMode(WebSettings.LOAD_NO_CACHE);
        settings.setJavaScriptEnabled(true);settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setSavePassword(false);settings.setSaveFormData(false);
        settings.setJavaScriptCanOpenWindowsAutomatically(false);
        CookieManager.getInstance().setAcceptCookie(true);
        CookieManager.getInstance().setAcceptThirdPartyCookies(web,captchaDialog);
        if(!captchaDialog){
            android.widget.CheckBox captchaCookies=new android.widget.CheckBox(this);
            captchaCookies.setText("CAPTCHA用のサードパーティCookieを許可");
            captchaCookies.setChecked(false);
            captchaCookies.setOnCheckedChangeListener((button,enabled)->{
                if(!enabled){CookieManager.getInstance().setAcceptThirdPartyCookies(web,false);return;}
                new HaiagaruDialog.Builder(this).setTitle("サードパーティCookieを許可しますか？")
                    .setMessage("認証サービスなど、表示中のサイト以外からのCookieもこの認証画面で受け入れます。信頼する認証先で必要な場合だけ許可してください。")
                    .setNegativeButton("キャンセル",(d,w)->captchaCookies.setChecked(false))
                    .setOnCancelListener(d->captchaCookies.setChecked(false))
                    .setPositiveButton("許可して再読込",(d,w)->{CookieManager.getInstance().setAcceptThirdPartyCookies(web,true);reloadPage();}).show();
            });
            details.addView(captchaCookies);
            Button options=new Button(this);options.setText("説明・Cookie設定を開く");root.addView(options);
            options.setOnClickListener(v->{
                boolean open=details.getVisibility()!=android.view.View.VISIBLE;
                details.setVisibility(open?android.view.View.VISIBLE:android.view.View.GONE);
                options.setText(open?"説明・Cookie設定を閉じる":"説明・Cookie設定を開く");
            });
            root.addView(details);
        }
        web.setWebChromeClient(new WebChromeClient(){
            @Override public void onProgressChanged(WebView view,int progress){
                if(challenge!=null)setStatus("投稿確認: "+BoardAuthRules.origin(auth)+(progress<100?" ("+progress+"%)":""));
            }
        });
        web.setWebViewClient(new WebViewClient(){
            private boolean navigate(WebView view,String url) {
                String origin=BoardAuthRules.origin(url);
                if(origin.isEmpty()) {setStatus("HTTPS以外の移動を停止しました。");return true;}
                if(challenge!=null&&!origin.equals(BoardAuthRules.origin(challenge.base))){
                    setStatus("投稿確認中は別サイトへの移動を停止します。");return true;
                }
                if(allowed.contains(origin)) return false;
                new HaiagaruDialog.Builder(ExternalBoardAuthActivity.this).setTitle("別のサイトへ移動します")
                    .setMessage(origin+"\nこの認証先を信頼できる場合のみ続行してください。")
                    .setNegativeButton("キャンセル",null).setPositiveButton("移動",(d,w)->{allowed.add(origin);view.loadUrl(url);}).show();
                return true;
            }
            @Override public boolean shouldOverrideUrlLoading(WebView view,String url){return navigate(view,url);}
            @Override public boolean shouldOverrideUrlLoading(WebView view,WebResourceRequest request){return request.isForMainFrame()&&navigate(view,request.getUrl().toString());}
            @Override public android.webkit.WebResourceResponse shouldInterceptRequest(WebView view,WebResourceRequest request){
                if(challengeToken!=null&&request.isForMainFrame()&&"GET".equalsIgnoreCase(request.getMethod())
                        &&auth.equals(request.getUrl().toString())){
                    BoardChallengeSession.Page page=firstResponse.getAndSet(null);
                    if(page!=null){
                        // Serve the original POST response locally on its original HTTPS
                        // URL. No extra request or draft POST is made on page opening.
                        if(BoardChallengeSession.find(challengeToken,board)==null)
                            return new android.webkit.WebResourceResponse("text/plain","UTF-8",new java.io.ByteArrayInputStream(new byte[0]));
                        return new android.webkit.WebResourceResponse("text/html",page.encoding,200,"OK",
                            java.util.Collections.singletonMap("Cache-Control","no-store"),new java.io.ByteArrayInputStream(page.bytes()));
                    }
                }
                // POST navigations do not call shouldOverrideUrlLoading. Prevent a
                // confirmation form from sending its body to a different origin.
                if(challengeToken!=null&&request.isForMainFrame()
                        &&!BoardAuthRules.origin(auth).equals(BoardAuthRules.origin(request.getUrl().toString())))
                    return new android.webkit.WebResourceResponse("text/plain","UTF-8",
                        new java.io.ByteArrayInputStream("別サイトへの送信を停止しました。".getBytes(java.nio.charset.StandardCharsets.UTF_8)));
                if(challengeToken!=null&&"POST".equalsIgnoreCase(request.getMethod())
                        &&(request.isForMainFrame()||auth.equals(request.getUrl().toString().split("\\?",2)[0]))
                        &&!sendAllowed.get()){
                    location.post(()->setStatus("送信は未許可です。許可する場合は上のチェックを入れ、確認画面を再表示してください。"));
                    return new android.webkit.WebResourceResponse("text/plain","UTF-8",
                        new java.io.ByteArrayInputStream("送信を停止しました。上の「サイトからの認証・投稿送信を許可する」を確認してください。".getBytes(java.nio.charset.StandardCharsets.UTF_8)));
                }
                return null;
            }
            @Override public void onPageStarted(WebView view,String url,android.graphics.Bitmap icon){
                navigation++;
                if(!allowed.contains(BoardAuthRules.origin(url))) {view.stopLoading();navigate(view,url);return;}
                setStatus("認証先: "+BoardAuthRules.origin(url));
            }
            @Override public void onPageFinished(WebView view,String url){
                CookieManager.getInstance().flush();
                if(captchaDialog)view.evaluateJavascript(CaptchaDialogContent.SCRIPT,null);
                checkPosted(view,url,navigation);
            }
            @Override public void onReceivedSslError(WebView view,android.webkit.SslErrorHandler handler,android.net.http.SslError error){
                handler.cancel();setStatus("証明書を確認できないため接続を停止しました。");
            }
            @Override public void onReceivedError(WebView view,WebResourceRequest request,android.webkit.WebResourceError error){
                if(request.isForMainFrame()) setStatus("認証ページを開けませんでした: "+error.getDescription());
            }
        });
        if(captchaDialog){
            root.removeAllViews();
            location.setVisibility(android.view.View.GONE);
            root.addView(location);
        }
        root.addView(web,new LinearLayout.LayoutParams(-1,0,1));
        HaiagaruUi.showModel(this,captchaDialog?(challenge.calculation?"計算による投稿確認":"CAPTCHA認証"):challenge==null?"外部板の認証":"サイトの投稿確認",root);
        if(captchaDialog){
            setFinishOnTouchOutside(false);
            getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(android.graphics.Color.TRANSPARENT));
            web.setBackgroundColor(android.graphics.Color.TRANSPARENT);
            android.util.DisplayMetrics metrics=getResources().getDisplayMetrics();
            int margin=Math.min((int)(16*metrics.density),Math.max(0,metrics.widthPixels-(int)(320*metrics.density)));
            getWindow().setLayout(Math.min(metrics.widthPixels-margin,(int)(640*metrics.density)),(int)(metrics.heightPixels*.82f));
            android.view.WindowManager.LayoutParams attributes=getWindow().getAttributes();
            attributes.dimAmount=.35f;getWindow().setAttributes(attributes);
            getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        }
        if(challenge!=null)ExternalBoardAuth.prepareWebSession(this,board,auth,this::renderChallenge);
        else if(state==null || web.restoreState(state)==null)
            ExternalBoardAuth.prepareWebSession(this,board,auth,()->web.loadUrl(auth));
    }
    private void checkPosted(WebView view,String url,long generation){
        if(challenge==null||postingCompleted)return;
        view.evaluateJavascript("JSON.stringify([document.title,(document.body?document.body.innerText:'').slice(0,4096),!!document.querySelector('form')])",value->{
            if(postingCompleted||isFinishing()||isDestroyed()||web!=view||navigation!=generation||!url.equals(view.getUrl()))return;
            try {
                Object decoded=new org.json.JSONTokener(value).nextValue();
                org.json.JSONArray page=new org.json.JSONArray(String.valueOf(decoded));
                if(!BoardPostResult.success(board,url,page.optString(0),page.optString(1),page.optBoolean(2,true)))return;
                postingCompleted=true;
                Runnable posted=challenge.posted;challenge.posted=null;
                if(posted!=null)posted.run();
                completeAuth();
            }catch(org.json.JSONException invalid){ /* Incomplete/navigation document: retain draft. */ }
        });
    }
    private void completeAuth(){
        CookieManager.getInstance().flush();
        try{if(board!=null&&web!=null)BoardCookies.importAuth(board,web.getUrl()==null?board:web.getUrl());}
        catch(RuntimeException failed){setStatus("認証Cookieを保存できませんでした。もう一度お試しください。");return;}
        ExternalBoardAuth.prefs(this).edit().putBoolean("enabled:"+BoardAuthRules.origin(board),true).apply();
        if(!captchaDialog)android.widget.Toast.makeText(this,challenge==null
                ?"認証Cookieの連携を有効にしました。投稿は自動再送信されません。"
                :"サイト側で投稿済みの場合は、ChMateから同じ本文を再送しないでください。",android.widget.Toast.LENGTH_LONG).show();
        finish();
    }
    private void setStatus(String message){
        location.setText(message);
        if(captchaDialog)location.setVisibility(message.startsWith("投稿確認:")||message.startsWith("認証先:")
                ?android.view.View.GONE:android.view.View.VISIBLE);
    }
    private void reloadPage(){
        if(web==null)return;
        // A GET reload of bbs.cgi has no form body. Restore the captured page
        // after cookie changes too, without automatically replaying a POST.
        if(challenge==null)web.reload();else renderChallenge();
    }
    private void renderChallenge(){
        if(web==null)return;
        BoardChallengeSession.Page page=BoardChallengeSession.find(challengeToken,board);
        if(page==null){setStatus("確認ページの期限が切れました。新しい投稿確認ページを取得してください。");return;}
        // The first GET is intercepted above, preserving HTTPS origin, document
        // encoding and relative Worker/form URLs without another server request.
        // Never synthesize a proof, change UA, or start calculation/submission.
        firstResponse.set(page);
        web.loadUrl(page.base);
    }
    @Override protected void onSaveInstanceState(Bundle state){if(web!=null&&challenge==null)web.saveState(state);super.onSaveInstanceState(state);}
    @Override public void onBackPressed(){if(captchaDialog)completeAuth();else finish();}
    @Override protected void onDestroy(){
        BoardCookies.endAuth(this);
        if(isFinishing()&&challengeToken!=null)BoardChallengeSession.forget(challengeToken);
        if(web!=null){web.stopLoading();web.destroy();web=null;}
        challenge=null;
        firstResponse.set(null);
        sendAllowed.set(false);
        super.onDestroy();
    }
}
