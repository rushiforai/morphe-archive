/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import org.json.JSONObject;
import org.json.JSONTokener;

/** Single-flight verification through the public service page, without a native JS bridge. */
final class SourceVerification {
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static Session active;
    private static long retryAt;
    private SourceVerification(){}
    static void ensure(Activity activity){
        if(active!=null||SystemClock.elapsedRealtime()<retryAt||!usable(activity)||!activity.hasWindowFocus())return;
        String jwt=LyricsConfig.preferences(activity).getString("serviceJwt","");
        if(TokenExpiry.needsRenewal(jwt,System.currentTimeMillis()/1000))start(activity,false);
    }
    static void show(Activity activity){
        if(!usable(activity))return;
        if(active!=null){active.reveal();return;}
        start(activity,true);
    }
    static void cancel(){if(active!=null)active.finish(false,"Verification paused");}
    private static boolean usable(Activity activity){return activity!=null&&!activity.isFinishing()&&!activity.isDestroyed();}
    private static void start(Activity activity,boolean interactive){
        retryAt=SystemClock.elapsedRealtime()+300000;
        try{active=new Session(activity);active.start(interactive);}
        catch(Exception ex){LyricsDiagnostics.record("Source connection","Could not start verification: "+ex.getClass().getSimpleName());if(active!=null)active.finish(false,"Source verification could not start");}
    }
    private static final class Session {
        private final Activity activity;
        private final WebView web;
        private final long deadline=SystemClock.elapsedRealtime()+120000;
        private AlertDialog dialog;
        private boolean stopped,polling,retrying;
        private int attempts=1;
        private final Runnable poll=this::poll;
        private final Runnable retry=this::retry;
        private void retry(){if(!stopped){retrying=false;web.loadUrl(LyricsNetwork.BROKER+"challenge");main.postDelayed(poll,750);}}
        @SuppressLint("SetJavaScriptEnabled")
        Session(Activity activity){
            this.activity=activity;web=new WebView(activity);
            web.getSettings().setJavaScriptEnabled(true);web.getSettings().setDomStorageEnabled(true);
            web.getSettings().setAllowFileAccess(false);web.getSettings().setAllowContentAccess(false);
            CookieManager.getInstance().setAcceptThirdPartyCookies(web,true);
            web.setWebViewClient(new WebViewClient(){
                @Override public boolean shouldOverrideUrlLoading(WebView view,WebResourceRequest request){
                    Uri uri=request.getUrl();String value=uri.toString();
                    if(!request.isForMainFrame()&&("about:blank".equals(value)||"about:srcdoc".equals(value)))return false;
                    return !"https".equals(uri.getScheme())||!("lyrics.api.dacubeking.com".equals(uri.getHost())||!request.isForMainFrame()&&"challenges.cloudflare.com".equals(uri.getHost()));
                }
                @Override public void onPageFinished(WebView view,String url){if(!stopped&&url.startsWith(LyricsNetwork.BROKER+"challenge"))view.evaluateJavascript(PROBE,null);}
                @Override public boolean onRenderProcessGone(WebView view,RenderProcessGoneDetail detail){finish(false,"Verification browser stopped; tap Connect sources to retry");return true;}
            });
        }
        void start(boolean interactive){
            if(interactive)reveal();
            else{
                View decor=activity.getWindow().getDecorView();
                if(!(decor instanceof ViewGroup root)){finish(false,"Open Connect sources to verify access");return;}
                web.setAlpha(0);web.setFocusable(false);web.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
                root.addView(web,new ViewGroup.LayoutParams(1,1));
            }
            LyricsDiagnostics.record("Source connection",interactive?"Interactive verification started":"Automatic verification started");
            web.loadUrl(LyricsNetwork.BROKER+"challenge");main.postDelayed(poll,750);
        }
        void reveal(){
            if(stopped||dialog!=null)return;
            if(web.getParent() instanceof ViewGroup parent)parent.removeView(web);
            web.setAlpha(1);web.setFocusable(true);web.setFocusableInTouchMode(true);web.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
            web.setMinimumHeight((int)(220*activity.getResources().getDisplayMetrics().density));
            dialog=new AlertDialog.Builder(activity).setTitle("Connect Better Lyrics sources")
                .setMessage("Additional providers normally verify and renew automatically. Complete verification here if interaction is required. This does not sign you into YouTube.")
                .setView(web).setNegativeButton("Cancel",null).create();
            dialog.setOnDismissListener(value->finish(false,"Verification canceled; public sources remain available"));dialog.show();
        }
        // Keep the challenge's browser identity and cookies for the normal same-origin exchange.
        private static final String PROBE="(()=>{if(!window.__bdListener){window.__bdListener=true;window.addEventListener('message',event=>{if(event.source!==window||event.origin!==location.origin)return;if(event.data?.type==='turnstile-token'&&typeof event.data.token==='string')window.__bdChallengeToken=event.data.token;});}if(!window.__bdConnection){let token=window.__bdChallengeToken;try{token||=window.turnstile&&window.turnstile.getResponse();}catch{}if(!token)return JSON.stringify({waiting:true});window.__bdConnection={pending:true};fetch('/verify-turnstile',{method:'POST',credentials:'include',headers:{'Content-Type':'application/json'},body:JSON.stringify({token})}).then(async r=>{if(!r.ok){window.__bdConnection={status:r.status,retryAfter:r.headers?.get('Retry-After')||''};return;}const data=await r.json();window.__bdConnection={jwt:typeof data.jwt==='string'?data.jwt:'',status:200};}).catch(()=>window.__bdConnection={status:0});}return JSON.stringify(window.__bdConnection);})()";
        void poll(){
            if(stopped||retrying)return;
            if(!usable(activity)){finish(false,"Verification paused");return;}
            if(SystemClock.elapsedRealtime()>deadline){finish(false,"Automatic verification did not finish; tap Connect sources if interaction is needed");return;}
            String url=web.getUrl();
            if(!polling&&url!=null&&url.startsWith(LyricsNetwork.BROKER+"challenge")){
                polling=true;
                web.evaluateJavascript(PROBE,encoded->{
                    polling=false;if(stopped)return;
                    try{
                        Object decoded=new JSONTokener(encoded).nextValue();if(!(decoded instanceof String text))return;
                        JSONObject state=new JSONObject(text);if(!state.has("status"))return;
                        int status=state.optInt("status",0);String jwt=state.optString("jwt","");
                        long serverDelay=LyricsNetwork.retryAfter(state.optString("retryAfter",""));
                        if(serverDelay>0)retryAt=Math.max(retryAt,SystemClock.elapsedRealtime()+serverDelay);
                        if(status==200&&!ServiceConnection.expired(jwt)){
                            LyricsConfig.preferences(activity).edit().putString("serviceJwt",jwt).apply();finish(true,"Additional lyric sources connected");return;
                        }
                        if((status==0||status==408||status>=500)&&attempts<3&&serverDelay<=15000){
                            attempts++;retrying=true;LyricsDiagnostics.record("Source connection","Temporary verification failure; retry "+attempts+"/3");
                            main.removeCallbacks(poll);main.postDelayed(retry,Math.max(attempts*1000L,serverDelay));return;
                        }
                        finish(false,status==429?"Source verification rate limited; try Connect sources later":"Verification needs attention; tap Connect sources");
                    }catch(Exception ex){finish(false,"Verification response could not be read; tap Connect sources");}
                });
            }
            main.postDelayed(poll,750);
        }
        void finish(boolean success,String message){
            if(stopped)return;stopped=true;main.removeCallbacks(poll);main.removeCallbacks(retry);
            LyricsDiagnostics.record("Source connection",message);
            if(dialog!=null){dialog.setOnDismissListener(null);dialog.dismiss();if(usable(activity))Toast.makeText(activity,message,Toast.LENGTH_LONG).show();}
            web.stopLoading();app.bdcrusher.ytmusic.common.ViewDisposal.dispose(web,web::destroy);if(active==this)active=null;
        }
    }
}
