package nl.johninnl.wuplaycar;

import java.util.Map;

/** Owns car playback independently of the phone Activity and rejects stale callbacks. */
public final class CarPlayback<T> implements AutoCloseable {
    public interface Engine<T> {
        void surface(T value);
        void prepare(String url, Map<String,String> headers, long resume);
        boolean playing();
        void playing(boolean value);
        long position();
        long duration();
        void seek(long position);
        void release();
    }
    private final Engine<T> engine;
    private T surface;
    private long selection;
    private boolean closed;
    public CarPlayback(Engine<T> engine) { this.engine = engine; }
    public long beginSelection() { return ++selection; }
    public boolean current(long request) { return !closed && request == selection; }
    public boolean select(long request, String url, Map<String,String> headers, long resume) {
        if (!current(request)) return false;
        engine.prepare(url, headers, Math.max(0, resume));
        if (surface != null) engine.surface(surface);
        return true;
    }
    public void bind(T value) {
        if (closed || surface == value) return;
        surface = value;
        engine.surface(value);
    }
    public void unbind(T value) {
        if (closed || surface != value) return;
        surface = null;
        engine.surface(null);
    }
    public void toggle() { if (!closed) engine.playing(!engine.playing()); }
    public void seekBy(long delta) {
        if (closed) return;
        long position = Math.max(0, engine.position());
        long next = delta > 0 && position > Long.MAX_VALUE - delta ? Long.MAX_VALUE : position + delta;
        long duration = engine.duration();
        if (duration > 0) next = Math.min(next, duration);
        engine.seek(Math.max(0, next));
    }
    @Override public void close() {
        if (closed) return;
        closed = true;
        selection++;
        surface = null;
        engine.release();
    }
}
