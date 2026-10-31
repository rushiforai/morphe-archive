package app.template.extension.niagaralauncher;

import org.json.*;

public final class WeatherSource {
    public String id,
            name,
            kind,
            url = "",
            mode = "once",
            temperature = "C",
            time = "seconds",
            probability = "fraction",
            codes = "OWM";
    public int count = 7;
    public boolean enabled = true;
    public JSONObject mappings = new JSONObject();

    public WeatherSource(String id, String name, String kind) {
        this.id = id;
        this.name = name;
        this.kind = kind;
    }

    public WeatherSource copy() {
        try {
            return read(new JSONObject(json().toString()));
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
    }

    public JSONObject json() throws JSONException {
        return new JSONObject()
                .put("id", id)
                .put("name", name)
                .put("kind", kind)
                .put("url", url)
                .put("mode", mode)
                .put("count", count)
                .put("temperature", temperature)
                .put("time", time)
                .put("probability", probability)
                .put("codes", codes)
                .put("enabled", enabled)
                .put("mappings", mappings);
    }

    public static WeatherSource read(JSONObject o) throws JSONException {
        WeatherSource s =
                new WeatherSource(o.getString("id"), o.getString("name"), o.getString("kind"));
        s.url = o.optString("url");
        s.mode = o.optString("mode", "once");
        s.count = Math.max(1, Math.min(168, o.optInt("count", 7)));
        s.temperature = o.optString("temperature", "C");
        s.time = o.optString("time", "seconds");
        s.probability = o.optString("probability", "fraction");
        s.codes = o.optString("codes", "OWM");
        s.enabled = o.optBoolean("enabled", true);
        s.mappings = o.optJSONObject("mappings");
        if (s.mappings == null) s.mappings = new JSONObject();
        return s;
    }
}
