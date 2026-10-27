package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import java.lang.reflect.Method;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

/** Offline arithmetic/DOM test only. No site proof, CAPTCHA, account or real post is used. */
public final class BoardChallengeWebViewFixture {
    public static final String BOARD="https://fixture.invalid/board/";
    public static String token;
    private static FixturePostingActivity draftHost;
    private static FixtureEditor draftEditor;
    private static final String ORIGINAL="OFFLINE_SYNTHETIC_DRAFT";
    public static final class FixturePostingActivity extends jp.syoboi.a2chMate.activity.ResEditActivity {
        public int finishes;
        @Override public void finish(){finishes++;}
    }
    public static final class FixtureEditor {
        final Activity host; final android.widget.EditText body;
        public int saves; public String persisted=ORIGINAL;
        FixtureEditor(Activity host,android.widget.EditText body){this.host=host;this.body=body;}
        public Activity getActivity(){return host;}
        public View getView(){return body;}
        public void haiagaruSaveExternalDraft(){saves++;persisted=body.getText().toString();}
    }
    public static String openDraftCompletion(Activity home,boolean changed)throws Exception {
        String result=openCaptcha(home);
        draftHost=new FixturePostingActivity();
        android.widget.EditText body=new android.widget.EditText(home);body.setText(ORIGINAL);
        draftEditor=new FixtureEditor(draftHost,body);
        ClassLoader loader=home.getClassLoader();
        Class<?> hub=Class.forName("app.morphe.extension.chmate.ExternalBoardAuth",true,loader);
        hub.getMethod("target",Object.class,String.class,android.widget.EditText.class).invoke(null,draftEditor,BOARD,body);
        Method capture=hub.getDeclaredMethod("draftCompletion",Activity.class,String.class);capture.setAccessible(true);
        Runnable completion=(Runnable)capture.invoke(null,draftHost,BOARD);
        Class<?> sessions=Class.forName("app.morphe.extension.chmate.BoardChallengeSession",true,loader);
        Method find=sessions.getDeclaredMethod("find",String.class,String.class);find.setAccessible(true);
        Object page=find.invoke(null,token,BOARD);
        java.lang.reflect.Field posted=page.getClass().getDeclaredField("posted");posted.setAccessible(true);posted.set(page,completion);
        if(changed)body.setText("NEW_SYNTHETIC_DRAFT");
        return result;
    }
    public static int draftChecks(boolean changed,boolean completed){
        boolean cleared=completed&&!changed;
        String expected=changed?"NEW_SYNTHETIC_DRAFT":cleared?"":ORIGINAL;
        if(!draftEditor.body.getText().toString().equals(expected))throw new AssertionError("Draft preservation mismatch");
        if(draftEditor.saves!=(cleared?1:0))throw new AssertionError("Draft save count mismatch");
        if(draftHost.finishes!=(cleared?1:0))throw new AssertionError("Posting dialog close count mismatch");
        if(!draftEditor.persisted.equals(cleared?"":ORIGINAL))throw new AssertionError("Persisted draft mismatch");
        return 4;
    }
    public static void showResult(Activity activity,boolean success)throws Exception {
        java.lang.reflect.Field field=activity.getClass().getDeclaredField("web");field.setAccessible(true);
        WebView web=(WebView)field.get(activity);
        String html=success?"<html><head><title>書きこみました。</title></head><body>書きこみが終わりました。</body></html>":
            "<html><head><title>ERROR</title></head><body>書き込みエラー。投稿は完了していません。</body></html>";
        web.loadDataWithBaseURL("https://fixture.invalid/test/bbs.cgi",html,"text/html","UTF-8",null);
    }
    public static String openRussia(Activity activity)throws Exception {
        if(!activity.getPackageName().endsWith(".captchadialog191"))throw new AssertionError("Dedicated verification app only");
        String script=new String(java.nio.file.Files.readAllBytes(java.nio.file.Paths.get("/data/local/tmp/haiagaru-russia-form-pow.js")),java.nio.charset.StandardCharsets.UTF_8);
        String worker=new String(java.nio.file.Files.readAllBytes(java.nio.file.Paths.get("/data/local/tmp/haiagaru-russia-pow-worker.js")),java.nio.charset.StandardCharsets.UTF_8);
        // Synthetic, unsigned challenge. It cannot authenticate on any real server.
        String challenge="v1."+(System.currentTimeMillis()/1000)+".16."+"0".repeat(32)+".post."+"0".repeat(64)+"."+"0".repeat(64);
        String html="<!doctype html><html><head><meta charset='utf-8'><title>計算による投稿確認</title></head><body><p id='outside'>通信しないテスト</p>"
            +"<form method='POST' action='./bbs.cgi' id='form'><input type='hidden' name='MESSAGE' value='SYNTHETIC_ONLY'>"
            +"<div class='local-pow' data-challenge='"+challenge+"' data-ttl='240' data-timeout='90'>"
            +"<button type='button' data-pow-start>計算を開始</button><button type='button' data-pow-stop>中止</button>"
            +"<p data-pow-status></p><input type='hidden' name='pow-response'></div>"
            +"<input type='submit' id='form-btn' value='認証する'></form>"
            +"<script type='application/json' id='ex0ch-pow-worker'>"+org.json.JSONObject.quote(worker)+"</script>"
            +"<script>window.syntheticSubmits=0;document.getElementById('form').addEventListener('submit',e=>{e.preventDefault();window.syntheticSubmits++});</script>"
            +"<script>"+script+"</script></body></html>";
        ClassLoader loader=activity.getClassLoader();
        Class<?> sessions=Class.forName("app.morphe.extension.chmate.BoardChallengeSession",true,loader);
        Method remember=sessions.getDeclaredMethod("remember",String.class,String.class);remember.setAccessible(true);
        token=(String)remember.invoke(null,BOARD,html);
        if(token.isEmpty())throw new AssertionError("Site-script fixture rejected");
        Class<?> hub=Class.forName("app.morphe.extension.chmate.ExternalBoardAuth",true,loader);
        Method launch=hub.getDeclaredMethod("openChallenge",Activity.class,String.class,String.class);
        launch.setAccessible(true);launch.invoke(null,activity,BOARD,token);
        return "STARTED original public Russia calculation scripts; unsigned offline fixture";
    }
    public static String open(Activity activity)throws Exception { return open(activity,false); }
    public static String openCaptcha(Activity activity)throws Exception { return open(activity,true); }
    private static String open(Activity activity,boolean captcha)throws Exception {
        if(!(activity.getPackageName().endsWith(".settingsfix191")||activity.getPackageName().endsWith(".captchadialog191")))throw new AssertionError("Verification package only");
        String html="<!doctype html><html><head><meta http-equiv='Content-Type' content='text/html;charset=Shift_JIS'><title>計算による投稿確認</title></head>"
            +"<body><h2>通信しないオフライン表示テスト</h2><p>実際の掲示板には送信しません。</p>"
            +"<form method='POST' action='/test/bbs.cgi' id='form'><input type='hidden' name='MESSAGE' value='SYNTHETIC_DRAFT_ONLY'>"
            +"<button type='button' id='compute'>Workerの計算テスト</button><button id='confirm'>送信せずDOM確認</button></form><p id='status'>待機中</p>"
            +"<script>window.fixtureReady=true;window.starts=0;window.submits=0;window.workerValue=0;window.blockedPost=0;"
            +"document.getElementById('compute').onclick=function(){window.starts++;"
            +"const url=URL.createObjectURL(new Blob(['onmessage=function(e){postMessage(e.data*2)}'],{type:'text/javascript'}));"
            +"const w=new Worker(url);w.onmessage=function(e){window.workerValue=e.data;document.getElementById('status').textContent='Worker結果 '+e.data;w.terminate();URL.revokeObjectURL(url)};w.postMessage(7)};"
            +"document.getElementById('form').onsubmit=function(e){e.preventDefault();window.submits++;"
            +"fetch('/test/bbs.cgi?fixture=1',{method:'POST',body:'OFFLINE_FIXTURE_ONLY'}).then(r=>r.text()).then(t=>window.blockedPost=t.includes('送信を停止')?1:-1).catch(e=>window.blockedPost=-2);return false};</script></body></html>";
        if(!captcha)html=html.replace("<h2>","<h2 id='outside'>")
                .replace("<button type='button' id='compute'>Workerの計算テスト</button>",
                    "<div class='local-pow'><button type='button' id='compute' data-pow-start>Workerの計算テスト</button></div>")
                .replace("fetch('/test/bbs.cgi?fixture=1',{method:'POST',body:'OFFLINE_FIXTURE_ONLY'}).then(r=>r.text()).then(t=>window.blockedPost=t.includes('送信を停止')?1:-1).catch(e=>window.blockedPost=-2);","window.blockedPost=2;");
        if(captcha){
            html=html.replace("<title>計算による投稿確認</title>","<title>Captcha認証</title>")
                .replace("<h2>","<h2 id='outside'>")
                .replace("<button type='button' id='compute'>Workerの計算テスト</button>",
                    "<div class='g-recaptcha' style='border:1px solid #aaa;padding:16px'>CAPTCHA表示テスト（外部通信なし）<br><button type='button' id='compute'>Workerの計算テスト</button></div>")
                .replace("fetch('/test/bbs.cgi?fixture=1',{method:'POST',body:'OFFLINE_FIXTURE_ONLY'}).then(r=>r.text()).then(t=>window.blockedPost=t.includes('送信を停止')?1:-1).catch(e=>window.blockedPost=-2);",
                    "window.blockedPost=2;");
        }
        ClassLoader loader=activity.getClassLoader();
        Class<?> sessions=Class.forName("app.morphe.extension.chmate.BoardChallengeSession",true,loader);
        Method remember=sessions.getDeclaredMethod("remember",String.class,String.class);remember.setAccessible(true);
        token=(String)remember.invoke(null,BOARD,html);
        if(token.isEmpty())throw new AssertionError("Fixture page rejected");
        if(captcha){
            Class<?> hub=Class.forName("app.morphe.extension.chmate.ExternalBoardAuth",true,loader);
            Method launch=hub.getDeclaredMethod("openChallenge",Activity.class,String.class,String.class);
            launch.setAccessible(true);launch.invoke(null,activity,BOARD,token);
        }else activity.startActivity(new Intent(activity,Class.forName("app.morphe.extension.chmate.ExternalBoardAuthActivity",true,loader))
            .putExtra("board",BOARD).putExtra("challenge",token));
        return "STARTED offline Web Worker fixture";
    }
    public static boolean forgotten(Activity activity)throws Exception {
        Class<?> sessions=Class.forName("app.morphe.extension.chmate.BoardChallengeSession",true,activity.getClassLoader());
        Method find=sessions.getDeclaredMethod("find",String.class,String.class);find.setAccessible(true);
        return find.invoke(null,token,BOARD)==null;
    }
    public static int networkChecks(Activity activity)throws Exception {
        Class<?> type=activity.getClass();
        java.lang.reflect.Field field=type.getDeclaredField("web");field.setAccessible(true);
        WebView web=(WebView)field.get(activity);
        field=type.getDeclaredField("sendAllowed");field.setAccessible(true);
        java.util.concurrent.atomic.AtomicBoolean permission=(java.util.concurrent.atomic.AtomicBoolean)field.get(activity);
        boolean previous=permission.get();
        try {
            field=type.getDeclaredField("captchaDialog");field.setAccessible(true);
            if(previous!=field.getBoolean(activity))throw new AssertionError("Sending must default to CAPTCHA mode");
            permission.set(false);
            if(web.getWebViewClient().shouldInterceptRequest(web,new Request("https://fixture.invalid/test/bbs.cgi",true))==null)
                throw new AssertionError("Unapproved main-frame POST permitted");
            if(web.getWebViewClient().shouldInterceptRequest(web,new Request("https://fixture.invalid/test/bbs.cgi",false))==null)
                throw new AssertionError("Unapproved script POST permitted");
            permission.set(true);
            if(web.getWebViewClient().shouldInterceptRequest(web,new Request("https://fixture.invalid/test/bbs.cgi",true))!=null)
                throw new AssertionError("Approved same-origin POST blocked");
            if(web.getWebViewClient().shouldInterceptRequest(web,new Request("https://outside.invalid/test/bbs.cgi",true))==null)
                throw new AssertionError("Cross-origin POST permitted");
            return 4;
        } finally { permission.set(previous); }
    }
    public static int captchaChecks(Activity activity)throws Exception {
        Class<?> type=activity.getClass();
        java.lang.reflect.Field field=type.getDeclaredField("web");field.setAccessible(true);
        WebView web=(WebView)field.get(activity);
        field=type.getDeclaredField("captchaDialog");field.setAccessible(true);
        if(!field.getBoolean(activity))throw new AssertionError("CAPTCHA dialog mode missing");
        field=type.getDeclaredField("sendAllowed");field.setAccessible(true);
        if(!((java.util.concurrent.atomic.AtomicBoolean)field.get(activity)).get())throw new AssertionError("CAPTCHA sending is not ON");
        if(!android.webkit.CookieManager.getInstance().acceptThirdPartyCookies(web))throw new AssertionError("CAPTCHA cookies are not ON");
        android.util.TypedValue floating=new android.util.TypedValue();
        if(!activity.getTheme().resolveAttribute(android.R.attr.windowIsFloating,floating,true)||floating.data==0)
            throw new AssertionError("Activity is not a dialog window");
        android.view.WindowManager.LayoutParams params=activity.getWindow().getAttributes();
        if(params.height<=0||params.height>=activity.getResources().getDisplayMetrics().heightPixels)
            throw new AssertionError("CAPTCHA dialog is full screen");
        android.util.TypedValue translucent=new android.util.TypedValue();
        int manifestTheme=activity.getPackageManager().getActivityInfo(activity.getComponentName(),0).theme;
        android.view.ContextThemeWrapper manifestContext=new android.view.ContextThemeWrapper(activity,manifestTheme);
        if(!manifestContext.getTheme().resolveAttribute(android.R.attr.windowIsTranslucent,translucent,true)||translucent.data==0)
            throw new AssertionError("Dialog does not preserve its underlying Activity");
        if(!(activity.getWindow().getDecorView().getBackground() instanceof android.graphics.drawable.ColorDrawable)
                ||((android.graphics.drawable.ColorDrawable)activity.getWindow().getDecorView().getBackground()).getAlpha()!=0)
            throw new AssertionError("Dialog backdrop is not transparent");
        return 7;
    }
    static final class Request implements WebResourceRequest {
        final android.net.Uri url; final boolean main;
        Request(String url,boolean main){this.url=android.net.Uri.parse(url);this.main=main;}
        public android.net.Uri getUrl(){return url;}
        public boolean isForMainFrame(){return main;}
        public boolean isRedirect(){return false;}
        public boolean hasGesture(){return true;}
        public String getMethod(){return "POST";}
        public java.util.Map<String,String> getRequestHeaders(){return java.util.Collections.emptyMap();}
    }
}
