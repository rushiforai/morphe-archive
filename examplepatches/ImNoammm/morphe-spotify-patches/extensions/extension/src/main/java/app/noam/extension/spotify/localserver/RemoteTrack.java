package app.noam.extension.spotify.localserver;

import org.json.JSONException;
import org.json.JSONObject;

public final class RemoteTrack {
    public String url;
    public String name;
    public long size;
    public String title = "";
    public String artist = "";
    public String album = "";
    public int durationSeconds;

    public static RemoteTrack fromJson(JSONObject json) {
        RemoteTrack track = new RemoteTrack();
        track.url = json.optString("url");
        track.name = json.optString("name");
        track.size = json.optLong("size");
        track.title = json.optString("title");
        track.artist = json.optString("artist");
        track.album = json.optString("album");
        track.durationSeconds = json.optInt("duration");
        return track;
    }

    public JSONObject toJson() throws JSONException {
        JSONObject json = new JSONObject();
        json.put("url", url);
        json.put("name", name);
        json.put("size", size);
        json.put("title", title);
        json.put("artist", artist);
        json.put("album", album);
        json.put("duration", durationSeconds);
        return json;
    }

    public String id() {
        return Integer.toHexString(url.hashCode()) + "-" + Math.abs((long) name.hashCode() % 100000);
    }

    public String displayTitle() {
        if (title != null && !title.isEmpty()) return title;
        int dot = name.lastIndexOf('.');
        return dot > 0 ? name.substring(0, dot) : name;
    }
}
