/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;
import java.util.Locale;
import app.morphe.extension.shared.theme.ThemeUtils;

/** Private preferences shared by both editions; no service token is exposed to the renderer. */
public final class LyricsConfig {
    private LyricsConfig(){}
    public static SharedPreferences preferences(Context c){return c.getSharedPreferences("bdcrusher_better_lyrics",Context.MODE_PRIVATE);}
    static JSONObject catalog(Context c){
        try(var in=c.getAssets().open("bdcrusher-lyrics/providers.json")){
            java.io.ByteArrayOutputStream out=new java.io.ByteArrayOutputStream();byte[] b=new byte[4096];int n;
            while((n=in.read(b))!=-1)out.write(b,0,n);
            return new JSONObject(out.toString("UTF-8"));
        }catch(Exception ex){throw new IllegalStateException("Missing Better Lyrics provider catalog",ex);}
    }
    static JSONArray order(Context c){
        SharedPreferences p=preferences(c);JSONArray result=new JSONArray();java.util.LinkedHashSet<String> ids=new java.util.LinkedHashSet<>();
        if(p.getInt("catalogSchema",0)>=2)for(String id:p.getString("priority","").split(","))if(!id.isEmpty())ids.add(id);
        JSONArray defaults=catalog(c).optJSONArray("providers");for(int i=0;i<defaults.length();i++)ids.add(defaults.optJSONObject(i).optString("key"));
        for(String id:ids)result.put(id);return result;
    }
    static boolean enabled(Context c,String... keys){
        try{JSONArray disabled=new JSONArray(preferences(c).getString("disabled","[]"));java.util.Set<String> off=new java.util.HashSet<>();for(int i=0;i<disabled.length();i++)off.add(disabled.optString(i));for(String key:keys)if(!off.contains(key))return true;return false;}
        catch(JSONException invalid){return true;}
    }
    static boolean brokerEnabled(Context c){return enabled(c,"bLyrics-richsynced","bLyrics-synced","binimum-richsynced","binimum-synced","portato-richsynced","musixmatch-richsync","musixmatch-synced","legato-synced","lrclib-synced","lrclib-plain");}
    public static JSONObject read(Context c){
        SharedPreferences p=preferences(c);JSONObject r=new JSONObject(),agents=new JSONObject();
        try{
            for(String a:new String[]{"v1","v2","v3","v1000"}){String v=p.getString(a,"auto");if(!"auto".equals(v))agents.put(a,v);}
            for(String e:p.getString("extraAgents","").split(",")){String[] pair=e.trim().split("=");if(pair.length==2&&pair[0].trim().matches("v[0-9]+")&&java.util.Arrays.asList("left","center","right").contains(pair[1].trim()))agents.put(pair[0].trim(),pair[1].trim());}
            r.put("agents",agents).put("fontSize",p.getInt("fontSize",28)).put("letterWave",p.getBoolean("letterWave",true))
             .put("wordSync",p.getBoolean("wordSync",true)).put("background",p.getBoolean("background",true))
             .put("bgSize",p.getInt("bgSize",65)/100.0).put("bgOpacity",p.getInt("bgOpacity",70)/100.0)
             .put("bgAlignment",p.getString("backgroundAlignment","auto")).put("translation",p.getBoolean("translation",false))
             .put("romanization",p.getBoolean("romanization",false)).put("language",p.getString("language",Locale.getDefault().getLanguage()))
             .put("passive",p.getBoolean("passive",false)).put("tapSeek",p.getBoolean("tapSeek",true))
             .put("reducedMotion",p.getBoolean("reducedMotion",false)).put("dockCollapsed",p.getBoolean("dockCollapsed",false))
             .put("priority",order(c)).put("disabled",new JSONArray(p.getString("disabled","[]")))
             .put("textColor",String.format(Locale.ROOT,"#%06x",ThemeUtils.getAppForegroundColor()&0xffffff));
        }catch(Exception ex){throw new IllegalStateException("Invalid personal lyric configuration",ex);}
        return r;
    }
    public static void show(Context c){
        Intent intent=new Intent(Intent.ACTION_VIEW,Uri.parse("morphe_settings_intent"));
        intent.setClassName(c.getPackageName(),"com.google.android.gms.common.api.GoogleApiActivity");
        intent.putExtra("bdcrusher_open_lyrics",true);intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);c.startActivity(intent);
    }
}
