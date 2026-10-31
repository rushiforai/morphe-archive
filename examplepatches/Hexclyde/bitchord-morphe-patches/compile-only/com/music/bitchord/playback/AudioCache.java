package com.music.bitchord.playback;

import android.net.Uri;

/** Compile-only host signature; verified against every patched APK. Never packaged. */
public final class AudioCache {
    /** R8 made this static and moved keepComplete first; it removes every rendition of v=. */
    public static void discard(boolean keepComplete, Uri uri) {}
}
