package android.content;

public interface SharedPreferences {
    String getString(String key, String def);
    int getInt(String key, int def);
    interface Editor {
        Editor putString(String key, String val);
        Editor putInt(String key, int val);
        void apply();
    }
    Editor edit();
}
