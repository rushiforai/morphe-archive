package android.content;

public class ContextWrapper extends Context {
    private final Context base;
    public ContextWrapper(Context base) { this.base = base; }
    @Override public Context getApplicationContext() { return base.getApplicationContext(); }
    @Override public SharedPreferences getSharedPreferences(String name, int mode) { return base.getSharedPreferences(name, mode); }
}
