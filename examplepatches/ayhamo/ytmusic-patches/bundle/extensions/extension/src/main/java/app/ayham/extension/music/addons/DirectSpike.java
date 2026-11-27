package app.ayham.extension.music.addons;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Debug spike for Phase 4's Direct mode: plays a progressive file (an addon's stream, or a local
 * file) on a separate player built from YT Music 9.30.53's own media3 classes (obfuscated names
 * from the APK), starting at an offset, then stops and releases it. Only registered when
 * spike.properties holds directSpike=1, so it never runs in normal use.
 *
 * adb shell am broadcast -p PKG -a app.ayham.DIRECT_SPIKE --es src addon|/path/file|https://...
 *     [--es title T --es artist A --ef dur 237] [--el startMs 30000] [--ei secs 20] [--ei clip 1]
 */
public final class DirectSpike {
    private static final String TAG = "AyhamDirect";
    public static final String ACTION = "app.ayham.DIRECT_SPIKE";
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static Object player;
    private static boolean registered;

    private DirectSpike() {
    }

    public static void register(Context ctx) {
        if (registered) return;
        registered = true;
        BroadcastReceiver r = new BroadcastReceiver() {
            @Override
            public void onReceive(Context c, Intent i) {
                start(c.getApplicationContext(), i);
            }
        };
        IntentFilter f = new IntentFilter(ACTION);
        if (Build.VERSION.SDK_INT >= 33) ctx.registerReceiver(r, f, Context.RECEIVER_EXPORTED);
        else ctx.registerReceiver(r, f);
        Log.i(TAG, "direct spike armed: " + ACTION);
    }

    private static void start(Context ctx, Intent i) {
        final String src = i.getStringExtra("src");
        final long startMs = i.getLongExtra("startMs", 0);
        final int secs = i.getIntExtra("secs", 20);
        final boolean clip = i.getIntExtra("clip", 1) == 1;
        mp3Index = i.getIntExtra("mp3index", 0) == 1;
        warmMs = i.getIntExtra("warm", 0);
        prerollMs = i.getIntExtra("preroll", 0);
        final String title = i.getStringExtra("title"), artist = i.getStringExtra("artist");
        final float dur = i.getFloatExtra("dur", 0);
        new Thread(() -> {
            try {
                String url;
                Map<String, String> headers = Collections.emptyMap();
                if ("addon".equals(src)) {
                    File list = new File(ctx.getExternalFilesDir(null), "addons.txt");
                    List<AddonClient.Addon> addons = new ArrayList<>();
                    for (String l : new String(Files.readAllBytes(list.toPath()), StandardCharsets.UTF_8).split("\n")) {
                        if (!l.trim().isEmpty()) addons.add(new AddonClient.Addon(l.trim()));
                    }
                    String only = i.getStringExtra("addon");
                    if (only != null) {
                        List<AddonClient.Addon> keep = new ArrayList<>();
                        for (AddonClient.Addon a : addons) if (a.base.contains(only)) keep.add(a);
                        addons = keep;
                    }
                    TrackMatcher.Target t = new TrackMatcher.Target();
                    t.title = title;
                    t.artist = artist;
                    t.durationSec = dur > 0 ? (double) dur : null;
                    long t0 = System.currentTimeMillis();
                    AddonPlayback.upgrading(true);
                    AddonClient c = client();
                    AddonClient.Opened o = c.resolve(t, addons, new AddonClient.Options());
                    AddonPlayback.upgrading(false);
                    addonName = o.addon == null ? null : o.addon.name;
                    if (o.stream == null) {
                        Log.w(TAG, "no stream: " + o.none);
                        return;
                    }
                    Protocol.Stream s = o.stream;
                    Log.i(TAG, "resolved in " + (System.currentTimeMillis() - t0) + " ms: " + o.addon.name + " · " + s.codec + " " + s.sampleRate + "/" + s.bitDepth
                            + " · " + Protocol.redact(s.url));
                    url = s.url;
                    headers = Protocol.audio(s.url, s.headers, null).headers;
                    String override = i.getStringExtra("override");
                    if (override != null) {
                        url = override.startsWith("/") ? Uri.fromFile(new File(override)).toString() : override;
                        Log.i(TAG, "playing the override instead");
                    }
                } else {
                    addonName = i.getStringExtra("name");
                    url = src.startsWith("/") ? Uri.fromFile(new File(src)).toString() : src;
                }
                final String u = url;
                final Map<String, String> h = headers;
                main.post(() -> play(ctx, u, h, startMs, secs, clip));
            } catch (Throwable t) {
                AddonPlayback.upgrading(false);
                Log.e(TAG, "spike failed", t);
            }
        }, "direct-spike").start();
    }

    private static AddonClient client;

    /** One client for every broadcast: its stream limits and 429 lessons carry over. */
    private static synchronized AddonClient client() {
        if (client == null) client = AddonClient.create(line -> Log.i(TAG, line));
        return client;
    }

    private static boolean mp3Index;
    private static int warmMs;
    private static int prerollMs;
    private static volatile String addonName;

    private static void play(Context ctx, String url, Map<String, String> headers, long startMs, int secs, boolean clip) {
        try {
            release();
            ClassLoader cl = ctx.getClassLoader();
            Class<?> crg = cl.loadClass("crg"), ctb = cl.loadClass("ctb"), cms = cl.loadClass("cms"), cnf = cl.loadClass("cnf"),
                    dvp = cl.loadClass("dvp"), dme = cl.loadClass("dme"), cmj = cl.loadClass("cmj"), dvy = cl.loadClass("dvy"),
                    cdv = cl.loadClass("cdv"), ceg = cl.loadClass("ceg"), dkt = cl.loadClass("dkt"), cmq = cl.loadClass("cmq"),
                    djj = cl.loadClass("djj"), djm = cl.loadClass("djm"), cdw = cl.loadClass("cdw"), cev = cl.loadClass("cev");
            Object data;
            if (url.startsWith("file:")) {
                data = cmq.getConstructor(Context.class).newInstance(ctx);
            } else {
                data = cms.getConstructor().newInstance();
                cms.getField("b").set(data, Protocol.USER_AGENT);
                // cross-protocol redirects stay off (field e): https only, never down to http
                Field g = cms.getDeclaredField("g");
                g.setAccessible(true);
                Method set = cnf.getMethod("c", String.class, String.class);
                for (Map.Entry<String, String> e : headers.entrySet()) {
                    if (!e.getKey().equalsIgnoreCase("User-Agent")) set.invoke(g.get(data), e.getKey(), e.getValue());
                }
            }
            Object ext = dvp.getConstructor().newInstance();
            dvp.getMethod("d").invoke(ext); // constant-bitrate seeking, so a header-less MP3 can start at an offset
            if (mp3Index) dvp.getMethod("g").invoke(ext); // MP3 index seeking: exact, reads up to the offset
            Object factory = dme.getConstructor(cmj, dvy).newInstance(data, ext);
            Object p = crg.getMethod("a").invoke(crg.getConstructor(Context.class).newInstance(ctx));
            app.ayham.extension.music.features.PlayerTap.markOurs(p);
            player = p; // from here on release() frees it, also when a step below fails
            Object mib = cdv.getConstructor().newInstance();
            cdv.getField("b").set(mib, Uri.parse(url));
            Object src = dme.getMethod("a", ceg).invoke(factory, cdv.getMethod("a").invoke(mib));
            final long t0 = System.currentTimeMillis();
            p.getClass().getMethod("y", cev).invoke(p, Proxy.newProxyInstance(cl, new Class<?>[]{cev}, (proxy, m, a) -> {
                if (m.getDeclaringClass() == Object.class) return m.getName().equals("hashCode") ? System.identityHashCode(proxy) : m.getName().equals("equals") ? proxy == a[0] : "spike";
                String args = a == null ? "" : Arrays.deepToString(a);
                if (args.length() > 400) args = args.substring(0, 400) + "…";
                Log.i(TAG, "+" + (System.currentTimeMillis() - t0) + " ms " + m.getName() + args);
                return null;
            }));
            if (clip && startMs > 0) {
                Object cb = djj.getConstructor(dkt).newInstance(src);
                cdw.getMethod("d", long.class).invoke(djj.getField("b").get(cb), startMs);
                Object clipped = djm.getConstructor(djj).newInstance(cb);
                ctb.getMethod("af", List.class).invoke(p, Collections.singletonList(clipped));
            } else {
                ctb.getMethod("ae", List.class, long.class).invoke(p, Collections.singletonList(src), startMs);
            }
            ctb.getMethod("z").invoke(p);
            player = p;
            AddonPlayback.playing(p, addonName, prerollMs <= 0);
            if (prerollMs > 0) {
                // play silent first, so whatever happens as the stream starts is not heard
                final Method vol = ctb.getMethod("E", float.class);
                vol.invoke(p, 0f);
                final Method st = ctb.getMethod("n");
                main.post(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (player != p) return;
                            if ((int) st.invoke(p) != 3) {
                                main.postDelayed(this, 20);
                                return;
                            }
                            main.postDelayed(() -> {
                                try {
                                    if (player == p) {
                                        vol.invoke(p, 1f);
                                        AddonPlayback.audible(p, true);
                                        Log.i(TAG, "unmuted after " + prerollMs + " ms of silent play");
                                    }
                                } catch (Throwable ignored) {
                                }
                            }, prerollMs);
                        } catch (Throwable t) {
                            Log.e(TAG, "preroll failed", t);
                        }
                    }
                });
            }
            if (warmMs <= 0) {
                ctb.getMethod("A", boolean.class).invoke(p, true);
            } else {
                // hold play until READY, then warmMs more of loading
                final Method state = ctb.getMethod("n"), play = ctb.getMethod("A", boolean.class);
                final long asked = System.currentTimeMillis();
                main.post(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (player != p) return;
                            if ((int) state.invoke(p) != 3) {
                                main.postDelayed(this, 20);
                                return;
                            }
                            Log.i(TAG, "ready after " + (System.currentTimeMillis() - asked) + " ms; playing in " + warmMs + " ms");
                            main.postDelayed(() -> {
                                try {
                                    if (player == p) play.invoke(p, true);
                                } catch (Throwable ignored) {
                                }
                            }, warmMs);
                        } catch (Throwable t) {
                            Log.e(TAG, "warm failed", t);
                        }
                    }
                });
            }
            Log.i(TAG, "playing " + (url.startsWith("file:") ? url : Protocol.redact(url)) + " from " + startMs + " ms (" + (clip ? "clipped" : "start position") + ") for " + secs + " s");
            final Method pos = ctb.getMethod("r");
            for (int k = 1; k <= secs; k++) {
                final int kk = k;
                main.postDelayed(() -> {
                    try {
                        if (player == p) Log.i(TAG, "t+" + kk + " s position " + pos.invoke(p) + " ms");
                        if (player == p && kk == 3) dumpFormat(p);
                    } catch (Throwable ignored) {
                    }
                }, k * 1000L);
            }
            main.postDelayed(() -> {
                if (player == p) {
                    release();
                    Log.i(TAG, "stopped and released");
                }
            }, secs * 1000L + 300);
        } catch (Throwable t) {
            Log.e(TAG, "play failed", t);
            release();
        }
    }

    private static void dumpFormat(Object p) {
        try {
            Object f = app.ayham.extension.music.features.PlayerTap.audioFormat(p);
            if (f == null) {
                Log.i(TAG, "format: none found");
                return;
            }
            StringBuilder b = new StringBuilder("format " + f + " ints:");
            for (Field x : f.getClass().getDeclaredFields()) {
                if (x.getType() != int.class || java.lang.reflect.Modifier.isStatic(x.getModifiers())) continue;
                x.setAccessible(true);
                b.append(' ').append(x.getName()).append('=').append(x.getInt(f));
            }
            Log.i(TAG, b.toString());
        } catch (Throwable t) {
            Log.e(TAG, "format dump failed", t);
        }
    }

    private static void release() {
        Object p = player;
        player = null;
        if (p == null) return;
        try {
            p.getClass().getMethod("A", boolean.class).invoke(p, false);
            p.getClass().getMethod("L").invoke(p);
            app.ayham.extension.music.features.PlayerTap.forget(p);
            AddonPlayback.stopped(p);
        } catch (Throwable t) {
            Log.e(TAG, "release failed", t);
        }
    }
}
