package app.template.extension.hevalcontrols;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/** In-memory {@link Store} that can be told to fail. */
final class FakeStore implements Store {
    final Map<String, Object> values = new HashMap<>();
    boolean failReads;
    boolean failCommits;
    boolean refuseCommits;
    int commits;
    private Runnable listener;

    @Override
    public Map<String, ?> readAll() {
        if (failReads) throw new ClassCastException("corrupt preferences");
        return new HashMap<>(values);
    }

    @Override
    public boolean commit(Map<String, Object> puts, Collection<String> removes) {
        if (failCommits) throw new IllegalStateException("disk full");
        if (refuseCommits) return false;
        commits++;
        if (removes != null) for (String key : removes) values.remove(key);
        if (puts != null) values.putAll(puts);
        return true;
    }

    @Override
    public void setOnChange(Runnable listener) {
        this.listener = listener;
    }

    /** Another writer (another process, an import) changed a value. */
    void externalWrite(String key, Object value) {
        values.put(key, value);
        if (listener != null) listener.run();
    }
}
