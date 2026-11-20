package app.template.extension.hevalcontrols;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Collection;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/** {@link Store} on the private SharedPreferences file {@code heval_controls}. */
final class PrefsStore implements Store, SharedPreferences.OnSharedPreferenceChangeListener {
    static final String FILE_NAME = "heval_controls";

    private final SharedPreferences preferences;
    private volatile Runnable listener;

    PrefsStore(Context context) {
        preferences = context.getSharedPreferences(FILE_NAME, Context.MODE_PRIVATE);
        // SharedPreferences keeps listeners in a WeakHashMap. This store is held strongly by
        // HevalSettings for the life of the process, so registering itself keeps the listener alive.
        preferences.registerOnSharedPreferenceChangeListener(this);
    }

    @Override
    public Map<String, ?> readAll() {
        return preferences.getAll();
    }

    @Override
    public boolean commit(Map<String, Object> puts, Collection<String> removes) {
        SharedPreferences.Editor editor = preferences.edit();
        if (removes != null) for (String key : removes) editor.remove(key);
        if (puts != null) {
            for (Map.Entry<String, Object> entry : puts.entrySet()) {
                Object value = entry.getValue();
                if (value instanceof Boolean) editor.putBoolean(entry.getKey(), (Boolean) value);
                else if (value instanceof String) editor.putString(entry.getKey(), (String) value);
                else if (value instanceof Set) editor.putStringSet(entry.getKey(), stringSet((Set<?>) value));
                else if (value == null) editor.remove(entry.getKey());
                else throw new IllegalArgumentException("Unsupported value type");
            }
        }
        // commit(), not apply(): a restart (process kill) or the crash guard must never lose a
        // write still queued by apply().
        return editor.commit();
    }

    /** A copy holding only the String elements: SharedPreferences must not keep the caller's set. */
    private static Set<String> stringSet(Set<?> values) {
        Set<String> copy = new HashSet<>();
        for (Object value : values) {
            if (value instanceof String) copy.add((String) value);
            else throw new IllegalArgumentException("Unsupported set element type");
        }
        return copy;
    }

    @Override
    public void setOnChange(Runnable listener) {
        this.listener = listener;
    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences preferences, String key) {
        Runnable current = listener;
        if (current != null) current.run();
    }
}
