package dev.materialtidal.extension.tidal.collection;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;

import java.lang.ref.WeakReference;

import dev.materialtidal.extension.tidal.navbar.ExpressiveViewFactory;

/**
 * Bridge connecting TIDAL's obfuscated Compose {@code MyCollectionScreenKt.MyCollectionItems}
 * to our custom Material 3 Expressive Bento tile grid View via {@code AndroidView}.
 *
 * <p>All {@code native*} stubs below are replaced at patch time with fingerprinted Dalvik bytecode.
 */
@SuppressWarnings("unused")
public final class ExpressiveCollectionBridge {

    private static final String TAG = "MaterialTidalCollection";

    public static final int ITEM_PLAYLISTS = 0;
    public static final int ITEM_TRACKS = 1;
    public static final int ITEM_ALBUMS = 2;
    public static final int ITEM_ARTISTS = 3;
    public static final int ITEM_MIXES_RADIO = 4;
    public static final int ITEM_VIDEOS = 5;
    public static final int ITEM_PURCHASES = 6;
    public static final int ITEM_SAVE_FOR_LATER = 7;
    public static final int ITEM_DOWNLOADS = 8;
    public static final int ITEM_OFFLINE_BLOCKED = 9;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static final ExpressiveViewFactory CREATE_COLLECTION_FACTORY =
            new ExpressiveViewFactory(ExpressiveViewFactory.MODE_CREATE_COLLECTION_GRID);
    private static final ExpressiveViewFactory UPDATE_COLLECTION_FACTORY =
            new ExpressiveViewFactory(ExpressiveViewFactory.MODE_UPDATE_COLLECTION_GRID);

    private static volatile Object latestEventConsumer;
    private static volatile boolean latestShowPurchases;
    private static volatile boolean latestShowSaveForLater;
    private static volatile boolean latestIsOffline;

    private static volatile WeakReference<ExpressiveCollectionGridView> activeGridRef =
            new WeakReference<>(null);

    private ExpressiveCollectionBridge() {
    }

    /**
     * Composable replacement invoked by {@code MyCollectionScreenKt.f} when Expressive Collection
     * mode is enabled.
     */
    public static void renderCollectionItems(
            Object coroutineScope,
            Object eventConsumer,
            boolean showPurchases,
            boolean showSaveForLater,
            boolean isOffline,
            Object composer,
            int changed
    ) {
        latestEventConsumer = eventConsumer;
        latestShowPurchases = showPurchases;
        latestShowSaveForLater = showSaveForLater;
        latestIsOffline = isOffline;

        ExpressiveCollectionGridView current = activeGridRef.get();
        if (current != null) {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                current.updateState(showPurchases, showSaveForLater, isOffline);
            } else {
                MAIN_HANDLER.post(() -> current.updateState(showPurchases, showSaveForLater, isOffline));
            }
        }

        try {
            nativeMountCollectionAndroidView(CREATE_COLLECTION_FACTORY, UPDATE_COLLECTION_FACTORY, composer);
        } catch (Throwable t) {
            Log.e(TAG, "Failed mounting ExpressiveCollectionGridView via AndroidView", t);
        }
    }

    /** Factory callback invoked by {@link ExpressiveViewFactory} for {@code AndroidView} creation. */
    public static View createCollectionGridView(Context context) {
        ExpressiveCollectionGridView view = new ExpressiveCollectionGridView(context);
        activeGridRef = new WeakReference<>(view);
        view.updateState(latestShowPurchases, latestShowSaveForLater, latestIsOffline);
        return view;
    }

    /** Update callback invoked by {@link ExpressiveViewFactory} during Compose updates. */
    public static void updateCollectionGridView(View view) {
        if (view instanceof ExpressiveCollectionGridView) {
            ExpressiveCollectionGridView grid = (ExpressiveCollectionGridView) view;
            activeGridRef = new WeakReference<>(grid);
            grid.updateState(latestShowPurchases, latestShowSaveForLater, latestIsOffline);
        }
    }

    /** Dispatches a tile click into TIDAL's {@code eventConsumer}, honoring offline restrictions. */
    static void onTileClicked(int itemKey) {
        Object consumer = latestEventConsumer;
        if (consumer == null) {
            return;
        }
        int effectiveKey = (latestIsOffline && itemKey != ITEM_DOWNLOADS)
                ? ITEM_OFFLINE_BLOCKED
                : itemKey;
        try {
            nativeDispatchCollectionEvent(consumer, effectiveKey);
        } catch (Throwable t) {
            Log.e(TAG, "Error dispatching collection navigation event key=" + effectiveKey, t);
        }
    }

    private static void nativeMountCollectionAndroidView(Object factory, Object update, Object composer) {
        // Populated at patch time by ExpressiveMediaPagesPatch.
    }

    private static void nativeDispatchCollectionEvent(Object eventConsumer, int eventKey) {
        // Populated at patch time by ExpressiveMediaPagesPatch.
    }
}
