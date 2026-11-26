package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;

/** Latest attempt only. Fixed enums and numeric metadata, never URL, body,
 * cookie, headers, account identifiers, or exception messages. */
final class MebukiPostDiagnostic {
    private static final String STORE="futatabi_mebuki_post_diagnostic";
    enum Stage { VALIDATION, BEFORE_READ, BEFORE_FAILED, SESSION_CHANGED, SEND,
        RESPONSE, AFTER_READ, AFTER_FAILED, FINISHED }
    enum CookieScope { SAVED_ONLY, WEBVIEW_ROOT_CHANGED, ACTION_SAME, ACTION_SCOPED, ACTION_UNAVAILABLE }
    enum Read { NOT_ATTEMPTED, OK, NOT_SAVED, ANONYMOUS, UNVERIFIED, HTTP_401, HTTP_403,
        HTTP_OTHER, UNSUPPORTED_FORMAT, TRANSPORT }
    private final SharedPreferences prefs;
    Stage stage=Stage.VALIDATION;
    CookieScope scope=CookieScope.SAVED_ONLY;
    Read before=Read.NOT_ATTEMPTED,after=Read.NOT_ATTEMPTED;
    MebukiActionResponse.Kind kind=MebukiActionResponse.Kind.NOT_RECEIVED;
    MebukiThreadData.Match match=MebukiThreadData.Match.NOT_CHECKED;
    int status=0, beforeCount=-1, afterCount=-1;
    boolean router, setCookie, confirmed, webViewUa;
    MebukiPostDiagnostic(Context c){prefs=c.getSharedPreferences(STORE,Context.MODE_PRIVATE);save();}
    void save(){
        prefs.edit().clear().putLong("time",System.currentTimeMillis()).putString("stage",stage.name())
            .putString("scope",scope.name()).putString("before",before.name()).putString("after",after.name())
            .putString("response",kind.name()).putString("match",match.name()).putInt("http",status)
            .putInt("beforeCount",beforeCount).putInt("afterCount",afterCount)
            .putBoolean("webViewUa",webViewUa).putBoolean("router",router).putBoolean("setCookie",setCookie).putBoolean("confirmed",confirmed).commit();
    }
    static Read readFailure(Exception e){
        if(!(e instanceof MebukiSession.ReadFailure))return Read.TRANSPORT;
        String reason=e.getMessage();
        if("UNSUPPORTED_THREAD_FORMAT".equals(reason))return Read.UNSUPPORTED_FORMAT;
        if("HTTP 401".equals(reason))return Read.HTTP_401;
        if("HTTP 403".equals(reason))return Read.HTTP_403;
        if(reason!=null&&reason.startsWith("HTTP "))return Read.HTTP_OTHER;
        try{return Read.valueOf(reason);}catch(Exception ignored){return Read.TRANSPORT;}
    }
    static String report(Context c){
        SharedPreferences p=c.getSharedPreferences(STORE,Context.MODE_PRIVATE);
        if(!p.contains("time"))return "\u6295\u7a3f\u5c65\u6b74\u306a\u3057";
        return "\u6700\u7d42\u6295\u7a3f: "+new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss",java.util.Locale.JAPAN).format(new java.util.Date(p.getLong("time",0)))
            +"\nStage: "+p.getString("stage","")+"\nCookie scope: "+p.getString("scope","")
            +"\nBefore read: "+p.getString("before","")+" / "+p.getInt("beforeCount",-1)
            +"\nUpstream HTTP: "+(p.getInt("http",0)==0?"not received":p.getInt("http",0))
            +"\nResponse: "+p.getString("response","")+"\nWebView UA: "+p.getBoolean("webViewUa",false)+"\nRouter marker: "+p.getBoolean("router",false)
            +"\nSet-Cookie present: "+p.getBoolean("setCookie",false)
            +"\nAfter read: "+p.getString("after","")+" / "+p.getInt("afterCount",-1)
            +"\nMatch: "+p.getString("match","")+"\nConfirmed: "+p.getBoolean("confirmed",false);
    }
}
