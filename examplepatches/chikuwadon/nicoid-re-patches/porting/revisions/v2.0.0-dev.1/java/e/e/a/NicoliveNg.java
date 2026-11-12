package e.e.a;
import android.content.*;import android.preference.PreferenceManager;import java.util.*;import org.json.*;
final class NicoliveNg {
 final SharedPreferences prefs;volatile Set<String> users=Collections.emptySet(),words=Collections.emptySet();
 NicoliveNg(Context c){prefs=PreferenceManager.getDefaultSharedPreferences(c);reload();}
 void reload(){HashSet<String> w=new HashSet<String>(prefs.getStringSet("nicolive_ng_words",Collections.<String>emptySet()));HashSet<String> u=new HashSet<String>(prefs.getStringSet("nicolive_ng_users",Collections.<String>emptySet()));
  try{JSONArray items=NgCommentData.items(prefs.getString("saveNGList","{}"));for(int i=0;i<items.length();i++){JSONObject item=items.optJSONObject(i);if(item==null)continue;String type=item.optString("type"),value=item.optString("source");if(value.length()==0)continue;if(type.equals("word"))w.add(value);else if(type.equals("id")&&value.matches("[0-9]+"))u.add("raw:"+value);}}catch(Exception ignored){}words=w;users=u;
 }
 boolean blocked(NicoliveData.Chat c){if(users.contains(c.user))return true;for(String w:words)if(!w.isEmpty()&&c.text.contains(w))return true;return false;}
 void addUser(String value){if(value==null||value.isEmpty())return;HashSet<String> all=new HashSet<String>(prefs.getStringSet("nicolive_ng_users",Collections.<String>emptySet()));all.add(value);prefs.edit().putStringSet("nicolive_ng_users",all).apply();reload();}
 void addWord(String value){if(value==null||value.trim().isEmpty())return;HashSet<String> all=new HashSet<String>(prefs.getStringSet("nicolive_ng_words",Collections.<String>emptySet()));all.add(value.trim());prefs.edit().putStringSet("nicolive_ng_words",all).apply();reload();}
 void clear(){prefs.edit().remove("nicolive_ng_words").remove("nicolive_ng_users").apply();reload();}
}
