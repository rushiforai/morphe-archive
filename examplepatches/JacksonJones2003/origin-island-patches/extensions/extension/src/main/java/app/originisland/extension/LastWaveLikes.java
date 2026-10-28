package app.originisland.extension;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Set;

/**
 * Likes and removes the like of the song that plays in LastWave, the way its like button does,
 * and tells if the song is liked.
 *
 * LastWave keeps the songs that are liked in a playlist, which a class of its own manages:
 * it toggles the like of a song in the background, and keeps the keys of the liked songs.
 * Its classes are obfuscated, so the patch fills the bridges below with calls to them.
 */
@SuppressWarnings("unused")
public final class LastWaveLikes {

    private static final String TAG = "OriginIslandLastWave";

    private static volatile Object manager;
    private static volatile Object currentTrack;

    private LastWaveLikes() {
    }

    // Bridges, filled by the patch. The unused parameters are registers for the calls.

    /**
     * @return The track as the manager of the liked songs takes it, of the track that plays.
     */
    static Object toManagedTrack(Object playableTrack) {
        throw new UnsupportedOperationException();
    }

    /**
     * @return The key the manager keeps the liked songs by.
     */
    static String keyOf(Object managedTrack) {
        throw new UnsupportedOperationException();
    }

    /**
     * Toggles the like of the track, as a step of a coroutine.
     */
    static Object toggle(Object manager, Object managedTrack, Object continuation) {
        throw new UnsupportedOperationException();
    }

    /**
     * @return The coroutine scope of the manager.
     */
    static Object scopeOf(Object manager) {
        throw new UnsupportedOperationException();
    }

    /**
     * Runs the block in the scope, as a coroutine.
     */
    static void launch(Object scope, Object block, Object unused1, Object unused2) {
        throw new UnsupportedOperationException();
    }

    /**
     * @return The interface of a block of a coroutine, a function of two arguments.
     */
    static Class<?> blockInterface(Object unused) {
        throw new UnsupportedOperationException();
    }

    /**
     * Injection point. Called as the manager of the liked songs is made.
     */
    public static void onManagerCreated(Object likedSongsManager) {
        manager = likedSongsManager;
    }

    /**
     * Injection point. Called with the track the app publishes to its session.
     */
    public static void onCurrentTrack(Object playableTrack) {
        if (playableTrack != null) {
            currentTrack = playableTrack;
        }
    }

    /**
     * @return If the song that plays is liked, or null if that is not known.
     */
    static Boolean isLiked() {
        try {
            Object likedSongsManager = manager;
            Object track = currentTrack;
            if (likedSongsManager == null || track == null) {
                return null;
            }

            Set<?> keys = likedKeys(likedSongsManager);
            return keys == null ? null : keys.contains(keyOf(toManagedTrack(track)));
        } catch (Throwable ex) {
            Log.e(TAG, "isLiked failure", ex);
            return null;
        }
    }

    /**
     * Toggles the like of the song that plays, in the background.
     *
     * @return If it was toggled.
     */
    static boolean toggleLike() {
        try {
            Object likedSongsManager = manager;
            Object track = currentTrack;
            if (likedSongsManager == null || track == null) {
                return false;
            }
            Object managedTrack = toManagedTrack(track);

            Class<?> blockInterface = blockInterface(null);
            Object block = Proxy.newProxyInstance(blockInterface.getClassLoader(), new Class<?>[]{blockInterface},
                    (proxy, method, args) -> {
                        if (args != null && args.length == 2) {
                            // Invoked with the scope and the continuation of the coroutine.
                            return toggle(likedSongsManager, managedTrack, args[1]);
                        }
                        switch (method.getName()) {
                            case "equals":
                                return proxy == args[0];
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            case "toString":
                                return "OriginIslandToggleLike";
                            default:
                                return null;
                        }
                    });

            launch(scopeOf(likedSongsManager), block, null, null);
            return true;
        } catch (Throwable ex) {
            Log.e(TAG, "toggleLike failure", ex);
            return false;
        }
    }

    /**
     * @return The keys of the liked songs, which the manager keeps in a state of its own.
     */
    private static Set<?> likedKeys(Object likedSongsManager) throws Exception {
        for (Field field : likedSongsManager.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            Object state = field.get(likedSongsManager);
            if (state == null) {
                continue;
            }

            Method getValue;
            try {
                getValue = state.getClass().getMethod("getValue");
            } catch (NoSuchMethodException ex) {
                continue;
            }
            Object value = getValue.invoke(state);
            if (value instanceof Set) {
                return (Set<?>) value;
            }
        }
        return null;
    }
}
