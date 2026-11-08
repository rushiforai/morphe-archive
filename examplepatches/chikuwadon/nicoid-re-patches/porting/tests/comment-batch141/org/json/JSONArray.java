package org.json;
import java.util.*;
public class JSONArray {
 private final ArrayList<Object> data=new ArrayList<>();
 public JSONArray put(Object v){data.add(v);return this;}
 public int length(){return data.size();}
 public JSONObject getJSONObject(int i){return (JSONObject)data.get(i);}
 public String optString(int i){return String.valueOf(data.get(i));}
}
