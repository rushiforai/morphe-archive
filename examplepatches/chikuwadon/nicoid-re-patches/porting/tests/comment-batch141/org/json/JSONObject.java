package org.json;
import java.util.*;
public class JSONObject {
 private final Map<String,Object> data=new HashMap<>();
 public JSONObject put(String k,Object v){data.put(k,v);return this;}
 public JSONObject getJSONObject(String k){return (JSONObject)data.get(k);}
 public JSONArray getJSONArray(String k){return (JSONArray)data.get(k);}
 public JSONArray optJSONArray(String k){return (JSONArray)data.get(k);}
 public String optString(String k){return optString(k,"");}
 public String optString(String k,String fallback){Object v=data.get(k);return v==null?fallback:String.valueOf(v);}
 public int optInt(String k){Object v=data.get(k);return v instanceof Number?((Number)v).intValue():0;}
}
