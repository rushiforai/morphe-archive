package android.content;
public interface SharedPreferences {
    Editor edit();
    interface Editor { Editor putInt(String key, int value); void apply(); }
}
