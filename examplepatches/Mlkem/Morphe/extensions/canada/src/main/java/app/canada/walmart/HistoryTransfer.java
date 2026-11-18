package app.canada.walmart;
import android.content.*;import org.json.*;import java.util.*;import java.text.SimpleDateFormat;
/** Explicit user-driven backup/export. Imports validate everything before writing. */
final class HistoryTransfer {
 static List<PriceLedger.Point> points(Context c,String key){return PriceLedger.decode(HistoryStore.data(c).getString(key,""));}
 static String json(Context c)throws JSONException {
  JSONArray items=new JSONArray();SharedPreferences m=HistoryStore.meta(c);
  for(String k:HistoryStore.keys(c)){
   JSONObject item=new JSONObject().put("key",k).put("name",m.getString(k+"_name","Previously saved item")).put("scope",m.getString(k+"_scope","Store not identified")).put("seller",m.getString(k+"_seller","")).put("favorite",m.getBoolean(k+"_favorite",false)).put("targetCents",m.getLong(k+"_target",-1));
   JSONArray rows=new JSONArray();for(PriceLedger.Point p:points(c,k))rows.put(new JSONArray().put(p.time).put(p.cents));items.put(item.put("points",rows));
  }
  return new JSONObject().put("format","walmart-canada-price-history").put("version",1).put("currency","CAD").put("items",items).toString(2);
 }
 static String bounded(JSONObject o,String key,String fallback)throws JSONException {String s=o.optString(key,fallback);if(s.length()>600)throw new JSONException("Text field is too long");return s;}
 static long integer(Object o)throws JSONException {if(!(o instanceof Integer)&&!(o instanceof Long))throw new JSONException("Expected a whole-number timestamp or cents amount");return ((Number)o).longValue();}
 static int merge(Context c,String input)throws JSONException {
  if(input.length()>524288)throw new JSONException("Backup exceeds 512 KiB");JSONObject root=new JSONObject(input);
  if(!root.optString("format").equals("walmart-canada-price-history")||root.optInt("version")!=1||!root.optString("currency").equals("CAD"))throw new JSONException("Unsupported backup format");
  JSONArray items=root.getJSONArray("items");if(items.length()>128)throw new JSONException("Too many histories");Set<String> seen=new HashSet<>();List<JSONObject> valid=new ArrayList<>();
  for(int i=0;i<items.length();i++){
   JSONObject item=items.getJSONObject(i);String k=item.getString("key");if(!k.matches("p_[A-Za-z0-9_]{1,80}")||!seen.add(k))throw new JSONException("Invalid or duplicate history key");
   bounded(item,"name","Previously saved item");bounded(item,"scope","Store not identified");bounded(item,"seller","");
   long target=integer(item.has("targetCents")?item.get("targetCents"):-1);if(target< -1||target>100000000)throw new JSONException("Invalid target price");
   JSONArray rows=item.getJSONArray("points");if(rows.length()==0||rows.length()>30)throw new JSONException("Use 1 to 30 observations per history");
   for(int j=0;j<rows.length();j++){JSONArray p=rows.getJSONArray(j);if(p.length()!=2)throw new JSONException("Invalid observation");long time=integer(p.get(0)),cents=integer(p.get(1));if(time<=0||time>4102444800000L||cents<0||cents>100000000)throw new JSONException("Invalid observation");}
   valid.add(item);
  }
  Set<String> all=new HashSet<>(HistoryStore.keys(c));all.addAll(seen);if(all.size()>128)throw new JSONException("Merge would exceed 128 histories. Remove some histories first.");
  SharedPreferences.Editor data=HistoryStore.data(c).edit(),meta=HistoryStore.meta(c).edit();
  for(JSONObject item:valid){String k=item.getString("key");TreeMap<Long,Long> merged=new TreeMap<>();JSONArray rows=item.getJSONArray("points");for(int j=0;j<rows.length();j++){JSONArray p=rows.getJSONArray(j);merged.put(p.getLong(0),p.getLong(1));}
   for(PriceLedger.Point p:points(c,k))merged.put(p.time,p.cents);while(merged.size()>30)merged.pollFirstEntry();List<PriceLedger.Point> out=new ArrayList<>();for(Map.Entry<Long,Long> e:merged.entrySet())out.add(new PriceLedger.Point(e.getKey(),e.getValue()));data.putString(k,PriceLedger.encode(out));
   // Existing watch settings take precedence; importing a backup cannot erase them.
   boolean existing=HistoryStore.data(c).contains(k);meta.putString(k+"_name",bounded(item,"name","Previously saved item")).putString(k+"_scope",bounded(item,"scope","Store not identified")).putString(k+"_seller",bounded(item,"seller",""));
   if(!existing)meta.putBoolean(k+"_favorite",item.optBoolean("favorite")).putLong(k+"_target",item.optLong("targetCents",-1));
  }
  data.apply();meta.apply();return valid.size();
 }
 static String csv(Context c){StringBuilder b=new StringBuilder("name,scope,seller,observed_utc,price_cad,favorite,target_cad\r\n");SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'",Locale.ROOT);f.setTimeZone(TimeZone.getTimeZone("UTC"));SharedPreferences m=HistoryStore.meta(c);
  for(String k:HistoryStore.keys(c))for(PriceLedger.Point p:points(c,k)){long target=m.getLong(k+"_target",-1);b.append(ShoppingMath.csv(m.getString(k+"_name","Previously saved item"))).append(',').append(ShoppingMath.csv(m.getString(k+"_scope","Store not identified"))).append(',').append(ShoppingMath.csv(m.getString(k+"_seller",""))).append(',').append(f.format(new Date(p.time))).append(',').append(String.format(Locale.ROOT,"%.2f",p.cents/100.0)).append(',').append(m.getBoolean(k+"_favorite",false)).append(',').append(target<0?"":String.format(Locale.ROOT,"%.2f",target/100.0)).append("\r\n");}return b.toString();
 }
 static void remove(Context c,String key){HistoryStore.data(c).edit().remove(key).apply();SharedPreferences.Editor m=HistoryStore.meta(c).edit();for(String s:new String[]{"_name","_scope","_seller","_favorite","_target"})m.remove(key+s);m.apply();}
}
