package nl.johninnl.deezer.lyrics;

/** Native reactive-stream adapter policy. The generated DEX bridge owns Deezer's private ABI. */
public final class LyricsFlow implements LyricsRepository.Listener {
    public interface Output {
        boolean isCurrent();
        boolean nativeUsable(Object value);
        Object fallbackValue(LyricsPayload payload);
        void value(Object value);
        void complete();
        void error(Throwable error);
        void disposeNative();
    }
    private static final class RepositoryHolder { static final LyricsRepository INSTANCE = new LyricsRepository(); }
    private final LyricsRepository repository;
    private final TrackSignature signature;
    private final Output output;
    private LyricsRepository.Request request;
    private Throwable nativeError;
    private boolean disposed, terminal, nativeEnded, nativeSeen, lookupStarted, fallbackFinished, fallbackEmitted;

    public LyricsFlow(TrackSignature signature, Output output) { this(RepositoryHolder.INSTANCE, signature, output); }
    LyricsFlow(LyricsRepository repository, TrackSignature signature, Output output) {
        this.repository = repository; this.signature = signature; this.output = output;
    }

    public static LyricsPayload cached(TrackSignature signature) { return RepositoryHolder.INSTANCE.cached(signature); }

    public synchronized boolean isDisposed() { return disposed || terminal; }

    @Override public synchronized boolean isCurrent() { return !disposed && !terminal && output.isCurrent(); }

    public synchronized void dispose() {
        if (disposed) return;
        disposed = true;
        if (request != null) request.cancel();
        output.disposeNative();
    }

    private boolean active() {
        if (disposed || terminal) return false;
        if (!output.isCurrent()) { dispose(); return false; }
        return true;
    }

    public synchronized void nativeValue(Object value) {
        if (!active()) return;
        if (!output.nativeUsable(value)) { startFallback(); return; }
        nativeSeen = true;
        if (request != null) request.cancel();
        output.value(value);
    }

    public synchronized void nativeComplete() {
        if (!active()) return;
        nativeEnded = true;
        if (nativeSeen || fallbackFinished) finishWithoutFallback(); else startFallback();
    }

    public synchronized void nativeFailure(Throwable failure) {
        if (!active()) return;
        nativeEnded = true;
        nativeError = failure;
        if (nativeSeen || fallbackFinished) finishWithoutFallback(); else startFallback();
    }

    private void startFallback() {
        if (lookupStarted || nativeSeen || !active()) return;
        lookupStarted = true;
        if (signature == null) {
            LyricsDiagnostics.event("fallback_no_signature");
            fallbackFinished = true; if (nativeEnded) finishWithoutFallback(); return;
        }
        LyricsDiagnostics.event("fallback_start");
        request = repository.lookup(signature, this);
    }

    @Override public synchronized void found(LyricsPayload payload) {
        if (!active() || nativeSeen) return;
        LyricsDiagnostics.event("fallback_found");
        fallbackFinished = true;
        Object value = output.fallbackValue(payload);
        if (value == null) { if (nativeEnded) finishWithoutFallback(); return; }
        fallbackEmitted = true;
        output.value(value);
        if (nativeEnded) {
            terminal = true;
            // A successful fallback resolves a native lyrics-only error; account and media requests are untouched.
            output.complete();
        }
    }

    @Override public synchronized void missing() {
        if (!active() || nativeSeen) return;
        LyricsDiagnostics.event("fallback_missing");
        fallbackFinished = true;
        if (nativeEnded) finishWithoutFallback();
    }

    private void finishWithoutFallback() {
        if (disposed || terminal) return;
        terminal = true;
        if (nativeError == null || fallbackEmitted) output.complete(); else output.error(nativeError);
    }
}
