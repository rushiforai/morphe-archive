package app.morphe.extension.chmate;

import org.json.JSONArray;
import org.json.JSONObject;

/** 191 requires metadata fields omitted by newer toolbar serializers. */
public final class ToolbarSettingsCompat {
    public static String for191(String source){
        if(source==null||source.isEmpty()||source.length()>524288)return source;
        try{
            JSONObject root=new JSONObject(source);JSONArray buttons=root.optJSONArray("buttons");
            if(buttons==null)return source;
            boolean changed=false;
            for(int i=0;i<buttons.length();i++){
                JSONObject item=buttons.optJSONObject(i);if(item==null||!item.has("id"))continue;
                // Native merge matches IDs against this version's defaults and restores
                // its resource metadata. Keep saved ordering, visibility and intents.
                for(String key:new String[]{"icon","text","summary"})if(!item.has(key)){item.put(key,0);changed=true;}
            }
            return changed?root.toString():source;
        }catch(Exception invalid){return source;}
    }
    private ToolbarSettingsCompat(){}
}
