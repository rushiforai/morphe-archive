package android.content;

/** Only preference operations used by the settings-backup controller are modeled in host tests. */
public interface SharedPreferences {
    boolean getBoolean(String key, boolean fallback);
    String getString(String key, String fallback);
    Editor edit();
    interface Editor {
        Editor putBoolean(String key, boolean value);
        Editor putString(String key, String value);
        boolean commit();
    }
}
