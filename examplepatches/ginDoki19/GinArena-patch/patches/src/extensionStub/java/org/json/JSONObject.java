package org.json;

import java.util.Iterator;

public class JSONObject {
    public JSONObject() { throw new RuntimeException(); }
    public JSONObject(String json) throws JSONException { throw new RuntimeException(); }
    public String optString(String name) { throw new RuntimeException(); }
    public String optString(String name, String fallback) { throw new RuntimeException(); }
    public long optLong(String name, long fallback) { throw new RuntimeException(); }
    public int optInt(String name, int fallback) { throw new RuntimeException(); }
    public boolean optBoolean(String name, boolean fallback) { throw new RuntimeException(); }
    public JSONObject optJSONObject(String name) { throw new RuntimeException(); }
    public Iterator<String> keys() { throw new RuntimeException(); }
    public JSONObject put(String name, boolean value) throws JSONException { throw new RuntimeException(); }
    public JSONObject put(String name, double value) throws JSONException { throw new RuntimeException(); }
    public JSONObject put(String name, int value) throws JSONException { throw new RuntimeException(); }
    public JSONObject put(String name, long value) throws JSONException { throw new RuntimeException(); }
    public JSONObject put(String name, Object value) throws JSONException { throw new RuntimeException(); }
}
