package e.e.a;
import android.os.Bundle;import java.util.*;import org.json.JSONObject;
/** Match the existing cache list's metadata keys without starting any network request. */
public final class CacheTitles117 {
 static final LinkedHashMap<String,String> TITLES=new LinkedHashMap<String,String>(64,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,String> e){return size()>256;}};
 static String title(JSONObject data,String id){for(String key:new String[]{"videoTitle","title"}){String value=data.optString(key,"").trim();if(!value.isEmpty()&&!"null".equals(value)&&!value.equals(id))return value;}return id;}
 static synchronized void remember(String id,String title){if(id!=null&&title!=null&&!title.trim().isEmpty()&&!title.equals(id)&&!title.equals("null"))TITLES.put(id,title);}
 static synchronized String known(String id){String s=TITLES.get(id);return s==null?id:s;}
 public static void bundle(Object value){if(!(value instanceof Bundle))return;Bundle b=(Bundle)value;String id=HistoryRules.id(b.getString("videoId",b.getString("id","")));String title=b.getString("videoTitle","");if(title.trim().isEmpty()||"null".equals(title))title=b.getString("title","");if(id==null||!id.matches("(?:sm|so|nm|ss)?[0-9]+"))try{id=String.valueOf(Class.forName("com.sauzask.nicoid.NicoidDownloadCache").getField("t").get(null));}catch(Exception ignored){}remember(id,title);}
}
