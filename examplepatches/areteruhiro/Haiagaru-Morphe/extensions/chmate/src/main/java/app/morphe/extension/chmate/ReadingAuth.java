package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.webkit.CookieManager;
import java.util.ArrayList;
import java.util.List;

/** Explicit browser session for Edge reading; never shares posting identity cookies. */
public final class ReadingAuth {
    private static final String PREFS="haiagaru_reading_auth";
    private static final java.util.Map<android.webkit.WebView,android.webkit.WebViewClient> CLIENTS=new java.util.WeakHashMap<>();
    public static void setChallengeClient(android.webkit.WebView web,android.webkit.WebViewClient client){
        CLIENTS.put(web,client);web.setWebViewClient(client);
    }
    static boolean eligible(String url){
        try{return "https".equals(java.net.URI.create(url).getScheme())&&"bbs.eddibb.cc".equals(java.net.URI.create(url).getHost())&&ViewingUserAgentRules.reading(url,"GET");}
        catch(Exception invalid){return false;}
    }
    static void open(Activity a,String url){
        if(!eligible(url))return;
        a.startActivity(new Intent(a,ExternalBoardAuthActivity.class).putExtra("board",url).putExtra("auth",ReadingAuthRules.page(url)).putExtra("reading",true));
    }
    /** Called only at ChMate's native Cloudflare dialog boundary. Other sites retain the original call. */
    public static void loadChallenge(android.webkit.WebView web,String url){
        android.webkit.WebViewClient client=CLIENTS.remove(web);
        if(eligible(url)){
            web.getSettings().setUserAgentString(android.webkit.WebSettings.getDefaultUserAgent(web.getContext()));
            web.getSettings().setJavaScriptEnabled(true);
            web.getSettings().setDomStorageEnabled(true);
            CookieManager.getInstance().setAcceptCookie(true);
            url=ReadingAuthRules.page(url);
            if(client!=null)web.setWebViewClient(new ReadingChallengeClient(web,client));
        }
        web.loadUrl(url);
    }
    /** Save the browser identity before the native callback imports clearance and closes the dialog. */
    public static void challengeFinished(android.webkit.WebView web,String url){
        if(web!=null&&ReadingAuthRules.isPage(url)&&hasClearance(url)){
            CookieManager.getInstance().flush();
            complete(web.getContext(),web.getSettings().getUserAgentString());
        }
    }
    static void complete(Context c,String ua){
        if(ViewingUserAgentRules.valid(ua))c.getSharedPreferences(PREFS,0).edit().putString("agent",ua).apply();
    }
    static void clear(Context c){c.getSharedPreferences(PREFS,0).edit().clear().apply();}
    static boolean hasClearance(String url){
        String header=CookieManager.getInstance().getCookie(url);
        return header!=null&&java.util.regex.Pattern.compile("(?:^|;\\s*)cf_clearance=[^;\\s]+").matcher(header).find();
    }
    static String agent(String url,String method){
        Context c=Haiagaru.applicationContextForExtension();
        if(c==null||!eligible(url)||!ViewingUserAgentRules.reading(url,method))return null;
        String ua=c.getSharedPreferences(PREFS,0).getString("agent",null);
        return ViewingUserAgentRules.valid(ua)?ua:null;
    }
    static String clearance(String url){
        if(agent(url,"GET")==null)return null;
        String header=CookieManager.getInstance().getCookie(url);if(header==null)return null;
        for(String pair:header.split(";"))if(pair.trim().startsWith("cf_clearance="))return pair.trim();
        return null;
    }
    static List<?> cookies(List<?> original,Object url){
        if(url==null)return original;
        try{
            String pair=clearance(url.toString());if(pair==null)return original;
            Object parsed=ExternalBoardAuth.parseCookie(url,pair+"; Path=/; Secure");if(parsed==null)return original;
            ArrayList<Object> result=new ArrayList<>();
            for(Object cookie:original)if(!cookie.toString().startsWith("cf_clearance="))result.add(cookie);
            result.add(parsed);return result;
        }catch(RuntimeException error){return original;}
    }
    private ReadingAuth(){}
}
