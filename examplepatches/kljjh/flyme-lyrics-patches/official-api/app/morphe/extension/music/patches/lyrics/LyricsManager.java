package app.morphe.extension.music.patches.lyrics;
/** Compile-only signature; the official patch supplies this class on device. */
public class LyricsManager { public static native LyricsManager getInstance(); public native app.morphe.extension.music.patches.lyrics.model.TrackInfo getCurrentTrack(); public native boolean areLyricsSynced(); public native String getCurrentLineText(); }
