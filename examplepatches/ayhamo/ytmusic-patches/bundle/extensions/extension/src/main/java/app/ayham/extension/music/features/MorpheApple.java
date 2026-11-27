package app.ayham.extension.music.features;

import android.util.Log;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Morphe's Apple Music catalog lookup (Morphe 2.4.0, AppleMusicArtworkPatch #5082), the Apple source of
 * the square art: its search, scoring and storefronts, not ours. Morphe's own overlay is left out of our
 * builds (scripts/patch.ps1 disables its patch), so our canvas draws the clip under the source order and
 * switches. Our own lookup stays only for what Morphe has none of: the tall 3:4 clip of full-screen art.
 */
final class MorpheApple {
    private static final String TAG = "Ayham";
    private static final String CATALOG = "app.morphe.extension.music.patches.applemusicartwork.AppleMusicCatalog";

    private static volatile boolean looked;
    private static Method find;

    private MorpheApple() {
    }

    /** Morphe's lookup, or null when this Morphe has none (before 2.4.0) or it changed shape. */
    private static Method method() {
        if (!looked) {
            synchronized (MorpheApple.class) {
                if (!looked) {
                    try {
                        Method m = Class.forName(CATALOG).getDeclaredMethod("findMotionArtwork", String.class, String.class, String.class);
                        m.setAccessible(true);
                        find = m;
                    } catch (Throwable t) {
                        Log.i(TAG, "canvas: no Morphe Apple lookup (" + t + "): ours is used");
                    }
                    looked = true;
                }
            }
        }
        return find;
    }

    static boolean available() {
        return method() != null;
    }

    /**
     * Off the main thread. The HLS playlist of the song's album motion art (square first), or null for
     * none; a failed lookup throws, so it is not saved as a miss.
     */
    static String find(String title, String artist, String album) throws Exception {
        Method m = method();
        if (m == null) throw new IllegalStateException("no Morphe Apple lookup");
        try {
            String url = (String) m.invoke(null, title, artist, album);
            Log.i(TAG, "canvas: Morphe's Apple lookup: " + (url == null ? "none" : "hit"));
            return url;
        } catch (InvocationTargetException e) {
            Throwable c = e.getCause();
            throw c instanceof Exception ? (Exception) c : e;
        }
    }
}
