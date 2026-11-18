import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.os.Looper;
import android.view.View;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/** Executes the injected loader on Android. All-off must reconstruct the independent stock SHA-256. */
public final class BundleProbe {
    /** The stock bundle's SHA-256, from HermesBundle.SOURCE_SHA256 (bin/test-kick passes it). */
    private static String stock;
    private static final Map<String, Boolean> switches = new HashMap<>();
    private static final Map<String, String> choices = new HashMap<>();

    /** Names the patches matched, from the APK's assets/lurk/locators.json (Locators.record); empty without it. */
    private static JSONObject locators = new JSONObject();

    /**
     * The class and method name of the Disable analytics hook recorded as kick.disable_analytics.[name], or the given
     * fallback while the APK has no locator for it.
     */
    private static String[] locate(String name, String className, String method) {
        return locateKey("kick.disable_analytics." + name, className, method);
    }

    /** The class and method name recorded as [key], or the given fallback while the APK has no locator for it. */
    private static String[] locateKey(String key, String className, String method) {
        String value = locators.optString(key, "");
        if (value.isEmpty()) return new String[]{className, method};
        java.util.regex.Matcher reference = java.util.regex.Pattern.compile("L([^;]+);->([^(]+)\\(").matcher(value);
        check(reference.lookingAt(), "Malformed locator " + key + ": " + value);
        return new String[]{reference.group(1).replace('/', '.'), reference.group(2)};
    }

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static String digest(String algorithm, byte[] bytes) throws Exception {
        StringBuilder value = new StringBuilder();
        for (byte b : MessageDigest.getInstance(algorithm).digest(bytes)) value.append(String.format("%02x", b & 255));
        return value.toString();
    }

    private static byte[] unhex(String value) {
        byte[] result = new byte[value.length() / 2];
        for (int i = 0; i < result.length; i++) result[i] = (byte) Integer.parseInt(value.substring(2 * i, 2 * i + 2), 16);
        return result;
    }

    private static byte[] read(AssetManager assets, String name) throws Exception {
        try (java.io.InputStream input = assets.open(name)) { return input.readAllBytes(); }
    }

    private static void verifyAnalyticsJobs(Class<?> settings) throws Exception {
        Method registryJson = settings.getDeclaredMethod("registryJson");
        registryJson.setAccessible(true);
        JSONArray entries = new JSONObject((String) registryJson.invoke(null)).getJSONArray("settings");
        boolean selected = false;
        for (int i = 0; i < entries.length(); i++) {
            if ("disable_analytics".equals(entries.getJSONObject(i).getString("key"))) selected = true;
        }
        if (!selected) return; // Hermes-only combinations do not patch these jobs.

        // Isolate from the completed Hermes snapshot tests. Constructors and the original job
        // bodies must not run: either could initialize SDK work in this app_process test.
        switches.put("disable_analytics", true);
        try {
            Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
            Object unsafe = unsafeClass.getMethod("getUnsafe").invoke(null);
            Method allocate = unsafeClass.getMethod("allocateInstance", Class.class);
            Class<?> parameters = Class.forName("android.app.job.JobParameters");
            for (String[] job : new String[][]{
                    locate("insider_session_upload_job", "com.useinsider.insider.SessionPayloadJobService", "onStartJob"),
                    locate("insider_amplification_job", "com.useinsider.insider.InsiderAmplificationService", "onStartJob")}) {
                Class<?> type = Class.forName(job[0]);
                String name = type.getSimpleName();
                Object service = allocate.invoke(unsafe, type);
                Object result = type.getMethod(job[1], parameters).invoke(service, new Object[]{null});
                check(Boolean.FALSE.equals(result), name + " did not complete synchronously");
            }
            System.out.println("PASS: two actual Insider job guards complete synchronously without SDK dispatch");
            verifyPromises(unsafe, allocate);
        } finally {
            switches.remove("disable_analytics");
            switches.remove("block_fingerprinting");
        }
    }

    /**
     * The Firebase event bridge, Datadog's React initialization and the player's PAL nonce loader settle their promise
     * at once, so JavaScript awaiting them carries on; FingerprintJS rejects as a network error only while its own
     * switch is on. The real methods run on instances made without constructors.
     */
    @SuppressWarnings("deprecation")
    private static void verifyPromises(Object unsafe, Method allocate) throws Exception {
        // The PAL bridge makes a main-thread Handler when its class loads; app_process has no main Looper yet.
        if (android.os.Looper.getMainLooper() == null) android.os.Looper.prepareMainLooper();
        List<String> calls = new ArrayList<>();
        Class<?> reactPromise = Class.forName("com.facebook.react.bridge.Promise");
        Class<?> expoPromise = Class.forName("expo.modules.kotlin.Promise");
        Class<?> readableMap = Class.forName("com.facebook.react.bridge.ReadableMap");
        Object promise = Proxy.newProxyInstance(reactPromise.getClassLoader(), new Class<?>[]{reactPromise},
            (proxy, method, values) -> { calls.add(method.getName() + Arrays.toString(values)); return null; });
        Object expo = Proxy.newProxyInstance(expoPromise.getClassLoader(), new Class<?>[]{expoPromise},
            (proxy, method, values) -> { calls.add(method.getName() + Arrays.toString(values)); return null; });

        String[] logEvent = locate("firebase_log_event", "io.invertase.firebase.analytics.NativeRNFBTurboAnalytics", "logEvent");
        Class<?> firebase = Class.forName(logEvent[0]);
        firebase.getMethod(logEvent[1], String.class, readableMap, reactPromise)
            .invoke(allocate.invoke(unsafe, firebase), "screen_view", null, promise);
        check(calls.equals(List.of("resolve[null]")), "Firebase logEvent: " + calls);
        calls.clear();
        String[] initialize = locate("datadog_initialize", "com.datadog.reactnative.DdSdkImplementation", "initialize");
        Class<?> datadog = Class.forName(initialize[0]);
        datadog.getMethod(initialize[1], readableMap, reactPromise).invoke(allocate.invoke(unsafe, datadog), null, promise);
        check(calls.equals(List.of("resolve[null]")), "Datadog initialize: " + calls);
        calls.clear();
        String[] nonce = locate("pal_generate_nonce", "com.kick.mobile.playerv3.pal.PalNonceGenerator", "loadNonce");
        Class<?> pal = Class.forName(nonce[0]);
        Class<?> palOptions = Class.forName("com.kick.mobile.playerv3.pal.PalNonceRequestOptions");
        pal.getMethod(nonce[1], Context.class, palOptions, expoPromise)
            .invoke(allocate.invoke(unsafe, pal), null, null, expo);
        // Kick's JavaScript reads a missing nonce as an empty one and requests playback without it.
        check(calls.equals(List.of("resolve[null]")), "PAL nonce: " + calls);
        calls.clear();

        for (String[] visitor : new String[][]{
                locate("fingerprintjs_visitor_data", "com.fingerprintjs.reactnative.RNFingerprintjsProModule", "getVisitorDataWithTimeout"),
                locate("fingerprintjs_visitor_id", "com.fingerprintjs.reactnative.RNFingerprintjsProModule", "getVisitorIdWithTimeout")}) {
            Class<?> fpjs = Class.forName(visitor[0]);
            Object module = allocate.invoke(unsafe, fpjs);
            String name = visitor[1];
            Method method = fpjs.getMethod(name, readableMap, String.class, Integer.class, reactPromise);
            switches.put("block_fingerprinting", false);
            method.invoke(module, null, null, null, promise);
            check(calls.isEmpty(), name + " ran Lurk's rejection with the switch off: " + calls);
            switches.put("block_fingerprinting", true);
            method.invoke(module, null, null, null, promise);
            check(calls.equals(List.of("reject[Error: , NetworkError]")), name + ": " + calls);
            calls.clear();
        }
        System.out.println("PASS: Firebase, Datadog and PAL stubs resolve their promise; FingerprintJS rejects only "
            + "with its switch on");
        verifyPlayerAnalytics(unsafe, allocate);
    }

    /**
     * Kick's player: Mux Data's monitor keeps no options, so it never starts Mux, and the player view makes no Datazoom
     * monitor, with Disable analytics on. Off, Kick's own code runs: the monitor keeps the options, and the view goes
     * on to make its Datazoom monitor, which fails here on a view made without its constructor.
     */
    private static void verifyPlayerAnalytics(Object unsafe, Method allocate) throws Exception {
        String[] mux = locate("mux_options", "com.kick.mobile.playerv3.MuxDataMonitor", "setOptions");
        Class<?> monitorType = Class.forName(mux[0]);
        Class<?> muxOptions = Class.forName("com.kick.mobile.playerv3.records.MuxDataOptions");
        Method setOptions = monitorType.getMethod(mux[1], muxOptions, Class.forName("androidx.media3.exoplayer.ExoPlayer"));
        Object options = allocate.invoke(unsafe, muxOptions);
        field(muxOptions, "environmentKey").set(options, "");
        Field kept = field(monitorType, "options");
        for (boolean on : new boolean[]{true, false}) {
            switches.put("disable_analytics", on);
            Object monitor = allocate.invoke(unsafe, monitorType);
            setOptions.invoke(monitor, options, null);
            check((kept.get(monitor) == null) == on, "Mux options kept with Disable analytics " + (on ? "on" : "off"));
        }

        String[] datazoom = locate("datazoom_options", "com.kick.mobile.playerv3.VideoView", "setDatazoom");
        Class<?> viewType = Class.forName(datazoom[0]);
        Class<?> datazoomOptions = Class.forName("com.kick.mobile.playerv3.datazoom.DatazoomOptions");
        Method setDatazoom = viewType.getMethod(datazoom[1], datazoomOptions);
        Field datazoomMonitor = field(viewType, "datazoomMonitor");
        Object datazoomValue = allocate.invoke(unsafe, datazoomOptions);
        switches.put("disable_analytics", true);
        Object view = allocate.invoke(unsafe, viewType);
        setDatazoom.invoke(view, datazoomValue);
        check(datazoomMonitor.get(view) == null, "Datazoom monitor made with Disable analytics on");
        switches.put("disable_analytics", false);
        try {
            setDatazoom.invoke(allocate.invoke(unsafe, viewType), datazoomValue);
            throw new AssertionError("Kick's setDatazoom didn't run with Disable analytics off");
        } catch (java.lang.reflect.InvocationTargetException expected) {
            check(expected.getCause() instanceof NullPointerException, "setDatazoom off: " + expected.getCause());
        }
        switches.put("disable_analytics", true);
        System.out.println("PASS: Mux and Datazoom stay unstarted in Kick's player with Disable analytics on, and run "
            + "with it off");
    }

    /**
     * Process starts with settings off their defaults reuse the private copy: the same settings load it without
     * rewriting it, while a changed setting, a changed copy or a sidecar written for another embedded bundle build it
     * again, and the patch-time defaults delete both files.
     */
    private static void verifyReuse(Method prepare, Field prepared, Field defaults, AssetManager assets, byte[] embedded,
                                    File directory, JSONArray edits) throws Exception {
        File output = new File(directory, "lurk-kick.hbc");
        File sidecar = new File(directory, "lurk-kick.json");
        List<String> keys = new ArrayList<>(switches.keySet());
        check(keys.size() >= 2, "Reuse needs two switches");
        switches.put(keys.get(0), true);
        byte[] first = load(prepare, prepared, defaults, assets, embedded);
        check(output.isFile() && sidecar.isFile(), "No private copy and sidecar for non-default settings");
        check(output.setLastModified(1_000_000_000_000L), "Cannot date the private copy");
        byte[] again = load(prepare, prepared, defaults, assets, embedded);
        check(Arrays.equals(again, first) && output.lastModified() == 1_000_000_000_000L,
            "The same settings rebuilt the private copy");

        try (java.io.RandomAccessFile file = new java.io.RandomAccessFile(output, "rw")) {
            file.seek(1000);
            int value = file.read();
            file.seek(1000);
            file.write(value ^ 1);
        }
        output.setLastModified(1_000_000_000_000L);
        byte[] repaired = load(prepare, prepared, defaults, assets, embedded);
        check(Arrays.equals(repaired, first) && output.lastModified() != 1_000_000_000_000L,
            "A changed private copy was reused");

        JSONObject stored = new JSONObject(new String(Files.readAllBytes(sidecar.toPath()), "UTF-8"));
        JSONObject key = new JSONObject(stored.getString("key"));
        key.put("embeddedSha256", "0000000000000000000000000000000000000000000000000000000000000000");
        Files.write(sidecar.toPath(), stored.put("key", key.toString()).toString().getBytes("UTF-8"));
        output.setLastModified(1_000_000_000_000L);
        load(prepare, prepared, defaults, assets, embedded);
        check(output.lastModified() != 1_000_000_000_000L, "A sidecar for another embedded bundle was trusted");

        switches.put(keys.get(1), true);
        output.setLastModified(1_000_000_000_000L);
        byte[] changed = load(prepare, prepared, defaults, assets, embedded);
        check(!Arrays.equals(changed, first) && output.lastModified() != 1_000_000_000_000L,
            "A changed setting reused the old private copy");

        // The patch-time defaults use the embedded asset and remove both files.
        for (int i = 0; i < edits.length(); i++) {
            JSONObject edit = edits.getJSONObject(i);
            if (edit.has("values")) choices.put(edit.getString("key"), edit.getString("default"));
            else switches.put(edit.getString("key"), edit.getBoolean("default"));
        }
        check(load(prepare, prepared, defaults, assets, embedded) == embedded, "Defaults did not use the embedded asset");
        check(!output.exists() && !sidecar.exists(), "Defaults left the private copy or its sidecar");
        System.out.println("PASS: private copy reused for the same settings and rebuilt for changed settings, a changed "
            + "copy or another embedded bundle; defaults remove it");
    }

    /** Show exact counts: Kick's real native formatter, rounded with the switch off and in full with it on. */
    private static void verifyCounts(Class<?> settings) throws Exception {
        Method registryJson = settings.getDeclaredMethod("registryJson");
        registryJson.setAccessible(true);
        if (!((String) registryJson.invoke(null)).contains("\"exact_counts\"")) return;
        Class<?> formatter = Class.forName("expo.modules.kickintlformatter.KickIntlFormatterModule");
        Object module = formatter.getConstructor().newInstance();
        Method format = formatter.getMethod("formatNumber", double.class, String.class, Boolean.class);
        switches.put("exact_counts", false);
        String rounded = (String) format.invoke(module, 306112d, "en", null);
        switches.put("exact_counts", true);
        String exact = (String) format.invoke(module, 306112d, "en", null);
        String explicit = (String) format.invoke(module, 306112d, "en", Boolean.TRUE);
        switches.remove("exact_counts");
        check("306.1K".equals(rounded), "Kick's own count is rounded: " + rounded);
        check("306,112".equals(exact) && "306,112".equals(explicit), "Exact counts: " + exact + ", " + explicit);
        System.out.println("PASS: Show exact counts turns Kick's " + rounded + " into " + exact);
    }

    /**
     * Fill screen: Media3's real video frame (AspectRatioFrameLayout), measured exactly at the view's size with a
     * video's aspect ratio and Kick's FIT. In a 2000x900 (20:9) frame a 16:9 video is pillarboxed (1600x900) with the
     * switch off and fills the width, cropped top and bottom (2000x1125), with it on in landscape. Portrait, a vertical
     * video and an 800x720 frame next to the chat, where FIT letterboxes, keep Kick's FIT.
     */
    private static void verifyFill(Class<?> settings) throws Exception {
        Method registryJson = settings.getDeclaredMethod("registryJson");
        registryJson.setAccessible(true);
        if (!((String) registryJson.invoke(null)).contains("\"fill_screen\"")) return;
        if (Looper.getMainLooper() == null) Looper.prepareMainLooper();
        Object thread = Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
        Context system = (Context) thread.getClass().getMethod("getSystemContext").invoke(thread);
        Configuration landscape = new Configuration(system.getResources().getConfiguration());
        landscape.orientation = Configuration.ORIENTATION_LANDSCAPE;
        Configuration portrait = new Configuration(landscape);
        portrait.orientation = Configuration.ORIENTATION_PORTRAIT;

        String[] located = locateKey("kick.fill_screen.video_frame_measure", "androidx.media3.ui.AspectRatioFrameLayout",
            "onMeasure");
        Class<?> type = Class.forName(located[0]);
        check(located[1].equals("onMeasure"), "Fill screen hooks " + located[1]);
        Method setAspectRatio = type.getMethod("setAspectRatio", float.class);
        Field resources = field(View.class, "mResources");

        Map<String, String> results = new java.util.LinkedHashMap<>();
        Object[][] cases = {
            // name, switch, configuration, video width and height, frame width and height, expected size
            {"off", false, landscape, 1920, 1080, 2000, 900, "1600x900"},
            {"on", true, landscape, 1920, 1080, 2000, 900, "2000x1125"},
            {"on, portrait", true, portrait, 1920, 1080, 2000, 900, "1600x900"},
            {"on, vertical video", true, landscape, 1080, 1920, 2000, 900, "506x900"},
            {"on, next to the chat", true, landscape, 1920, 1080, 800, 720, "800x450"},
        };
        for (Object[] c : cases) {
            switches.put("fill_screen", (Boolean) c[1]);
            View frame = (View) type.getConstructor(Context.class).newInstance(system);
            resources.set(frame, system.createConfigurationContext((Configuration) c[2]).getResources());
            setAspectRatio.invoke(frame, (Integer) c[3] / (float) (Integer) c[4]);
            frame.measure(View.MeasureSpec.makeMeasureSpec((Integer) c[5], View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec((Integer) c[6], View.MeasureSpec.EXACTLY));
            String size = frame.getMeasuredWidth() + "x" + frame.getMeasuredHeight();
            results.put((String) c[0], size);
            check(size.equals(c[7]), "Fill screen " + c[0] + ": " + size + ", expected " + c[7]);
        }
        switches.remove("fill_screen");
        System.out.println("PASS: Fill screen sizes Media3's video frame " + results);
    }

    private static Field field(Class<?> type, String name) throws Exception {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    /** A fresh process's load: the private copy's bytes, or the embedded asset's when it uses that. */
    private static byte[] load(Method prepare, Field prepared, Field defaults, AssetManager assets, byte[] embedded)
            throws Exception {
        prepared.set(null, null);
        defaults.set(null, false);
        String output = (String) prepare.invoke(null, assets, "assets://index.android.bundle");
        return output == null ? embedded : Files.readAllBytes(new File(output).toPath());
    }

    public static void main(String[] args) throws Exception {
        File directory = new File(args[1]);
        stock = args[2];
        directory.mkdirs();
        AssetManager assets = AssetManager.class.getDeclaredConstructor().newInstance();
        AssetManager.class.getMethod("addAssetPath", String.class).invoke(assets, args[0]);
        try {
            locators = new JSONObject(new String(read(assets, "lurk/locators.json"), "UTF-8"));
            System.out.println("Locators: " + locators.length() + " names from the APK");
        } catch (java.io.IOException absent) {
            System.out.println("Locators: no assets/lurk/locators.json, using the names BundleProbe knows");
        }
        byte[] embedded = read(assets, "index.android.bundle");
        JSONObject manifest = new JSONObject(new String(read(assets, "lurk-hermes.json"), "UTF-8"));
        check(stock.equals(manifest.getString("sourceSha256")), "Unexpected source hash");
        JSONArray edits = manifest.getJSONArray("edits");
        check(edits.length() > 0, "No selected Hermes patches");
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                if (method.getName().equals("getBoolean")) {
                    return switches.getOrDefault((String) values[0], (Boolean) values[1]);
                }
                if (method.getName().equals("getString")) {
                    return choices.getOrDefault((String) values[0], (String) values[1]);
                }
                throw new UnsupportedOperationException(method.getName());
            });
        Context context = new ContextWrapper(null) {
            @Override public Context getApplicationContext() { return this; }
            @Override public File getCodeCacheDir() { return directory; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
        };
        Class<?> settings = Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings");
        Field settingsContext = settings.getDeclaredField("context");
        settingsContext.setAccessible(true);
        settingsContext.set(null, context);
        Class<?> loader = Class.forName("io.github.jordanwoodson.extension.shared.kick.KickBundle");
        loader.getMethod("init", Context.class).invoke(null, context);
        Method prepare = loader.getMethod("prepare", AssetManager.class, String.class);
        Field prepared = loader.getDeclaredField("prepared");
        prepared.setAccessible(true);
        Field defaults = loader.getDeclaredField("embedded");
        defaults.setAccessible(true);
        check(prepare.invoke(null, assets, "assets://unrelated.hbc") == null, "Unrelated bundle intercepted");

        // Patch defaults load the embedded asset as is, without a private copy, and a second load in the
        // process keeps that snapshot.
        File stale = new File(directory, "lurk-kick.hbc");
        Files.write(stale.toPath(), new byte[]{1});
        check(prepare.invoke(null, assets, "assets://index.android.bundle") == null, "Defaults made a private copy");
        check(!stale.exists(), "Defaults left a stale private copy");
        Map<String, JSONObject> choiceValues = new HashMap<>();
        for (int i = 0; i < edits.length(); i++) {
            JSONObject edit = edits.getJSONObject(i);
            if (edit.has("values")) {
                choices.put(edit.getString("key"), "0");
                choiceValues.put(edit.getString("key"), edit.getJSONObject("values"));
            } else {
                switches.put(edit.getString("key"), false);
            }
        }
        check(prepare.invoke(null, assets, "assets://index.android.bundle") == null, "Settings changed without restart");

        // Simulate process restart; every switch off and every choice at 0 must reconstruct the
        // independently hashed stock bundle.
        byte[] restored = load(prepare, prepared, defaults, assets, embedded);
        check(digest("SHA-256", restored).equals(stock), "All-off did not restore the stock bundle");
        for (String key : switches.keySet()) {
            switches.put(key, true);
            byte[] selected = load(prepare, prepared, defaults, assets, embedded);
            check(!Arrays.equals(selected, restored), "Switch had no effect: " + key);
            check(selected.length == restored.length, "Bundle layout changed");
            byte[] content = Arrays.copyOf(selected, selected.length - 20);
            check(Arrays.equals(MessageDigest.getInstance("SHA-1").digest(content),
                Arrays.copyOfRange(selected, content.length, selected.length)), "Invalid Hermes footer: " + key);
            switches.put(key, false);
        }
        // Each choice value writes exactly its bytes at its edits; an unknown value keeps the original.
        int values = 0;
        for (String key : choiceValues.keySet()) {
            JSONObject options = choiceValues.get(key);
            List<String> tried = new ArrayList<>();
            for (Iterator<String> names = options.keys(); names.hasNext(); ) tried.add(names.next());
            tried.add("-7");
            for (String value : tried) {
                choices.put(key, value);
                byte[] selected = load(prepare, prepared, defaults, assets, embedded);
                byte[] expected = restored.clone();
                for (int i = 0; i < edits.length(); i++) {
                    JSONObject edit = edits.getJSONObject(i);
                    if (!key.equals(edit.getString("key"))) continue;
                    String bytes = edit.getJSONObject("values").optString(value, edit.getString("original"));
                    byte[] write = unhex(bytes);
                    System.arraycopy(write, 0, expected, edit.getInt("offset"), write.length);
                }
                byte[] content = Arrays.copyOf(expected, expected.length - 20);
                System.arraycopy(MessageDigest.getInstance("SHA-1").digest(content), 0, expected, content.length, 20);
                check(Arrays.equals(selected, expected), "Choice bytes differ: " + key + "=" + value);
                values++;
            }
            choices.put(key, "0");
        }
        System.out.println("PASS: loader defaults, process snapshot, all-off stock restoration, " + switches.size() +
            " independent switches, " + choiceValues.size() + " choices with " + values + " exact values");
        verifyReuse(prepare, prepared, defaults, assets, embedded, directory, edits);
        verifyAnalyticsJobs(settings);
        verifyCounts(settings);
        verifyFill(settings);
    }
}
