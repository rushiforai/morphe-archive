package io.github.sabopura.deviceprobe;

import android.app.Instrumentation;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Runs inside the patched Twitch process. Exercises the Block ads layers that work without a
 * signed-in account, against the app's own classes and real Twitch playlists.
 */
public class AdsProbe extends Instrumentation {
    private static final String TAG = "AdsProbe";
    private final StringBuilder report = new StringBuilder();
    private int failed;
    private ClassLoader app;

    @Override
    public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        start();
    }

    @Override
    public void onStart() {
        Bundle result = new Bundle();
        try {
            Context target = getTargetContext();
            app = target.getClassLoader();
            Class<?> adBlock = app.loadClass("io.github.sabopura.morphe.extension.twitch.ads.AdBlock");
            adBlock.getMethod("initialize", Context.class).invoke(null, target);
            check((Boolean) adBlock.getMethod("enabled").invoke(null), "blocking is on by default");
            settingsEntry();
            nativePlayer();
            clientAds(adBlock);
            adServerApi(adBlock);
            playerEvents(adBlock);
            stitchedAds();
            playerPath(adBlock);
        } catch (Throwable t) {
            fail("probe crashed: " + t + " " + Log.getStackTraceString(t));
        }
        line("RESULT failed=" + failed);
        result.putString(Instrumentation.REPORT_KEY_STREAMRESULT, report.toString());
        finish(failed == 0 ? 0 : 1, result);
    }

    // ---- streams open in the native player screen ----

    private void nativePlayer() throws Exception {
        Class<?> kt = app.loadClass("tv.twitch.android.feature.discovery.feed.rn.theatre.RNTheatreRouteDecisionKt");
        Method decide = null;
        for (Method m : kt.getMethods()) if (m.getName().equals("rnTheatreRouteDecision")) decide = m;
        Object[] args = new Object[decide.getParameterTypes().length];
        for (int i = 0; i < args.length; i++) {
            Class<?> t = decide.getParameterTypes()[i];
            if (t == boolean.class) args[i] = true;
            else if (t == String.class) args[i] = "somechannel";
            else if (t.isEnum()) args[i] = t.getEnumConstants()[0];
        }
        Object result = decide.invoke(null, args);
        check(String.valueOf(result).startsWith("RefuseUltralight"), "live streams open in the native player: " + result);
    }

    // ---- the row in Twitch's settings screen ----

    private void settingsEntry() throws Exception {
        Class<?> entry = app.loadClass("io.github.sabopura.morphe.extension.twitch.ui.SettingsEntry");
        final Object[] out = new Object[2];
        runOnMainSync(() -> {
            try {
                // The settings screen runs with Twitch's theme; use it like the real screen does.
                Context target = getTargetContext();
                int theme = target.getResources().getIdentifier("Theme.Twitch", "style", "tv.twitch.android.app");
                Context themed = new android.view.ContextThemeWrapper(target, theme);
                android.widget.FrameLayout original = new android.widget.FrameLayout(themed);
                out[0] = original;
                out[1] = entry.getMethod("wrap", android.view.View.class).invoke(null, original);
            } catch (Exception e) {
                out[1] = e;
            }
        });
        check(out[1] instanceof android.widget.LinearLayout, "settings screen is wrapped with the patch settings row");
        android.widget.LinearLayout wrapper = (android.widget.LinearLayout) out[1];
        check(wrapper.getChildCount() == 2 && wrapper.getChildAt(1) == out[0], "Twitch's own settings stay below the row");
        android.view.View row = wrapper.getChildAt(0);
        int titleId = getTargetContext().getResources().getIdentifier("menu_item_title", "id", "tv.twitch.android.app");
        android.widget.TextView title = titleId == 0 ? null : row.findViewById(titleId);
        check(title != null && String.valueOf(title.getText()).length() > 0,
                "row uses Twitch's settings item layout: " + (title == null ? "none" : title.getText()));
        check(row.hasOnClickListeners(), "row opens the patch settings");
        final Object[] legacy = new Object[1];
        runOnMainSync(() -> {
            try {
                android.view.View v = new android.view.View(getTargetContext());
                legacy[0] = entry.getMethod("wrapIfMain", Object.class, android.view.View.class).invoke(null, new Object(), v) == v;
            } catch (Exception e) {
                legacy[0] = e;
            }
        });
        check(Boolean.TRUE.equals(legacy[0]), "other list-style settings pages are left alone");
    }

    // ---- ① ----

    private void clientAds(Class<?> adBlock) throws Exception {
        Method allow = adBlock.getMethod("allowClientAds", boolean.class);
        check(!(Boolean) allow.invoke(null, true), "client-side video ads are switched off");
        check(!(Boolean) allow.invoke(null, false), "clips stay ad-free");
        check(!(Boolean) adBlock.getMethod("allowPictureByPicture", boolean.class).invoke(null, true),
                "picture-by-picture is off");
        Method cue = adBlock.getMethod("dropReactCue", String.class);
        check((Boolean) cue.invoke(null, "{\"CLASS\":\"twitch-maf-ad\"}"), "React Native MAF cue dropped");
        check(!(Boolean) cue.invoke(null, "{\"CLASS\":\"twitch-stream-source\"}"), "live cue kept");
    }

    // ---- ② ----

    private void adServerApi(Class<?> adBlock) throws Exception {
        Class<?> api = app.loadClass("tv.twitch.android.shared.ad.edge.api.AdEdgeApi");
        final boolean[] touched = {false};
        Object real = Proxy.newProxyInstance(app, new Class<?>[]{api}, (proxy, method, args) -> {
            if (method.getDeclaringClass() == Object.class) return method.getName().equals("hashCode") ? 1 : null;
            touched[0] = true;
            return null;
        });
        Object wrapped = adBlock.getMethod("service", Object.class).invoke(null, real);
        check(wrapped != real, "AdEdgeApi service is wrapped");
        Object other = Proxy.newProxyInstance(app, new Class<?>[]{Runnable.class}, (p, m, a) -> null);
        check(adBlock.getMethod("service", Object.class).invoke(null, other) == other, "other services untouched");
        for (String name : new String[]{"requestAd", "requestBrowseDisplayAd", "requestMidFeedAd"}) {
            Method m = null;
            for (Method c : api.getMethods()) if (c.getName().equals(name)) m = c;
            Object[] args = new Object[m.getParameterTypes().length];
            for (int i = 0; i < args.length; i++) if (m.getParameterTypes()[i] == int.class) args[i] = 0;
            Object single = m.invoke(wrapped, args);
            Object value = firstObjectField(single);
            boolean error = value != null && value.getClass().getName().equals("retrofit2.adapter.rxjava2.Result")
                    && (Boolean) value.getClass().getMethod("isError").invoke(value);
            check(error, name + " answers at once with a failed Result, no network");
        }
        check(!touched[0], "the real ad server API was never called");
    }

    private static Object firstObjectField(Object o) throws Exception {
        for (Class<?> c = o.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (f.getType().isPrimitive() || java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object v = f.get(o);
                if (v != null) return v;
            }
        }
        return null;
    }

    // ---- ⑥ ----

    private void playerEvents(Class<?> adBlock) throws Exception {
        Field kind = adBlock.getField("eventKind");
        Method on = adBlock.getMethod("onPlayerAdEvent", Object.class, Object.class);
        Object player = new Object();
        Object event = new Object() {
            @Override
            public String toString() {
                return "OnSurestreamAdStarted(adMetadata=SureStreamAdMetadata(duration=2.0, podDuration=4.0, id=x, podLength=2, podPosition=0, adBreakPosition=0)";
            }
        };
        kind.setInt(null, 1);
        check((Boolean) on.invoke(null, player, event), "unreplaced stitched ad: event dropped and covered");
        kind.setInt(null, 3);
        check((Boolean) on.invoke(null, player, event), "quartile dropped while covered");
        kind.setInt(null, 4);
        check((Boolean) on.invoke(null, player, event), "stream-requested ad event dropped");
        kind.setInt(null, 2);
        check(!(Boolean) on.invoke(null, player, event), "live-again event passes through");
        int covered = (Integer) adBlock.getMethod("count", int.class, boolean.class).invoke(null, 2, true);
        check(covered == 1, "cover counted once");
        Class<?> shield = app.loadClass("io.github.sabopura.morphe.extension.twitch.ads.AdShield");
        final Object[] made = new Object[1];
        runOnMainSync(() -> {
            try {
                made[0] = shield.getConstructor(Context.class, android.util.AttributeSet.class)
                        .newInstance(getTargetContext(), null);
            } catch (Exception e) {
                made[0] = e;
            }
        });
        check(made[0] != null && shield.isInstance(made[0]), "cover view can be inflated");
    }

    // ---- ④ ----

    private void stitchedAds() throws Exception {
        Object client = app.loadClass("com.amazonaws.ivs.net.HttpClientFactory").getMethod("create").invoke(null);
        check(client.getClass().getName().endsWith(".AdFreeHttpClient"), "IVS HTTP client is wrapped: " + client.getClass().getName());
        boolean replaced = false, clean = false;
        List<String> channels = topChannels(20);
        for (String login : channels) {
            if (replaced && clean) break;
            String[] token = token(login);
            if (token == null) continue;
            String master = "https://usher.ttvnw.net/api/channel/hls/" + login + ".m3u8?allow_source=true&allow_audio_only=true"
                    + "&fast_bread=true&player_backend=mediaplayer&supported_codecs=avc1&p=" + (int) (Math.random() * 1e6)
                    + "&sig=" + enc(token[1]) + "&token=" + enc(token[0]);
            String masterText = ivsGet(client, master);
            if (masterText == null || !masterText.contains("#EXT-X-STREAM-INF")) continue;
            String variant = null;
            for (String l : masterText.split("\n")) if (l.startsWith("https://")) { variant = l.trim(); break; }
            String raw = directGet(variant);
            boolean rawAd = raw != null && raw.contains("twitch-stitched-ad");
            long t0 = System.currentTimeMillis();
            String served = ivsGet(client, variant);
            long took = System.currentTimeMillis() - t0;
            if (served == null) continue;
            boolean servedAd = served.contains("twitch-stitched-ad") || served.contains(",Amazon");
            boolean live = served.contains("#EXT-X-TWITCH-LIVE-SEQUENCE");
            line("CHANNEL " + login + " rawAd=" + rawAd + " servedAd=" + servedAd + " live=" + live + " ms=" + took);
            if (rawAd && !replaced) {
                check(!servedAd && live, "stitched pre-roll on " + login + " replaced by a clean live playlist (" + took + " ms)");
                replaced = true;
            } else if (!rawAd && !clean) {
                check(!servedAd && took < 2000, "clean stream passes without a backup (" + took + " ms)");
                clean = true;
            }
        }
        if (!replaced) line("NOTE no channel served a stitched pre-roll this run; replacement not exercised");
        check(clean, "at least one clean live stream was checked");
    }

    private String ivsGet(Object client, String url) throws Exception {
        Class<?> request = app.loadClass("com.amazonaws.ivs.net.Request");
        Class<?> responseCallback = app.loadClass("com.amazonaws.ivs.net.ResponseCallback");
        Class<?> readCallback = app.loadClass("com.amazonaws.ivs.net.ReadCallback");
        Class<?> response = app.loadClass("com.amazonaws.ivs.net.Response");
        Object r = request.getConstructor(String.class, String.class).newInstance(url, "GET");
        CountDownLatch done = new CountDownLatch(1);
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        final String[] error = {null};
        InvocationHandler reader = (proxy, method, args) -> {
            switch (method.getName()) {
                case "getTimeout": return 10;
                case "onData":
                    if (args[0] instanceof ByteBuffer) {
                        ByteBuffer b = (ByteBuffer) args[0];
                        byte[] chunk = new byte[b.remaining()];
                        b.get(chunk);
                        body.write(chunk, 0, chunk.length);
                    } else {
                        body.write((byte[]) args[0], 0, (Integer) args[1]);
                    }
                    if ((Boolean) args[args.length - 1]) done.countDown();
                    return null;
                case "onError":
                    error[0] = String.valueOf(args[0]);
                    done.countDown();
                    return null;
                default: return null;
            }
        };
        InvocationHandler callback = (proxy, method, args) -> {
            if (method.getName().equals("onResponse")) {
                Object resp = args[0];
                int status = (Integer) response.getMethod("getStatus").invoke(resp);
                if (status != 200) {
                    error[0] = "HTTP " + status;
                    done.countDown();
                    return null;
                }
                Object cb = Proxy.newProxyInstance(app, new Class<?>[]{readCallback}, reader);
                response.getMethod("readContent", readCallback).invoke(resp, cb);
            } else if (method.getName().equals("onError")) {
                error[0] = String.valueOf(args[0]);
                done.countDown();
            }
            return null;
        };
        Object cb = Proxy.newProxyInstance(app, new Class<?>[]{responseCallback}, callback);
        client.getClass().getMethod("execute", request, responseCallback).invoke(client, r, cb);
        if (!done.await(15, TimeUnit.SECONDS) || error[0] != null) {
            line("IVS GET failed " + error[0]);
            return null;
        }
        return body.toString("UTF-8");
    }

    // ---- ④ through the real player ----

    /** Plays live streams with Twitch's own IVS MediaPlayer, so playlists go the player's way. */
    private void playerPath(Class<?> adBlock) throws Exception {
        Method count = adBlock.getMethod("count", int.class, boolean.class);
        int before = (Integer) count.invoke(null, 1, true);
        Class<?> builderClass = app.loadClass("com.amazonaws.ivs.player.MediaPlayer$Builder");
        Class<?> optionsClass = app.loadClass("com.amazonaws.ivs.player.MediaPlayer$LoadOptions");
        List<String> channels = topChannels(12);
        int played = 0;
        for (String login : channels) {
            if (played >= 6) break;
            String[] token = androidToken(login);
            if (token == null) continue;
            String url = "https://usher.ttvnw.net/api/channel/hls/" + login + ".m3u8?allow_source=true&allow_audio_only=true"
                    + "&fast_bread=true&player_backend=mediaplayer&p=" + (int) (Math.random() * 1e6)
                    + "&sig=" + enc(token[1]) + "&token=" + enc(token[0]);
            final Object[] player = new Object[1];
            final Exception[] problem = new Exception[1];
            runOnMainSync(() -> {
                try {
                    Object builder = builderClass.getConstructor(Context.class).newInstance(getTargetContext());
                    Object p = builderClass.getMethod("build").invoke(builder);
                    p.getClass().getMethod("setMuted", boolean.class).invoke(p, true);
                    Object options = optionsClass.getConstructor(android.net.Uri.class).newInstance(android.net.Uri.parse(url));
                    // The same session settings the app uses for live streams.
                    Class<?> sc = app.loadClass("com.amazonaws.ivs.player.SessionConfig");
                    Object config = sc.getConstructor().newInstance();
                    sc.getMethod("setLiveCatchUpSpeedUpEnabled", boolean.class).invoke(config, true);
                    sc.getMethod("setSuppressSegmentMetadataCue", boolean.class).invoke(config, false);
                    sc.getMethod("setSendTwitchEvents", boolean.class).invoke(config, true);
                    optionsClass.getMethod("setMediaType", String.class).invoke(options, "application/x-mpegURL");
                    optionsClass.getMethod("setSessionConfig", sc).invoke(options, config);
                    p.getClass().getMethod("load", optionsClass).invoke(p, options);
                    p.getClass().getMethod("play").invoke(p);
                    player[0] = p;
                } catch (Exception e) {
                    problem[0] = e;
                }
            });
            if (problem[0] != null) {
                fail("MediaPlayer could not play: " + Log.getStackTraceString(problem[0]));
                return;
            }
            Thread.sleep(12000);
            String issue = String.valueOf(adBlock.getMethod("lastIssue").invoke(null));
            line("PLAYED " + login + " replacedSoFar=" + ((Integer) count.invoke(null, 1, true) - before) + " lastIssue=" + issue);
            runOnMainSync(() -> {
                try {
                    player[0].getClass().getMethod("release").invoke(player[0]);
                } catch (Exception ignored) {
                }
            });
            played++;
        }
        int replaced = (Integer) count.invoke(null, 1, true) - before;
        line("PLAYER replaced=" + replaced + " of " + played + " streams");
        check(played > 0, "streams played through the IVS player");
    }

    /** An Android mobile_player token, as the app itself uses. */
    private static String[] androidToken(String login) {
        try {
            String q = "query($login:String!){streamPlaybackAccessToken(channelName:$login,params:{platform:\"android\","
                    + "playerBackend:\"mediaplayer\",playerType:\"mobile_player\"}){value signature}}";
            HttpURLConnection c = (HttpURLConnection) new URL("https://gql.twitch.tv/gql").openConnection();
            c.setRequestMethod("POST");
            c.setDoOutput(true);
            c.setRequestProperty("Client-ID", "kd1unb4b3q4t58fwlpcbzcbnm76a8fp");
            c.setRequestProperty("Content-Type", "application/json");
            try (OutputStream out = c.getOutputStream()) {
                out.write(new JSONObject().put("query", q).put("variables", new JSONObject().put("login", login))
                        .toString().getBytes("UTF-8"));
            }
            JSONObject t = new JSONObject(read(c.getInputStream())).getJSONObject("data").getJSONObject("streamPlaybackAccessToken");
            return new String[]{t.getString("value"), t.getString("signature")};
        } catch (Exception e) {
            return null;
        }
    }

    // ---- plain HTTP for the probe's own lookups ----

    private static String directGet(String url) {
        try {
            HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
            c.setConnectTimeout(8000);
            c.setReadTimeout(8000);
            return c.getResponseCode() == 200 ? read(c.getInputStream()) : null;
        } catch (Exception e) {
            return null;
        }
    }

    private static String gql(String body) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL("https://gql.twitch.tv/gql").openConnection();
        c.setRequestMethod("POST");
        c.setDoOutput(true);
        c.setRequestProperty("Client-ID", "kimne78kx3ncx6brgo4mv6wki5h1ko");
        c.setRequestProperty("Content-Type", "application/json");
        try (OutputStream out = c.getOutputStream()) {
            out.write(body.getBytes("UTF-8"));
        }
        return read(c.getInputStream());
    }

    private static List<String> topChannels(int n) throws Exception {
        JSONObject d = new JSONObject(gql(new JSONObject().put("query",
                "query{streams(first:" + n + "){edges{node{broadcaster{login}}}}}").toString()));
        JSONArray edges = d.getJSONObject("data").getJSONObject("streams").getJSONArray("edges");
        List<String> logins = new ArrayList<>();
        for (int i = 0; i < edges.length(); i++)
            logins.add(edges.getJSONObject(i).getJSONObject("node").getJSONObject("broadcaster").getString("login"));
        return logins;
    }

    /** A web "site" token: the context that most often gets a stitched pre-roll. */
    private static String[] token(String login) {
        try {
            String q = "query($login:String!){streamPlaybackAccessToken(channelName:$login,params:{platform:\"web\","
                    + "playerBackend:\"mediaplayer\",playerType:\"site\"}){value signature}}";
            JSONObject d = new JSONObject(gql(new JSONObject().put("query", q)
                    .put("variables", new JSONObject().put("login", login)).toString()));
            JSONObject t = d.getJSONObject("data").getJSONObject("streamPlaybackAccessToken");
            return new String[]{t.getString("value"), t.getString("signature")};
        } catch (Exception e) {
            return null;
        }
    }

    private static String read(InputStream in) throws Exception {
        try (InputStream i = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] b = new byte[8192];
            int n;
            while ((n = i.read(b)) > 0) out.write(b, 0, n);
            return out.toString("UTF-8");
        }
    }

    private static String enc(String s) throws Exception {
        return URLEncoder.encode(s, "UTF-8");
    }

    // ---- reporting ----

    private void check(boolean ok, String what) {
        if (ok) line("PASS " + what);
        else fail(what);
    }

    private void fail(String what) {
        failed++;
        line("FAIL " + what);
    }

    private void line(String text) {
        Log.i(TAG, text);
        report.append(text).append('\n');
    }
}
