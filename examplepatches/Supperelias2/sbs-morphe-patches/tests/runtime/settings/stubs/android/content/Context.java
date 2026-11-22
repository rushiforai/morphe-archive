package android.content;

/** JVM fixture only. Unsupported UI/platform calls fail instead of pretending to work. */
public class Context {
    public static final int MODE_PRIVATE = 0;
    public Context getApplicationContext() { throw new UnsupportedOperationException("Platform context not exercised"); }
    public SharedPreferences getSharedPreferences(String name, int mode) { throw new UnsupportedOperationException("Platform storage not exercised"); }
    public void startActivity(Intent intent) { throw new UnsupportedOperationException("Activity launch not exercised"); }
}
