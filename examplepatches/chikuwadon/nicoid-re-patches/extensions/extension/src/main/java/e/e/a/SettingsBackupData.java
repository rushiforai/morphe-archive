package e.e.a;
import java.io.*;import java.util.*;import org.json.*;
final class SettingsBackupData {
 static final Map<String,String> TYPES=new HashMap<>();static final Map<String,Set<String>> VALUES=new HashMap<>();
 // Register direct-SharedPreferences custom dialog settings in the portable
 // typed format even when the corresponding preference is not in the screen.
 // The shipped SettingsBackupData.smali receives the same keys via overlay.
 static {
  TYPES.put("nicoid_single_tap_control_region","string");
  TYPES.put("nicoid_single_tap_region_open_only","boolean");
  TYPES.put("nicoid_ambient_enabled","boolean");
  for(int mode=0;mode<3;mode++)TYPES.put("nicoid_ambient_mode_"+mode,"boolean");
  TYPES.put("nicoid_ambient_sides","int");
  for(String name:new String[]{"intensity","spread","softness","brightness","contrast",
                                "saturation","vibrance","response","rate","resolution"})
   TYPES.put("nicoid_ambient_"+name,"int");
 }
 static boolean portable(String k){return k!=null&&!k.matches("(?i).*(cookie|session|password|token|auth).*|cache_tree.*|cache_dir|nologin|user_id|login_.*|save_.*|labs_.*|nicoid_patch_version|nicoid_share_debug");}
 static JSONObject encode(Map<String,?> all)throws Exception{JSONObject entries=new JSONObject();for(String k:new TreeSet<>(all.keySet())){if(!portable(k)||!TYPES.containsKey(k))continue;Object v=all.get(k);String type=v instanceof Boolean?"boolean":v instanceof Integer?"int":v instanceof Long?"long":v instanceof Float?"float":v instanceof Set?"set":"string";Object value=v instanceof Set?new JSONArray(new TreeSet<>((Set<String>)v)):v;entries.put(k,new JSONObject().put("type",type).put("value",value));}return new JSONObject().put("format","nicoid-re-settings").put("version",1).put("settings",entries);}
 static long integer(Object value)throws IOException{if(!(value instanceof Number))throw new IOException("Invalid numeric setting");try{return new java.math.BigDecimal(value.toString()).longValueExact();}catch(ArithmeticException|NumberFormatException e){throw new IOException("Invalid integral setting",e);}}
 static Map<String,Object> decode(JSONObject file)throws Exception{if(!"nicoid-re-settings".equals(file.optString("format"))||file.optInt("version")!=1)throw new IOException("Unsupported settings file");JSONObject entries=file.getJSONObject("settings");Map<String,Object> out=new LinkedHashMap<>();Iterator<String> keys=entries.keys();while(keys.hasNext()){String k=keys.next();if(!portable(k)||!TYPES.containsKey(k))continue;JSONObject o=entries.getJSONObject(k);String type=o.getString("type"),expected=TYPES.get(k);Object v=o.get("value");if(!expected.equals(type))throw new IOException("Invalid setting type");switch(type){case "boolean":if(!(v instanceof Boolean))throw new IOException();break;case "int":long integer=integer(v);if(integer<Integer.MIN_VALUE||integer>Integer.MAX_VALUE)throw new IOException("Integer overflow");v=(int)integer;if(k.startsWith("search_range_")&&((Integer)v<0||(Integer)v>(k.endsWith("mode")?3:6000059)))throw new IOException("Invalid search range");if(!k.startsWith("search_range_")&&k.startsWith("search_")&&((Integer)v<0||(Integer)v>(k.equals("search_Sort")?12:8)))throw new IOException("Invalid search filter");break;case "long":v=integer(v);break;case "float":if(!(v instanceof Number))throw new IOException("Invalid numeric setting");v=(float)o.getDouble("value");if(!Float.isFinite((Float)v))throw new IOException();break;case "set":JSONArray items=o.getJSONArray("value");Set<String> set=new HashSet<>();for(int i=0;i<items.length();i++){Object item=items.get(i);if(!(item instanceof String))throw new IOException();set.add((String)item);}v=set;break;case "string":if(!(v instanceof String))throw new IOException();Set<String> allowed=VALUES.get(k);if(allowed!=null&&!allowed.contains(v))throw new IOException("Unsupported setting value");break;default:throw new IOException("Unknown setting type");}out.put(k,v);}if(out.isEmpty())throw new IOException("No matching settings");return out;}
}
