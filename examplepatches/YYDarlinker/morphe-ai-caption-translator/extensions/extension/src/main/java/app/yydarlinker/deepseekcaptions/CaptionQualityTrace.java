package app.yydarlinker.deepseekcaptions;
import android.content.*;import org.json.*;
/** On-device, opt-in bounded evidence. Never stores an HTTP body, key, cookie or endpoint. */
final class CaptionQualityTrace {
    private static final String PREFS="caption_quality_evidence";
    private static final int MAX_RECORDS=6,MAX_CHARS=36_000;
    static synchronized void record(Context context,String key,long request,JSONObject source,String response,String metadata){
        if(context==null || !DeepSeekConfig.displayTextDebugEnabled(context))return;
        try {
            SharedPreferences p=context.getSharedPreferences(PREFS,Context.MODE_PRIVATE);
            JSONArray old=new JSONArray(p.getString("records","[]")),next=new JSONArray();
            JSONObject item=new JSONObject().put("at",System.currentTimeMillis()).put("request",request)
                    .put("settings",redact(metadata,key,700));
            if(source!=null)item.put("source",redact(source.toString(),key,12000));
            if(response!=null&&!response.isEmpty())item.put("response",redact(response,key,12000));
            if(item.toString().length()>MAX_CHARS){
                if(item.has("source"))item.put("source",redact(item.optString("source"),key,2400));
                if(item.has("response"))item.put("response",redact(item.optString("response"),key,2400));
                item.put("truncated",true);
            }
            next.put(item);int chars=item.toString().length();
            for(int i=0;i<old.length()&&next.length()<MAX_RECORDS;i++){
                JSONObject entry=old.optJSONObject(i);if(entry==null)continue;
                if(System.currentTimeMillis()-entry.optLong("at",0)>24*60*60*1000L)continue;
                int size=entry.toString().length();if(chars+size>MAX_CHARS)break;next.put(entry);chars+=size;
            }
            p.edit().putString("records",next.toString()).apply();
        }catch(Exception ignored){}
    }
    static String digest(String text){
        try{byte[] hash=java.security.MessageDigest.getInstance("SHA-256").digest((text==null?"":text).getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder out=new StringBuilder();for(byte v:hash)out.append(String.format(java.util.Locale.ROOT,"%02x",v&255));return out.toString();
        }catch(java.security.NoSuchAlgorithmException impossible){return "unavailable";}
    }
    static String redact(String value,String key,int limit){
        String text=(value==null?"":value).replace("\\/","/");
        if(key!=null&&!key.isEmpty()){
            text=text.replace(key,"[redacted]");
            String escaped=JSONObject.quote(key);if(escaped.length()>2)text=text.replace(escaped.substring(1,escaped.length()-1),"[redacted]");
        }
        text=text.replaceAll("(?i)https?://[^\\s\\\"<>]+","[URL redacted]")
                .replaceAll("(?i)(bearer\\s+|sk-)[A-Za-z0-9_.-]{8,}","[credential redacted]");
        return text.length()<=limit?text:text.substring(0,limit)+" [truncated]";
    }
    static synchronized String text(Context c){
        if(c==null||!DeepSeekConfig.displayTextDebugEnabled(c))return "";
        try{JSONArray old=new JSONArray(c.getSharedPreferences(PREFS,Context.MODE_PRIVATE).getString("records","[]"));
            JSONArray keep=new JSONArray();for(int i=0;i<old.length();i++){
                JSONObject row=old.optJSONObject(i);if(row!=null&&System.currentTimeMillis()-row.optLong("at",0)<=24*60*60*1000L)keep.put(row);
            }
            if(keep.length()!=old.length())c.getSharedPreferences(PREFS,Context.MODE_PRIVATE).edit().putString("records",keep.toString()).apply();
            return keep.length()==0?"":"\n\n[Quality evidence / local, opt-in, bounded, 24h]\n"+keep.toString(2);
        }catch(Exception ignored){return "";}
    }
    static synchronized void clear(Context c){if(c!=null)c.getSharedPreferences(PREFS,Context.MODE_PRIVATE).edit().clear().apply();}
}
