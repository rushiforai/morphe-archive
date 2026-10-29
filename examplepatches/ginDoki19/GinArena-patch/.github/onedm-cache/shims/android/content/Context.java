package android.content;

import android.content.res.AssetManager;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Context {
    private final File rootDir;
    private final File filesDir;
    private final File cacheDir;
    private final AssetManager assetManager;
    private final Map<String, SharedPreferences> prefsMap = new HashMap<>();

    public Context(File rootDir) {
        this.rootDir = rootDir;
        this.filesDir = new File(rootDir, "files");
        this.cacheDir = new File(rootDir, "cache");
        File assetsDir = new File(rootDir, "assets");
        this.filesDir.mkdirs();
        this.cacheDir.mkdirs();
        this.assetManager = new AssetManager(assetsDir);
    }

    public AssetManager getAssets() {
        return assetManager;
    }

    public Context getApplicationContext() {
        return this;
    }

    public File getFilesDir() {
        return filesDir;
    }

    public File getCacheDir() {
        return cacheDir;
    }

    public File getExternalFilesDir(String type) {
        File ext = new File(rootDir, "external_files");
        ext.mkdirs();
        return ext;
    }

    public File[] getExternalFilesDirs(String type) {
        return new File[]{getExternalFilesDir(type)};
    }

    public String getPackageName() {
        return "idm.internet.download.manager";
    }

    public String getString(int resId) {
        return "str_" + resId;
    }

    public String getString(int resId, Object... formatArgs) {
        return "str_" + resId;
    }

    public Object getSystemService(String name) {
        return null;
    }

    public synchronized SharedPreferences getSharedPreferences(String name, int mode) {
        return prefsMap.computeIfAbsent(name, k -> new MemSharedPreferences());
    }

    private static final class MemSharedPreferences implements SharedPreferences {
        private final Map<String, Object> map = new HashMap<>();

        @Override public Map<String, ?> getAll() { return new HashMap<>(map); }
        @Override public String getString(String k, String def) { Object v = map.get(k); return v instanceof String ? (String) v : def; }
        @Override @SuppressWarnings("unchecked") public Set<String> getStringSet(String k, Set<String> def) { Object v = map.get(k); return v instanceof Set ? (Set<String>) v : def; }
        @Override public int getInt(String k, int def) { Object v = map.get(k); return v instanceof Number ? ((Number) v).intValue() : def; }
        @Override public long getLong(String k, long def) { Object v = map.get(k); return v instanceof Number ? ((Number) v).longValue() : def; }
        @Override public float getFloat(String k, float def) { Object v = map.get(k); return v instanceof Number ? ((Number) v).floatValue() : def; }
        @Override public boolean getBoolean(String k, boolean def) { Object v = map.get(k); return v instanceof Boolean ? (Boolean) v : def; }
        @Override public boolean contains(String k) { return map.containsKey(k); }
        @Override public Editor edit() {
            return new Editor() {
                @Override public Editor putString(String k, String v) { map.put(k, v); return this; }
                @Override public Editor putStringSet(String k, Set<String> v) { map.put(k, v); return this; }
                @Override public Editor putInt(String k, int v) { map.put(k, v); return this; }
                @Override public Editor putLong(String k, long v) { map.put(k, v); return this; }
                @Override public Editor putFloat(String k, float v) { map.put(k, v); return this; }
                @Override public Editor putBoolean(String k, boolean v) { map.put(k, v); return this; }
                @Override public Editor remove(String k) { map.remove(k); return this; }
                @Override public Editor clear() { map.clear(); return this; }
                @Override public boolean commit() { return true; }
                @Override public void apply() {}
            };
        }
    }
}
