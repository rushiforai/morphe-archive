package app.johninnl.modelhost.api;

import org.json.JSONException;
import org.json.JSONObject;
final class Protocol {
    static final int VERSION = 10000;
    static JSONObject object(String json) { try { return new JSONObject(json); } catch (JSONException e) { throw new IllegalArgumentException("Invalid host JSON", e); } }
    static JSONObject put(JSONObject json, String key, Object value) { try { json.put(key, value); return json; } catch (JSONException e) { throw new IllegalArgumentException("Invalid protocol value", e); } }
    static JSONObject envelope() { return put(new JSONObject(), "schema", 1); }
}
