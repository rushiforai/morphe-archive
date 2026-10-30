// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** "Send to car" trips and shared places arrive as maps.app.goo.gl short links. Maps expands
 * them through Firebase Dynamic Links in Play services; MicroG-RE's replacement fails
 * ("requestLinkResponse failed") and Maps drops the route without a message. The short link is a
 * plain HTTPS redirect to www.google.com/maps/..., which Maps' own intent handler opens. Resolve the
 * redirect here and deliver the same intent (extras, send-to-car token, flags) with the long URL.
 * Only a redirect to a Google Maps URL is used; anything else falls back to Maps' own resolver. */
public final class ShortLinks {
    static final String TAG="MapsShortLink";
    static final String RESOLVED="local.maps.cluster.SHORT_LINK_RESOLVED";
    static final String ACTIVITY="com.google.android.maps.MapsActivity";
    static final int TIMEOUT_MS=6000;
    private static final ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsShortLink");t.setDaemon(true);return t;});
    private static final Handler main=new Handler(Looper.getMainLooper());

    /** Called first in Maps' legacy intent processor (hyk.b, main thread). True = handled here. */
    public static boolean intercept(Intent intent){
        try{
            if(intent==null||intent.getBooleanExtra(RESOLVED,false))return false;
            Uri link=intent.getData();
            Context context=MicrogProvider.context();
            if(!isShortLink(link)||context==null)return false;
            Intent copy=new Intent(intent);
            worker.execute(()->{
                String[] result=resolve(link.toString());
                main.post(()->deliver(context,copy,result[0],result[1]));
            });
            return true;
        }catch(Throwable ignored){return false;}
    }
    static boolean isShortLink(Uri u){
        if(u==null||!"https".equalsIgnoreCase(u.getScheme()))return false;
        String host=u.getHost(),path=u.getPath();
        return host!=null&&host.toLowerCase(Locale.ROOT).equals("maps.app.goo.gl")&&path!=null&&path.length()>1;
    }
    /** https://www.google.<tld>/maps..., https://google.<tld>/maps... or https://maps.google.<tld>/... */
    static boolean isMapsUrl(String value){
        try{
            Uri u=Uri.parse(value);
            String host=u.getHost(),path=u.getPath()==null?"":u.getPath();
            if(!"https".equalsIgnoreCase(u.getScheme())||host==null)return false;
            host=host.toLowerCase(Locale.ROOT);
            if(host.startsWith("maps.google."))return googleTld(host.substring("maps.google.".length()));
            if(host.startsWith("www."))host=host.substring(4);
            return host.startsWith("google.")&&googleTld(host.substring("google.".length()))&&(path.equals("/maps")||path.startsWith("/maps/"));
        }catch(RuntimeException e){return false;}
    }
    /** com, de, co.uk, com.ua, ...: one or two short alphabetic labels. */
    static boolean googleTld(String tld){return tld.matches("[a-z]{2,3}(\\.[a-z]{2,3})?");}
    /** Pauses before each retry. A link created by the phone a moment ago answered HTTP 404 on the
     * car (BYD Tang, 26 Oct 2026) and resolved a few seconds later; network errors are retried too. */
    static long[] RETRY_DELAYS_MS={1000,2000,4000};
    /** {Maps URL or null, failure reason or null}. A fresh connection per attempt. */
    static String[] resolve(String link){
        String reason=null;
        for(int attempt=0;;attempt++){
            HttpURLConnection c=null;boolean retry;
            try{
                c=(HttpURLConnection)new URL(link).openConnection();
                c.setInstanceFollowRedirects(false);c.setUseCaches(false);c.setRequestProperty("Connection","close");
                c.setConnectTimeout(TIMEOUT_MS);c.setReadTimeout(TIMEOUT_MS);c.setRequestMethod("GET");
                int code=c.getResponseCode();String location=c.getHeaderField("Location");
                if(code>=300&&code<400&&location!=null)return isMapsUrl(location)?new String[]{location,null}:new String[]{null,"redirect to a non-Maps URL"};
                reason=(reason==null?"":reason+" then ")+"HTTP "+code;
                retry=code==404||code==408||code==429||code>=500;
            }catch(Throwable e){reason=(reason==null?"":reason+" then ")+e.getClass().getSimpleName();retry=true;}
            finally{if(c!=null)c.disconnect();}
            if(!retry||attempt>=RETRY_DELAYS_MS.length)return new String[]{null,reason};
            try{Thread.sleep(RETRY_DELAYS_MS[attempt]);}catch(InterruptedException e){Thread.currentThread().interrupt();return new String[]{null,reason};}
        }
    }
    static void deliver(Context context,Intent copy,String target){deliver(context,copy,target,null);}
    static void deliver(Context context,Intent copy,String target,String reason){
        try{
            copy.putExtra(RESOLVED,true);
            if(target!=null)copy.setData(Uri.parse(target));
            if(copy.getComponent()==null)copy.setClassName(context,ACTIVITY);
            copy.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            android.util.Log.i(TAG,target!=null?"short link expanded; delivering the Maps URL":"short link not expanded ("+(reason==null?"unknown":reason)+"); Maps' own resolver is used");
            context.startActivity(copy);
        }catch(Throwable e){android.util.Log.w(TAG,"short link delivery failed: "+e.getClass().getSimpleName());}
    }
    private ShortLinks(){}
}
