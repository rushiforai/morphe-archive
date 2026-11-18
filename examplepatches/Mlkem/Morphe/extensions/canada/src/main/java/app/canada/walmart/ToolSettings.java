package app.canada.walmart;
import android.content.*;
/** Only local patch preferences; never modifies Walmart account settings. */
final class ToolSettings {
 static SharedPreferences prefs(Context c){return c.getSharedPreferences("walmart_canada_tools_v1",Context.MODE_PRIVATE);}
 static boolean enabled(Context c,String key){return prefs(c).getBoolean(key,true);}
 static void set(Context c,String key,boolean value){prefs(c).edit().putBoolean(key,value).apply();}
 static boolean record(Context c,boolean browse){return enabled(c,"record")&&enabled(c,browse?"record_browse":"record_lists");}
}
