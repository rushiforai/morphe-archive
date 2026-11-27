package app.jimaku.extension.youtube;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;

import app.jimaku.extension.gateway.Cancellation;
import app.jimaku.extension.gateway.GatewayException;
import app.jimaku.extension.gateway.Http;

/**
 * Reads a video's caption tracks from YouTube's player API as the installed YouTube app asks for
 * them: the ANDROID client with the app's own version and Android's SDK level, in the app's own
 * User-Agent form. Nothing else goes with it: no cookie, no account, no visitor data. Morphe's own
 * voice-over transcripts are read the same way. Calls block; run them off the main thread.
 */
public final class YouTube {
    public static final String ORIGIN = "https://www.youtube.com";
    private static final int TIMEOUT_MILLIS = 15_000;
    /**
     * The app's version Morphe's voice-over asks as, which YouTube still answers with each word's
     * timing. It retires old versions after a year or two (19.44.38 was refused on 2026-10-29), and
     * this one then needs a newer one that isn't in the experiment.
     */
    static final String TIMED_VERSION = "20.10.38";

    private final String origin;
    private final String version;
    private final int sdk;
    private final String release;
    private final String userAgent;
    private final int timeoutMillis;

    YouTube(String origin, String version, int sdk, String release, int timeoutMillis) {
        this.origin = origin;
        this.version = version;
        this.sdk = sdk;
        this.release = release;
        this.userAgent = userAgent(version);
        this.timeoutMillis = timeoutMillis;
    }

    /** As the YouTube app running Jimaku, with its version and the phone's Android. */
    public static YouTube of(Context context) {
        String version;
        try {
            version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            version = null;
        }
        return new YouTube(ORIGIN, version != null ? version : "20.10.38", Build.VERSION.SDK_INT, Build.VERSION.RELEASE, TIMEOUT_MILLIS);
    }

    /**
     * What YouTube says about {@code video}'s captions, or null where it gives nothing to go by:
     * an answer refused or unreadable, or a video it won't play without an account.
     */
    public TrackInfo tracks(String video, Cancellation cancellation) throws GatewayException {
        JSONObject answer = player(video, version, cancellation);
        return answer != null ? PlayerAnswer.read(video, answer) : null;
    }

    /** YouTube's player answer for {@code video} to the ANDROID client at {@code clientVersion}, or null. */
    private JSONObject player(String video, String clientVersion, Cancellation cancellation) throws GatewayException {
        JSONObject client = new JSONObject();
        JSONObject body = new JSONObject();
        try {
            client.put("clientName", "ANDROID").put("clientVersion", clientVersion).put("androidSdkVersion", sdk);
            body.put("context", new JSONObject().put("client", client)).put("videoId", video);
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
        Http.Request request = Http.Request.post(URI.create(origin + "/youtubei/v1/player?prettyPrint=false"), "application/json",
                        body.toString().getBytes(StandardCharsets.UTF_8))
                .with("X-YouTube-Client-Name", "3")
                .with("X-YouTube-Client-Version", clientVersion);
        Http.Response response = send(request, userAgent(clientVersion), cancellation);
        if (!response.ok()) return null;
        try {
            Object answer = new JSONTokener(response.text()).nextValue();
            return answer instanceof JSONObject ? (JSONObject) answer : null;
        } catch (JSONException e) {
            return null;
        }
    }

    /**
     * {@code track}'s text as a captions job's body, {@code {title, events}}, as the extension sends
     * it. Fails as {@code no_captions} where YouTube answers with nothing.
     *
     * <p>Since 2026-10, YouTube answers the app's recent versions with an automatic track without
     * each word's timing, whole caption windows instead (its {@code exp=xpo} experiment). Where that
     * comes back, the player is asked once more as an older version of the app, as Morphe's
     * voice-over asks it, and that track's text goes where it has the timing. Otherwise the untimed
     * one goes, which the processor spreads over each window's speaking time.
     */
    public String captions(TrackInfo info, CaptionTrack track, Cancellation cancellation) throws GatewayException {
        JSONArray events = events(track.address, userAgent, cancellation);
        if (events == null) throw new GatewayException("no_captions");
        if (track.automatic && !timed(events)) {
            JSONArray again = timedAgain(info.video, track.code, cancellation);
            if (again != null) events = again;
        }
        try {
            return new JSONObject().put("title", info.title).put("events", events).toString();
        } catch (JSONException e) {
            throw new GatewayException("no_captions", e);
        }
    }

    /** The automatic track in {@code code} as the older app reads it, where its words carry their timing; else null. */
    private JSONArray timedAgain(String video, String code, Cancellation cancellation) throws GatewayException {
        JSONObject answer = player(video, TIMED_VERSION, cancellation);
        TrackInfo older = answer != null ? PlayerAnswer.read(video, answer) : null;
        CaptionTrack same = older != null ? older.automatic : null;
        if (same == null || !same.code.equals(code)) return null;
        JSONArray events = events(same.address, userAgent(TIMED_VERSION), cancellation);
        return events != null && timed(events) ? events : null;
    }

    /** A track's events, read as json3, or null where YouTube answers with none. */
    private JSONArray events(String address, String agent, Cancellation cancellation) throws GatewayException {
        Http.Response response = send(Http.Request.get(json3(address)), agent, cancellation);
        if (!response.ok()) return null;
        try {
            Object answer = new JSONTokener(response.text()).nextValue();
            JSONArray events = answer instanceof JSONObject ? ((JSONObject) answer).optJSONArray("events") : null;
            return events != null && events.length() > 0 ? events : null;
        } catch (JSONException e) {
            return null;
        }
    }

    /** Whether any word of the track carries its own timing. */
    static boolean timed(JSONArray events) {
        for (int i = 0; i < events.length(); i++) {
            JSONObject event = events.optJSONObject(i);
            JSONArray segs = event != null ? event.optJSONArray("segs") : null;
            for (int j = 0; segs != null && j < segs.length(); j++) {
                JSONObject seg = segs.optJSONObject(j);
                if (seg != null && seg.has("tOffsetMs")) return true;
            }
        }
        return false;
    }

    private String userAgent(String clientVersion) {
        return "com.google.android.youtube/" + clientVersion + " (Linux; U; Android " + release + ") gzip";
    }

    /** The track's address asking for json3, the format with each word's timing; only on YouTube's own origin. */
    URI json3(String address) throws GatewayException {
        URI uri;
        try {
            uri = URI.create(address);
        } catch (IllegalArgumentException e) {
            throw new GatewayException("no_captions", e);
        }
        URI own = URI.create(origin);
        if (!own.getScheme().equals(uri.getScheme()) || !own.getHost().equals(uri.getHost()) || own.getPort() != uri.getPort()) {
            throw new GatewayException("no_captions");
        }
        StringBuilder query = new StringBuilder();
        String raw = uri.getRawQuery();
        for (String part : raw != null ? raw.split("&") : new String[0]) {
            if (part.isEmpty() || part.startsWith("fmt=")) continue;
            query.append(query.length() == 0 ? "" : "&").append(part);
        }
        query.append(query.length() == 0 ? "" : "&").append("fmt=json3");
        return URI.create(uri.getScheme() + "://" + uri.getRawAuthority() + uri.getRawPath() + "?" + query);
    }

    private Http.Response send(Http.Request request, String agent, Cancellation cancellation) throws GatewayException {
        try {
            return Http.send(request, agent, timeoutMillis, cancellation);
        } catch (IOException e) {
            throw new GatewayException(cancellation.isCancelled() ? "cancelled" : "offline", e);
        }
    }
}
