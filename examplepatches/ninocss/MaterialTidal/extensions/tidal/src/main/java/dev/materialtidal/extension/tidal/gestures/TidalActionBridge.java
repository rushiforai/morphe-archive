package dev.materialtidal.extension.tidal.gestures;

import android.util.Log;
import android.view.View;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Bridge between the un-obfuscated MaterialTidal swipe controller and TIDAL's obfuscated internals.
 * The {@code native*} methods below are replaced at patch time with fingerprinted Dalvik bytecode.
 */
@SuppressWarnings("unused")
public final class TidalActionBridge {

    private static final String TAG = "MaterialTidal";

    private static volatile Object addToQueueProvider;
    private static volatile Object favoritesManagerProvider;

    private static final Map<Object, Object> ITEM_TO_TRACK =
            Collections.synchronizedMap(new WeakHashMap<>());

    private TidalActionBridge() {
    }

    public static void registerAddToQueueProvider(Object provider) {
        if (provider != null) {
            addToQueueProvider = provider;
        }
    }

    public static void registerFavoritesManagerProvider(Object provider) {
        if (provider != null) {
            favoritesManagerProvider = provider;
        }
    }

    public static void mapItemToTrack(Object uiItem, Object mediaItem) {
        if (uiItem != null && mediaItem != null && isTrack(mediaItem)) {
            ITEM_TO_TRACK.put(uiItem, mediaItem);
        }
    }

    public static Object resolveMappedTrack(Object uiItem) {
        return uiItem == null ? null : ITEM_TO_TRACK.get(uiItem);
    }

    public static void bindTrackRow(View itemView, Object mediaItem) {
        if (itemView == null) {
            return;
        }
        Object track = isTrack(mediaItem) ? mediaItem : null;
        TrackSwipeController.bindRow(itemView, track);
    }

    public static void bindMappedTrackRow(View itemView, Object uiItem) {
        if (itemView == null) {
            return;
        }
        Object track = resolveMappedTrack(uiItem);
        TrackSwipeController.bindRow(itemView, track);
    }

    public static void bindSearchTrackRow(View itemView, Object searchItem) {
        if (itemView == null) {
            return;
        }
        Object track = null;
        if (searchItem != null) {
            try {
                Object extracted = nativeExtractSearchTrack(searchItem);
                if (isTrack(extracted)) {
                    track = extracted;
                }
            } catch (Throwable t) {
                Log.e(TAG, "Failed extracting search track", t);
            }
        }
        TrackSwipeController.bindRow(itemView, track);
    }

    public static boolean isTrack(Object obj) {
        if (obj == null) {
            return false;
        }
        try {
            return nativeIsTrack(obj);
        } catch (Throwable t) {
            Log.e(TAG, "isTrack check failed", t);
            return false;
        }
    }

    public static boolean isFavoriteTrack(Object track) {
        if (track == null) {
            return false;
        }
        try {
            return nativeIsFavorite(track);
        } catch (Throwable t) {
            Log.e(TAG, "isFavoriteTrack check failed", t);
            return false;
        }
    }

    public static boolean performAction(View anchorView, Object track, int action) {
        if (track == null || !isTrack(track) || action == TrackSwipeConfig.ACTION_NONE) {
            return false;
        }
        try {
            switch (action) {
                case TrackSwipeConfig.ACTION_ADD_TO_QUEUE: {
                    if (!nativeIsStreamReady(track)) {
                        return false;
                    }
                    Object provider = addToQueueProvider;
                    if (provider == null) {
                        Log.w(TAG, "AddToQueue provider not captured yet");
                        return false;
                    }
                    return nativeAddToQueue(provider, track);
                }
                case TrackSwipeConfig.ACTION_PLAY_NEXT: {
                    if (!nativeIsStreamReady(track)) {
                        return false;
                    }
                    Object provider = addToQueueProvider;
                    if (provider == null) {
                        Log.w(TAG, "AddToQueue provider not captured yet");
                        return false;
                    }
                    return nativePlayNext(provider, track);
                }
                case TrackSwipeConfig.ACTION_TOGGLE_FAVORITE: {
                    if (nativeIsFavorite(track)) {
                        return nativeRemoveFromFavorites(track);
                    }
                    Object provider = favoritesManagerProvider;
                    if (provider == null) {
                        Log.w(TAG, "FavoritesManager provider not captured yet");
                        return false;
                    }
                    return nativeAddToFavorites(provider, track);
                }
                case TrackSwipeConfig.ACTION_ADD_TO_PLAYLIST: {
                    if (!nativeIsStreamReady(track)) {
                        return false;
                    }
                    return nativeAddToPlaylist(track);
                }
                default:
                    return false;
            }
        } catch (Throwable t) {
            Log.e(TAG, "performAction failed for action=" + action, t);
            return false;
        }
    }

    // ---- Patch-time replaced Dalvik stubs ----

    private static boolean nativeIsTrack(Object obj) {
        return false;
    }

    private static boolean nativeIsStreamReady(Object track) {
        return false;
    }

    private static boolean nativeIsFavorite(Object track) {
        return false;
    }

    private static boolean nativeAddToQueue(Object provider, Object track) {
        return false;
    }

    private static boolean nativePlayNext(Object provider, Object track) {
        return false;
    }

    private static boolean nativeAddToFavorites(Object provider, Object track) {
        return false;
    }

    private static boolean nativeRemoveFromFavorites(Object track) {
        return false;
    }

    private static boolean nativeAddToPlaylist(Object track) {
        return false;
    }

    private static Object nativeExtractSearchTrack(Object searchItem) {
        return null;
    }
}
