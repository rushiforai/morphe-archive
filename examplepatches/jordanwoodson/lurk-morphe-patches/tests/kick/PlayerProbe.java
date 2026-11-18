import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;

/**
 * Kick's player hooks on ART, through the patched APK's real classes: Kick's player view and player
 * (kick-player-v3, made without their constructors around the fields the hooks use), its Media3 listener, and Media3's
 * own Format, DecoderCounters, Metadata and SCTE-35 classes, with the ExoPlayer itself a stand-in that records calls.
 * Usage: PlayerProbe <patched.apk>; bin/test-kick runs it.
 *
 * Show video stats: the player's real emitTimeUpdate, through the injected hook, puts a panel with the ExoPlayer's
 * numbers in the player view's overlay with the switch on, keeps Kick's own code running after it, survives a player
 * that throws, and removes the panel at the next update once the switch is off.
 *
 * Mute stitched live ads: Media3 SCTE-35 splice inserts fed to Kick's real player listener (through the onMetadata the
 * patch adds) and Kick's own MediaTailor ad events fed to the view's callback mute the player through its own setMuted
 * and cover the video, and both come back when the break's time is up, the break returns or another stream loads.
 * Other metadata, cancelled splices and the switch off change nothing.
 *
 * Refresh stream: the bridges KickTouch reads the player through give a video's duration and position from the
 * ExoPlayer, none for a live stream, and seek it.
 */
public final class PlayerProbe {
    private static final Map<String, Boolean> switches = new HashMap<>();
    private static JSONObject locators = new JSONObject();
    private static String registry = "";
    private static Context system;
    private static Object unsafe;
    private static Method allocate;

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static Field field(Class<?> type, String name) throws Exception {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    /** The class and method recorded as [key], or the given fallback while the APK has no locator for it. */
    private static String[] locate(String key, String className, String method) {
        String value = locators.optString(key, "");
        if (value.isEmpty()) return new String[]{className, method};
        java.util.regex.Matcher reference = java.util.regex.Pattern.compile("L([^;]+);->([^(]+)\\(").matcher(value);
        check(reference.lookingAt(), "Malformed locator " + key + ": " + value);
        return new String[]{reference.group(1).replace('/', '.'), reference.group(2)};
    }

    private static final class Stop extends RuntimeException {
    }

    /** Runs the main looper for [milliseconds]: what the hooks post there, and their timers, run meanwhile. */
    static void pump(long milliseconds) {
        new Handler(Looper.getMainLooper()).postDelayed(() -> { throw new Stop(); }, milliseconds);
        try {
            Looper.loop();
        } catch (Stop expected) {
            // The loop is left by the sentinel and can be entered again.
        }
    }

    static Object make(Class<?> type) throws Exception {
        return allocate.invoke(unsafe, type);
    }

    /** Kick's player view, made without its constructor: a context, resources and a 720 x 405 frame. */
    static View playerView() throws Exception {
        Class<?> type = Class.forName("com.kick.mobile.playerv3.VideoView");
        View view = (View) make(type);
        field(View.class, "mContext").set(view, system);
        field(View.class, "mResources").set(view, system.getResources());
        field(View.class, "mRight").setInt(view, 720);
        field(View.class, "mBottom").setInt(view, 405);
        return view;
    }

    /** A Media3 ExoPlayer that answers from [answers] (method name to value) and records every call in [calls]. */
    static Object exoPlayer(Map<String, Object> answers, List<String> calls) throws Exception {
        Class<?> type = Class.forName("androidx.media3.exoplayer.ExoPlayer");
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, values) -> {
            String call = method.getName() + (values == null ? "[]" : Arrays.toString(values));
            synchronized (calls) {
                calls.add(call);
            }
            Object answer = answers.get(method.getName());
            if (answer instanceof RuntimeException) throw (RuntimeException) answer;
            if (answer != null) return answer;
            Class<?> result = method.getReturnType();
            if (result == long.class) return 0L;
            if (result == int.class) return 0;
            if (result == float.class) return 0f;
            if (result == boolean.class) return false;
            return null;
        });
    }

    /**
     * Kick's player, made without its constructor, on [view] (which shows it) with [exo] as its ExoPlayer. Its JavaScript
     * runtime is gone, so Kick's code after the hooks finds no app context; [kick] records that it got that far. The
     * mute the player is set to goes to [calls] as "muted[new, old]".
     */
    static Object videoPlayer(View view, Object exo, List<String> calls, boolean[] kick) throws Exception {
        Class<?> type = Class.forName("com.kick.mobile.playerv3.player.VideoPlayer");
        Object player = make(type);
        field(Class.forName("expo.modules.kotlin.sharedobjects.SharedObject"), "runtimeContextHolder")
            .set(player, new WeakReference<Object>(null) {
                @Override public Object get() {
                    kick[0] = true;
                    return null;
                }
            });
        field(type, "player").set(player, exo);
        Class<?> reference = Class.forName("com.kick.mobile.playerv3.utils.MutableWeakReference");
        Class<?> function2 = Class.forName("kotlin.jvm.functions.Function2");
        Object unit = Class.forName("kotlin.Unit").getField("INSTANCE").get(null);
        field(type, "currentVideoViewRef").set(player,
            reference.getConstructor(Object.class, function2).newInstance(view, null));
        Object didSet = Proxy.newProxyInstance(function2.getClassLoader(), new Class<?>[]{function2},
            (proxy, method, values) -> {
                if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (method.getName().equals("equals")) return proxy == values[0];
                if (method.getName().equals("toString")) return "didSet";
                synchronized (calls) {
                    calls.add("muted" + Arrays.toString(values));
                }
                return unit;
            });
        Class<?> delegate = Class.forName("com.kick.mobile.playerv3.delegates.IgnoreSameSet");
        Constructor<?> make = delegate.getConstructor(Object.class, Class.forName("kotlin.jvm.functions.Function1"),
            function2, int.class, Class.forName("kotlin.jvm.internal.DefaultConstructorMarker"));
        field(type, "muted$delegate").set(player, make.newInstance(false, null, didSet, 2, null));
        field(view.getClass(), "videoPlayer").set(view, player);
        return player;
    }

    // ---------------------------------------------------------------------------------------------
    // Show video stats

    private static void verifyStats() throws Exception {
        if (!registry.contains("\"video_stats\"")) {
            System.out.println("SKIP: Show video stats isn't in this APK");
            return;
        }
        String[] located = locate("kick.video_stats.time_update", "com.kick.mobile.playerv3.player.VideoPlayer",
            "emitTimeUpdate");
        Method update = Class.forName(located[0]).getMethod(located[1]);
        View view = playerView();

        Class<?> builder = Class.forName("androidx.media3.common.Format$Builder");
        Object videoBuilder = builder.getConstructor().newInstance();
        builder.getMethod("setAverageBitrate", int.class).invoke(videoBuilder, 5_800_000);
        builder.getMethod("setPeakBitrate", int.class).invoke(videoBuilder, 6_000_000);
        builder.getMethod("setWidth", int.class).invoke(videoBuilder, 1920);
        builder.getMethod("setHeight", int.class).invoke(videoBuilder, 1080);
        builder.getMethod("setFrameRate", float.class).invoke(videoBuilder, 60f);
        builder.getMethod("setCodecs", String.class).invoke(videoBuilder, "avc1.64002A");
        Object video = builder.getMethod("build").invoke(videoBuilder);
        Object audioBuilder = builder.getConstructor().newInstance();
        builder.getMethod("setCodecs", String.class).invoke(audioBuilder, "mp4a.40.2");
        Object audio = builder.getMethod("build").invoke(audioBuilder);
        Class<?> countersType = Class.forName("androidx.media3.exoplayer.DecoderCounters");
        Object counters = countersType.getConstructor().newInstance();
        countersType.getField("droppedBufferCount").setInt(counters, 3);
        countersType.getField("renderedOutputBufferCount").setInt(counters, 1190);
        countersType.getField("skippedOutputBufferCount").setInt(counters, 7);

        Map<String, Object> answers = new HashMap<>();
        answers.put("isCurrentMediaItemLive", true);
        answers.put("getCurrentLiveOffset", 2100L);
        answers.put("getTotalBufferedDuration", 4300L);
        answers.put("getVideoFormat", video);
        answers.put("getAudioFormat", audio);
        answers.put("getVideoDecoderCounters", counters);
        List<String> calls = new ArrayList<>();
        boolean[] kick = new boolean[1];
        Object player = videoPlayer(view, exoPlayer(answers, calls), new ArrayList<>(), kick);

        Class<?> stats = Class.forName("io.github.jordanwoodson.extension.shared.kick.KickStats");
        Method shown = stats.getDeclaredMethod("shown", View.class);
        shown.setAccessible(true);

        switches.put("video_stats", false);
        update.invoke(player);
        pump(200);
        check(shown.invoke(null, view) == null, "Show video stats off: a panel appeared");
        check(calls.isEmpty(), "Show video stats off: the hook read the player: " + calls);
        check(kick[0], "Kick's own time update didn't run (off)");

        switches.put("video_stats", true);
        kick[0] = false;
        update.invoke(player);
        pump(200);
        String[] lines = (String[]) shown.invoke(null, view);
        check(lines != null && lines.length == 6, "Show video stats on: panel " +
            (lines == null ? "missing" : Arrays.toString(lines)));
        // The network estimate comes from Media3's shared bandwidth meter, whatever it has in this process.
        check(lines[1].matches("Bitrate  5\\.80 Mbps(, network .*)?"), "Show video stats on: bitrate " + lines[1]);
        List<String> expected = Arrays.asList(
            "Latency  2.1 s",
            lines[1],
            "Buffer   4.3 s",
            "Dropped  3 of 1200 frames, 60 fps",
            "Quality  1080p60, 1920x1080",
            "Codecs   avc1.64002A, mp4a.40.2");
        check(Arrays.asList(lines).equals(expected), "Show video stats on: panel " + Arrays.toString(lines));
        check(kick[0], "Kick's own time update didn't run (on)");

        // The panel is a drawable in the view's overlay: it draws its box and text in the top left corner.
        Object overlay = view.getOverlay();
        Object group = field(Class.forName("android.view.ViewOverlay"), "mOverlayViewGroup").get(overlay);
        @SuppressWarnings("unchecked")
        List<Drawable> drawables = (List<Drawable>) field(group.getClass(), "mDrawables").get(group);
        check(drawables.size() == 1, "Show video stats on: the overlay holds " + drawables.size() + " drawables");
        Bitmap bitmap = Bitmap.createBitmap(720, 405, Bitmap.Config.ARGB_8888);
        drawables.get(0).draw(new Canvas(bitmap));
        check((bitmap.getPixel(30, 30) >>> 24) > 0x80, "Show video stats on: no box in the top left corner");
        check(bitmap.getPixel(700, 390) == 0, "Show video stats on: the panel covers the whole player");

        // A player that fails while it's read: no panel update and no crash; Kick's own code still runs.
        answers.put("getVideoFormat", new IllegalStateException("released"));
        kick[0] = false;
        update.invoke(player);
        check(kick[0], "Kick's own code didn't run after a failed read");
        answers.put("getVideoFormat", video);

        // Off again: the next update removes the panel, and the overlay is empty.
        switches.put("video_stats", false);
        update.invoke(player);
        pump(200);
        check(shown.invoke(null, view) == null && drawables.isEmpty(), "Show video stats off: the panel stayed");
        switches.remove("video_stats");
        System.out.println("PASS: Show video stats draws " + expected.size() + " lines from Kick's Media3 player through "
            + "its time update, never reads the player while off, and removes the panel when switched off");
    }

    // ---------------------------------------------------------------------------------------------
    // Mute stitched live ads

    /** The mutes the player was set to, as "muted[new, old]". */
    private static List<String> mutes(List<String> calls) {
        synchronized (calls) {
            return new ArrayList<>(calls);
        }
    }

    private static boolean covered(View view) {
        Drawable cover = view.getForeground();
        return cover != null && cover.getClass().getName().endsWith("KickAds$AdCover");
    }

    /** Media3's SCTE-35 splice insert: out of the network for [durationMs] (0 for none), or its return. */
    private static Object splice(boolean out, boolean cancelled, long durationMs) throws Exception {
        Class<?> type = Class.forName("androidx.media3.extractor.metadata.scte35.SpliceInsertCommand");
        Constructor<?> make = type.getDeclaredConstructor(long.class, boolean.class, boolean.class, boolean.class,
            boolean.class, long.class, long.class, List.class, boolean.class, long.class, int.class, int.class, int.class);
        make.setAccessible(true);
        long unset = Long.MIN_VALUE + 1;
        return make.newInstance(42L, cancelled, out, true, false, unset, unset, new ArrayList<>(), true,
            durationMs > 0 ? durationMs * 1000 : unset, 0, 1, 1);
    }

    private static Object metadata(Object entry) throws Exception {
        Class<?> entryType = Class.forName("androidx.media3.common.Metadata$Entry");
        Object entries = java.lang.reflect.Array.newInstance(entryType, 1);
        java.lang.reflect.Array.set(entries, 0, entry);
        return Class.forName("androidx.media3.common.Metadata").getConstructor(entries.getClass()).newInstance(entries);
    }

    private static void verifyAds() throws Exception {
        if (!registry.contains("\"mute_live_ads\"")) {
            System.out.println("SKIP: Mute stitched live ads isn't in this APK");
            return;
        }
        View view = playerView();
        List<String> mutes = new ArrayList<>();
        boolean[] kick = new boolean[1];
        Object player = videoPlayer(view, exoPlayer(new HashMap<>(), new ArrayList<>()), mutes, kick);
        Class<?> playerType = player.getClass();
        Method setMuted = playerType.getMethod("setMuted", boolean.class);
        Method prepare = playerType.getMethod("prepare");

        // Kick's player listener (the type of the player's playerListener, as the patch finds it), holding the player,
        // with the onMetadata the patch adds.
        Class<?> listenerType = playerType.getDeclaredField("playerListener").getType();
        Object listener = make(listenerType);
        for (Field f : listenerType.getDeclaredFields()) {
            if (f.getType() == playerType) {
                f.setAccessible(true);
                f.set(listener, player);
            }
        }
        Method onMetadata = listenerType.getMethod("onMetadata", Class.forName("androidx.media3.common.Metadata"));

        // The view's MediaTailor callback, with Kick's own ad event payload.
        String[] tailor = locate("kick.mute_live_ads.media_tailor_event", "com.kick.mobile.playerv3.VideoView",
            "setDatazoom$lambda$1");
        Class<?> payloadType = Class.forName("com.kick.mobile.playerv3.datazoom.MediaTailorAdEventPayload");
        Method adEvent = Class.forName(tailor[0]).getDeclaredMethod(tailor[1], view.getClass(), payloadType);
        adEvent.setAccessible(true);
        Constructor<?> payload = payloadType.getConstructor(String.class, String.class, String.class, String.class,
            double.class, double.class, double.class, double.class, String.class, int.class, int.class);

        // Off: an ad break changes nothing.
        switches.put("mute_live_ads", false);
        onMetadata.invoke(listener, metadata(splice(true, false, 2000)));
        check(!covered(view) && mutes.isEmpty(), "off: a splice insert muted or covered the player");

        // On: metadata that isn't an ad and a cancelled splice change nothing.
        switches.put("mute_live_ads", true);
        Object event = Class.forName("androidx.media3.extractor.metadata.emsg.EventMessage")
            .getConstructor(String.class, String.class, long.class, long.class, byte[].class)
            .newInstance("https://aomedia.org/emsg/ID3", "", 0L, 1L, new byte[0]);
        onMetadata.invoke(listener, metadata(event));
        onMetadata.invoke(listener, metadata(splice(true, true, 2000)));
        check(!covered(view) && mutes.isEmpty(), "on: other metadata or a cancelled splice muted the player");

        // A two-second break: muted and covered at once; Kick's own unmute is kept back; both back once its time is up.
        onMetadata.invoke(listener, metadata(splice(true, false, 2000)));
        check(covered(view) && mutes(mutes).equals(List.of("muted[true, false]")), "splice: " + mutes + " " + covered(view));
        setMuted.invoke(player, false);
        check(mutes(mutes).size() == 1, "Kick's unmute reached the player during the break: " + mutes);
        pump(3000);
        check(covered(view), "the break ended before its time");
        pump(1500);
        check(!covered(view) && mutes(mutes).equals(List.of("muted[true, false]", "muted[false, true]")),
            "the break didn't end: " + mutes);

        // The splice's return ends the break at once; so does another stream.
        mutes.clear();
        onMetadata.invoke(listener, metadata(splice(true, false, 0)));
        check(covered(view), "a splice without a duration didn't start a break");
        onMetadata.invoke(listener, metadata(splice(false, false, 0)));
        check(!covered(view) && mutes(mutes).size() == 2, "the splice's return didn't end the break: " + mutes);
        onMetadata.invoke(listener, metadata(splice(true, false, 30_000)));
        check(covered(view), "no break");
        try {
            prepare.invoke(player);
        } catch (InvocationTargetException expected) {
            // Kick's prepare goes on to its own player state, which this player made without a constructor lacks.
        }
        check(!covered(view), "another stream didn't end the break");

        // MediaTailor: adStart covers, adEnd ends the break 1.5 s later unless the next ad starts.
        mutes.clear();
        for (String type : new String[]{"adStart", "adEnd"}) {
            try {
                adEvent.invoke(null, view, payload.newInstance(type, "ad", "", "", 15.0, 0.0, 0.0, 15.0, "avail", 1, 1));
            } catch (InvocationTargetException expected) {
                // Kick's callback goes on to React Native's event, which this view made without a constructor lacks.
            }
            if (type.equals("adStart")) check(covered(view), "MediaTailor adStart didn't cover the player");
        }
        pump(1000);
        check(covered(view), "MediaTailor adEnd ended the break before the pod gap");
        pump(800);
        check(!covered(view) && mutes(mutes).size() == 2, "MediaTailor adEnd didn't end the break: " + mutes);

        // A player Kick had muted stays muted after the break; the switch going off mid-break still ends it.
        setMuted.invoke(player, true);
        mutes.clear();
        onMetadata.invoke(listener, metadata(splice(true, false, 1000)));
        switches.put("mute_live_ads", false);
        pump(3500);
        check(!covered(view), "the break didn't end with the switch off");
        check(mutes(mutes).isEmpty(), "a player Kick had muted was unmuted: " + mutes);
        switches.remove("mute_live_ads");
        System.out.println("PASS: Mute stitched live ads mutes and covers Kick's player for SCTE-35 splice inserts and "
            + "MediaTailor ads, ignores other metadata and cancelled splices, and ends on time, on return and on another "
            + "stream");
    }

    // ---------------------------------------------------------------------------------------------
    // Refresh stream

    private static void verifyRefreshBridges() throws Exception {
        if (!registry.contains("\"refresh_stream\"")) {
            System.out.println("SKIP: Refresh stream isn't in this APK");
            return;
        }
        Class<?> touch = Class.forName("io.github.jordanwoodson.extension.shared.kick.KickTouch");
        Method duration = touch.getDeclaredMethod("duration", View.class);
        Method position = touch.getDeclaredMethod("position", View.class);
        Method seek = touch.getDeclaredMethod("seek", View.class, double.class);
        for (Method m : new Method[]{duration, position, seek}) m.setAccessible(true);
        Map<String, Object> answers = new HashMap<>();
        List<String> calls = new ArrayList<>();
        View view = playerView();
        videoPlayer(view, exoPlayer(answers, calls), new ArrayList<>(), new boolean[1]);
        answers.put("isCurrentMediaItemLive", true);
        answers.put("getDuration", 7_200_000L);
        check(duration.invoke(null, view) == null, "a live stream has a duration");
        answers.put("isCurrentMediaItemLive", false);
        check(Long.valueOf(7_200_000L).equals(duration.invoke(null, view)), "a video's duration");
        answers.put("getCurrentPosition", 61_500L);
        check(Integer.valueOf(61).equals(position.invoke(null, view)), "a video's position");
        seek.invoke(null, view, 61.0);
        check(calls.contains("seekTo[61000]"), "seek: " + calls);
        View empty = playerView();
        check(duration.invoke(null, empty) == null && Integer.valueOf(0).equals(position.invoke(null, empty)),
            "a view without a player");
        seek.invoke(null, empty, 5.0);
        System.out.println("PASS: Refresh stream reads a video's duration and position from Kick's Media3 player, none "
            + "for a live stream or a view without a player, and seeks it");
    }

    public static void main(String[] args) throws Exception {
        // app_process kills the whole process on an exception in any thread; say what it was first.
        Thread.setDefaultUncaughtExceptionHandler((thread, failure) -> {
            System.out.println("Exception in " + thread.getName() + ":");
            failure.printStackTrace(System.out);
            System.out.flush();
            System.exit(1);
        });
        Looper.prepareMainLooper();
        // app_process has no system font map, and Typeface's default would be set twice (a native abort) when the
        // panels' paints first need it: give it one font for every family first.
        android.graphics.fonts.Font font = new android.graphics.fonts.Font.Builder(
            new java.io.File("/system/fonts/Roboto-Regular.ttf")).build();
        Method makeFace = Typeface.class.getDeclaredMethod("createFromFamilies", String.class,
            android.graphics.fonts.FontFamily[].class);
        makeFace.setAccessible(true);
        Typeface face = (Typeface) makeFace.invoke(null, "sans-serif",
            new android.graphics.fonts.FontFamily[]{new android.graphics.fonts.FontFamily.Builder(font).build()});
        Method fonts = Typeface.class.getDeclaredMethod("setSystemFontMap", Map.class);
        fonts.setAccessible(true);
        fonts.invoke(null, Map.of("sans-serif", face, "serif", face, "monospace", face));
        Object thread = Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
        system = (Context) thread.getClass().getMethod("getSystemContext").invoke(thread);
        Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
        unsafe = unsafeClass.getMethod("getUnsafe").invoke(null);
        allocate = unsafeClass.getMethod("allocateInstance", Class.class);

        AssetManager assets = AssetManager.class.getDeclaredConstructor().newInstance();
        AssetManager.class.getMethod("addAssetPath", String.class).invoke(assets, args[0]);
        try (InputStream input = assets.open("lurk/locators.json")) {
            locators = new JSONObject(new String(input.readAllBytes(), "UTF-8"));
        } catch (java.io.IOException absent) {
            System.out.println("Locators: no assets/lurk/locators.json, using the names PlayerProbe knows");
        }
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                if (method.getName().equals("getBoolean")) {
                    return switches.getOrDefault((String) values[0], (Boolean) values[1]);
                }
                if (method.getName().equals("getString")) return values[1];
                if (method.getName().equals("getAll")) return new HashMap<String, Object>();
                if (method.getName().equals("contains")) return switches.containsKey((String) values[0]);
                if (method.getName().startsWith("registerOn") || method.getName().startsWith("unregisterOn")) return null;
                throw new UnsupportedOperationException(method.getName());
            });
        Context context = new ContextWrapper(system) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
        };
        Class<?> settings = Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings");
        field(settings, "context").set(null, context);
        Method registryJson = settings.getDeclaredMethod("registryJson");
        registryJson.setAccessible(true);
        registry = (String) registryJson.invoke(null);

        try {
            verifyStats();
            verifyAds();
            verifyRefreshBridges();
        } catch (InvocationTargetException e) {
            throw new AssertionError("a hooked method threw", e.getCause());
        }
        // Media3's bandwidth meter leaves a worker thread that would keep app_process alive.
        System.out.flush();
        System.exit(0);
    }
}
