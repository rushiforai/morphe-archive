package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import android.content.SharedPreferences;
import java.util.*;
import java.lang.ref.WeakReference;
import org.json.*;
/** Profile identity is a stable UUID, never a user label or a server hostname. */
final class ApiProfiles {
    static final Object LOCK=new Object();
    static final String LEGACY="default";
    private static boolean flushing;
    private static volatile long revision;
    static long revision(){return revision;}
    static boolean flushing(){return flushing;}
    interface Editor { boolean flushProfile(); void profileChanged(); }
    private static final List<WeakReference<Editor>> editors=new ArrayList<>();
    static void register(Editor editor){synchronized(LOCK){editors.removeIf(r->r.get()==null || r.get()==editor);editors.add(new WeakReference<>(editor));}}
    static void unregister(Editor editor){synchronized(LOCK){editors.removeIf(r->r.get()==null || r.get()==editor);}}
    private static boolean usable(Editor editor){
        if(!(editor instanceof android.preference.Preference))return true;
        Context c=((android.preference.Preference)editor).getContext();
        while(c instanceof android.content.ContextWrapper){
            if(c instanceof android.app.Activity){android.app.Activity a=(android.app.Activity)c;return !a.isFinishing()&&!a.isDestroyed();}
            Context base=((android.content.ContextWrapper)c).getBaseContext();if(base==c)break;c=base;
        }
        return true;
    }
    private static SharedPreferences index(Context c){return c.getSharedPreferences("caption_api_profiles",Context.MODE_PRIVATE);}
    static String active(Context c){synchronized(LOCK){return index(c).getString("active",LEGACY);}}
    static SharedPreferences values(Context c,String id){return c.getSharedPreferences(LEGACY.equals(id)?"deepseek_caption_translator":"caption_profile_"+id,Context.MODE_PRIVATE);}
    static SharedPreferences values(Context c){return values(c,active(c));}
    static LinkedHashMap<String,String> list(Context c){synchronized(LOCK){
        LinkedHashMap<String,String> result=new LinkedHashMap<>();if(!index(c).getBoolean("legacy_deleted",false))result.put(LEGACY,CaptionStrings.settings(c,"profile_default"));
        String data=index(c).getString("names","{}");
        try{JSONObject o=new JSONObject(data);Iterator<String> keys=o.keys();while(keys.hasNext()){String id=keys.next();result.put(id,o.getString(id));}}
        catch(JSONException invalid){throw new IllegalStateException("Invalid saved API profiles",invalid);}
        return result;
    }}
    static void rename(Context c,String id,String name){synchronized(LOCK){
        String n=name==null?"":name.trim();if(n.isEmpty()||n.length()>60)throw new IllegalArgumentException(CaptionStrings.settings(c,"profile_name_error"));
        if(!list(c).containsKey(id))throw new IllegalArgumentException("Unknown API profile");
        try{JSONObject names=new JSONObject(index(c).getString("names","{}"));names.put(id,n);index(c).edit().putString("names",names.toString()).apply();}
        catch(JSONException invalid){throw new IllegalStateException("Invalid API profiles",invalid);}
    }}
    static String create(Context c,String name,String base){synchronized(LOCK){
        String n=name==null?"":name.trim();if(n.isEmpty()||n.length()>60)throw new IllegalArgumentException(CaptionStrings.settings(c,"profile_name_error"));
        if(list(c).size()>=30)throw new IllegalStateException(CaptionStrings.settings(c,"profile_limit"));
        String endpoint=ProviderEndpoint.validate(base);String id=UUID.randomUUID().toString();
        // New profiles deliberately do NOT copy the active API key or model.
        values(c,id).edit().putString("base_url",endpoint).putString("model","").apply();
        try{JSONObject names=new JSONObject(index(c).getString("names","{}"));names.put(id,n);index(c).edit().putString("names",names.toString()).apply();}
        catch(JSONException invalid){throw new IllegalStateException("Invalid API profiles",invalid);}
        return id;
    }}
    private static List<Editor> liveEditors(){
        List<Editor> live=new ArrayList<>();synchronized(LOCK){for(WeakReference<Editor> ref:editors){Editor e=ref.get();if(e!=null && usable(e))live.add(e);}}return live;
    }
    static boolean flushCurrent(){return flushCurrent(false);}
    static boolean flushExceptKey(){return flushCurrent(true);}
    private static boolean flushCurrent(boolean skipKey){
        flushing=true;
        try{for(Editor e:liveEditors()){
            if(skipKey && e instanceof android.preference.Preference && DeepSeekTextPreference.KEY_API_KEY.equals(((android.preference.Preference)e).getKey()))continue;
            if(!e.flushProfile())return false;
        }return true;}finally{flushing=false;}
    }
    static boolean select(Context c,String id){
        synchronized(LOCK){if(!list(c).containsKey(id))throw new IllegalArgumentException("Unknown API profile");if(id.equals(active(c)))return true;}
        // UI caller flushes edits while the old profile is still active; reject invalid input.
        if(!flushCurrent())return false;
        synchronized(LOCK){index(c).edit().putString("active",id).apply();}
        changed(c);
        return true;
    }
    static void changed(Context c) {
        synchronized(LOCK){revision++;}
        for(Editor e:liveEditors())e.profileChanged();
        DeepSeekModelPreference.onCredentialsChanged(c);
        ContextualBatchApiClient.resetRejection();
        DynamicCaptionController.refreshConfiguration(c);
    }

    /** Confirmation is handled by the UI. Delete only this profile, never global caption settings. */
    static void delete(Context c, String id) {
        boolean activeDeleted;
        synchronized (LOCK) {
            LinkedHashMap<String,String> saved = list(c);
            if (!saved.containsKey(id)) throw new IllegalArgumentException("Unknown API profile");
            if (saved.size() <= 1) throw new IllegalStateException(CaptionStrings.settings(c,"profile_keep_one"));
            activeDeleted = id.equals(active(c));
            saved.remove(id);
            try {
                JSONObject names = new JSONObject(index(c).getString("names","{}"));
                names.remove(id);
                SharedPreferences.Editor edit = index(c).edit().putString("names",names.toString());
                if (LEGACY.equals(id)) edit.putBoolean("legacy_deleted",true);
                if (activeDeleted) edit.putString("active",saved.keySet().iterator().next());
                edit.apply();
            } catch (JSONException invalid) { throw new IllegalStateException("Invalid API profiles",invalid); }
            SecureApiKey.clear(c,id);
            if (LEGACY.equals(id)) {
                // Legacy profile shares a store with engine, style and caption-menu preferences.
                values(c,id).edit().remove("base_url").remove("model").remove("prompt").apply();
            } else values(c,id).edit().clear().apply();
        }
        // Invalid/unsaved edits in a deleted profile must not be flushed back into it.
        if (activeDeleted) changed(c);
    }

    static void clearKey(Context c, String id) {
        synchronized (LOCK) {
            if (!list(c).containsKey(id)) return; // A stale confirmation must not touch another profile.
            SecureApiKey.clear(c,id);
        }
        if (id.equals(active(c))) changed(c);
    }
}
