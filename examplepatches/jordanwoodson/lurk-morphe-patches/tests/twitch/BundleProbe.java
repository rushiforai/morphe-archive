import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/** Executes the injected loader on Android. All-off must reconstruct the independent stock SHA-256. */
public final class BundleProbe {
    private static final String STOCK = "059f4713e0cea80b58e68b675fb05d63053056869e2ac60c79f5d57567a3e583";
    private static final Map<String, Boolean> switches = new HashMap<>();

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static String digest(String algorithm, byte[] bytes) throws Exception {
        StringBuilder value = new StringBuilder();
        for (byte b : MessageDigest.getInstance(algorithm).digest(bytes)) value.append(String.format("%02x", b & 255));
        return value.toString();
    }

    private static byte[] read(AssetManager assets, String name) throws Exception {
        try (java.io.InputStream input = assets.open(name)) { return input.readAllBytes(); }
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
        directory.mkdirs();
        AssetManager assets = AssetManager.class.getDeclaredConstructor().newInstance();
        AssetManager.class.getMethod("addAssetPath", String.class).invoke(assets, args[0]);
        byte[] embedded = read(assets, "index.android.bundle");
        JSONObject manifest = new JSONObject(new String(read(assets, "lurk-hermes.json"), "UTF-8"));
        check(STOCK.equals(manifest.getString("sourceSha256")), "Unexpected source hash");
        JSONArray edits = manifest.getJSONArray("edits");
        JSONObject append = manifest.optJSONObject("append");
        check(edits.length() > 0, "No selected Hermes patches");
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                if (method.getName().equals("getBoolean")) {
                    return switches.getOrDefault((String) values[0], (Boolean) values[1]);
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
        Class<?> loader = Class.forName("io.github.jordanwoodson.extension.shared.twitch.TwitchBundle");
        loader.getMethod("init", Context.class).invoke(null, context);
        Method prepare = loader.getMethod("prepare", AssetManager.class, String.class);
        Field prepared = loader.getDeclaredField("prepared");
        prepared.setAccessible(true);
        Field defaults = loader.getDeclaredField("embedded");
        defaults.setAccessible(true);
        check(prepare.invoke(null, assets, "assets://unrelated.hbc") == null, "Unrelated bundle intercepted");

        // Patch defaults load the embedded asset as is, without a private copy, and a second load in the
        // process keeps that snapshot.
        File stale = new File(directory, "lurk-twitch.hbc");
        Files.write(stale.toPath(), new byte[]{1});
        check(prepare.invoke(null, assets, "assets://index.android.bundle") == null, "Defaults made a private copy");
        check(!stale.exists(), "Defaults left a stale private copy");
        for (int i = 0; i < edits.length(); i++) switches.put(edits.getJSONObject(i).getString("key"), false);
        if (append != null) switches.put(append.getString("key"), false);
        check(prepare.invoke(null, assets, "assets://index.android.bundle") == null, "Settings changed without restart");

        // Simulate process restart; every edit off must reconstruct the independently hashed stock bundle.
        byte[] restored = load(prepare, prepared, defaults, assets, embedded);
        check(digest("SHA-256", restored).equals(STOCK), "All-off did not restore the stock bundle");
        for (String key : switches.keySet()) {
            switches.put(key, true);
            byte[] selected = load(prepare, prepared, defaults, assets, embedded);
            check(!Arrays.equals(selected, restored), "Switch had no effect: " + key);
            check(selected.length == (append != null && key.equals(append.getString("key"))
                ? embedded.length : restored.length), "Unexpected predicate/layout selection");
            byte[] content = Arrays.copyOf(selected, selected.length - 20);
            check(Arrays.equals(MessageDigest.getInstance("SHA-1").digest(content),
                Arrays.copyOfRange(selected, content.length, selected.length)), "Invalid Hermes footer: " + key);
            switches.put(key, false);
        }

        // Cold starts with unchanged settings reuse the prepared copy instead of rewriting 28 MB.
        File copy = new File(directory, "lurk-twitch.hbc");
        File sidecar = new File(directory, "lurk-twitch.json");
        check(Arrays.equals(load(prepare, prepared, defaults, assets, embedded), restored), "All-off copy changed");
        check(sidecar.isFile(), "No sidecar for the prepared copy");
        long written = copy.lastModified();
        Thread.sleep(50);
        check(Arrays.equals(load(prepare, prepared, defaults, assets, embedded), restored) && copy.lastModified() == written,
            "Unchanged settings rewrote the prepared copy");
        // Another selection is rebuilt, and so is the first one again afterwards.
        String first = switches.keySet().iterator().next();
        switches.put(first, true);
        Thread.sleep(50);
        check(!Arrays.equals(load(prepare, prepared, defaults, assets, embedded), restored) && copy.lastModified() != written,
            "A changed setting reused the old copy");
        switches.put(first, false);
        check(Arrays.equals(load(prepare, prepared, defaults, assets, embedded), restored), "Returning to a selection reused the wrong copy");
        // A copy changed after its sidecar was written, or a missing sidecar, means a rebuild.
        byte[] tampered = Files.readAllBytes(copy.toPath());
        tampered[200] ^= 1;
        Thread.sleep(50);
        Files.write(copy.toPath(), tampered);
        check(Arrays.equals(load(prepare, prepared, defaults, assets, embedded), restored), "A modified copy was reused");
        check(sidecar.delete(), "No sidecar to delete");
        written = copy.lastModified();
        Thread.sleep(50);
        check(Arrays.equals(load(prepare, prepared, defaults, assets, embedded), restored) && copy.lastModified() != written &&
            sidecar.isFile(), "A copy without a sidecar was reused");
        // Back at the defaults, both files go.
        switches.clear();
        check(load(prepare, prepared, defaults, assets, embedded) == embedded && !copy.exists() && !sidecar.exists(),
            "Defaults kept the private copy or its sidecar");
        System.out.println("PASS: loader defaults, process snapshot, all-off stock restoration, independent switches, " +
            "prepared copy reused only for unchanged settings");
    }
}
