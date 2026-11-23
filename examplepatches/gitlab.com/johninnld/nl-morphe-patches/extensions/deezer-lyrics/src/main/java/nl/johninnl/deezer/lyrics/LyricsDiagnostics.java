package nl.johninnl.deezer.lyrics;

/** Review-only stage markers. Never include track names, lyric bodies, URLs or credentials. */
public final class LyricsDiagnostics {
    private LyricsDiagnostics() {}
    public static void event(String stage) {
        if (!BuildConfig.PATCH_VERSION.contains("+review.")) return;
        try { android.util.Log.i("MorpheLyrics", stage); }
        catch (RuntimeException unavailable) { /* A diagnostic must never affect playback or lyrics. */ }
    }
}
