/* Copyright 2026 BDCrusher. GPL-3.0. Normal ALTCHA verification from Shaders 1.5.1. */
package app.bdcrusher.ytmusic.shaders;
import android.content.Context;
import android.os.*;
import android.util.Base64;
import org.json.*;

final class ArtworkToken {
    private static JSONObject challenge;
    private static int id;
    private static boolean pending;
    private static long retryAt;
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static Runnable renewal;
    private ArtworkToken(){}
    private static JSONObject claims(String token){try{String[] parts=token.split("\\.");if(parts.length!=3)return null;return new JSONObject(new String(Base64.decode(parts[1],Base64.URL_SAFE),java.nio.charset.StandardCharsets.UTF_8));}catch(Exception invalid){return null;}}
    static String usable(Context c){String token=ArtworkRepository.preferences(c).getString("artworkToken","");JSONObject claims=claims(token);return claims!=null&&claims.optDouble("exp")>System.currentTimeMillis()/1000.0?token:null;}
    static synchronized void ensure(Context context){
        Context c=context.getApplicationContext();String token=usable(c);JSONObject metadata=token==null?null:claims(token);double now=System.currentTimeMillis()/1000.0;
        if(metadata!=null){double exp=metadata.optDouble("exp"),iat=metadata.optDouble("iat",0),refreshAt=iat>0&&iat<exp?iat+(exp-iat)*.8:exp-600;if(now<refreshAt){schedule(c,(long)((refreshAt-now)*1000));return;}}
        if(!ShaderRuntime.active()){schedule(c,60000);return;}
        if(pending||SystemClock.elapsedRealtime()<retryAt)return;
        pending=true;int expected=++id;retryAt=SystemClock.elapsedRealtime()+300000;
        ArtworkRepository.io.execute(()->{try{JSONObject next=ArtworkRepository.request(ArtworkRepository.API+"/challenge","GET",null,null);synchronized(ArtworkToken.class){if(expected!=id)return;challenge=next;}
            new Handler(Looper.getMainLooper()).post(()->{if(!ShaderRuntime.requestProof(expected,next)){finish(expected);schedule(c,300000);}});
        }catch(Exception failure){finish(expected);schedule(c,300000);}});
        new Handler(Looper.getMainLooper()).postDelayed(()->{boolean stalled;synchronized(ArtworkToken.class){stalled=pending&&id==expected;}finish(expected);if(stalled)schedule(c,300000);},125000);
    }
    private static synchronized void schedule(Context c,long delay){if(renewal!=null)main.removeCallbacks(renewal);renewal=()->ensure(c);main.postDelayed(renewal,Math.max(1000,delay));}
    private static synchronized void finish(int expected){if(expected==id){pending=false;challenge=null;}}
    static void proof(Context context,int expected,String value){
        final JSONObject original;
        synchronized(ArtworkToken.class){if(!pending||expected!=id||challenge==null)return;original=challenge;challenge=null;}
        if(value==null||value.isEmpty()||value.length()>128*1024){finish(expected);schedule(context.getApplicationContext(),300000);return;}
        Context c=context.getApplicationContext();ArtworkRepository.io.execute(()->{boolean minted=false;try{
            JSONObject body=new JSONObject().put("challenge",original).put("solution",new JSONObject(value));JSONObject response=ArtworkRepository.request(ArtworkRepository.API+"/mint","POST",body,null);
            String token=response.optString("token");JSONObject metadata=claims(token);if(metadata!=null&&metadata.optDouble("exp")>System.currentTimeMillis()/1000.0){ArtworkRepository.preferences(c).edit().putString("artworkToken",token).apply();minted=true;}
        }catch(Exception ignored){}finally{finish(expected);if(minted)main.post(()->ensure(c));else schedule(c,300000);}});
    }
}
