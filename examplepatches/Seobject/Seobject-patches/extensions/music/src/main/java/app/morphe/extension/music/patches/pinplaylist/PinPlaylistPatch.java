package app.morphe.extension.music.patches.pinplaylist;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.util.SparseArray;
import android.os.SystemClock;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class PinPlaylistPatch {
    private static final String TAG = "PinPlaylist";
    private static final String BUILD_ID = "v124-single-player-setting";
    private static final String[] MENU_ITEM_HELPER_CLASSES =
            {"aqxr", "arad", "arbe", "aqft"};
    private static final String[] ICON_ENUM_CLASSES =
            {"bsts", "btcw", "brfz"};
    private static final String[] TEXT_HELPER_CLASSES =
            {"bcjc", "bcow", "bbjy"};
    private static final String[] LIBRARY_ADAPTER_CLASSES =
            {"hxs", "hyz", "hvx"};
    private static final String[] ADAPTER_MOVE_NOTIFY_METHODS =
            {"iF", "jv", "js"};
    private static final String[] ADAPTER_FULL_NOTIFY_METHODS =
            {"eB", "fq", "fo", "fj"};
    private static final String MENU_TITLE_PIN =
            "Pin playlist to Library";
    private static final String MENU_TITLE_UNPIN =
            "Unpin playlist from Library";
    private static final String TOAST_PINNED =
            "Pinned to Library";
    private static final String TOAST_UNPINNED =
            "Unpinned from Library";
    private static final int MAX_TRACKED_MENU_ITEMS = 256;

    /*
     * Reflection limits prevent a malformed or unexpectedly large renderer graph
     * from causing an expensive traversal on the UI thread.
     */
    private static final int MAX_REFLECTION_DEPTH = 10;
    private static final int MAX_VISITED_OBJECTS_PER_ROW = 1200;
    private static final int MAX_DIAGNOSTIC_STRINGS = 40;
    private static final int MAX_FLYOUT_OBJECT_MAPPINGS = 4000;

    /*
     * Real user-created YouTube playlist IDs are substantially longer than
     * renderer/page tokens such as PLAYLISTS_PAGE and PLAYLISTS_PAGEB.
     * Requiring a realistic PL payload prevents those page constants from
     * being mistaken for the identity of every bound Library row.
     */
    private static final Pattern PLAYLIST_ID_PATTERN = Pattern.compile(
            "(OLAK5uy_[A-Za-z0-9_-]{8,}|PL[A-Za-z0-9_-]{30,}|LRSR[A-Za-z0-9_-]{8,})"
    );

    private static final IdentityHashMap<Object, String> flyoutObjectIds =
            new IdentityHashMap<>();

    private static final IdentityHashMap<Object, String> flyoutPresenterIds =
            new IdentityHashMap<>();

    /*
     * Bounded identity cache for page/source objects whose playlist identity
     * was already resolved. Reopening the same page menu can then avoid another
     * protobuf graph traversal.
     */
    private static final IdentityHashMap<Object, String>
            flyoutSourcePlaylistIds = new IdentityHashMap<>();
    private static final int MAX_FLYOUT_SOURCE_ID_CACHE = 128;

    /*
     * Reflection is used only to bridge app-private models. Cache successful
     * structural resolutions so normal menu binding does not rescan classes.
     */
    private static final Map<String, Method> staticMethodCache =
            new LinkedHashMap<>();
    private static final int MAX_STATIC_METHOD_CACHE = 128;

    private static final IdentityHashMap<Class<?>, List<Field>>
            instanceFieldCache = new IdentityHashMap<>();
    private static final int MAX_INSTANCE_FIELD_CACHE = 96;

    private static final IdentityHashMap<Class<?>, Method>
            presenterIconGetterCache = new IdentityHashMap<>();
    private static final Set<Class<?>> presenterIconGetterMisses =
            Collections.newSetFromMap(new IdentityHashMap<Class<?>, Boolean>());

    private static final IdentityHashMap<Object, Boolean>
            injectedLibraryPinMenuItems = new IdentityHashMap<>();

    private static final long ACTIVE_FLYOUT_ID_TTL_MS = 30_000L;
    private static final long PENDING_FLYOUT_VIEW_ID_TTL_MS = 2_000L;

    @Nullable
    private static volatile String activeFlyoutPlaylistId;

    /*
     * The normalized 9.25 row can omit the dynamic Speed Dial title/icon data
     * that 9.24 exposed directly on the row. Preserve the same semantic anchor
     * by remembering whether the original native flyout contained Speed Dial.
     */
    private static volatile boolean activeFlyoutHasSpeedDial;

    private static volatile long activeFlyoutCapturedAtMs;

    @Nullable
    private static volatile String pendingFlyoutViewPlaylistId;

    private static volatile long pendingFlyoutViewCapturedAtMs;

    private static boolean flyoutSourceEntryLogged;
    private static boolean flyoutViewEntryLogged;

    @Nullable
    private static volatile Long activeFlyoutStableRowId;

    @Nullable
    private static volatile View activeFlyoutRowView;

    @Nullable
    private static volatile String activeFlyoutRowPlaylistId;

    private static volatile int activeFlyoutAdapterPosition = -1;

    @Nullable
    private static volatile Object activeLibraryAdapter;

    @Nullable
    private static volatile List<?> activeLibraryBackingList;

    private static final IdentityHashMap<Object, Map<Long, String>>
            adapterPlaylistIds = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Set<Long>>
            adapterOrdinaryPlaylistRows = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, List<Long>>
            adapterBaseOrder = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, List<Long>>
            adapterLastAppliedOrder = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Boolean>
            adapterReorderPending = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Integer>
            adapterBindReorderGeneration = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Integer>
            adapterExpectedPlaylistCount = new IdentityHashMap<>();

    /*
     * Once one Library list has been identified after binding, this gives the
     * pre-submit path an exact safety threshold for later sort/refresh lists.
     */
    private static volatile int lastKnownLibraryPlaylistCount;

    /*
     * Pre-submit AdapterProxy bridge.
     *
     * bfrh.h(index) creates each Lhyi render-info object. A later bfrh method
     * builds the complete List<Lhzq>, clears hzc.b, converts every Lhzq to hvg,
     * and only then notifies hyz. Capturing owner/index/renderInfo at h() return
     * lets us partition that source list before the first adapter render.
     */
    private static boolean adapterProxyHookLogged;
    private static int adapterProxyAttemptLogCount;
    private static int directSourceRowLogCount;

    @Nullable
    private static volatile Class<?> adapterProxyOwnerClass;

    private static final Set<Class<?>> adapterProxyRenderInfoClasses =
            new LinkedHashSet<>();

    private static final IdentityHashMap<Object, Object>
            adapterProxySourceAdapters = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Object>
            adapterProxyVisualAdapters = new IdentityHashMap<>();

    /*
     * The obfuscated visual-adapter class is reused by Library playlists,
     * playlist song lists, albums, and other feeds. Track candidate owners by
     * object identity so hot hooks do not treat every instance of that class
     * as the Library. A candidate has a bounded source adapter; confirmation
     * requires a successfully installed playlist position map.
     */
    private static final IdentityHashMap<Object, Boolean>
            adapterProxyCandidateOwners = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, AdapterProxySource>
            adapterProxySources = new IdentityHashMap<>();

    /*
     * Some bfrh lists reuse the same render-info object in multiple positions.
     * An IdentityHashMap then collapses every position to the final h(index)
     * invocation. Preserve each completed invocation in order as well.
     */
    private static final IdentityHashMap<Object, ArrayList<AdapterProxySource>>
            adapterProxySourceHistory = new IdentityHashMap<>();

    /*
     * AdapterProxyRenderInfo is one shared singleton for all delegated rows.
     * Reordering List<Lhzq> therefore cannot change what the proxy adapter
     * binds. Present a virtual reordered adapter instead: hyz keeps its native
     * backing list, while its position-based methods translate visual position
     * to the corresponding native bewt source position.
     */
    private static final IdentityHashMap<Object, int[]>
            adapterVisualToSourcePositions =
            new IdentityHashMap<>();

    private static final IdentityHashMap<Object, String>
            stablePrebindKeys = new IdentityHashMap<>();

    private static boolean stableDelegateLiveUpdateRequested;
    private static boolean stableDelegateLiveUpdateApplied;

    /*
     * Visible local-pin state for the Library rows. The factory map already
     * knows the canonical playlist ID assigned to every final visual slot, so
     * retain that metadata beside the position permutation and decorate only
     * rows that are locally pinned.
     */
    private static final String LEGACY_ROW_PIN_PREFIX = "\uD83D\uDCCC ";

    private static final IdentityHashMap<Object, Map<Integer, String>>
            ownerVisualPlaylistIds =
            new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Set<Integer>>
            ownerPinnedVisualPositions =
            new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Map<Integer, String>>
            adapterVisualPlaylistIds =
            new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Set<Integer>>
            adapterPinnedVisualPositions =
            new IdentityHashMap<>();

    private static final IdentityHashMap<TextView, Boolean>
            activePinIndicatorTextViews =
            new IdentityHashMap<>();

    private static final IdentityHashMap<TextView, Drawable>
            originalSubtitleStartDrawables =
            new IdentityHashMap<>();

    private static final IdentityHashMap<TextView, Integer>
            originalSubtitleDrawablePaddings =
            new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Map<Integer, View>>
            adapterVisibleRowViews =
            new IdentityHashMap<>();

    private static int rowPinIndicatorLogCount;
    private static int flyoutMenuIconLogCount;
    private static int flyoutMenuCandidateLogCount;

    private static final ThreadLocal<Object>
            pendingAdapterPositionRemapTarget =
            new ThreadLocal<>();

    private static final ThreadLocal<String>
            pendingAdapterPositionRemapKind =
            new ThreadLocal<>();

    /*
     * Build the pinned permutation before bfrh.h(index) reads its source item.
     * This is earlier than both RecyclerView binding and the completed
     * pre-submit list, so the first Library frame can contain the final pinned
     * order without hiding any rows.
     */
    private static final IdentityHashMap<Object, int[]>
            adapterProxyFactoryVisualToSource =
            new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Integer>
            adapterProxyFactorySourceCounts =
            new IdentityHashMap<>();

    private static int adapterProxyFactoryMapLogCount;
    private static int adapterProxyFactoryInstallLogCount;
    private static int adapterProxyVisualBridgeLogCount;
    private static int nativeLibrarySubmissionLogCount;
    private static int nativeLibraryResolverLogCount;
    private static final ThreadLocal<Object>
            pendingNativeLibraryController = new ThreadLocal<>();
    private static final IdentityHashMap<Object, String>
            preparedNativeLibraryLists = new IdentityHashMap<>();

    private static Object activeAdapterProxyFactoryOwner;
    private static Object activeAdapterProxyFactoryVisualAdapter;

    /*
     * A clean install has no local pins. In that state, all Library identity
     * discovery, source-history capture, and adapter-reorder work is useless.
     * Cache the answer once per process and make those hot hooks near-no-ops.
     */
    private static volatile Boolean processHasAnyPins;
    private static boolean noPinColdStartBypassLogged;

    private static final Object featureStateLock =
            new Object();

    @Nullable
    private static volatile Boolean lastFeatureEnabledState;

    @Nullable

    private static volatile boolean featureStoreStateSynchronized;

    /*
     * bfrh.h(index) can re-enter while constructing a row. A single ThreadLocal
     * slot is therefore unsafe: an inner call overwrites the outer call's
     * source index/object. Keep one frame per invocation instead.
     */
    private static final ThreadLocal<ArrayList<AdapterProxySource>>
            pendingAdapterProxySources =
            new ThreadLocal<ArrayList<AdapterProxySource>>() {
                @Override
                protected ArrayList<AdapterProxySource>
                initialValue() {
                    return new ArrayList<>();
                }
            };

    private static final ThreadLocal<Object>
            pendingAdapterProxyOwner = new ThreadLocal<>();

    private static final class AdapterProxySource {
        final Object owner;
        final int sourceIndex;
        Object sourceAdapter;
        Object sourceObject;
        Object renderInfo;
        long completedAtMs;

        AdapterProxySource(Object owner, int sourceIndex) {
            this.owner = owner;
            this.sourceIndex = sourceIndex;
        }
    }


    private static final class AdapterProxyMapping {
        final String path;
        final int offset;
        final int score;
        final Map<Integer, String> idsByListPosition;
        final boolean ambiguous;

        AdapterProxyMapping(
                String path,
                int offset,
                int score,
                Map<Integer, String> idsByListPosition,
                boolean ambiguous
        ) {
            this.path = path;
            this.offset = offset;
            this.score = score;
            this.idsByListPosition = idsByListPosition;
            this.ambiguous = ambiguous;
        }
    }


    /*
     * Entry/return bridge for hyz.o. Capturing the row only after the binder
     * returns removes the old View.post delay while preserving the original
     * adapter, holder, position, and stable row ID.
     */
    private static final IdentityHashMap<Object, PendingBoundRow>
            pendingBoundRows = new IdentityHashMap<>();

    private static final class PendingBoundRow {
        final Object adapter;
        final Object holder;
        final int position;
        final long stableId;
        final View itemView;

        PendingBoundRow(
                Object adapter,
                Object holder,
                int position,
                long stableId,
                View itemView
        ) {
            this.adapter = adapter;
            this.holder = holder;
            this.position = position;
            this.stableId = stableId;
            this.itemView = itemView;
        }
    }

    /*
     * A full adapter notification rebinds existing holders. Their posted
     * identity callbacks can briefly observe a holder after it has been reused
     * for another row, which would overwrite correct stable-ID mappings.
     */
    private static final IdentityHashMap<Object, Long>
            adapterBindSuppressedUntilMs = new IdentityHashMap<>();

    private static final IdentityHashMap<Object, Integer>
            adapterSuppressionReconcileGeneration = new IdentityHashMap<>();

    private static final Handler mainHandler =
            new Handler(Looper.getMainLooper());

    /*
     * The byhm reference exposed by recycled row Views can become stale after
     * changing Library sort order. Preserve a verified row-text signature to
     * playlist-ID bridge so newly generated stable IDs can be reconstructed
     * without trusting that stale listener reference.
     */
    private static final Map<String, String>
            playlistIdByRowSignature = new LinkedHashMap<>();

    private static final Map<String, String>
            rowSignatureByPlaylistId = new LinkedHashMap<>();

    private static final Set<String>
            ambiguousRowSignatures = new LinkedHashSet<>();

    private static int rowIdentityConflictLogCount;
    private static int stableRowRemapConflictLogCount;
    private static int boundRowLogCount;
    private static int boundRowNoIdLogCount;
    private static boolean deferredBindHookLogged;

    @Nullable
    private static volatile Context applicationContext;

    /**
     * Diagnostic hook for the flyout-opening path. The source object is the
     * renderer/model associated with the menu before the individual bwyn click
     * loses that context.
     */
    private static void resetFlyoutIdentityMappings() {
        activeFlyoutPlaylistId = null;
        activeFlyoutHasSpeedDial = false;
        activeFlyoutCapturedAtMs = 0L;

        synchronized (flyoutObjectIds) {
            flyoutObjectIds.clear();
        }

        synchronized (flyoutPresenterIds) {
            flyoutPresenterIds.clear();
        }
    }

    private static void clearActiveFlyoutRowContext() {
        activeFlyoutAdapterPosition = -1;
        activeFlyoutStableRowId = null;
        activeFlyoutRowView = null;
        activeFlyoutRowPlaylistId = null;
    }

    private static void rememberPendingFlyoutViewPlaylistId(
            String playlistId
    ) {
        pendingFlyoutViewPlaylistId = playlistId;
        pendingFlyoutViewCapturedAtMs =
                android.os.SystemClock.elapsedRealtime();
    }

    @Nullable
    private static String consumePendingFlyoutViewPlaylistId() {
        String playlistId = pendingFlyoutViewPlaylistId;
        long capturedAt = pendingFlyoutViewCapturedAtMs;

        pendingFlyoutViewPlaylistId = null;
        pendingFlyoutViewCapturedAtMs = 0L;

        if (!PinStore.isSupportedPlaylistId(playlistId)
                || capturedAt <= 0L) {
            return null;
        }

        long ageMs = android.os.SystemClock.elapsedRealtime()
                - capturedAt;

        if (ageMs > PENDING_FLYOUT_VIEW_ID_TTL_MS) {
            Log.d(TAG, "Discarded stale flyout-view playlist id="
                    + playlistId
                    + " ageMs=" + ageMs);
            return null;
        }

        return playlistId;
    }

    @Nullable
    private static String lookupCachedFlyoutSourcePlaylistId(
            @Nullable Object sourceObject
    ) {
        if (sourceObject == null) return null;

        synchronized (flyoutSourcePlaylistIds) {
            return flyoutSourcePlaylistIds.get(sourceObject);
        }
    }

    private static void rememberFlyoutSourcePlaylistId(
            @Nullable Object sourceObject,
            String playlistId
    ) {
        if (sourceObject == null
                || !PinStore.isSupportedPlaylistId(playlistId)) {
            return;
        }

        synchronized (flyoutSourcePlaylistIds) {
            if (flyoutSourcePlaylistIds.size()
                    >= MAX_FLYOUT_SOURCE_ID_CACHE) {
                flyoutSourcePlaylistIds.clear();
            }

            flyoutSourcePlaylistIds.put(sourceObject, playlistId);
        }
    }

    @Nullable
    private static String findStrongSupportedPlaylistIdConsensus(
            Map<String, Integer> counts
    ) {
        String bestId = null;
        int bestCount = 0;
        int secondBestCount = 0;
        boolean tied = false;

        for (Map.Entry<String, Integer> entry : counts.entrySet()) {
            String candidate = entry.getKey();
            Integer countObject = entry.getValue();

            if (!PinStore.isSupportedPlaylistId(candidate)
                    || countObject == null) {
                continue;
            }

            int count = countObject;

            if (count > bestCount) {
                secondBestCount = bestCount;
                bestCount = count;
                bestId = candidate;
                tied = false;
            } else if (count == bestCount) {
                tied = true;
            } else if (count > secondBestCount) {
                secondBestCount = count;
            }
        }

        return bestCount >= 2
                && !tied
                && bestCount > secondBestCount
                ? bestId
                : null;
    }

    /**
     * Fast path for ordinary playlist menus. The same canonical playlist ID is
     * normally present in several independent native rows. Stop as soon as two
     * rows agree instead of traversing the presenter plus every menu item.
     * The existing full graph resolver remains the compatibility fallback.
     */
    @Nullable
    private static String resolveFastMenuConsensusPlaylistId(
            @Nullable Object flyoutMenu
    ) {
        Object listObject = readFieldByName(flyoutMenu, "c");

        if (!(listObject instanceof List)) {
            return null;
        }

        Map<String, Integer> counts = new LinkedHashMap<>();
        int scannedItems = 0;

        for (Object menuItem : (List<?>) listObject) {
            if (menuItem == null) continue;
            if (scannedItems >= 6) break;
            scannedItems++;

            Set<String> itemIds =
                    collectCanonicalPlaylistIds(menuItem, 8);

            for (String itemId : itemIds) {
                if (!PinStore.isSupportedPlaylistId(itemId)) {
                    continue;
                }

                Integer previous = counts.get(itemId);
                counts.put(
                        itemId,
                        previous == null ? 1 : previous + 1
                );
            }

            String consensus =
                    findStrongSupportedPlaylistIdConsensus(counts);

            if (PinStore.isSupportedPlaylistId(consensus)) {
                Log.d(TAG, "FlyoutPageIdentityBridge"
                        + " source=fastMenuConsensus"
                        + " playlistId=" + consensus
                        + " scannedItems=" + scannedItems
                        + " counts=" + counts
                        + " menuType="
                        + objectTypeName(flyoutMenu));
                return consensus;
            }
        }

        return null;
    }

    @Nullable
    private static String resolveNativeSpeedDialPlaylistId(
            @Nullable Object flyoutMenu
    ) {
        Object listObject =
                readFieldByName(flyoutMenu, "c");

        if (!(listObject instanceof List)) {
            return null;
        }

        for (Object menuItem : (List<?>) listObject) {
            if (!isSpeedDialMenuItem(menuItem)) {
                continue;
            }

            Set<String> ids =
                    collectCanonicalPlaylistIds(menuItem, 14);
            String playlistId =
                    findOnlySupportedPlaylistId(ids);

            if (PinStore.isSupportedPlaylistId(playlistId)) {
                Log.d(TAG, "FlyoutPageIdentityBridge"
                        + " source=nativeSpeedDialCommand"
                        + " playlistId=" + playlistId
                        + " menuItemType="
                        + objectTypeName(menuItem));
                return playlistId;
            }

            Log.d(TAG, "FlyoutPageIdentityBridge"
                    + " source=nativeSpeedDialCommand"
                    + " resolved=false"
                    + " candidateIds=" + ids
                    + " menuItemType="
                    + objectTypeName(menuItem));
        }

        return null;
    }

    @Nullable
    private static String resolvePageMenuGraphPlaylistId(
            @Nullable Object flyoutMenu,
            @Nullable Object flyoutPresenter
    ) {
        Set<String> presenterIds =
                collectCanonicalPlaylistIds(flyoutPresenter, 14);
        String playlistId =
                findOnlySupportedPlaylistId(presenterIds);

        if (PinStore.isSupportedPlaylistId(playlistId)) {
            Log.d(TAG, "FlyoutPageIdentityBridge"
                    + " source=presenterGraph"
                    + " playlistId=" + playlistId
                    + " presenterType="
                    + objectTypeName(flyoutPresenter));
            return playlistId;
        }

        Object listObject =
                readFieldByName(flyoutMenu, "c");
        Set<String> menuIds = new LinkedHashSet<>();
        Map<String, Integer> menuIdCounts =
                new LinkedHashMap<>();

        if (listObject instanceof List) {
            int index = 0;

            for (Object menuItem : (List<?>) listObject) {
                Set<String> itemIds =
                        collectCanonicalPlaylistIds(menuItem, 14);

                if (!itemIds.isEmpty()) {
                    Object title =
                            invokeStaticByNames(
                                    MENU_ITEM_HELPER_CLASSES,
                                    "e",
                                    menuItem
                            );

                    if (flyoutMenuCandidateLogCount < 20) {
                        flyoutMenuCandidateLogCount++;

                        Log.d(TAG, "FlyoutPageMenuCandidate"
                                + " index=" + index
                                + " title=" + title
                                + " ids=" + itemIds
                                + " itemType="
                                + objectTypeName(menuItem));
                    }

                    menuIds.addAll(itemIds);

                    for (String itemId : itemIds) {
                        if (!PinStore.isSupportedPlaylistId(itemId)) {
                            continue;
                        }

                        Integer previous =
                                menuIdCounts.get(itemId);
                        menuIdCounts.put(
                                itemId,
                                previous == null ? 1 : previous + 1
                        );
                    }
                }

                index++;
            }
        }

        playlistId =
                findOnlySupportedPlaylistId(menuIds);

        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            playlistId =
                    findConsensusSupportedPlaylistId(menuIdCounts);
        }

        if (PinStore.isSupportedPlaylistId(playlistId)) {
            Log.d(TAG, "FlyoutPageIdentityBridge"
                    + " source=menuGraphConsensus"
                    + " playlistId=" + playlistId
                    + " counts=" + menuIdCounts
                    + " menuType="
                    + objectTypeName(flyoutMenu));
            return playlistId;
        }

        Log.d(TAG, "FlyoutPageIdentityBridge"
                + " source=pageMenuGraphs"
                + " resolved=false"
                + " presenterIds=" + presenterIds
                + " menuIds=" + menuIds
                + " menuIdCounts=" + menuIdCounts
                + " presenterType="
                + objectTypeName(flyoutPresenter)
                + " menuType=" + objectTypeName(flyoutMenu));

        return null;
    }

    @Nullable
    private static String findConsensusSupportedPlaylistId(
            Map<String, Integer> counts
    ) {
        String bestId = null;
        int bestCount = 0;
        int secondBestCount = 0;
        boolean tied = false;

        if (counts == null) return null;

        for (Map.Entry<String, Integer> entry : counts.entrySet()) {
            String candidate = entry.getKey();
            Integer countObject = entry.getValue();

            if (!PinStore.isSupportedPlaylistId(candidate)
                    || countObject == null) {
                continue;
            }

            int count = countObject;

            if (count > bestCount) {
                secondBestCount = bestCount;
                bestCount = count;
                bestId = candidate;
                tied = false;
            } else if (count == bestCount) {
                tied = true;
            } else if (count > secondBestCount) {
                secondBestCount = count;
            }
        }

        if (bestCount < 2
                || tied
                || bestCount <= secondBestCount) {
            Log.d(TAG, "FlyoutPageIdentityConsensus"
                    + " accepted=false"
                    + " counts=" + counts
                    + " bestCount=" + bestCount
                    + " secondBestCount=" + secondBestCount
                    + " tied=" + tied);
            return null;
        }

        Log.d(TAG, "FlyoutPageIdentityConsensus"
                + " accepted=true"
                + " playlistId=" + bestId
                + " bestCount=" + bestCount
                + " secondBestCount=" + secondBestCount
                + " counts=" + counts);

        return bestId;
    }

    public static void captureFlyoutSource(
            @Nullable Object flyoutMenu,
            @Nullable Object sourceObject,
            @Nullable Object flyoutPresenter
    ) {
        try {
            captureFlyoutSourceInternal(
                    flyoutMenu,
                    sourceObject,
                    flyoutPresenter
            );
        } catch (Throwable error) {
            Log.e(TAG, "Failed capturing flyout source", error);
            resetFlyoutIdentityMappings();
        }
    }

    private static void captureFlyoutSourceInternal(
            @Nullable Object flyoutMenu,
            @Nullable Object sourceObject,
            @Nullable Object flyoutPresenter
    ) {
        if (!isFeatureEnabled()) {
            return;
        }

        /*
         * A flyout is modal, so mappings from the previous one must never be
         * reused. This is especially important for page-level menus whose
         * source object does not expose a canonical playlist ID.
         */
        resetFlyoutIdentityMappings();
        /*
         * The native source parameter distinguishes the two observed playlist
         * flyout contexts without relying on app symbols or localized text:
         * Library-list row menus carry a concrete source model, while the
         * playlist-page internal menu carries the exact Object.class sentinel.
         */
        activeFlyoutHasSpeedDial =
                sourceObject != null
                        && sourceObject.getClass() != Object.class;

        if (!flyoutSourceEntryLogged) {
            flyoutSourceEntryLogged = true;
            Log.d(TAG, "DiagnosticBuild=" + BUILD_ID
                    + " flyoutSourceHook=true"
                    + " sourceType=" + objectTypeName(sourceObject)
                    + " menuType=" + objectTypeName(flyoutMenu)
                    + " presenterType=" + objectTypeName(flyoutPresenter));
        }

        Set<String> sourceStrings = Collections.emptySet();
        String viewPlaylistId =
                consumePendingFlyoutViewPlaylistId();
        String playlistId = viewPlaylistId;
        String cachedSourcePlaylistId = null;
        String fastMenuPlaylistId = null;
        String speedDialPlaylistId = null;
        String menuGraphPlaylistId = null;

        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            cachedSourcePlaylistId =
                    lookupCachedFlyoutSourcePlaylistId(sourceObject);
            playlistId = cachedSourcePlaylistId;
        }

        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            sourceStrings = collectObjectStrings(sourceObject);
            playlistId = findBestPlaylistId(sourceStrings);
        }

        if (PinStore.isSupportedPlaylistId(viewPlaylistId)) {
            Log.d(TAG, "FlyoutPageIdentityBridge"
                    + " resolved=true"
                    + " resolutionSource=pendingView"
                    + " playlistId=" + playlistId
                    + " sourceType=" + objectTypeName(sourceObject));
        } else if (PinStore.isSupportedPlaylistId(cachedSourcePlaylistId)) {
            Log.d(TAG, "FlyoutPageIdentityBridge"
                    + " resolved=true"
                    + " resolutionSource=sourceIdentityCache"
                    + " playlistId=" + playlistId
                    + " sourceType=" + objectTypeName(sourceObject));
        }

        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            fastMenuPlaylistId =
                    resolveFastMenuConsensusPlaylistId(flyoutMenu);

            if (PinStore.isSupportedPlaylistId(fastMenuPlaylistId)) {
                playlistId = fastMenuPlaylistId;
            }
        }

        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            speedDialPlaylistId =
                    resolveNativeSpeedDialPlaylistId(flyoutMenu);

            if (PinStore.isSupportedPlaylistId(speedDialPlaylistId)) {
                playlistId = speedDialPlaylistId;

                Log.d(TAG, "FlyoutPageIdentityBridge"
                        + " resolved=true"
                        + " resolutionSource=nativeSpeedDialCommand"
                        + " playlistId=" + playlistId
                        + " sourceType="
                        + objectTypeName(sourceObject));
            }
        }

        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            menuGraphPlaylistId =
                    resolvePageMenuGraphPlaylistId(
                            flyoutMenu,
                            flyoutPresenter
                    );

            if (PinStore.isSupportedPlaylistId(menuGraphPlaylistId)) {
                playlistId = menuGraphPlaylistId;

                Log.d(TAG, "FlyoutPageIdentityBridge"
                        + " resolved=true"
                        + " resolutionSource=pageMenuGraphs"
                        + " playlistId=" + playlistId
                        + " sourceType="
                        + objectTypeName(sourceObject));
            }
        }

        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            clearActiveFlyoutRowContext();

            Log.d(TAG, "Flyout source playlist id not found"
                    + " sourceType=" + objectTypeName(sourceObject)
                    + " viewBridgeAvailable="
                    + PinStore.isSupportedPlaylistId(viewPlaylistId)
                    + " fastMenuBridgeAvailable="
                    + PinStore.isSupportedPlaylistId(fastMenuPlaylistId)
                    + " speedDialBridgeAvailable="
                    + PinStore.isSupportedPlaylistId(speedDialPlaylistId)
                    + " menuGraphBridgeAvailable="
                    + PinStore.isSupportedPlaylistId(menuGraphPlaylistId));
            logCandidateSet(
                    "FlyoutSourceCandidate",
                    sourceStrings
            );
            return;
        }

        if (!playlistId.equals(activeFlyoutRowPlaylistId)) {
            clearActiveFlyoutRowContext();
        }

        rememberFlyoutSourcePlaylistId(
                sourceObject,
                playlistId
        );

        /*
         * A direct presenter mapping plus the active-flyout bridge is enough
         * for the separate native row. Avoid indexing the complete menu graph
         * on the UI thread. Retain the old graph fallback only when no
         * presenter object is available at all.
         */
        if (flyoutPresenter == null) {
            indexFlyoutObjectGraph(
                    flyoutMenu,
                    playlistId
            );
        }

        if (flyoutPresenter != null) {
            synchronized (flyoutPresenterIds) {
                flyoutPresenterIds.put(
                        flyoutPresenter,
                        playlistId
                );
            }
        }

        activeFlyoutPlaylistId = playlistId;
        activeFlyoutCapturedAtMs =
                android.os.SystemClock.elapsedRealtime();

        Log.d(TAG, "Captured flyout playlist id=" + playlistId
                + " presenterMapped=" + (flyoutPresenter != null)
                + " activeBridge=true"
                + " rowContextMatched="
                + playlistId.equals(activeFlyoutRowPlaylistId)
                + " sourceType=" + objectTypeName(sourceObject)
                + " menuType=" + objectTypeName(flyoutMenu)
                + " presenterType=" + objectTypeName(flyoutPresenter));
    }

    /**
     * Returns the canonical playlist ID captured for the active flyout.
     *
     * Kotlin calls this before the app normalizes its menu. A null return is a
     * hard stop: no native row is created for a non-playlist or ambiguous menu.
     */
    @Nullable
    public static String getActiveFlyoutPlaylistIdForNativeRow() {
        if (!isFeatureEnabled()
                || !isFeatureEnabled()) {
            return null;
        }

        String playlistId = activeFlyoutPlaylistId;

        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            return null;
        }

        return playlistId;
    }

    /**
     * Returns the exact title for the row that is about to be constructed by
     * YouTube Music's own native menu-item factory.
     */
    @Nullable
    public static String getActiveFlyoutMenuTitle(
            @Nullable Context context
    ) {
        String playlistId =
                getActiveFlyoutPlaylistIdForNativeRow();

        if (playlistId == null || context == null) {
            return null;
        }

        Context appContext = context.getApplicationContext();
        applicationContext =
                appContext != null ? appContext : context;

        boolean pinned =
                PinStore.isPinned(context, playlistId);

        return pinned
                ? MENU_TITLE_UNPIN
                : MENU_TITLE_PIN;
    }

    /**
     * Inserts a native factory-created menu item after YouTube Music has
     * completed qml.a(...) normalization.
     *
     * The seed item is not copied from an existing menu row. It was created by
     * the app's own Context/String -> menu-item factory. We rebuild only that
     * new seed to replace its title with a title object produced by the app's
     * own native text factory. Its seed icon is intentionally left untouched
     * in the protobuf; the patch-owned Pin/Unpin drawable is applied only after
     * MenuItemPresenter completes its normal bind. The completed list is the
     * exact list later copied by bwpg into qmu and bound by MenuItemPresenter.
     */
    public static List insertNativePinMenuItem(
            @Nullable List convertedItems,
            @Nullable Object nativeSeedItem,
            @Nullable Object nativeTitleMessage
    ) {
        if (!isFeatureEnabled()
                || !isFeatureEnabled()
                || convertedItems == null
                || nativeSeedItem == null
                || nativeTitleMessage == null) {
            return convertedItems;
        }

        try {
            String playlistId =
                    getActiveFlyoutPlaylistIdForNativeRow();

            if (playlistId == null) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=noCanonicalPlaylistId");
                return convertedItems;
            }

            MenuComponentSelection selection =
                    findActiveMenuComponent(
                            nativeSeedItem,
                            null,
                            null
                    );

            if (selection == null
                    || selection.parentField == null
                    || !selection.titleField.getType()
                    .isInstance(nativeTitleMessage)) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=seedSchemaMismatch"
                        + " itemType="
                        + objectTypeName(nativeSeedItem)
                        + " titleType="
                        + objectTypeName(nativeTitleMessage));
                return convertedItems;
            }

            Object seedComponent =
                    selection.sourceComponent;

            Object componentBuilder =
                    invokeNoArgObject(
                            seedComponent,
                            "toBuilder"
                    );

            if (componentBuilder == null
                    || !invokeNoArgVoid(
                    componentBuilder,
                    "copyOnWrite"
            )) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=componentCopyFailed"
                        + " componentType="
                        + objectTypeName(seedComponent));
                return convertedItems;
            }

            Object componentInstance =
                    readFieldByName(
                            componentBuilder,
                            "instance"
                    );

            if (componentInstance == null
                    || !writeFieldByName(
                    componentInstance,
                    selection.titleField.getName(),
                    nativeTitleMessage
            )) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=titleWriteFailed"
                        + " componentType="
                        + objectTypeName(seedComponent));
                return convertedItems;
            }

            Object finalComponent =
                    invokeNoArgObject(
                            componentBuilder,
                            "build"
                    );

            if (finalComponent == null) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=componentBuildFailed");
                return convertedItems;
            }

            Object itemBuilder =
                    invokeNoArgObject(
                            nativeSeedItem,
                            "toBuilder"
                    );

            if (itemBuilder == null
                    || !invokeNoArgVoid(
                    itemBuilder,
                    "copyOnWrite"
            )) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=itemCopyFailed"
                        + " itemType="
                        + objectTypeName(nativeSeedItem));
                return convertedItems;
            }

            Object itemInstance =
                    readFieldByName(
                            itemBuilder,
                            "instance"
                    );

            if (itemInstance == null
                    || !writeFieldByName(
                    itemInstance,
                    selection.parentField.getName(),
                    finalComponent
            )) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=itemComponentWriteFailed");
                return convertedItems;
            }

            Object finalItem =
                    invokeNoArgObject(
                            itemBuilder,
                            "build"
                    );

            if (finalItem == null
                    || finalItem == nativeSeedItem) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=itemBuildFailed");
                return convertedItems;
            }

            String expectedTitle =
                    getActiveFlyoutMenuTitle(
                            resolveApplicationContext()
                    );

            Object renderedTitle =
                    invokeStaticByNames(
                            MENU_ITEM_HELPER_CLASSES,
                            "e",
                            finalItem
                    );

            if (expectedTitle == null
                    || renderedTitle == null
                    || !expectedTitle.equals(
                    renderedTitle.toString()
            )) {
                Log.d(TAG, "NativeFactoryPinRow skipped=true"
                        + " reason=nativeTitleValidationFailed"
                        + " expected=" + expectedTitle
                        + " actual=" + renderedTitle
                        + " itemType="
                        + objectTypeName(finalItem));
                return convertedItems;
            }

            /*
             * Remove only rows created by this extension. The native list is a
             * fresh ArrayList returned by qml.a(...), but this also makes the
             * hook idempotent if another patch invokes it twice.
             */
            int removedExistingRows = 0;

            for (int index = convertedItems.size() - 1;
                 index >= 0;
                 index--) {
                Object item = convertedItems.get(index);

                if (!isRememberedInjectedLibraryPinMenuItem(item)) {
                    continue;
                }

                convertedItems.remove(index);
                removedExistingRows++;
            }

            int speedDialIndex = -1;

            for (int index = 0;
                 index < convertedItems.size();
                 index++) {
                if (isSpeedDialMenuItem(
                        convertedItems.get(index)
                )) {
                    speedDialIndex = index;
                    break;
                }
            }

            int insertionIndex =
                    speedDialIndex >= 0
                            ? Math.min(
                            speedDialIndex + 1,
                            convertedItems.size()
                    )
                            : activeFlyoutHasSpeedDial
                            ? convertedItems.size()
                            : Math.max(
                            0,
                            convertedItems.size() - 1
                    );

            List outputItems = convertedItems;

            try {
                outputItems.add(
                        insertionIndex,
                        finalItem
                );
            } catch (UnsupportedOperationException immutableList) {
                outputItems =
                        new ArrayList(convertedItems);

                insertionIndex =
                        Math.min(
                                insertionIndex,
                                outputItems.size()
                        );

                outputItems.add(
                        insertionIndex,
                        finalItem
                );
            }

            rememberInjectedLibraryPinMenuItem(finalItem);
            synchronized (flyoutObjectIds) {
                flyoutObjectIds.put(finalItem, playlistId);
            }

            Log.d(TAG, "NativeFactoryPinRow added=true"
                    + " postNormalization=true"
                    + " playlistId=" + playlistId
                    + " itemType="
                    + objectTypeName(finalItem)
                    + " componentType="
                    + objectTypeName(finalComponent)
                    + " titleType="
                    + objectTypeName(nativeTitleMessage)
                    + " title=" + renderedTitle
                    + " iconMode=patchOwnedBindDrawable"
                    + " speedDialIndex=" + speedDialIndex
                    + " sourceSpeedDialPresent="
                    + activeFlyoutHasSpeedDial
                    + " insertionIndex=" + insertionIndex
                    + " removedExistingRows="
                    + removedExistingRows
                    + " outputCount="
                    + outputItems.size());

            return outputItems;
        } catch (Throwable error) {
            Log.e(TAG, "Failed inserting native post-normalization pin row", error);
            return convertedItems;
        }
    }

    /**
     * Returns a detached native flyout-menu protobuf containing the optional
     * Library Pin/Unpin action.
     *
     * The menu supplied by YouTube Music belongs to an enclosing Elements
     * command and may already have a memoized serialized size. Mutating that
     * object in place can corrupt later serialization when the menu is reused.
     * Always modify a builder-owned copy and return the rebuilt message.
     */
    @Nullable
    public static Object prepareFlyoutMenu(
            @Nullable Object flyoutMenu,
            @Nullable Object sourceObject
    ) {
        if (!isFeatureEnabled()
                || !isFeatureEnabled()
                || flyoutMenu == null) {
            return flyoutMenu;
        }

        try {
            String playlistId = activeFlyoutPlaylistId;

            if (!PinStore.isSupportedPlaylistId(playlistId)) {
                playlistId = findBestPlaylistId(
                        collectObjectStrings(sourceObject)
                );
            }

            /*
             * Canonical identity is the hard safety boundary. A playlist menu
             * may change layout or omit Speed Dial, but an unrelated menu must
             * never receive a synthetic command-bearing row.
             */
            if (!PinStore.isSupportedPlaylistId(playlistId)) {
                Log.d(TAG, "NativePinMenuRow skipped=true"
                        + " reason=noCanonicalPlaylistId"
                        + " menuType=" + objectTypeName(flyoutMenu)
                        + " sourceType=" + objectTypeName(sourceObject));
                return flyoutMenu;
            }

            Object menuBuilder = invokeNoArgObject(
                    flyoutMenu,
                    "toBuilder"
            );

            if (menuBuilder == null
                    || !invokeNoArgVoid(menuBuilder, "copyOnWrite")) {
                Log.d(TAG, "NativePinMenuRow skipped=true"
                        + " reason=menuCopyFailed"
                        + " menuType=" + objectTypeName(flyoutMenu));
                return flyoutMenu;
            }

            Object workingMenu = readFieldByName(
                    menuBuilder,
                    "instance"
            );

            if (workingMenu == null) {
                Log.d(TAG, "NativePinMenuRow skipped=true"
                        + " reason=noMenuCopyInstance"
                        + " menuType=" + objectTypeName(flyoutMenu));
                return flyoutMenu;
            }

            Field listField = findNativeMenuListField(workingMenu);
            if (listField == null) {
                Log.d(TAG, "NativePinMenuRow skipped=true"
                        + " reason=noNativeMenuList"
                        + " menuType=" + objectTypeName(workingMenu));
                logDirectObjectFields(
                        "NativePinMenuContainerProbe",
                        workingMenu
                );
                return flyoutMenu;
            }

            /*
             * The detached protobuf still owns a frozen repeated-field list.
             * The generated helper makes that list mutable on only this copy.
             */
            if (!invokeNoArgVoid(workingMenu, "a")) {
                Log.d(TAG, "NativePinMenuRow skipped=true"
                        + " reason=menuListCopyOnWriteFailed"
                        + " listField=" + listField.getName()
                        + " menuType=" + objectTypeName(workingMenu));
                return flyoutMenu;
            }

            List mutableItems = readListField(workingMenu, listField);
            if (mutableItems == null || mutableItems.isEmpty()) {
                Log.d(TAG, "NativePinMenuRow skipped=true"
                        + " reason=noMutableMenuList"
                        + " listField=" + listField.getName());
                return flyoutMenu;
            }

            int removedExistingRows = 0;
            for (int index = mutableItems.size() - 1;
                 index >= 0;
                 index--) {
                Object item = mutableItems.get(index);
                if (!isInjectedLibraryPinMenuItem(item)) {
                    continue;
                }

                mutableItems.remove(index);
                removedExistingRows++;
            }

            int speedDialIndex = -1;
            for (int index = 0;
                 index < mutableItems.size();
                 index++) {
                if (isSpeedDialMenuItem(mutableItems.get(index))) {
                    speedDialIndex = index;
                    break;
                }
            }

            Context context = resolveApplicationContext();
            boolean pinned = context != null
                    && PinStore.isPinned(context, playlistId);

            String title = pinned
                    ? MENU_TITLE_UNPIN
                    : MENU_TITLE_PIN;

            /*
             * Construct a new native model from protobuf default instances.
             * Existing rows are used only to discover the active schema and
             * primitive oneof/presence flags. No title, command, endpoint,
             * renderer, or menu-item graph is copied from a source row.
             */
            Object pinIconSource =
                    findNativePinIconSource(
                            mutableItems
                    );

            Object freshItem = null;
            int schemaIndex = -1;

            /*
             * Select the dominant ordinary command-row schema instead of the
             * first structurally plausible item. This avoids accidentally
             * constructing a header, divider, account row, or another rare
             * one-off renderer that happens to contain text and integer fields.
             */
            List<FreshMenuSchemaCandidate> schemaCandidates =
                    collectFreshMenuSchemaCandidates(
                            mutableItems
                    );

            for (FreshMenuSchemaCandidate schemaCandidate
                    : schemaCandidates) {
                freshItem =
                        createFreshLibraryPinMenuItem(
                                schemaCandidate.item,
                                schemaCandidate.selection,
                                pinIconSource,
                                title,
                                pinned
                        );

                if (freshItem != null) {
                    schemaIndex = schemaCandidate.index;
                    break;
                }
            }

            if (freshItem == null) {
                Log.d(TAG, "NativePinMenuRow skipped=true"
                        + " reason=noFreshNativeSchema"
                        + " listField=" + listField.getName()
                        + " itemCount=" + mutableItems.size()
                        + " speedDialIndex=" + speedDialIndex);
                logNativeMenuCandidateSummary(mutableItems);
                return flyoutMenu;
            }

            int insertionIndex = speedDialIndex >= 0
                    ? Math.min(
                    speedDialIndex + 1,
                    mutableItems.size()
            )
                    : activeFlyoutHasSpeedDial
                    ? mutableItems.size()
                    : Math.max(
                    0,
                    mutableItems.size() - 1
            );

            try {
                mutableItems.add(insertionIndex, freshItem);
            } catch (Throwable error) {
                Log.e(TAG, "Detached menu list rejected inserted model", error);
                return flyoutMenu;
            }

            Object preparedMenu = invokeNoArgObject(
                    menuBuilder,
                    "build"
            );

            if (preparedMenu == null) {
                Log.d(TAG, "NativePinMenuRow skipped=true"
                        + " reason=menuCopyBuildFailed"
                        + " menuType=" + objectTypeName(flyoutMenu));
                return flyoutMenu;
            }

            /* Index the exact detached object passed into the native pipeline. */
            indexFlyoutObjectGraph(preparedMenu, playlistId);

            Log.d(TAG, "NativePinMenuRow added=true"
                    + " detachedCopy=true"
                    + " playlistId=" + playlistId
                    + " pinned=" + pinned
                    + " listField=" + listField.getName()
                    + " schemaIndex=" + schemaIndex
                    + " speedDialIndex=" + speedDialIndex
                    + " sourceSpeedDialPresent="
                    + activeFlyoutHasSpeedDial
                    + " insertionIndex=" + insertionIndex
                    + " removedExistingRows=" + removedExistingRows
                    + " itemType=" + objectTypeName(freshItem));

            return preparedMenu;
        } catch (Throwable error) {
            Log.e(TAG, "Failed preparing detached Library pin menu item", error);
            return flyoutMenu;
        }
    }

    /**
     * Finds the repeated-field list that actually contains the native Speed
     * Dial row, avoiding dependence on one obfuscated field name.
     */
    @Nullable
    private static Field findNativeMenuListField(Object flyoutMenu) {
        /*
         * Known 9.24.51 fast path. It is only a preference, not a requirement;
         * the scored structural fallback below survives field renaming.
         */
        Field knownField = findInstanceFieldByName(
                flyoutMenu.getClass(),
                "c"
        );

        if (knownField != null
                && readListField(flyoutMenu, knownField) != null) {
            return knownField;
        }

        Field bestField = null;
        int bestScore = Integer.MIN_VALUE;

        for (Field field : getInstanceFields(flyoutMenu.getClass())) {
            try {
                field.setAccessible(true);
                Object value = field.get(flyoutMenu);

                if (!(value instanceof List)) {
                    continue;
                }

                List<?> list = (List<?>) value;
                if (list.isEmpty() || list.size() > 100) {
                    continue;
                }

                int objectCount = 0;
                int canonicalIdItems = 0;
                int repeatedTypeCount = 0;
                Class<?> firstType = null;

                for (Object item : list) {
                    if (item == null
                            || item instanceof CharSequence
                            || item instanceof Number
                            || item instanceof Boolean
                            || item.getClass().isEnum()) {
                        continue;
                    }

                    objectCount++;

                    if (firstType == null) {
                        firstType = item.getClass();
                    }

                    if (firstType == item.getClass()) {
                        repeatedTypeCount++;
                    }

                    Set<String> ids =
                            collectCanonicalPlaylistIds(item, 6);
                    if (!ids.isEmpty()) {
                        canonicalIdItems++;
                    }
                }

                if (objectCount == 0) {
                    continue;
                }

                int score = objectCount
                        + repeatedTypeCount * 2
                        + canonicalIdItems * 8;

                if (score > bestScore) {
                    bestScore = score;
                    bestField = field;
                }
            } catch (Throwable ignored) {
                // Try the next candidate field.
            }
        }

        if (bestField != null) {
            Log.d(TAG, "NativePinMenuList selected=true"
                    + " structuralFallback=true"
                    + " field=" + bestField.getName()
                    + " score=" + bestScore
                    + " menuType=" + objectTypeName(flyoutMenu));
        }

        return bestField;
    }

    @Nullable
    private static Field findInstanceFieldByName(
            Class<?> type,
            String fieldName
    ) {
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(fieldName);
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }

                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                // Continue through the class hierarchy.
            } catch (Throwable ignored) {
                return null;
            }
        }

        return null;
    }

    @Nullable
    private static List readListField(Object owner, Field field) {
        try {
            field.setAccessible(true);
            Object value = field.get(owner);
            return value instanceof List ? (List) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void logNativeMenuCandidateSummary(List<?> items) {
        int limit = Math.min(items.size(), 20);

        for (int index = 0; index < limit; index++) {
            Object item = items.get(index);
            MenuComponentSelection selection = item == null
                    ? null
                    : findActiveMenuComponent(item, null, null);

            Log.d(TAG, "NativePinMenuCandidate"
                    + " index=" + index
                    + " itemType=" + objectTypeName(item)
                    + " schemaCapable=" + (selection != null)
                    + " componentType="
                    + (selection == null
                    ? "<none>"
                    : objectTypeName(selection.sourceComponent))
                    + " parentField="
                    + (selection == null
                    || selection.parentField == null
                    ? "<none>"
                    : selection.parentField.getName())
                    + " titleField="
                    + (selection == null
                    ? "<none>"
                    : selection.titleField.getName())
                    + " iconField="
                    + (selection == null
                    ? "<none>"
                    : selection.iconField.getName())
                    + " speedDial=" + isSpeedDialMenuItem(item)
                    + " ids=" + collectCanonicalPlaylistIds(item, 5));
        }
    }

    /** Best-effort native bottom-sheet dismissal with no obfuscated classes. */
    private static void dismissFlyout(@Nullable View row) {
        if (row == null) return;

        try {
            View root = row.getRootView();
            int id = root.getResources().getIdentifier(
                    "touch_outside",
                    "id",
                    row.getContext().getPackageName()
            );
            View outside = id == 0 ? null : root.findViewById(id);
            if (outside != null) {
                outside.performClick();
            }
        } catch (Throwable error) {
            Log.d(TAG, "Native flyout dismissal unavailable: "
                    + error.getClass().getSimpleName());
        }
    }

    private static boolean isSpeedDialMenuItem(
            @Nullable Object menuItem
    ) {
        if (menuItem == null) return false;

        try {
            Object iconMessage =
                    invokeStaticByNames(
                            MENU_ITEM_HELPER_CLASSES,
                            "d",
                            menuItem
                    );

            Object iconNumberObject =
                    readFieldByName(
                            iconMessage,
                            "c"
                    );

            if (!(iconNumberObject instanceof Integer)) {
                return false;
            }

            Object iconEnum =
                    invokeStaticByNames(
                            ICON_ENUM_CLASSES,
                            "a",
                            iconNumberObject
                    );

            if (!(iconEnum instanceof Enum)) {
                return false;
            }

            String name =
                    ((Enum<?>) iconEnum).name();

            if (name.equals("KEEP")
                    || name.equals("PIN_OUTLINE")
                    || name.equals("KEEP_OFF")
                    || name.equals("PIN_OFF_OUTLINE")) {
                return true;
            }
        } catch (Throwable ignored) {
            // Use the structural text fallback below.
        }

        return objectGraphContainsText(
                menuItem,
                "speed dial",
                false
        );
    }

    private static boolean isRememberedInjectedLibraryPinMenuItem(
            @Nullable Object menuItem
    ) {
        if (menuItem == null) return false;

        synchronized (injectedLibraryPinMenuItems) {
            return injectedLibraryPinMenuItems.containsKey(menuItem);
        }
    }

    /**
     * Constant-time hot-path recognition used while native menu presenters are
     * binding. It deliberately avoids the bounded graph fallback for stock
     * rows; the full copy-safe recognizer remains available for click recovery.
     */
    private static boolean isInjectedLibraryPinMenuItemFast(
            @Nullable Object menuItem
    ) {
        if (menuItem == null) return false;
        if (isRememberedInjectedLibraryPinMenuItem(menuItem)) return true;

        Object resolvedTitle =
                invokeStaticByNames(
                        MENU_ITEM_HELPER_CLASSES,
                        "e",
                        menuItem
                );

        if (resolvedTitle == null) return false;

        String title = resolvedTitle.toString();
        return title.equals(MENU_TITLE_PIN)
                || title.equals(MENU_TITLE_UNPIN);
    }

    private static boolean isInjectedLibraryPinMenuItem(
            @Nullable Object menuItem
    ) {
        if (menuItem == null) return false;

        if (isRememberedInjectedLibraryPinMenuItem(menuItem)) {
            return true;
        }

        /*
         * Some protobuf/render paths may copy the inserted item. The custom
         * title is therefore a safe structural fallback for click routing.
         */
        Object resolvedTitle =
                invokeStaticByNames(
                        MENU_ITEM_HELPER_CLASSES,
                        "e",
                        menuItem
                );

        if (resolvedTitle != null) {
            String title = resolvedTitle.toString();

            if (title.equals(MENU_TITLE_PIN)
                    || title.equals(MENU_TITLE_UNPIN)) {
                return true;
            }
        }

        /*
         * Obfuscated helper methods can move between releases. The custom title
         * is embedded in the fresh protobuf, so a bounded graph scan remains a
         * reliable copy-safe marker when object identity or helper lookup is lost.
         */
        return objectGraphContainsText(
                menuItem,
                MENU_TITLE_PIN,
                true
        ) || objectGraphContainsText(
                menuItem,
                MENU_TITLE_UNPIN,
                true
        );
    }

    private static boolean objectGraphContainsText(
            @Nullable Object root,
            String expected,
            boolean exact
    ) {
        if (root == null || expected == null) return false;

        IdentityHashMap<Object, Boolean> visited =
                new IdentityHashMap<>();
        ArrayList<Object> queue = new ArrayList<>();
        ArrayList<Integer> depths = new ArrayList<>();
        queue.add(root);
        depths.add(0);

        String expectedNormalized = expected.toLowerCase(java.util.Locale.ROOT);
        int cursor = 0;

        while (cursor < queue.size()
                && visited.size() < 180) {
            Object value = queue.get(cursor);
            int depth = depths.get(cursor);
            cursor++;

            if (value == null
                    || visited.put(value, Boolean.TRUE) != null) {
                continue;
            }

            if (value instanceof CharSequence) {
                String text = value.toString();
                if (exact
                        ? text.equals(expected)
                        : text.toLowerCase(java.util.Locale.ROOT)
                        .contains(expectedNormalized)) {
                    return true;
                }
                continue;
            }

            Class<?> type = value.getClass();
            if (type.isPrimitive()
                    || value instanceof Number
                    || value instanceof Boolean
                    || value instanceof Character
                    || type.isEnum()
                    || depth >= 6) {
                continue;
            }

            if (value instanceof Iterable) {
                for (Object child : (Iterable<?>) value) {
                    queue.add(child);
                    depths.add(depth + 1);
                }
                continue;
            }

            if (type.isArray()) {
                int length = Array.getLength(value);
                for (int index = 0; index < length; index++) {
                    queue.add(Array.get(value, index));
                    depths.add(depth + 1);
                }
                continue;
            }

            for (Field field : getInstanceFields(type)) {
                if (field.getType().isPrimitive()) {
                    continue;
                }

                try {
                    field.setAccessible(true);
                    queue.add(field.get(value));
                    depths.add(depth + 1);
                } catch (Throwable ignored) {
                    // Continue scanning the bounded graph.
                }
            }
        }

        return false;
    }

    private static void rememberInjectedLibraryPinMenuItem(
            Object menuItem
    ) {
        synchronized (injectedLibraryPinMenuItems) {
            if (injectedLibraryPinMenuItems.size()
                    >= MAX_TRACKED_MENU_ITEMS) {
                injectedLibraryPinMenuItems.clear();
            }

            injectedLibraryPinMenuItems.put(
                    menuItem,
                    Boolean.TRUE
            );
        }
    }

    private static boolean hasAnySimpleClassName(
            @Nullable Object value,
            String... expectedNames
    ) {
        if (value == null) return false;

        String actual = value.getClass().getSimpleName();

        for (String expected : expectedNames) {
            if (expected.equals(actual)) return true;
        }

        return false;
    }

    private static boolean isUnpinLibraryMenuItem(
            @Nullable Object menuItem
    ) {
        if (menuItem == null) return false;

        Object renderedTitle =
                invokeStaticByNames(
                        MENU_ITEM_HELPER_CLASSES,
                        "e",
                        menuItem
                );

        if (renderedTitle != null) {
            return MENU_TITLE_UNPIN.equals(
                    renderedTitle.toString()
            );
        }

        return objectGraphContainsText(
                menuItem,
                MENU_TITLE_UNPIN,
                true
        );
    }

    @Nullable
    private static ImageView findPresenterIconView(
            @Nullable Object presenter
    ) {
        if (presenter == null) return null;

        Class<?> presenterType = presenter.getClass();
        Method candidate;

        synchronized (presenterIconGetterCache) {
            candidate = presenterIconGetterCache.get(presenterType);
            if (candidate == null
                    && presenterIconGetterMisses.contains(presenterType)) {
                return null;
            }
        }

        if (candidate == null) {
            for (Method method : presenterType.getDeclaredMethods()) {
                if (Modifier.isStatic(method.getModifiers())
                        || method.getParameterTypes().length != 0
                        || !ImageView.class.isAssignableFrom(
                        method.getReturnType()
                )) {
                    continue;
                }

                if (candidate != null) {
                    synchronized (presenterIconGetterCache) {
                        presenterIconGetterMisses.add(presenterType);
                    }
                    return null;
                }

                candidate = method;
            }

            synchronized (presenterIconGetterCache) {
                if (candidate == null) {
                    presenterIconGetterMisses.add(presenterType);
                    return null;
                }

                candidate.setAccessible(true);
                presenterIconGetterCache.put(presenterType, candidate);
            }
        }

        try {
            Object value = candidate.invoke(presenter);
            return value instanceof ImageView
                    ? (ImageView) value
                    : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    @Nullable
    private static Object findPresenterMenuItem(
            @Nullable Object presenter
    ) {
        if (presenter == null) return null;

        Object direct =
                readFieldByName(
                        presenter,
                        "c"
                );

        if (direct != null
                && !(direct instanceof View)
                && !(direct instanceof Context)) {
            return direct;
        }

        /*
         * Field names are obfuscated. Keep a structural fallback so a future
         * version only needs a Kotlin fingerprint update when the presenter
         * still contains exactly one bwyn model under a different field name.
         */
        for (Field field :
                getInstanceFields(presenter.getClass())) {
            if (field.getType().isPrimitive()) {
                continue;
            }

            try {
                field.setAccessible(true);
                Object value = field.get(presenter);

                if (isInjectedLibraryPinMenuItemFast(value)) {
                    return value;
                }
            } catch (Throwable ignored) {
                // Try the next field.
            }
        }

        return null;
    }

    private static List<FreshMenuSchemaCandidate>
    collectFreshMenuSchemaCandidates(
            List<?> items
    ) {
        ArrayList<FreshMenuSchemaCandidate> candidates =
                new ArrayList<>();
        java.util.HashMap<String, Integer> frequencies =
                new java.util.HashMap<>();

        for (int index = 0;
             index < items.size();
             index++) {
            Object item = items.get(index);

            if (item == null
                    || isInjectedLibraryPinMenuItem(item)) {
                continue;
            }

            MenuComponentSelection selection =
                    findActiveMenuComponent(
                            item,
                            null,
                            null
                    );

            if (selection == null
                    || isLikelyToggleComponent(
                    selection.sourceComponent
            )) {
                continue;
            }

            String schemaKey = menuSchemaKey(selection);
            Integer previous = frequencies.get(schemaKey);
            frequencies.put(
                    schemaKey,
                    previous == null ? 1 : previous + 1
            );

            candidates.add(
                    new FreshMenuSchemaCandidate(
                            index,
                            item,
                            selection,
                            schemaKey
                    )
            );
        }

        java.util.Collections.sort(
                candidates,
                new java.util.Comparator<FreshMenuSchemaCandidate>() {
                    @Override
                    public int compare(
                            FreshMenuSchemaCandidate left,
                            FreshMenuSchemaCandidate right
                    ) {
                        int leftFrequency = frequencies.get(left.schemaKey);
                        int rightFrequency = frequencies.get(right.schemaKey);

                        if (leftFrequency != rightFrequency) {
                            return Integer.compare(
                                    rightFrequency,
                                    leftFrequency
                            );
                        }

                        boolean leftHasPlaylistId =
                                !collectCanonicalPlaylistIds(
                                        left.item,
                                        6
                                ).isEmpty();
                        boolean rightHasPlaylistId =
                                !collectCanonicalPlaylistIds(
                                        right.item,
                                        6
                                ).isEmpty();

                        if (leftHasPlaylistId != rightHasPlaylistId) {
                            return leftHasPlaylistId ? -1 : 1;
                        }

                        if (left.selection.score
                                != right.selection.score) {
                            return Integer.compare(
                                    right.selection.score,
                                    left.selection.score
                            );
                        }

                        return Integer.compare(
                                left.index,
                                right.index
                        );
                    }
                }
        );

        for (FreshMenuSchemaCandidate candidate : candidates) {
            Log.d(TAG, "NativePinSchemaCandidate"
                    + " index=" + candidate.index
                    + " frequency="
                    + frequencies.get(candidate.schemaKey)
                    + " schema=" + candidate.schemaKey
                    + " score=" + candidate.selection.score
                    + " ids="
                    + collectCanonicalPlaylistIds(
                    candidate.item,
                    6
            ));
        }

        return candidates;
    }

    private static String menuSchemaKey(
            MenuComponentSelection selection
    ) {
        return selection.sourceComponent.getClass().getName()
                + "|"
                + (selection.parentField == null
                ? "<item>"
                : selection.parentField.getName())
                + "|"
                + selection.titleField.getName()
                + "|"
                + selection.iconField.getName();
    }

    @Nullable
    private static Object createFreshLibraryPinMenuItem(
            Object schemaItem,
            MenuComponentSelection selection,
            @Nullable Object preferredIconSource,
            String title,
            boolean pinned
    ) {
        Object schemaComponent =
                selection.sourceComponent;

        Object schemaTitle;
        Object schemaIcon;

        try {
            selection.titleField.setAccessible(true);
            schemaTitle =
                    selection.titleField.get(
                            schemaComponent
                    );

            selection.iconField.setAccessible(true);
            schemaIcon =
                    selection.iconField.get(
                            schemaComponent
                    );
        } catch (Throwable error) {
            Log.e(
                    TAG,
                    "Could not read native menu schema fields",
                    error
            );
            logFreshModelFailure(
                    "schemaRead",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        Object textMessage =
                createFreshTitleMessage(
                        schemaTitle,
                        title
                );

        if (textMessage == null
                || !selection.titleField.getType()
                .isInstance(textMessage)) {
            logFreshModelFailure(
                    "freshTitle",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        Object iconSchema =
                preferredIconSource != null
                        && selection.iconField.getType()
                        .isInstance(preferredIconSource)
                        ? preferredIconSource
                        : schemaIcon;

        Object iconMessage =
                createFreshIconMessage(iconSchema);

        /*
         * Protobuf icon messages are immutable value objects. Reusing only
         * that value is safe and does not copy the source menu item, command,
         * endpoint, or renderer graph. It is a compatibility fallback when
         * the icon message exposes no accessible builder.
         */
        if (iconMessage == null) {
            iconMessage = iconSchema;
        }

        if (iconMessage == null
                || !selection.iconField.getType()
                .isInstance(iconMessage)) {
            logFreshModelFailure(
                    "freshIcon",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        FreshMessageBuilder componentBuilder =
                beginFreshMessage(
                        schemaComponent
                );

        if (componentBuilder == null) {
            logFreshModelFailure(
                    "componentBuilder",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        copyDeclaredPrimitiveShape(
                schemaComponent,
                componentBuilder.instance
        );

        int populatedReferenceCount =
                populateFreshReferenceSkeleton(
                        schemaComponent,
                        componentBuilder.instance,
                        2,
                        selection.titleField.getName(),
                        selection.iconField.getName()
                );

        if (populatedReferenceCount == 0) {
            logFreshModelFailure(
                    "noReferenceEnvelope",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        if (!writeFieldByName(
                componentBuilder.instance,
                selection.titleField.getName(),
                textMessage
        ) || !writeFieldByName(
                componentBuilder.instance,
                selection.iconField.getName(),
                iconMessage
        )) {
            logFreshModelFailure(
                    "componentWrites",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        Object freshComponent =
                componentBuilder.build();

        if (freshComponent == null) {
            logFreshModelFailure(
                    "componentBuild",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        Object freshItem;

        if (selection.parentField == null) {
            freshItem = freshComponent;
        } else {
            FreshMessageBuilder itemBuilder =
                    beginFreshMessage(
                            schemaItem
                    );

            if (itemBuilder == null) {
                logFreshModelFailure(
                        "itemBuilder",
                        schemaItem,
                        schemaComponent
                );
                return null;
            }

            /*
             * Copy only primitive oneof/presence/style fields declared directly
             * by the generated message class. Reference fields stay at their
             * default values, so no inherited native command can survive.
             */
            copyDeclaredPrimitiveShape(
                    schemaItem,
                    itemBuilder.instance
            );

            if (!writeFieldByName(
                    itemBuilder.instance,
                    selection.parentField.getName(),
                    freshComponent
            )) {
                logFreshModelFailure(
                        "itemComponentWrite",
                        schemaItem,
                        schemaComponent
                );
                return null;
            }

            freshItem =
                    itemBuilder.build();
        }

        if (freshItem == null) {
            logFreshModelFailure(
                    "itemBuild",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        /*
         * Enforce the no-clone contract. The new object graph must not retain
         * any source item/component/title/icon identity.
         */
        if (objectGraphContainsIdentity(
                freshItem,
                schemaItem
        ) || objectGraphContainsIdentity(
                freshItem,
                schemaComponent
        ) || objectGraphContainsIdentity(
                freshItem,
                schemaTitle
        )) {
            logFreshModelFailure(
                    "sourceIdentityLeak",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        if (!objectGraphContainsText(
                freshItem,
                title,
                true
        )) {
            logFreshModelFailure(
                    "titleValidation",
                    schemaItem,
                    schemaComponent
            );
            return null;
        }

        rememberInjectedLibraryPinMenuItem(
                freshItem
        );

        Log.d(TAG, "SeparatePinFreshModel"
                + " success=true"
                + " itemType="
                + objectTypeName(freshItem)
                + " componentType="
                + objectTypeName(freshComponent)
                + " parentField="
                + (selection.parentField == null
                ? "<item>"
                : selection.parentField.getName())
                + " iconSourceType="
                + objectTypeName(iconSchema)
                + " pinned=" + pinned
                + " title=" + title);

        return freshItem;
    }

    @Nullable
    private static Object findNativePinIconSource(
            List<?> items
    ) {
        for (Object item : items) {
            if (item == null) continue;

            MenuComponentSelection selection =
                    findActiveMenuComponent(
                            item,
                            null,
                            null
                    );

            if (selection == null) continue;

            String renderedTitle =
                    readRenderedComponentTitle(
                            selection
                    );

            if ((renderedTitle != null
                    && renderedTitle
                    .toLowerCase(java.util.Locale.ROOT)
                    .contains("speed dial"))
                    || isSpeedDialMenuItem(item)) {
                try {
                    selection.iconField.setAccessible(true);
                    return selection.iconField.get(
                            selection.sourceComponent
                    );
                } catch (Throwable ignored) {
                    return null;
                }
            }
        }

        return null;
    }

    @Nullable
    private static String readRenderedComponentTitle(
            MenuComponentSelection selection
    ) {
        try {
            selection.titleField.setAccessible(true);
            Object titleMessage =
                    selection.titleField.get(
                            selection.sourceComponent
                    );

            String direct =
                    titleMessage == null
                            ? null
                            : readStringField(
                            titleMessage
                    );

            if (direct != null
                    && !direct.trim().isEmpty()) {
                return direct;
            }

            return titleMessage == null
                    ? null
                    : renderTextMessage(
                    titleMessage
            );
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isLikelyToggleComponent(
            Object component
    ) {
        /*
         * Boolean fields are common presence/state fields in generated
         * protobuf messages and do not identify a toggle renderer. Restrict
         * this guard to the one known toggle component class. Future adapters
         * can add another exact class name without excluding normal rows.
         */
        return "bwzj".equals(
                component.getClass().getSimpleName()
        );
    }

    @Nullable
    private static FreshMessageBuilder beginFreshMessage(
            Object schemaMessage
    ) {
        Class<?> messageType =
                schemaMessage.getClass();

        Object builder =
                invokeStaticNoArgObject(
                        messageType,
                        "newBuilder"
                );

        if (builder == null) {
            Object defaultInstance =
                    invokeNoArgObject(
                            schemaMessage,
                            "getDefaultInstanceForType"
                    );

            if (defaultInstance == null) {
                defaultInstance =
                        invokeStaticNoArgObject(
                                messageType,
                                "getDefaultInstance"
                        );
            }

            if (defaultInstance == null) {
                defaultInstance =
                        findStaticDefaultMessage(
                                messageType
                        );
            }

            if (defaultInstance == null) {
                return null;
            }

            builder =
                    invokeNoArgObject(
                            defaultInstance,
                            "toBuilder"
                    );
        }

        if (builder == null
                || !invokeNoArgVoid(
                builder,
                "copyOnWrite"
        )) {
            return null;
        }

        Object instance =
                readFieldByName(
                        builder,
                        "instance"
                );

        if (instance == null
                || !messageType.isInstance(instance)) {
            return null;
        }

        return new FreshMessageBuilder(
                builder,
                instance
        );
    }

    @Nullable
    private static Object invokeStaticNoArgObject(
            Class<?> type,
            String methodName
    ) {
        for (Class<?> current = type;
             current != null
                     && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Method method =
                        current.getDeclaredMethod(
                                methodName
                        );

                if (!Modifier.isStatic(
                        method.getModifiers()
                ) || method.getParameterTypes().length != 0
                        || method.getReturnType() == Void.TYPE) {
                    continue;
                }

                method.setAccessible(true);
                return method.invoke(null);
            } catch (NoSuchMethodException ignored) {
                // Continue through the hierarchy.
            } catch (Throwable ignored) {
                return null;
            }
        }

        return null;
    }

    @Nullable
    private static Object findStaticDefaultMessage(
            Class<?> messageType
    ) {
        for (Field field :
                messageType.getDeclaredFields()) {
            if (!Modifier.isStatic(
                    field.getModifiers()
            ) || !messageType.isAssignableFrom(
                    field.getType()
            )) {
                continue;
            }

            try {
                field.setAccessible(true);
                Object value = field.get(null);

                if (messageType.isInstance(value)) {
                    return value;
                }
            } catch (Throwable ignored) {
                // Try the next static message field.
            }
        }

        return null;
    }

    private static void copyDeclaredPrimitiveShape(
            Object source,
            Object target
    ) {
        Class<?> type = source.getClass();

        if (!type.equals(target.getClass())) {
            return;
        }

        for (Field field :
                type.getDeclaredFields()) {
            int modifiers =
                    field.getModifiers();

            if (Modifier.isStatic(modifiers)
                    || Modifier.isFinal(modifiers)
                    || !field.getType().isPrimitive()) {
                continue;
            }

            try {
                field.setAccessible(true);
                field.set(
                        target,
                        field.get(source)
                );
            } catch (Throwable ignored) {
                // A single optional primitive is not required to construct row.
            }
        }
    }

    @Nullable
    private static Object createFreshTitleMessage(
            @Nullable Object schemaTitle,
            String text
    ) {
        Object helperMessage =
                createSimpleTextMessage(text);

        if (helperMessage != null
                && schemaTitle != null
                && schemaTitle.getClass()
                .isInstance(helperMessage)) {
            return helperMessage;
        }

        if (schemaTitle == null) {
            return null;
        }

        FreshMessageBuilder builder =
                beginFreshMessage(schemaTitle);

        if (builder == null) {
            return null;
        }

        copyDeclaredPrimitiveShape(
                schemaTitle,
                builder.instance
        );

        boolean wroteText = false;

        for (Class<?> current =
                     builder.instance.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field :
                    current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())
                        || Modifier.isFinal(field.getModifiers())
                        || field.getType() != String.class) {
                    continue;
                }

                try {
                    field.setAccessible(true);
                    field.set(builder.instance, text);
                    wroteText = true;
                    break;
                } catch (Throwable ignored) {
                    // Try another String field.
                }
            }

            if (wroteText) break;
        }

        if (!wroteText) {
            return null;
        }

        Object message = builder.build();

        if (message == null
                || !objectGraphContainsText(
                message,
                text,
                true
        )) {
            return null;
        }

        return message;
    }

    private static int populateFreshReferenceSkeleton(
            Object source,
            Object target,
            int depth,
            String... excludedFieldNames
    ) {
        if (source == null
                || target == null
                || depth <= 0
                || source.getClass() != target.getClass()) {
            return 0;
        }

        int populatedCount = 0;

        java.util.HashSet<String> excluded =
                new java.util.HashSet<>();

        if (excludedFieldNames != null) {
            java.util.Collections.addAll(
                    excluded,
                    excludedFieldNames
            );
        }

        for (Field field :
                source.getClass().getDeclaredFields()) {
            int modifiers = field.getModifiers();

            if (Modifier.isStatic(modifiers)
                    || Modifier.isFinal(modifiers)
                    || field.getType().isPrimitive()
                    || excluded.contains(field.getName())
                    || field.getType() == String.class
                    || field.getType().isArray()
                    || Iterable.class.isAssignableFrom(
                    field.getType()
            ) || java.util.Map.class.isAssignableFrom(
                    field.getType()
            )) {
                continue;
            }

            Object sourceValue;

            try {
                field.setAccessible(true);
                sourceValue = field.get(source);
            } catch (Throwable ignored) {
                continue;
            }

            if (sourceValue == null) {
                continue;
            }

            if (sourceValue instanceof Enum) {
                try {
                    field.set(target, sourceValue);
                    populatedCount++;
                } catch (Throwable ignored) {
                    // Optional enum shape only.
                }
                continue;
            }

            FreshMessageBuilder childBuilder =
                    beginFreshMessage(sourceValue);

            if (childBuilder == null) {
                continue;
            }

            copyDeclaredPrimitiveShape(
                    sourceValue,
                    childBuilder.instance
            );

            int nestedCount =
                    populateFreshReferenceSkeleton(
                            sourceValue,
                            childBuilder.instance,
                            depth - 1
                    );

            Object freshChild = childBuilder.build();

            if (freshChild == null
                    || !field.getType()
                    .isInstance(freshChild)) {
                continue;
            }

            try {
                field.set(target, freshChild);
                populatedCount += 1 + nestedCount;
            } catch (Throwable ignored) {
                // A non-required reference may remain at its default value.
            }
        }

        return populatedCount;
    }

    @Nullable
    private static Object createFreshIconMessage(
            @Nullable Object schemaIcon
    ) {
        if (schemaIcon == null) return null;

        FreshMessageBuilder iconBuilder =
                beginFreshMessage(
                        schemaIcon
                );

        if (iconBuilder == null) {
            return null;
        }

        copyDeclaredPrimitiveShape(
                schemaIcon,
                iconBuilder.instance
        );

        return iconBuilder.build();
    }

    private static boolean objectGraphContainsIdentity(
            @Nullable Object root,
            @Nullable Object expected
    ) {
        if (root == null || expected == null) {
            return false;
        }

        IdentityHashMap<Object, Boolean> visited =
                new IdentityHashMap<>();
        ArrayList<Object> queue =
                new ArrayList<>();
        ArrayList<Integer> depths =
                new ArrayList<>();

        queue.add(root);
        depths.add(0);

        int cursor = 0;

        while (cursor < queue.size()
                && visited.size() < 180) {
            Object value =
                    queue.get(cursor);
            int depth =
                    depths.get(cursor);
            cursor++;

            if (value == null
                    || visited.put(
                    value,
                    Boolean.TRUE
            ) != null) {
                continue;
            }

            if (value == expected) {
                return true;
            }

            Class<?> type =
                    value.getClass();

            if (isTerminalType(type)
                    || depth >= 6) {
                continue;
            }

            if (value instanceof Iterable) {
                for (Object child :
                        (Iterable<?>) value) {
                    queue.add(child);
                    depths.add(depth + 1);
                }
                continue;
            }

            if (type.isArray()) {
                int length =
                        Array.getLength(value);

                for (int index = 0;
                     index < length;
                     index++) {
                    queue.add(
                            Array.get(
                                    value,
                                    index
                            )
                    );
                    depths.add(depth + 1);
                }
                continue;
            }

            for (Field field :
                    getInstanceFields(type)) {
                if (field.getType().isPrimitive()) {
                    continue;
                }

                try {
                    field.setAccessible(true);
                    queue.add(
                            field.get(value)
                    );
                    depths.add(depth + 1);
                } catch (Throwable ignored) {
                    // Keep the validation bounded and best-effort.
                }
            }
        }

        return false;
    }

    private static void logFreshModelFailure(
            String stage,
            @Nullable Object schemaItem,
            @Nullable Object schemaComponent
    ) {
        Log.d(TAG, "SeparatePinFreshModel"
                + " success=false"
                + " stage=" + stage
                + " itemType="
                + objectTypeName(schemaItem)
                + " componentType="
                + objectTypeName(schemaComponent));
    }

    private static final class FreshMessageBuilder {
        final Object builder;
        final Object instance;

        FreshMessageBuilder(
                Object builder,
                Object instance
        ) {
            this.builder = builder;
            this.instance = instance;
        }

        @Nullable
        Object build() {
            return invokeNoArgObject(
                    builder,
                    "build"
            );
        }
    }

    @Nullable
    private static MenuComponentSelection findActiveMenuComponent(
            Object sourceItem,
            @Nullable Object resolvedTitle,
            @Nullable Object resolvedIcon
    ) {
        String resolvedTitleString =
                resolvedTitle == null
                        ? null
                        : resolvedTitle.toString();

        Integer resolvedIconNumber =
                readIntegerField(
                        resolvedIcon,
                        "c"
                );

        MenuComponentSelection best =
                evaluateMenuComponentCandidate(
                        null,
                        sourceItem,
                        resolvedTitleString,
                        resolvedIconNumber
                );

        for (Field parentField :
                getInstanceFields(sourceItem.getClass())) {
            if (parentField.getType().isPrimitive()) {
                continue;
            }

            Object candidate;

            try {
                parentField.setAccessible(true);
                candidate =
                        parentField.get(sourceItem);
            } catch (Throwable ignored) {
                continue;
            }

            if (candidate == null) continue;

            MenuComponentSelection selection =
                    evaluateMenuComponentCandidate(
                            parentField,
                            candidate,
                            resolvedTitleString,
                            resolvedIconNumber
                    );

            if (selection != null
                    && (best == null
                    || selection.score > best.score)) {
                best = selection;
            }
        }

        return best;
    }

    @Nullable
    private static MenuComponentSelection evaluateMenuComponentCandidate(
            @Nullable Field parentField,
            Object candidate,
            @Nullable String resolvedTitle,
            @Nullable Integer resolvedIconNumber
    ) {
        Field firstTitleField = null;
        Field exactTitleField = null;
        Field firstIconField = null;
        Field exactIconField = null;

        for (Field field :
                getInstanceFields(candidate.getClass())) {
            if (field.getType().isPrimitive()) {
                continue;
            }

            Object value;

            try {
                field.setAccessible(true);
                value = field.get(candidate);
            } catch (Throwable ignored) {
                continue;
            }

            if (value == null) continue;

            String rendered = readStringField(value);

            if (rendered == null) {
                rendered = renderTextMessage(value);
            }

            /*
             * Generated text messages often keep their direct String field
             * empty because the visible text is represented by another
             * protobuf arm. The presence of a declared String field is still a
             * reliable schema signal even when no semantic text can be read.
             */
            boolean textSchema =
                    rendered != null
                            || hasDeclaredInstanceFieldOfType(
                            value.getClass(),
                            String.class
                    );

            if (textSchema) {
                if (firstTitleField == null) {
                    firstTitleField = field;
                }

                if (resolvedTitle != null
                        && rendered != null
                        && resolvedTitle.equals(rendered)) {
                    exactTitleField = field;
                }
                continue;
            }

            Integer iconNumber =
                    readIntegerField(value, "c");

            if (iconNumber != null) {
                if (firstIconField == null) {
                    firstIconField = field;
                }

                if (resolvedIconNumber != null
                        && resolvedIconNumber.equals(iconNumber)) {
                    exactIconField = field;
                }
            }
        }

        Field titleField =
                exactTitleField != null
                        ? exactTitleField
                        : firstTitleField;

        Field iconField =
                exactIconField != null
                        ? exactIconField
                        : firstIconField;

        if (titleField == null
                || iconField == null) {
            return null;
        }

        int score = 2;

        if (exactTitleField != null) {
            score += 4;
        }

        if (exactIconField != null) {
            score += 4;
        }

        return new MenuComponentSelection(
                parentField,
                candidate,
                titleField,
                iconField,
                score
        );
    }

    private static List<Field> getInstanceFields(
            Class<?> type
    ) {
        synchronized (instanceFieldCache) {
            List<Field> cached = instanceFieldCache.get(type);
            if (cached != null) return cached;
        }

        ArrayList<Field> fields = new ArrayList<>();

        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] declaredFields;
            try {
                declaredFields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : declaredFields) {
                if (Modifier.isStatic(field.getModifiers())
                        || field.isSynthetic()) {
                    continue;
                }

                try {
                    field.setAccessible(true);
                } catch (Throwable ignored) {
                    // Access can still be retried by the caller.
                }
                fields.add(field);
            }
        }

        List<Field> result = Collections.unmodifiableList(fields);

        synchronized (instanceFieldCache) {
            if (instanceFieldCache.size() >= MAX_INSTANCE_FIELD_CACHE) {
                instanceFieldCache.clear();
            }
            instanceFieldCache.put(type, result);
        }

        return result;
    }

    @Nullable
    private static Integer readIntegerField(
            @Nullable Object receiver,
            String fieldName
    ) {
        Object value =
                readFieldByName(
                        receiver,
                        fieldName
                );

        return value instanceof Integer
                ? (Integer) value
                : null;
    }

    private static boolean hasDeclaredInstanceFieldOfType(
            Class<?> type,
            Class<?> expectedType
    ) {
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }

                if (expectedType.equals(field.getType())) {
                    return true;
                }
            }
        }

        return false;
    }


    @Nullable
    private static String renderTextMessage(
            Object textMessage
    ) {
        Object rendered =
                invokeStaticByNames(
                        TEXT_HELPER_CLASSES,
                        "b",
                        textMessage
                );

        return rendered == null
                ? null
                : rendered.toString();
    }

    @Nullable
    private static String readStringField(
            Object message
    ) {
        for (Field field : getInstanceFields(message.getClass())) {
            if (!String.class.equals(field.getType())) {
                continue;
            }

            try {
                field.setAccessible(true);
                Object value = field.get(message);

                if (value instanceof String
                        && !((String) value).trim().isEmpty()) {
                    return (String) value;
                }
            } catch (Throwable ignored) {
                // Try the next field.
            }
        }

        return null;
    }

    private static void logDirectObjectFields(
            String prefix,
            Object receiver
    ) {
        StringBuilder output =
                new StringBuilder(prefix)
                        .append(" receiverType=")
                        .append(objectTypeName(receiver));

        for (Field field :
                getInstanceFields(receiver.getClass())) {
            if (field.getType().isPrimitive()) {
                continue;
            }

            Object value;

            try {
                field.setAccessible(true);
                value = field.get(receiver);
            } catch (Throwable ignored) {
                continue;
            }

            output.append(" ")
                    .append(field.getName())
                    .append("=")
                    .append(objectTypeName(value));
        }

        Log.d(TAG, output.toString());
    }

    @Nullable
    private static Object createSimpleTextMessage(
            String text
    ) {
        Object message =
                invokeStaticByNames(
                        TEXT_HELPER_CLASSES,
                        "f",
                        text
                );

        if (message == null) {
            Log.d(TAG, "SeparatePinFreshModel"
                    + " success=false"
                    + " stage=textFactory"
                    + " text=" + text);
        }

        return message;
    }

    private static final class FreshMenuSchemaCandidate {
        final int index;
        final Object item;
        final MenuComponentSelection selection;
        final String schemaKey;

        FreshMenuSchemaCandidate(
                int index,
                Object item,
                MenuComponentSelection selection,
                String schemaKey
        ) {
            this.index = index;
            this.item = item;
            this.selection = selection;
            this.schemaKey = schemaKey;
        }
    }

    private static final class MenuComponentSelection {
        @Nullable
        final Field parentField;
        final Object sourceComponent;
        final Field titleField;
        final Field iconField;
        final int score;

        MenuComponentSelection(
                @Nullable Field parentField,
                Object sourceComponent,
                Field titleField,
                Field iconField,
                int score
        ) {
            this.parentField = parentField;
            this.sourceComponent = sourceComponent;
            this.titleField = titleField;
            this.iconField = iconField;
            this.score = score;
        }
    }

    private static void showPinStateToast(
            Context context,
            boolean pinned
    ) {
        Context appContext =
                context.getApplicationContext();

        Toast.makeText(
                appContext != null
                        ? appContext
                        : context,
                pinned
                        ? TOAST_PINNED
                        : TOAST_UNPINNED,
                Toast.LENGTH_SHORT
        ).show();
    }

    /**
     * Applies the extension-owned Library Pin/Unpin icon after the native
     * MenuItemPresenter has completed its normal bind.
     *
     * The row model remains a factory-created native command row. Only the
     * rendered ImageView is changed, so this path does not depend on YouTube
     * Music's icon enum names, enum numbers, or the state of Speed Dial.
     */
    public static void styleInjectedLibraryPinPresenter(
            @Nullable Object presenter
    ) {
        if (!isFeatureEnabled()
                || !isFeatureEnabled()
                || presenter == null) {
            return;
        }

        try {
            Object menuItem = findPresenterMenuItem(presenter);

            if (!isInjectedLibraryPinMenuItemFast(menuItem)) {
                return;
            }

            /*
             * Native protobuf/render paths may copy the inserted model. Once
             * the custom title identifies that bound copy, remember it so the
             * icon and click hooks become identity-only for the rest of the
             * flyout lifetime.
             */
            rememberInjectedLibraryPinMenuItem(menuItem);
            String activePlaylistId = activeFlyoutPlaylistId;
            if (PinStore.isSupportedPlaylistId(activePlaylistId)) {
                synchronized (flyoutObjectIds) {
                    flyoutObjectIds.put(menuItem, activePlaylistId);
                }
            }

            ImageView iconView = findPresenterIconView(presenter);

            if (iconView == null) {
                if (flyoutMenuIconLogCount < 8) {
                    flyoutMenuIconLogCount++;
                    Log.d(TAG, "LibraryPinMenuIcon applied=false"
                            + " reason=noNativeIconView"
                            + " presenterType="
                            + objectTypeName(presenter));
                }
                return;
            }

            boolean unpinAction =
                    isUnpinLibraryMenuItem(menuItem);

            int iconSize = Math.max(
                    iconView.getWidth(),
                    iconView.getHeight()
            );

            ViewGroup.LayoutParams layoutParams =
                    iconView.getLayoutParams();

            if (iconSize <= 0 && layoutParams != null) {
                iconSize = Math.max(
                        layoutParams.width,
                        layoutParams.height
                );
            }

            if (iconSize <= 0) {
                float density =
                        iconView.getResources()
                                .getDisplayMetrics()
                                .density;
                iconSize = Math.max(
                        1,
                        Math.round(24.0f * density)
                );
            }

            LibraryPinMenuDrawable drawable =
                    new LibraryPinMenuDrawable(
                            unpinAction,
                            iconSize
                    );

            ColorFilter existingColorFilter =
                    iconView.getColorFilter();

            if (existingColorFilter != null) {
                drawable.setColorFilter(existingColorFilter);
            }

            iconView.setImageDrawable(drawable);
            iconView.setVisibility(View.VISIBLE);

            if (flyoutMenuIconLogCount < 8) {
                flyoutMenuIconLogCount++;
                Log.d(TAG, "LibraryPinMenuIcon applied=true"
                        + " action="
                        + (unpinAction ? "unpin" : "pin")
                        + " source=patchOwnedDrawable"
                        + " presenterType="
                        + objectTypeName(presenter)
                        + " itemType="
                        + objectTypeName(menuItem));
            }
        } catch (Throwable error) {
            Log.e(TAG, "Failed styling Library pin menu icon", error);
        }
    }

    /**
     * Hijacks only the existing Pin/Unpin Speed Dial rows.
     */
    public static boolean handleClick(
            @Nullable View clickedView,
            @Nullable Object presenter
    ) {
        try {
            Object menuItem = findPresenterMenuItem(presenter);
            boolean handled;

            if (isInjectedLibraryPinMenuItem(menuItem)) {
                handled = handleClick(
                        clickedView,
                        null,
                        presenter,
                        menuItem
                );
            } else {
                Object iconMessage = invokeStaticByNames(
                        MENU_ITEM_HELPER_CLASSES,
                        "d",
                        menuItem
                );
                Object iconNumber = readFieldByName(iconMessage, "c");
                Object icon = invokeStaticByNames(
                        ICON_ENUM_CLASSES,
                        "a",
                        iconNumber
                );

                handled = icon instanceof Enum<?>
                        && handleClick(
                        clickedView,
                        (Enum<?>) icon,
                        presenter,
                        menuItem
                );
            }

            if (handled) {
                dismissFlyout(clickedView);
            }

            return handled;
        } catch (Throwable error) {
            Log.e(TAG, "Failed resolving menu click", error);
            return false;
        }
    }


    /**
     * Performs the pin action after the presenter-specific click data is resolved.
     */
    public static boolean handleClick(
            @Nullable View clickedView,
            @Nullable Enum<?> icon,
            @Nullable Object presenter,
            @Nullable Object menuItem
    ) {
        if (!isFeatureEnabled()) {
            return false;
        }

        boolean injectedMenuItem =
                isInjectedLibraryPinMenuItem(menuItem);
        boolean separateMenuItem =
                isFeatureEnabled();

        if (separateMenuItem && !injectedMenuItem) {
            return false;
        }

        if (!separateMenuItem && injectedMenuItem) {
            return false;
        }

        if (icon == null && !injectedMenuItem) return false;

        String name = icon == null
                ? "LIBRARY_PIN"
                : icon.name();

        boolean isPin =
                name.equals("KEEP") ||
                name.equals("PIN_OUTLINE");

        boolean isUnpin =
                name.equals("KEEP_OFF") ||
                name.equals("PIN_OFF_OUTLINE");

        if (!injectedMenuItem && !isPin && !isUnpin) return false;

        if (clickedView != null) {
            Context context = clickedView.getContext();
            if (context != null) {
                applicationContext = context.getApplicationContext();
            }
        }

        String key = lookupPlaylistIdFromPresenterGraph(presenter);

        if (key != null) {
            Log.d(TAG, "Resolved playlist id from mapped flyout presenter=" + key);
        } else {
            key = lookupFlyoutPlaylistId(menuItem);
        }

        if (key == null) {
            key = consumeActiveFlyoutPlaylistId();
            if (key != null) {
                Log.d(TAG, "Resolved playlist id from active flyout bridge=" + key);
            }
        }

        if (!PinStore.isSupportedPlaylistId(key)) {
            Log.e(TAG, "Library pin click ignored"
                    + " reason=noCanonicalPlaylistId"
                    + " injected=" + injectedMenuItem
                    + " presenterType=" + objectTypeName(presenter)
                    + " menuItemType=" + objectTypeName(menuItem));

            /*
             * Consume a stray injected row so its native command can
             * never run. Stock rows fall through to the original app action.
             */
            return injectedMenuItem;
        }

        Log.d(TAG, (injectedMenuItem
                ? "Handled separate Library pin item"
                : "Hijacked Speed Dial item")
                + " icon=" + name
                + " key=" + key
                + " rowPosition=" + activeFlyoutAdapterPosition
                + " stableRowId=" + activeFlyoutStableRowId
                + " model=" + menuItem);

        if (clickedView == null) {
            Log.e(TAG, "Cannot persist pin state: clicked View is null");
            return true;
        }

        Context clickContext =
                clickedView.getContext();
        boolean newPinnedState =
                PinStore.togglePinned(clickContext, key);

        synchronized (preparedNativeLibraryLists) {
            preparedNativeLibraryLists.remove(activeLibraryAdapter);
        }

        showPinStateToast(
                clickContext,
                newPinnedState
        );

        refreshProcessPinPresence(
                clickContext
        );

        /*
         * On a zero-pin cold start, visible rows were intentionally not
         * tracked before the first pin. Repaint the exact Library row that
         * opened this flyout so the subtitle pin appears immediately even
         * when the full position-map refresh is unavailable.
         */
        boolean matchingRowContext =
                key.equals(activeFlyoutRowPlaylistId);

        postDirectFlyoutRowPinIndicatorRefresh(
                matchingRowContext
                        ? activeFlyoutRowView
                        : null,
                newPinnedState,
                key
        );

        boolean refreshedFactoryMap =
                refreshActiveFactoryPositionMap(
                        clickedView.getContext()
                );

        if (!refreshedFactoryMap) {
            refreshedFactoryMap =
                    refreshStableDelegatePositionMapAfterToggle();
        }

        if (!refreshedFactoryMap) {
            clearActivePositionRemapPreservingContext(
                    "pinToggleFallback"
            );

            Object adapter = activeLibraryAdapter;

            if (adapter != null) {
                boolean fullNotify =
                        invokeAdapterFullRefresh(adapter);

                if (!fullNotify) {
                    postVisiblePinIndicatorRefresh(adapter);
                }

                Log.d(TAG, "PinToggleFallbackRefresh"
                        + " adapterIdentity="
                        + identityString(adapter)
                        + " fullNotify=" + fullNotify
                        + " activeContextPreserved=true");
            }
            Long rowId = matchingRowContext
                    ? activeFlyoutStableRowId
                    : null;

            if (rowId == null && adapter != null) {
                synchronized (adapterPlaylistIds) {
                    Map<Long, String> knownRows =
                            adapterPlaylistIds.get(adapter);
                    if (knownRows != null) {
                        for (Map.Entry<Long, String> entry
                                : knownRows.entrySet()) {
                            if (key.equals(entry.getValue())) {
                                rowId = entry.getKey();
                                break;
                            }
                        }
                    }
                }
            }

            if (adapter != null && rowId != null) {
                rememberAdapterPlaylistId(
                        adapter,
                        rowId,
                        key
                );
                scheduleAdapterReorder(
                        adapter,
                        clickedView
                );
            } else {
                Log.d(TAG, "Pin state stored, but active Library"
                        + " mapping was unavailable for"
                        + " immediate reorder");
            }
        }

        Log.d(TAG, newPinnedState
                ? "Stored local playlist pin"
                : "Removed local playlist pin");

        return true;
    }

    /**
     * Stable-partitions raw section-list rows into:
     *
     * [matching pinned rows in existing order] + [all other rows in existing order]
     *
     * The optional metadata list is moved with exactly the same permutation.
     * The controller argument is currently retained for logging/future narrowing;
     * context is resolved independently so this also works after an app restart.
     */





    private static Set<String> collectCanonicalPlaylistIds(
            @Nullable Object root,
            int maxDepth
    ) {
        Set<String> ids = new LinkedHashSet<>();
        if (root == null) return ids;

        IdentityHashMap<Object, Boolean> visited = new IdentityHashMap<>();
        int[] visitedCount = new int[]{0};

        collectCanonicalPlaylistIdsRecursive(
                root,
                ids,
                visited,
                visitedCount,
                0,
                maxDepth
        );

        return ids;
    }

    private static void collectCanonicalPlaylistIdsRecursive(
            @Nullable Object value,
            Set<String> ids,
            IdentityHashMap<Object, Boolean> visited,
            int[] visitedCount,
            int depth,
            int maxDepth
    ) {
        if (value == null || depth > maxDepth) return;
        if (visitedCount[0] >= 500 || ids.size() >= 12) return;

        if (value instanceof CharSequence) {
            String id = extractCanonicalPlaylistId(value.toString());
            if (id != null) ids.add(id);
            return;
        }

        byte[] bytes = extractByteContainer(value);
        if (bytes != null && bytes.length != 0) {
            Set<String> strings = new LinkedHashSet<>();
            addPrintableCandidates(bytes, strings);
            for (String candidate : strings) {
                String id = extractCanonicalPlaylistId(candidate);
                if (id != null) ids.add(id);
            }

            if (value instanceof byte[] || isByteContainer(value.getClass())) {
                return;
            }
        }

        Class<?> type = value.getClass();
        if (isTerminalType(type) || type.isPrimitive()) return;

        if (visited.put(value, Boolean.TRUE) != null) return;
        visitedCount[0]++;

        if (type.isArray()) {
            int length = Array.getLength(value);
            for (int index = 0; index < length; index++) {
                collectCanonicalPlaylistIdsRecursive(
                        Array.get(value, index),
                        ids,
                        visited,
                        visitedCount,
                        depth + 1,
                        maxDepth
                );
            }
            return;
        }

        if (value instanceof Iterable) {
            for (Object child : (Iterable<?>) value) {
                collectCanonicalPlaylistIdsRecursive(
                        child,
                        ids,
                        visited,
                        visitedCount,
                        depth + 1,
                        maxDepth
                );
            }
            return;
        }

        if (value instanceof Map) {
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) value).entrySet()) {
                collectCanonicalPlaylistIdsRecursive(
                        entry.getKey(),
                        ids,
                        visited,
                        visitedCount,
                        depth + 1,
                        maxDepth
                );
                collectCanonicalPlaylistIdsRecursive(
                        entry.getValue(),
                        ids,
                        visited,
                        visitedCount,
                        depth + 1,
                        maxDepth
                );
            }
            return;
        }

        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable error) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (field.getType().isPrimitive()) continue;

                try {
                    field.setAccessible(true);
                    collectCanonicalPlaylistIdsRecursive(
                            field.get(value),
                            ids,
                            visited,
                            visitedCount,
                            depth + 1,
                            maxDepth
                    );
                } catch (Throwable ignored) {
                }
            }
        }
    }


    private static Set<String> collectObjectStrings(@Nullable Object root) {
        Set<String> candidates = new LinkedHashSet<>();

        if (root != null) {
            IdentityHashMap<Object, Boolean> visited = new IdentityHashMap<>();
            int[] visitedCount = new int[]{0};

            collectDiagnosticStringsRecursive(
                    root,
                    candidates,
                    visited,
                    visitedCount,
                    0
            );
        }

        return candidates;
    }

    @Nullable
    private static String findBestPlaylistId(Set<String> candidates) {
        if (candidates == null) return null;

        Set<String> playlistIds = new LinkedHashSet<>();

        for (String candidate : candidates) {
            if (candidate == null) continue;

            Matcher matcher = PLAYLIST_ID_PATTERN.matcher(candidate);
            while (matcher.find()) {
                playlistIds.add(matcher.group(1));
            }

            if (candidate.contains("VLLM")
                    || candidate.equals("LM")
                    || candidate.startsWith("LM")) {
                playlistIds.add("LM");
            }
        }

        return playlistIds.size() == 1
                ? playlistIds.iterator().next()
                : null;
    }


    @Nullable
    private static String extractCanonicalPlaylistId(@Nullable String text) {
        if (text == null) return null;

        Matcher matcher = PLAYLIST_ID_PATTERN.matcher(text);
        if (matcher.find()) {
            return matcher.group(1);
        }

        // YouTube Music's built-in Liked Music playlist commonly appears as
        // VLLM / LM rather than a normal PL... identifier.
        if (text.contains("VLLM") || text.equals("LM") || text.startsWith("LM")) {
            return "LM";
        }

        return null;
    }

    private static void indexFlyoutObjectGraph(
            @Nullable Object root,
            String playlistId
    ) {
        if (root == null) return;

        synchronized (flyoutObjectIds) {
            if (flyoutObjectIds.size() > MAX_FLYOUT_OBJECT_MAPPINGS) {
                flyoutObjectIds.clear();
            }

            IdentityHashMap<Object, Boolean> visited = new IdentityHashMap<>();
            int[] visitedCount = new int[]{0};
            indexFlyoutObjectGraphRecursive(
                    root,
                    playlistId,
                    visited,
                    visitedCount,
                    0
            );
        }
    }

    private static void indexFlyoutObjectGraphRecursive(
            @Nullable Object value,
            String playlistId,
            IdentityHashMap<Object, Boolean> visited,
            int[] visitedCount,
            int depth
    ) {
        if (value == null || depth > MAX_REFLECTION_DEPTH) return;
        if (visitedCount[0] >= MAX_VISITED_OBJECTS_PER_ROW) return;

        Class<?> type = value.getClass();
        if (isTerminalType(type) || type.isPrimitive()) return;
        if (value instanceof byte[] || isByteContainer(type)) return;

        if (visited.put(value, Boolean.TRUE) != null) return;
        visitedCount[0]++;

        flyoutObjectIds.put(value, playlistId);

        if (type.isArray()) {
            int length = Array.getLength(value);
            for (int index = 0; index < length; index++) {
                indexFlyoutObjectGraphRecursive(
                        Array.get(value, index),
                        playlistId,
                        visited,
                        visitedCount,
                        depth + 1
                );
            }
            return;
        }

        if (value instanceof Iterable) {
            for (Object item : (Iterable<?>) value) {
                indexFlyoutObjectGraphRecursive(
                        item,
                        playlistId,
                        visited,
                        visitedCount,
                        depth + 1
                );
            }
            return;
        }

        if (value instanceof Map) {
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) value).entrySet()) {
                indexFlyoutObjectGraphRecursive(
                        entry.getKey(),
                        playlistId,
                        visited,
                        visitedCount,
                        depth + 1
                );
                indexFlyoutObjectGraphRecursive(
                        entry.getValue(),
                        playlistId,
                        visited,
                        visitedCount,
                        depth + 1
                );
            }
            return;
        }

        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable error) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (field.getType().isPrimitive()) continue;

                try {
                    field.setAccessible(true);
                    indexFlyoutObjectGraphRecursive(
                            field.get(value),
                            playlistId,
                            visited,
                            visitedCount,
                            depth + 1
                    );
                } catch (Throwable ignored) {
                }
            }
        }
    }


    @Nullable
    private static Object readFieldByName(
            @Nullable Object receiver,
            String fieldName
    ) {
        if (receiver == null) return null;

        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(fieldName);
                if (Modifier.isStatic(field.getModifiers())) continue;

                field.setAccessible(true);
                return field.get(receiver);
            } catch (NoSuchFieldException ignored) {
            } catch (Throwable error) {
                return null;
            }
        }

        return null;
    }

    private static boolean writeFieldByName(
            @Nullable Object receiver,
            String fieldName,
            @Nullable Object value
    ) {
        if (receiver == null) return false;

        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Field field =
                        current.getDeclaredField(fieldName);

                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }

                field.setAccessible(true);
                field.set(receiver, value);
                return true;
            } catch (NoSuchFieldException ignored) {
            } catch (Throwable error) {
                return false;
            }
        }

        return false;
    }


    @Nullable
    private static Object invokeNoArgObject(
            @Nullable Object receiver,
            String methodName
    ) {
        if (receiver == null) return null;

        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Method method =
                        current.getDeclaredMethod(methodName);

                if (method.getParameterTypes().length != 0
                        || method.getReturnType() == Void.TYPE) {
                    continue;
                }

                method.setAccessible(true);
                return method.invoke(receiver);
            } catch (NoSuchMethodException ignored) {
            } catch (Throwable error) {
                return null;
            }
        }

        return null;
    }

    private static String staticMethodCacheKey(
            String className,
            String methodName,
            Object[] arguments
    ) {
        StringBuilder key = new StringBuilder(
                className.length() + methodName.length() + 24
        );
        key.append(className).append('#').append(methodName);

        for (Object argument : arguments) {
            key.append('|');
            key.append(argument == null
                    ? "<null>"
                    : argument.getClass().getName());
        }

        return key.toString();
    }

    @Nullable
    private static Object invokeStaticByName(
            String className,
            String methodName,
            Object... arguments
    ) {
        String cacheKey =
                staticMethodCacheKey(
                        className,
                        methodName,
                        arguments
                );
        Method cached;

        synchronized (staticMethodCache) {
            cached = staticMethodCache.get(cacheKey);
        }

        if (cached != null) {
            try {
                return cached.invoke(null, arguments);
            } catch (Throwable ignored) {
                synchronized (staticMethodCache) {
                    staticMethodCache.remove(cacheKey);
                }
            }
        }

        try {
            Class<?> type = Class.forName(className);

            for (Method method : type.getDeclaredMethods()) {
                if (!Modifier.isStatic(method.getModifiers())
                        || !method.getName().equals(methodName)
                        || method.getParameterTypes().length
                        != arguments.length) {
                    continue;
                }

                Class<?>[] parameterTypes = method.getParameterTypes();
                boolean compatible = true;

                for (int index = 0;
                     index < parameterTypes.length;
                     index++) {
                    Object argument = arguments[index];

                    if (argument == null) {
                        if (parameterTypes[index].isPrimitive()) {
                            compatible = false;
                            break;
                        }
                        continue;
                    }

                    Class<?> parameterType =
                            wrapPrimitiveType(parameterTypes[index]);

                    if (!parameterType.isInstance(argument)) {
                        compatible = false;
                        break;
                    }
                }

                if (!compatible) continue;

                method.setAccessible(true);

                synchronized (staticMethodCache) {
                    if (staticMethodCache.size()
                            >= MAX_STATIC_METHOD_CACHE) {
                        staticMethodCache.clear();
                    }
                    staticMethodCache.put(cacheKey, method);
                }

                return method.invoke(null, arguments);
            }
        } catch (Throwable ignored) {
            return null;
        }

        return null;
    }

    @Nullable
    private static Object invokeStaticByNames(
            String[] classNames,
            String methodName,
            Object... arguments
    ) {
        for (String className : classNames) {
            Object result = invokeStaticByName(
                    className,
                    methodName,
                    arguments
            );

            if (result != null) return result;
        }

        return null;
    }

    @Nullable
    private static Object findEnumConstant(
            String[] classNames,
            String constantName
    ) {
        for (String className : classNames) {
            try {
                Class<?> enumClass = Class.forName(className);

                @SuppressWarnings("unchecked")
                Object constant = Enum.valueOf(
                        (Class<? extends Enum>)
                                enumClass.asSubclass(Enum.class),
                        constantName
                );

                return constant;
            } catch (Throwable ignored) {
                // Try the symbol set for the other supported channel.
            }
        }

        return null;
    }

    private static Class<?> wrapPrimitiveType(
            Class<?> type
    ) {
        if (!type.isPrimitive()) return type;
        if (type == Integer.TYPE) return Integer.class;
        if (type == Boolean.TYPE) return Boolean.class;
        if (type == Long.TYPE) return Long.class;
        if (type == Byte.TYPE) return Byte.class;
        if (type == Short.TYPE) return Short.class;
        if (type == Float.TYPE) return Float.class;
        if (type == Double.TYPE) return Double.class;
        if (type == Character.TYPE) return Character.class;
        return type;
    }

    private static String abbreviateDiagnosticValue(
            @Nullable String value
    ) {
        if (value == null) return "null";
        if (value.length() <= 220) return value;
        return value.substring(0, 217) + "...";
    }

    /**
     * Runs after hyz.o(ViewHolder, position) has bound a row. The playlist
     * source object is attached to the row's overflow View as a normal or keyed
     * tag, so this discovers the canonical playlist ID without opening the
     * menu. Exact IDs are associated with hvg.b, the adapter's stable row ID.
     */
    /**
     * Called at the start and normal return points of hyz.o. The entry call
     * preserves adapter identity; the return call inspects the fully bound row
     * synchronously, avoiding the old per-row View.post delay.
     */
    private static boolean isFeatureEnabled() {
        Context context = resolveApplicationContext();
        boolean enabled = PinPlaylistSettings.isEnabled(context);
        Boolean previous = lastFeatureEnabledState;

        if (previous == null || previous != enabled) {
            synchronized (featureStateLock) {
                previous = lastFeatureEnabledState;

                if (previous == null || previous != enabled) {
                    lastFeatureEnabledState = enabled;
                    featureStoreStateSynchronized = false;

                    Log.d(TAG, "PinPlaylistFeatureState"
                            + " enabled=" + enabled
                            + " previous=" + previous);
                }
            }
        }

        ensureFeatureStoreStateSynchronized(enabled);
        return enabled;
    }

    private static void ensureFeatureStoreStateSynchronized(
            boolean enabled
    ) {
        if (featureStoreStateSynchronized) return;

        Context context = resolveApplicationContext();
        if (context == null) return;

        synchronized (featureStateLock) {
            if (featureStoreStateSynchronized) return;

            boolean clearedPins =
                    PinStore.synchronizeFeatureState(
                            context,
                            enabled
                    );

            featureStoreStateSynchronized = true;

            if (clearedPins) {
                processHasAnyPins = false;
                activeFlyoutPlaylistId = null;
                activeFlyoutHasSpeedDial = false;
                activeFlyoutCapturedAtMs = 0L;

                Log.d(TAG, "PinPlaylistFreshStart"
                        + " clearedPins=true"
                        + " reason=disabledToEnabled");
            }
        }
    }





    private static boolean hasAnyPinsFast() {
        Boolean cached = processHasAnyPins;
        if (cached != null) return cached;

        Context context = resolveApplicationContext();

        /*
         * Fail open if Context is not ready yet. This preserves correctness;
         * the next hook will retry after Application initialization.
         */
        if (context == null) return true;

        boolean hasPins = PinStore.hasAnyPins(context);
        processHasAnyPins = hasPins;

        if (!hasPins && !noPinColdStartBypassLogged) {
            noPinColdStartBypassLogged = true;
            Log.d(TAG, "DiagnosticBuild=" + BUILD_ID
                    + " noPinColdStartBypass=true");
        }

        return hasPins;
    }

    private static void refreshProcessPinPresence(
            @Nullable Context context
    ) {
        if (context == null) {
            processHasAnyPins = null;
            return;
        }

        processHasAnyPins =
                PinStore.hasAnyPins(context);
    }

    private static boolean isAdapterProxyOwner(
            @Nullable Object owner,
            boolean register
    ) {
        if (owner == null) return false;

        Class<?> ownerClass = adapterProxyOwnerClass;
        if (ownerClass == null && register) {
            adapterProxyOwnerClass = owner.getClass();
            return true;
        }

        return owner.getClass() == ownerClass;
    }

    private static boolean isAdapterProxyRenderInfo(
            @Nullable Object renderInfo,
            boolean register
    ) {
        if (renderInfo == null) return false;

        synchronized (adapterProxyRenderInfoClasses) {
            if (register) {
                adapterProxyRenderInfoClasses.add(renderInfo.getClass());
                return true;
            }

            return adapterProxyRenderInfoClasses.contains(
                    renderInfo.getClass()
            );
        }
    }

    private static boolean isAdapterProxyCandidateOwner(
            @Nullable Object owner
    ) {
        if (owner == null) return false;

        synchronized (adapterProxyCandidateOwners) {
            return adapterProxyCandidateOwners.containsKey(owner);
        }
    }

    private static void updateAdapterProxyCandidateOwner(
            @Nullable Object owner,
            @Nullable Integer sourceCount
    ) {
        if (owner == null) return;

        boolean candidate = sourceCount != null
                && sourceCount >= 6
                && sourceCount <= 24;

        synchronized (adapterProxyCandidateOwners) {
            if (candidate) {
                adapterProxyCandidateOwners.put(owner, Boolean.TRUE);
            } else {
                adapterProxyCandidateOwners.remove(owner);
            }
        }
    }

    private static boolean isConfirmedLibraryProxyOwner(
            @Nullable Object owner
    ) {
        if (owner == null) return false;
        if (owner == activeAdapterProxyFactoryOwner) return true;

        synchronized (adapterProxyFactoryVisualToSource) {
            if (adapterProxyFactoryVisualToSource.containsKey(owner)) {
                return true;
            }
        }

        synchronized (ownerVisualPlaylistIds) {
            Map<Integer, String> ids = ownerVisualPlaylistIds.get(owner);
            return ids != null && !ids.isEmpty();
        }
    }

    private static boolean hasAnyInstalledFactoryPositionMap() {
        synchronized (adapterProxyFactoryVisualToSource) {
            return !adapterProxyFactoryVisualToSource.isEmpty();
        }
    }

    private static boolean isConfirmedLibraryAdapterInstance(
            @Nullable Object adapter
    ) {
        if (!isLibraryAdapter(adapter)) return false;
        if (adapter == activeAdapterProxyFactoryVisualAdapter) return true;

        synchronized (adapterVisualToSourcePositions) {
            if (adapterVisualToSourcePositions.containsKey(adapter)) {
                return true;
            }
        }

        synchronized (adapterVisualPlaylistIds) {
            Map<Integer, String> ids = adapterVisualPlaylistIds.get(adapter);
            return ids != null && !ids.isEmpty();
        }
    }

    @Nullable
    private static Object getAdapterProxySourceAdapter(Object owner) {
        synchronized (adapterProxySourceAdapters) {
            return adapterProxySourceAdapters.get(owner);
        }
    }

    @Nullable
    private static Object findAdapterProxyVisualAdapter(Object owner) {
        synchronized (adapterProxyVisualAdapters) {
            Object known = adapterProxyVisualAdapters.get(owner);
            if (isLibraryAdapter(known)) return known;
        }

        Object controller = readFieldByName(owner, "p");
        Object visualAdapter = readFieldByName(controller, "f");
        if (isLibraryAdapter(visualAdapter)) {
            synchronized (adapterProxyVisualAdapters) {
                adapterProxyVisualAdapters.put(owner, visualAdapter);
            }
            return visualAdapter;
        }

        List<Object> firstLevel = directObfuscatedObjects(owner);
        for (Object child : firstLevel) {
            if (isLibraryAdapter(child)) {
                synchronized (adapterProxyVisualAdapters) {
                    adapterProxyVisualAdapters.put(owner, child);
                }
                return child;
            }

            for (Object grandchild : directObfuscatedObjects(child)) {
                if (!isLibraryAdapter(grandchild)) continue;

                synchronized (adapterProxyVisualAdapters) {
                    adapterProxyVisualAdapters.put(owner, grandchild);
                }
                return grandchild;
            }
        }

        return null;
    }

    /**
     * 9.25.50 keeps the AdapterProxy owner and RecyclerView/Litho adapter in
     * separate object graphs. The source factory can still derive a complete,
     * verified playlist permutation, but reflection from the owner cannot reach
     * the visual adapter. Pair that pending owner with the concrete adapter
     * instance supplied by the already-scoped Library bind hook.
     */
    private static void bridgePendingAdapterProxyVisualAdapter(
            @Nullable Object visualAdapter
    ) {
        if (!isLibraryAdapter(visualAdapter)) return;

        Object owner = activeAdapterProxyFactoryOwner;
        int[] visualToSource = null;
        Integer sourceCount = null;

        if (owner != null) {
            synchronized (adapterProxyFactoryVisualToSource) {
                int[] pending =
                        adapterProxyFactoryVisualToSource.get(owner);
                if (pending != null) {
                    visualToSource = pending.clone();
                    sourceCount =
                            adapterProxyFactorySourceCounts.get(owner);
                }
            }
        }

        /*
         * Process recreation can leave no active owner while one verified map
         * is waiting for the first adapter bind. Accept only an unambiguous
         * single pending owner; never guess between multiple feed instances.
         */
        if (visualToSource == null) {
            synchronized (adapterProxyFactoryVisualToSource) {
                if (adapterProxyFactoryVisualToSource.size() == 1) {
                    Map.Entry<Object, int[]> entry =
                            adapterProxyFactoryVisualToSource
                                    .entrySet().iterator().next();
                    owner = entry.getKey();
                    visualToSource = entry.getValue().clone();
                    sourceCount =
                            adapterProxyFactorySourceCounts.get(owner);
                }
            }
        }

        if (owner == null
                || visualToSource == null
                || sourceCount == null
                || sourceCount != visualToSource.length
                || sourceCount < 10
                || sourceCount > 24) {
            return;
        }

        Map<Integer, String> playlistIds;
        synchronized (ownerVisualPlaylistIds) {
            Map<Integer, String> ids =
                    ownerVisualPlaylistIds.get(owner);
            if (ids == null || ids.size() < 3) return;
            playlistIds = new LinkedHashMap<>(ids);
        }

        boolean changed;
        synchronized (adapterProxyVisualAdapters) {
            Object previous = adapterProxyVisualAdapters.put(
                    owner,
                    visualAdapter
            );
            changed = previous != visualAdapter;
        }

        synchronized (adapterVisualToSourcePositions) {
            adapterVisualToSourcePositions.clear();
            adapterVisualToSourcePositions.put(
                    visualAdapter,
                    visualToSource.clone()
            );
        }

        installAdapterPinIndicatorMetadata(owner, visualAdapter);

        activeAdapterProxyFactoryOwner = owner;
        activeAdapterProxyFactoryVisualAdapter = visualAdapter;
        activeLibraryAdapter = visualAdapter;
        lastKnownLibraryPlaylistCount = playlistIds.size();

        if (changed && adapterProxyVisualBridgeLogCount < 12) {
            adapterProxyVisualBridgeLogCount++;
            Log.d(TAG, "AdapterProxyVisualBridge"
                    + " installed=true"
                    + " ownerType=" + objectTypeName(owner)
                    + " ownerIdentity=" + identityString(owner)
                    + " visualAdapterType="
                    + objectTypeName(visualAdapter)
                    + " visualAdapterIdentity="
                    + identityString(visualAdapter)
                    + " sourceCount=" + sourceCount
                    + " playlistCount=" + playlistIds.size()
                    + " visualToSource="
                    + java.util.Arrays.toString(visualToSource));
        }
    }

    public static int remapAdapterProxySourcePosition(
            @Nullable Object owner,
            int visualPosition
    ) {
        if (!isFeatureEnabled()) {
            return visualPosition;
        }

        if (visualPosition < 0
                || !isAdapterProxyOwner(owner, false)) {
            return visualPosition;
        }

        boolean hasPins = hasAnyPinsFast();

        /*
         * A complete rebuild begins at position zero. Only that invocation
         * performs source discovery and canonical-ID extraction. All later
         * h(index) calls use the already-installed hyz position map.
         *
         * This avoids the v53 pattern that rescanned the entire growing bewt
         * source at counts 10, 11, 12, 13, 14 and 15.
         */
        if (visualPosition != 0) {
            return visualPosition;
        }

        Object sourceAdapter = getAdapterProxySourceAdapter(owner);
        Integer sourceCount =
                invokeIntNoArg(sourceAdapter, "a");

        if (sourceAdapter == null
                || sourceCount == null
                || sourceCount < 10
                || sourceCount > 24) {
            updateAdapterProxyCandidateOwner(owner, sourceCount);

            if (adapterProxyFactoryInstallLogCount < 12) {
                adapterProxyFactoryInstallLogCount++;

                Log.d(TAG, "PreFactoryFastPathSkipped"
                        + " reason=entryValidation"
                        + " ownerType=" + objectTypeName(owner)
                        + " sourceAdapterType="
                        + objectTypeName(sourceAdapter)
                        + " sourceCount=" + sourceCount);
            }

            return visualPosition;
        }

        updateAdapterProxyCandidateOwner(owner, sourceCount);

        if (!hasPins
                && isConfirmedLibraryProxyOwner(owner)
                && activeAdapterProxyFactoryVisualAdapter != null) {
            return visualPosition;
        }

        int[] visualToSource =
                buildAdapterProxyFactoryPositionMap(
                        owner,
                        sourceAdapter,
                        sourceCount
                );

        if (visualToSource == null) {
            synchronized (adapterProxyFactoryVisualToSource) {
                adapterProxyFactoryVisualToSource.remove(owner);
                adapterProxyFactorySourceCounts.remove(owner);
            }
            return visualPosition;
        }

        /*
         * Retain the verified source-side map even when this release separates
         * the visual adapter from the owner graph. The scoped adapter bind hook
         * will attach the concrete visual adapter before its position reads.
         */
        synchronized (adapterProxyFactoryVisualToSource) {
            adapterProxyFactoryVisualToSource.put(
                    owner,
                    visualToSource.clone()
            );
            adapterProxyFactorySourceCounts.put(
                    owner,
                    sourceCount
            );
        }
        activeAdapterProxyFactoryOwner = owner;

        Object visualAdapter = findAdapterProxyVisualAdapter(owner);

        if (!isLibraryAdapter(visualAdapter)) {
            if (adapterProxyFactoryInstallLogCount < 12) {
                adapterProxyFactoryInstallLogCount++;

                    Log.d(TAG, "PreFactoryVisualBridgePending"
                            + " reason=visualAdapterUnavailable"
                            + " ownerType=" + objectTypeName(owner)
                            + " ownerIdentity=" + identityString(owner)
                            + " sourceCount=" + sourceCount
                            + " visualAdapterType="
                            + objectTypeName(visualAdapter));
            }

            return visualPosition;
        }

        synchronized (adapterProxyFactoryVisualToSource) {
            adapterProxyFactoryVisualToSource.put(
                    owner,
                    visualToSource
            );
            adapterProxyFactorySourceCounts.put(
                    owner,
                    sourceCount
            );
        }

        synchronized (adapterVisualToSourcePositions) {
            adapterVisualToSourcePositions.clear();
            adapterVisualToSourcePositions.put(
                    visualAdapter,
                    visualToSource.clone()
            );
        }

        installAdapterPinIndicatorMetadata(
                owner,
                visualAdapter
        );

        activeAdapterProxyFactoryOwner = owner;
        activeAdapterProxyFactoryVisualAdapter = visualAdapter;

        Log.d(TAG, "PreFactoryFastPath"
                + " installed=true"
                + " ownerIdentity=" + identityString(owner)
                + " visualAdapterIdentity="
                + identityString(visualAdapter)
                + " sourceCount=" + sourceCount
                + " visualToSource="
                + java.util.Arrays.toString(
                visualToSource
        ));

        return visualPosition;
    }

    @Nullable
    private static int[] buildAdapterProxyFactoryPositionMap(
            Object owner,
            Object sourceAdapter,
            int sourceCount
    ) {
        return buildAdapterProxyFactoryPositionMap(
                owner,
                sourceAdapter,
                sourceCount,
                "getItem"
        );
    }

    @Nullable
    private static int[] buildAdapterProxyFactoryPositionMap(
            Object owner,
            Object sourceAdapter,
            int sourceCount,
            String itemAccessor
    ) {
        Context context = resolveApplicationContext();
        if (context == null) {
            if (adapterProxyFactoryMapLogCount < 24) {
                adapterProxyFactoryMapLogCount++;
                Log.d(TAG, "PreFactoryPositionMapSkipped"
                        + " reason=noContext"
                        + " count=" + sourceCount);
            }
            return null;
        }

        List<String> pinOrder =
                new ArrayList<>(
                        PinStore.getPinnedIds(context)
                );

        boolean resetToNativeOrder =
                pinOrder.isEmpty();

        List<Object> sourceItems =
                new ArrayList<>(sourceCount);
        LinkedHashMap<Integer, String> playlistIdByPosition =
                new LinkedHashMap<>();
        LinkedHashMap<String, Integer> sourcePositionById =
                new LinkedHashMap<>();
        Set<String> knownPlaylistIds =
                new LinkedHashSet<>(pinOrder);

        Map<String, String> persistedSignatures =
                PinStore.getPlaylistSignatures(context);
        knownPlaylistIds.addAll(
                persistedSignatures.keySet()
        );

        for (int position = 0;
             position < sourceCount;
             position++) {
            Object sourceItem =
                    invokeOneIntArgument(
                            sourceAdapter,
                            itemAccessor,
                            position
                    );

            sourceItems.add(sourceItem);

            if (sourceItem == null) continue;

            Set<String> canonicalIds =
                    collectCanonicalPlaylistIds(
                            sourceItem,
                            10
                    );

            LinkedHashSet<String> persistentIds =
                    new LinkedHashSet<>();

            for (String candidate : canonicalIds) {
                if (isPersistentPlaylistId(candidate)) {
                    persistentIds.add(candidate);
                }
            }

            String playlistId =
                    resolveCanonicalPlaylistId(
                            persistentIds,
                            pinOrder,
                            knownPlaylistIds
                    );

            if (!isPersistentPlaylistId(playlistId)) {
                continue;
            }

            if (sourcePositionById.containsKey(playlistId)) {
                Log.d(TAG, "PreFactoryPositionMapSkipped"
                        + " reason=duplicatePlaylistId"
                        + " playlistId=" + playlistId
                        + " firstPosition="
                        + sourcePositionById.get(playlistId)
                        + " duplicatePosition=" + position);
                return null;
            }

            playlistIdByPosition.put(
                    position,
                    playlistId
            );
            sourcePositionById.put(
                    playlistId,
                    position
            );
        }

        /*
         * The Library currently has ten ordinary playlist rows. Keep this
         * threshold broad enough for additions/deletions while rejecting
         * unrelated bfrh-backed lists.
         */
        if (playlistIdByPosition.size() < 3) {
            if (adapterProxyFactoryMapLogCount < 24) {
                adapterProxyFactoryMapLogCount++;
                Log.d(TAG, "PreFactoryPositionMapSkipped"
                        + " reason=tooFewPlaylistRows"
                        + " count=" + sourceCount
                        + " mapped="
                        + playlistIdByPosition.size()
                        + " sourceTypes="
                        + sourceTypeSummary(sourceItems));
            }
            return null;
        }

        List<Integer> playlistSlots =
                new ArrayList<>(
                        playlistIdByPosition.keySet()
                );

        List<Integer> desiredPlaylistSources =
                new ArrayList<>();
        Set<Integer> pinnedSourcePositions =
                new LinkedHashSet<>();
        List<String> pinnedPresent =
                new ArrayList<>();

        if (!resetToNativeOrder) {
            for (String pinnedId : pinOrder) {
                Integer sourcePosition =
                        sourcePositionById.get(pinnedId);

                if (sourcePosition == null) continue;

                desiredPlaylistSources.add(sourcePosition);
                pinnedSourcePositions.add(sourcePosition);
                pinnedPresent.add(pinnedId);
            }

            /*
             * A non-empty pin store with no matching Library row means this is
             * not the active playlist collection, or its identity model has
             * changed. Do not install an unrelated permutation.
             */
            if (pinnedPresent.isEmpty()) {
                return null;
            }
        }

        /*
         * Retain the current native order for all unpinned playlist rows.
         * When the final pin was removed, this naturally produces the identity
         * permutation and restores YouTube Music's native order.
         */
        for (int sourcePosition : playlistSlots) {
            if (!pinnedSourcePositions.contains(
                    sourcePosition
            )) {
                desiredPlaylistSources.add(
                        sourcePosition
                );
            }
        }

        if (desiredPlaylistSources.size()
                != playlistSlots.size()) {
            Log.d(TAG, "PreFactoryPositionMapSkipped"
                    + " reason=playlistCountMismatch"
                    + " slots=" + playlistSlots
                    + " desired="
                    + desiredPlaylistSources);
            return null;
        }

        int[] visualToSource =
                new int[sourceCount];

        for (int position = 0;
             position < sourceCount;
             position++) {
            visualToSource[position] = position;
        }

        for (int index = 0;
             index < playlistSlots.size();
             index++) {
            visualToSource[
                    playlistSlots.get(index)
            ] = desiredPlaylistSources.get(index);
        }

        LinkedHashMap<Integer, String>
                visualPlaylistIds =
                new LinkedHashMap<>();
        LinkedHashSet<Integer>
                pinnedVisualPositions =
                new LinkedHashSet<>();

        for (int index = 0;
             index < playlistSlots.size();
             index++) {
            int visualPosition =
                    playlistSlots.get(index);
            int sourcePosition =
                    desiredPlaylistSources.get(index);
            String playlistId =
                    playlistIdByPosition.get(sourcePosition);

            if (playlistId == null) continue;

            visualPlaylistIds.put(
                    visualPosition,
                    playlistId
            );

            if (pinnedSourcePositions.contains(
                    sourcePosition
            )) {
                pinnedVisualPositions.add(
                        visualPosition
                );
            }
        }

        synchronized (ownerVisualPlaylistIds) {
            ownerVisualPlaylistIds.put(
                    owner,
                    visualPlaylistIds
            );
            ownerPinnedVisualPositions.put(
                    owner,
                    pinnedVisualPositions
            );
        }

        boolean[] seen = new boolean[sourceCount];

        for (int sourcePosition : visualToSource) {
            if (sourcePosition < 0
                    || sourcePosition >= sourceCount
                    || seen[sourcePosition]) {
                Log.d(TAG, "PreFactoryPositionMapSkipped"
                        + " reason=notPermutation"
                        + " visualToSource="
                        + java.util.Arrays.toString(
                        visualToSource
                ));
                return null;
            }

            seen[sourcePosition] = true;
        }

        Log.d(TAG, "PreFactoryPositionMap"
                + " installed=true"
                + " ownerIdentity="
                + identityString(owner)
                + " sourceAdapterType="
                + objectTypeName(sourceAdapter)
                + " count=" + sourceCount
                + " playlistSlots=" + playlistSlots
                + " pinnedPresent=" + pinnedPresent
                + " resetToNativeOrder=" + resetToNativeOrder
                + " visualToSource="
                + java.util.Arrays.toString(
                visualToSource
        ));

        return visualToSource;
    }

    private static List<String> sourceTypeSummary(
            List<Object> sourceItems
    ) {
        List<String> result = new ArrayList<>();

        if (sourceItems == null) return result;

        for (Object sourceItem : sourceItems) {
            result.add(objectTypeName(sourceItem));
        }

        return result;
    }

    public static void beginAdapterProxyRenderInfo(
            @Nullable Object owner,
            int sourceIndex
    ) {
        if (!isFeatureEnabled()
                || !isAdapterProxyOwner(owner, true)) {
            return;
        }

        boolean hasPins = hasAnyPinsFast();

        /*
         * For an unknown owner, capture only its first source frame. The first
         * frame exposes the source adapter and allows structural validation.
         * With no pins, later frames have no work. With a pre-factory map,
         * later frames are also unnecessary because position zero performs
         * every required rebuild and the visual adapter owns the permutation.
         */
        if (sourceIndex != 0) {
            if (!hasPins) return;

            synchronized (adapterProxyFactoryVisualToSource) {
                if (adapterProxyFactoryVisualToSource.containsKey(owner)) {
                    return;
                }
            }

            if (!isAdapterProxyCandidateOwner(owner)
                    && !isConfirmedLibraryProxyOwner(owner)) {
                return;
            }
        }

        if (hasPins && !adapterProxyHookLogged) {
            adapterProxyHookLogged = true;
            Log.d(TAG, "DiagnosticBuild=" + BUILD_ID
                    + " adapterProxySourceHook=true");
        }

        ArrayList<AdapterProxySource> stack =
                pendingAdapterProxySources.get();

        stack.add(
                new AdapterProxySource(owner, sourceIndex)
        );
    }

    public static void captureAdapterProxySourceAdapter(
            @Nullable Object sourceAdapter
    ) {
        ArrayList<AdapterProxySource> stack =
                pendingAdapterProxySources.get();
        if (stack.isEmpty() || sourceAdapter == null) return;

        AdapterProxySource source = stack.get(stack.size() - 1);
        source.sourceAdapter = sourceAdapter;

        Integer sourceCount = invokeIntNoArg(sourceAdapter, "a");
        updateAdapterProxyCandidateOwner(source.owner, sourceCount);

        if (source.sourceIndex == 0
                || isAdapterProxyCandidateOwner(source.owner)
                || isConfirmedLibraryProxyOwner(source.owner)) {
            synchronized (adapterProxySourceAdapters) {
                adapterProxySourceAdapters.put(
                        source.owner,
                        sourceAdapter
                );
            }
        }
    }

    public static int remapActiveAdapterProxySourcePosition(
            int visualPosition
    ) {
        ArrayList<AdapterProxySource> stack =
                pendingAdapterProxySources.get();
        if (stack.isEmpty()) return visualPosition;

        AdapterProxySource source = stack.get(stack.size() - 1);
        return remapAdapterProxySourcePosition(
                source.owner,
                visualPosition
        );
    }

    public static void inspectNativeLibraryRows(
            @Nullable Object owner,
            @Nullable Object rows
    ) {
        if (hasAnyInstalledFactoryPositionMap()) return;
        prepareDiscoveredNativeRowList(owner, rows);
    }

    public static void inspectNativeLibraryController(
            @Nullable Object controller
    ) {
        prepareNativeLibraryTransaction(controller);
    }

    public static void prepareNativeLibraryTransaction(
            @Nullable Object transaction
    ) {
        if (!isFeatureEnabled()
                || !hasAnyPinsFast()
                || hasAnyInstalledFactoryPositionMap()
                || transaction == null) {
            return;
        }

        if (nativeLibraryResolverLogCount < 12) {
            nativeLibraryResolverLogCount++;
            Log.d(TAG, "NativeLibraryResolverEntry"
                    + " transactionType="
                    + objectTypeName(transaction));
        }

        if (transaction instanceof List) {
            prepareDiscoveredNativeRowList(null, transaction);
            return;
        }

        if (prepareDirectNativeRowLists(transaction)) return;

        List<Object> firstLevel = directObfuscatedObjects(transaction);
        for (Object child : firstLevel) {
            if (prepareDirectNativeRowLists(child)) return;

            for (Object grandchild : directObfuscatedObjects(child)) {
                if (prepareDirectNativeRowLists(grandchild)) return;
            }
        }
    }

    private static boolean prepareDirectNativeRowLists(Object owner) {
        List<String> directLists = new ArrayList<>();
        for (Class<?> current = owner.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())
                        || !List.class.isAssignableFrom(field.getType())) {
                    continue;
                }

                Object rows;
                try {
                    field.setAccessible(true);
                    rows = field.get(owner);
                } catch (Throwable ignored) {
                    continue;
                }

                if (!(rows instanceof List)) continue;
                List<?> list = (List<?>) rows;
                directLists.add(field.getName()
                        + "=" + list.size()
                        + ":" + (list.isEmpty()
                        ? "empty"
                        : objectTypeName(list.get(0))));

                if (prepareDiscoveredNativeRowList(
                        owner,
                        rows
                )) {
                    return true;
                }
            }
        }

        if (!directLists.isEmpty()
                && nativeLibraryResolverLogCount < 30) {
            nativeLibraryResolverLogCount++;
            Log.d(TAG, "NativeLibraryDirectLists"
                    + " ownerType=" + objectTypeName(owner)
                    + " lists=" + directLists);
        }

        return false;
    }

    private static List<Object> directObfuscatedObjects(Object owner) {
        List<Object> result = new ArrayList<>();
        for (Class<?> current = owner.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())
                        || field.getType().isPrimitive()) {
                    continue;
                }

                Object child;
                try {
                    field.setAccessible(true);
                    child = field.get(owner);
                } catch (Throwable ignored) {
                    continue;
                }

                if (child == null
                        || child instanceof Iterable
                        || child instanceof Map
                        || child.getClass().isArray()
                        || child.getClass().getName().contains(".")) {
                    continue;
                }

                result.add(child);
                if (result.size() >= 12) return result;
            }
        }
        return result;
    }

    public static void beginNativeLibraryMutation(
            @Nullable Object controller
    ) {
        if (hasAnyInstalledFactoryPositionMap()) {
            pendingNativeLibraryController.remove();
            return;
        }

        pendingNativeLibraryController.set(controller);
        prepareNativeLibraryTransaction(controller);
    }

    public static void finishNativeLibraryMutation() {
        Object controller = pendingNativeLibraryController.get();
        pendingNativeLibraryController.remove();
        prepareNativeLibraryTransaction(controller);
    }

    private static void applyPersistedNativeLibraryOrder(
            @Nullable Object owner
    ) {
        if (!isFeatureEnabled()
                || !hasAnyPinsFast()
                || hasAnyInstalledFactoryPositionMap()
                || owner == null) {
            return;
        }

        if (applyPersistedOrderToDirectList(owner)) return;
        for (Object child : directObfuscatedObjects(owner)) {
            if (applyPersistedOrderToDirectList(child)) return;
            for (Object grandchild : directObfuscatedObjects(child)) {
                if (applyPersistedOrderToDirectList(grandchild)) return;
            }
        }
    }

    public static void preparePersistedLibraryAdapter(
            @Nullable Object adapter
    ) {
        if (!isLibraryAdapter(adapter)) return;

        bridgePendingAdapterProxyVisualAdapter(adapter);

        if (hasAnyInstalledFactoryPositionMap()) {
            return;
        }

        synchronized (preparedNativeLibraryLists) {
            if (preparedNativeLibraryLists.containsKey(adapter)) return;
        }

        Context context = resolveApplicationContext();
        if (context == null) return;

        Set<String> pinOrder = PinStore.getPinnedIds(context);
        String expectedRowType =
                PinStore.getLibraryPermutationRowType(context);
        if (pinOrder.isEmpty() || expectedRowType.isEmpty()) return;

        for (Object controller : directObfuscatedObjects(adapter)) {
            for (Class<?> current = controller.getClass();
                 current != null && current != Object.class;
                 current = current.getSuperclass()) {
                Field[] fields;
                try {
                    fields = current.getDeclaredFields();
                } catch (Throwable ignored) {
                    continue;
                }

                for (Field field : fields) {
                    if (Modifier.isStatic(field.getModifiers())
                            || !List.class.isAssignableFrom(
                            field.getType())) {
                        continue;
                    }

                    List<?> rows;
                    try {
                        field.setAccessible(true);
                        rows = (List<?>) field.get(controller);
                    } catch (Throwable ignored) {
                        continue;
                    }

                    if (rows == null
                            || rows.isEmpty()
                            || !expectedRowType.equals(
                            objectTypeName(rows.get(0)))) {
                        continue;
                    }

                    int[] permutation =
                            PinStore.getLibraryPermutation(
                                    context,
                                    pinOrder,
                                    rows.size(),
                                    stableIdsForItems(rows)
                            );
                    if (permutation == null) continue;

                    synchronized (adapterVisualToSourcePositions) {
                        adapterVisualToSourcePositions.put(
                                adapter,
                                permutation
                        );
                    }

                    int[] playlistSlots =
                            PinStore.getLibraryPlaylistSlots(context);
                    LinkedHashMap<Integer, String> visualIds =
                            new LinkedHashMap<>();
                    LinkedHashSet<Integer> pinnedPositions =
                            new LinkedHashSet<>();
                    if (playlistSlots != null) {
                        int pinIndex = 0;
                        for (String pinnedId : pinOrder) {
                            if (pinIndex >= playlistSlots.length) break;
                            int position = playlistSlots[pinIndex++];
                            if (position < 0 || position >= rows.size()) {
                                continue;
                            }
                            visualIds.put(position, pinnedId);
                            pinnedPositions.add(position);
                        }
                    }
                    synchronized (adapterVisualPlaylistIds) {
                        adapterVisualPlaylistIds.put(adapter, visualIds);
                        adapterPinnedVisualPositions.put(
                                adapter,
                                pinnedPositions
                        );
                    }
                    synchronized (preparedNativeLibraryLists) {
                        preparedNativeLibraryLists.put(
                                adapter,
                                pinOrder.toString()
                        );
                    }

                    Log.d(TAG, "PersistedLibraryPermutationInstalled"
                            + " adapterType="
                            + objectTypeName(adapter)
                            + " total=" + rows.size()
                            + " rowType=" + expectedRowType
                            + " permutation="
                            + java.util.Arrays.toString(permutation));
                    return;
                }
            }
        }
    }

    private static boolean applyPersistedOrderToDirectList(Object owner) {
        Context context = resolveApplicationContext();
        if (context == null) return false;

        Set<String> pinOrder = PinStore.getPinnedIds(context);
        String expectedRowType =
                PinStore.getLibraryPermutationRowType(context);
        if (pinOrder.isEmpty() || expectedRowType.isEmpty()) return false;

        for (Class<?> current = owner.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())
                        || !List.class.isAssignableFrom(field.getType())) {
                    continue;
                }

                List rawList;
                try {
                    field.setAccessible(true);
                    rawList = (List) field.get(owner);
                } catch (Throwable ignored) {
                    continue;
                }

                if (rawList == null
                        || rawList.isEmpty()
                        || !expectedRowType.equals(
                        objectTypeName(rawList.get(0)))) {
                    continue;
                }

                int[] permutation = PinStore.getLibraryPermutation(
                        context,
                        pinOrder,
                        rawList.size(),
                        stableIdsForItems(rawList)
                );
                if (permutation == null) continue;

                String token = pinOrder.toString()
                        + java.util.Arrays.toString(permutation);
                synchronized (preparedNativeLibraryLists) {
                    if (token.equals(
                            preparedNativeLibraryLists.get(rawList))) {
                        return true;
                    }
                }

                List<Object> nativeRows = new ArrayList<>(rawList);
                try {
                    for (int position = 0;
                         position < permutation.length;
                         position++) {
                        rawList.set(
                                position,
                                nativeRows.get(permutation[position])
                        );
                    }
                } catch (Throwable ignored) {
                    return false;
                }

                synchronized (preparedNativeLibraryLists) {
                    preparedNativeLibraryLists.put(rawList, token);
                }

                Log.d(TAG, "PersistedNativeLibraryOrderApplied"
                        + " ownerType=" + objectTypeName(owner)
                        + " field=" + field.getName()
                        + " total=" + rawList.size()
                        + " rowType=" + expectedRowType
                        + " permutation="
                        + java.util.Arrays.toString(permutation));
                return true;
            }
        }

        return false;
    }

    private static void prepareNativeLibrarySourceTransaction(
            @Nullable Object transaction
    ) {
        if (!isFeatureEnabled()
                || !hasAnyPinsFast()
                || hasAnyInstalledFactoryPositionMap()
                || transaction == null) {
            return;
        }

        for (Class<?> current = transaction.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())
                        || !SparseArray.class.isAssignableFrom(
                        field.getType())) {
                    continue;
                }

                SparseArray sourceRows;
                try {
                    field.setAccessible(true);
                    sourceRows = (SparseArray) field.get(transaction);
                } catch (Throwable ignored) {
                    continue;
                }

                if (sourceRows == null
                        || sourceRows.size() < 6
                        || sourceRows.size() > 24) {
                    continue;
                }

                List<Object> values =
                        new ArrayList<>(sourceRows.size());
                for (int index = 0;
                     index < sourceRows.size();
                     index++) {
                    values.add(sourceRows.valueAt(index));
                }

                if (!prepareDiscoveredNativeRowList(
                        transaction,
                        values
                )) {
                    continue;
                }

                for (int index = 0;
                     index < values.size();
                     index++) {
                    sourceRows.setValueAt(index, values.get(index));
                }

                Log.d(TAG, "NativeLibrarySourcePrepared"
                        + " transactionType="
                        + objectTypeName(transaction)
                        + " field=" + field.getName()
                        + " total=" + values.size()
                        + " rowType="
                        + (values.isEmpty()
                        ? "empty"
                        : objectTypeName(values.get(0))));
                return;
            }
        }
    }

    private static boolean findAndPrepareNativeRowList(
            @Nullable Object value,
            int depth,
            IdentityHashMap<Object, Boolean> visited,
            int[] visitedCount
    ) {
        if (value == null
                || depth > 3
                || visitedCount[0] >= 40
                || visited.put(value, Boolean.TRUE) != null) {
            return false;
        }
        visitedCount[0]++;

        if (value instanceof List
                && prepareDiscoveredNativeRowList(null, value)) {
            return true;
        }

        Class<?> type = value.getClass();
        if (isTerminalType(type)
                || type.isPrimitive()
                || type.isArray()
                || value instanceof Map
                || value instanceof Iterable) {
            return false;
        }

        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())
                        || field.getType().isPrimitive()) {
                    continue;
                }

                Object child;
                try {
                    field.setAccessible(true);
                    child = field.get(value);
                } catch (Throwable ignored) {
                    continue;
                }

                if (child instanceof List
                        && prepareDiscoveredNativeRowList(value, child)) {
                    return true;
                }

                if (depth < 3
                        && findAndPrepareNativeRowList(
                        child,
                        depth + 1,
                        visited,
                        visitedCount
                )) {
                    return true;
                }
            }
        }

        return false;
    }

    private static boolean prepareDiscoveredNativeRowList(
            @Nullable Object owner,
            @Nullable Object rows
    ) {
        if (!(rows instanceof List)) return false;

        List rawList = (List) rows;
        int total = rawList.size();
        if (total < 6 || total > 24) return false;

        Context context = resolveApplicationContext();
        if (context == null) return false;

        List<String> pinOrder =
                new ArrayList<>(PinStore.getPinnedIds(context));
        if (pinOrder.isEmpty()) return false;

        Map<String, String> persisted =
                PinStore.getPlaylistSignatures(context);
        LinkedHashMap<String, String> signatureToId =
                new LinkedHashMap<>();
        Set<String> knownIds = new LinkedHashSet<>(pinOrder);

        for (Map.Entry<String, String> entry : persisted.entrySet()) {
            String playlistId = entry.getKey();
            String signature = entry.getValue();
            if (isPersistentPlaylistId(playlistId)
                    && signature != null
                    && !signature.isEmpty()) {
                knownIds.add(playlistId);
                signatureToId.put(signature, playlistId);
            }
        }

        LinkedHashMap<Integer, String> idByPosition =
                new LinkedHashMap<>();
        LinkedHashMap<String, Object> rowById =
                new LinkedHashMap<>();

        for (int position = 0; position < total; position++) {
            Object row = rawList.get(position);
            Set<String> candidates =
                    collectCanonicalPlaylistIds(row, 10);
            LinkedHashSet<String> persistentIds =
                    new LinkedHashSet<>();

            for (String candidate : candidates) {
                if (isPersistentPlaylistId(candidate)) {
                    persistentIds.add(candidate);
                }
            }

            String playlistId = resolveCanonicalPlaylistId(
                    persistentIds,
                    pinOrder,
                    knownIds
            );

            if (playlistId == null && !signatureToId.isEmpty()) {
                String signature = findUniqueKnownRowSignature(
                        collectObjectStrings(row),
                        signatureToId
                );
                if (signature != null) {
                    playlistId = signatureToId.get(signature);
                }
            }

            if (!isPersistentPlaylistId(playlistId)
                    || rowById.containsKey(playlistId)) {
                continue;
            }

            idByPosition.put(position, playlistId);
            rowById.put(playlistId, row);
        }

        int expectedPlaylistRows = lastKnownLibraryPlaylistCount;
        if (nativeLibraryResolverLogCount < 30) {
            nativeLibraryResolverLogCount++;
            Log.d(TAG, "NativeLibraryResolverCandidate"
                    + " ownerType=" + objectTypeName(owner)
                    + " rowType="
                    + (rawList.isEmpty()
                    ? "empty"
                    : objectTypeName(rawList.get(0)))
                    + " total=" + total
                    + " mapped=" + idByPosition
                    + " expected=" + expectedPlaylistRows
                    + " pinOrder=" + pinOrder);
        }

        if (idByPosition.size() < 3
                || (expectedPlaylistRows >= 3
                && idByPosition.size() < expectedPlaylistRows)) {
            return false;
        }

        List<String> desiredIds = new ArrayList<>();
        Set<String> pinnedPresent = new LinkedHashSet<>();
        for (String pinnedId : pinOrder) {
            if (rowById.containsKey(pinnedId)) {
                desiredIds.add(pinnedId);
                pinnedPresent.add(pinnedId);
            }
        }
        if (pinnedPresent.isEmpty()) return false;

        for (String playlistId : idByPosition.values()) {
            if (!pinnedPresent.contains(playlistId)) {
                desiredIds.add(playlistId);
            }
        }
        if (desiredIds.size() != idByPosition.size()) return false;

        List<Integer> playlistSlots =
                new ArrayList<>(idByPosition.keySet());
        List<String> currentIds =
                new ArrayList<>(idByPosition.values());
        if (currentIds.equals(desiredIds)) return true;

        try {
            for (int index = 0; index < playlistSlots.size(); index++) {
                rawList.set(
                        playlistSlots.get(index),
                        rowById.get(desiredIds.get(index))
                );
            }
        } catch (Throwable error) {
            return false;
        }

        if (nativeLibrarySubmissionLogCount < 20) {
            nativeLibrarySubmissionLogCount++;
            Log.d(TAG, "NativeLibraryOrderPrepared"
                    + " ownerType=" + objectTypeName(owner)
                    + " total=" + total
                    + " playlistSlots=" + playlistSlots
                    + " pinnedPresent=" + pinnedPresent
                    + " before=" + currentIds
                    + " after=" + desiredIds);
        }

        return true;
    }

    public static void captureAdapterProxySourceObject(
            @Nullable Object sourceObject
    ) {
        if (!isFeatureEnabled()) {
            pendingAdapterProxySources.remove();
            return;
        }

        ArrayList<AdapterProxySource> stack =
                pendingAdapterProxySources.get();

        if (stack.isEmpty()) return;

        AdapterProxySource source =
                stack.get(stack.size() - 1);

        source.sourceObject = sourceObject;
    }

    public static void captureAdapterProxyRenderInfo(
            @Nullable Object renderInfo
    ) {
        if (!isFeatureEnabled()) {
            pendingAdapterProxySources.remove();
            return;
        }

        ArrayList<AdapterProxySource> stack =
                pendingAdapterProxySources.get();

        if (stack.isEmpty()) return;

        AdapterProxySource source =
                stack.remove(stack.size() - 1);

        if (stack.isEmpty()) {
            pendingAdapterProxySources.remove();
        }

        if (!isAdapterProxyOwner(source.owner, false)
                || renderInfo == null
                || !hasAnyPinsFast()) {
            return;
        }

        Integer sourceCount = null;
        Object sourceAdapter = source.sourceAdapter != null
                ? source.sourceAdapter
                : getAdapterProxySourceAdapter(source.owner);

        if (sourceAdapter != null) {
            sourceCount =
                    invokeIntNoArg(sourceAdapter, "a");
        }

        updateAdapterProxyCandidateOwner(
                source.owner,
                sourceCount
        );

        if (sourceCount == null
                || sourceCount < 6
                || sourceCount > 24
                || (!isAdapterProxyCandidateOwner(source.owner)
                && !isConfirmedLibraryProxyOwner(source.owner))) {
            return;
        }

        isAdapterProxyRenderInfo(renderInfo, true);

        if (hasActiveFactoryMapForOwner(
                source.owner,
                sourceCount
        )) {
            return;
        }

        source.renderInfo = renderInfo;
        source.completedAtMs = SystemClock.uptimeMillis();

        synchronized (adapterProxySources) {
            adapterProxySources.put(renderInfo, source);

            if (adapterProxySources.size() > 1600) {
                adapterProxySources.clear();
                adapterProxySources.put(renderInfo, source);
            }
        }

        synchronized (adapterProxySourceHistory) {
            ArrayList<AdapterProxySource> history =
                    adapterProxySourceHistory.get(source.owner);

            if (history == null) {
                history = new ArrayList<>();
                adapterProxySourceHistory.put(
                        source.owner,
                        history
                );
            }

            history.add(source);

            if (history.size() > 600) {
                history.subList(0, history.size() - 300)
                        .clear();
            }
        }
    }

    public static void beginAdapterProxyReplaceAll(
            @Nullable Object owner
    ) {
        if (!isFeatureEnabled()
                || !hasAnyPinsFast()) {
            pendingAdapterProxyOwner.remove();
            return;
        }

        if (!adapterProxyHookLogged) {
            adapterProxyHookLogged = true;
            Log.d(TAG, "DiagnosticBuild=" + BUILD_ID
                    + " adapterProxySourceHook=true");
        }

        if (!isAdapterProxyOwner(owner, false)
                || (!isAdapterProxyCandidateOwner(owner)
                && !isConfirmedLibraryProxyOwner(owner))) {
            pendingAdapterProxyOwner.remove();
            return;
        }

        pendingAdapterProxyOwner.set(owner);
    }

    public static void prepareAdapterProxyRenderInfos(
            @Nullable Object renderInfoList
    ) {
        Object owner = pendingAdapterProxyOwner.get();
        pendingAdapterProxyOwner.remove();

        if (!adapterProxyHookLogged) {
            adapterProxyHookLogged = true;
            Log.d(TAG, "DiagnosticBuild=" + BUILD_ID
                    + " adapterProxySourceHook=true");
        }

        if (owner == null
                || !(renderInfoList instanceof List)
                || !isAdapterProxyOwner(owner, false)
                || (!isAdapterProxyCandidateOwner(owner)
                && !isConfirmedLibraryProxyOwner(owner))) {
            return;
        }

        if (!isFeatureEnabled()
                || !hasAnyPinsFast()) {
            return;
        }

        List rawList = (List) renderInfoList;
        int total = rawList.size();

        /*
         * Reject unrelated large feeds before counting render-info classes or
         * searching source history. This is the path that previously walked
         * 25- and 90-row playlist song submissions on the UI thread.
         */
        if (total < 6 || total > 24) return;

        if (hasActiveFactoryMapForOwner(
                owner,
                total
        )) {
            if (adapterProxyFactoryInstallLogCount < 20) {
                adapterProxyFactoryInstallLogCount++;

                Log.d(TAG, "PreSubmitFastPathSkipped"
                        + " reason=preFactoryMapActive"
                        + " ownerIdentity="
                        + identityString(owner)
                        + " total=" + total);
            }
            return;
        }

        int proxyRows = 0;

        for (Object item : rawList) {
            if (isAdapterProxyRenderInfo(item, false)) {
                proxyRows++;
            }
        }

        List<AdapterProxySource> orderedSources =
                findLatestAdapterProxySourceBatch(
                        owner,
                        total
                );

        int sourcedRows = orderedSources.size();

        if (total >= 6 && adapterProxyAttemptLogCount < 60) {
            adapterProxyAttemptLogCount++;

            Log.d(TAG, "PreSubmitEntry"
                    + " ownerIdentity=" + identityString(owner)
                    + " total=" + total
                    + " proxyRows=" + proxyRows
                    + " sourcedRows=" + sourcedRows
                    + " expectedPlaylistRows="
                    + lastKnownLibraryPlaylistCount);
        }

        /*
         * Library submissions are normally 14-15 rows, but incremental source
         * mutations can be slightly smaller. Keep a narrow enough range to
         * exclude recommendation shelves while still catching the active B/S
         * insertion paths.
         */
        if (proxyRows < 6 || sourcedRows < 6) return;

        Context context = resolveApplicationContext();
        if (context == null) return;

        List<String> pinOrder =
                new ArrayList<>(PinStore.getPinnedIds(context));
        if (pinOrder.isEmpty()) {
            clearAdapterPositionRemapForOwner(
                    owner,
                    "noPins"
            );
            return;
        }

        AdapterProxyMapping mapping =
                chooseAdapterProxyDirectSourceMapping(
                        orderedSources,
                        rawList,
                        context,
                        pinOrder
                );

        if (adapterProxyAttemptLogCount < 100) {
            adapterProxyAttemptLogCount++;

            Log.d(TAG, "PreSubmitMapping"
                    + " total=" + total
                    + " proxyRows=" + proxyRows
                    + " sourcedRows=" + sourcedRows
                    + " expectedPlaylistRows="
                    + lastKnownLibraryPlaylistCount
                    + " strategy=orderedDirectSource"
                    + " selectedPath="
                    + (mapping == null ? null : mapping.path)
                    + " offset="
                    + (mapping == null ? 0 : mapping.offset)
                    + " score="
                    + (mapping == null ? 0 : mapping.score)
                    + " mappedRows="
                    + (mapping == null
                    ? 0
                    : mapping.idsByListPosition.size())
                    + " ambiguous="
                    + (mapping != null && mapping.ambiguous)
                    + " pinOrder=" + pinOrder);
        }

        if (mapping == null
                || mapping.ambiguous
                || mapping.idsByListPosition.size() < 6) {
            clearAdapterPositionRemapForOwner(
                    owner,
                    "mappingUnavailable"
            );
            return;
        }

        LinkedHashMap<String, Object> rawItemById =
                new LinkedHashMap<>();
        LinkedHashMap<String, Object> sourceItemById =
                new LinkedHashMap<>();
        List<Integer> playlistSlots = new ArrayList<>();

        for (Map.Entry<Integer, String> entry
                : mapping.idsByListPosition.entrySet()) {
            int position = entry.getKey();
            String playlistId = entry.getValue();

            if (position < 0
                    || position >= rawList.size()
                    || position >= orderedSources.size()) {
                continue;
            }

            if (!isPersistentPlaylistId(playlistId)) continue;
            if (sourceItemById.containsKey(playlistId)) continue;

            AdapterProxySource source =
                    orderedSources.get(position);
            if (source == null || source.sourceObject == null) {
                continue;
            }

            rawItemById.put(playlistId, rawList.get(position));
            sourceItemById.put(
                    playlistId,
                    source.sourceObject
            );
            playlistSlots.add(position);
        }

        Collections.sort(playlistSlots);

        List<Object> desiredRawItems = new ArrayList<>();
        List<Object> desiredSourceItems = new ArrayList<>();
        Set<String> pinnedPresent = new LinkedHashSet<>();

        for (String pinnedId : pinOrder) {
            Object sourceItem = sourceItemById.get(pinnedId);
            if (sourceItem == null) continue;

            desiredSourceItems.add(sourceItem);
            desiredRawItems.add(rawItemById.get(pinnedId));
            pinnedPresent.add(pinnedId);
        }

        if (pinnedPresent.isEmpty()) return;

        for (int position : playlistSlots) {
            String playlistId =
                    mapping.idsByListPosition.get(position);
            if (playlistId == null
                    || pinnedPresent.contains(playlistId)) {
                continue;
            }

            Object sourceItem =
                    sourceItemById.get(playlistId);
            if (sourceItem != null) {
                desiredSourceItems.add(sourceItem);
                desiredRawItems.add(
                        rawItemById.get(playlistId)
                );
            }
        }

        if (desiredSourceItems.size() != playlistSlots.size()) {
            Log.d(TAG, "PreSubmitSkipped reason=incompleteDesiredOrder"
                    + " slots=" + playlistSlots
                    + " desired=" + desiredSourceItems.size()
                    + " mapping=" + mapping.idsByListPosition);
            return;
        }

        boolean positionRemapInstalled =
                installAdapterPositionRemap(
                        owner,
                        orderedSources,
                        playlistSlots,
                        desiredSourceItems
                );

        /*
         * All delegated playlist entries share the same Lhyi instance, so
         * assigning those objects within rawList is a no-op. The installed
         * hyz position translation is the operation that controls the first
         * visible bind.
         */
        boolean proxyListChanged = false;

        List<String> resultingIds = new ArrayList<>();
        for (Object sourceItem : desiredSourceItems) {
            String id = null;

            for (Map.Entry<String, Object> entry
                    : sourceItemById.entrySet()) {
                if (entry.getValue() == sourceItem) {
                    id = entry.getKey();
                    break;
                }
            }

            resultingIds.add(id);
        }

        Log.d(TAG, "PreSubmitApplied"
                + " changed="
                + (positionRemapInstalled || proxyListChanged)
                + " positionRemapInstalled="
                + positionRemapInstalled
                + " sourceMatched=false"
                + " sourceChanged=false"
                + " sourcePath=null"
                + " sourceMode=virtualPositionRemap"
                + " proxyListChanged=" + proxyListChanged
                + " total=" + total
                + " playlistSlots=" + playlistSlots
                + " pinnedPresent=" + pinnedPresent
                + " identityPath=" + mapping.path
                + " resultingIds=" + resultingIds);
    }


    private static boolean installAdapterPositionRemap(
            Object owner,
            List<AdapterProxySource> orderedSources,
            List<Integer> playlistSlots,
            List<Object> desiredSourceItems
    ) {
        Object visualAdapter = findAdapterProxyVisualAdapter(owner);
        Object sourceAdapter = getAdapterProxySourceAdapter(owner);

        if (!isLibraryAdapter(visualAdapter)
                || sourceAdapter == null) {
            Log.d(TAG, "PreSubmitPositionMapSkipped"
                    + " reason=adapterResolution"
                    + " ownerType=" + objectTypeName(owner)
                    + " visualAdapterType="
                    + objectTypeName(visualAdapter)
                    + " sourceAdapterType="
                    + objectTypeName(sourceAdapter));
            return false;
        }

        int total = orderedSources.size();
        if (total <= 0
                || playlistSlots.size()
                != desiredSourceItems.size()) {
            return false;
        }

        IdentityHashMap<Object, Integer> sourcePositionByItem =
                new IdentityHashMap<>();

        for (AdapterProxySource source : orderedSources) {
            if (source == null
                    || source.sourceObject == null
                    || source.sourceIndex < 0
                    || source.sourceIndex >= total) {
                Log.d(TAG, "PreSubmitPositionMapSkipped"
                        + " reason=invalidSourceFrame"
                        + " total=" + total);
                return false;
            }

            sourcePositionByItem.put(
                    source.sourceObject,
                    source.sourceIndex
            );
        }

        int[] visualToSource = new int[total];
        for (int position = 0; position < total; position++) {
            visualToSource[position] = position;
        }

        for (int index = 0;
             index < playlistSlots.size();
             index++) {
            int visualPosition = playlistSlots.get(index);
            Object desiredSourceItem =
                    desiredSourceItems.get(index);
            Integer sourcePosition =
                    sourcePositionByItem.get(desiredSourceItem);

            if (visualPosition < 0
                    || visualPosition >= total
                    || sourcePosition == null
                    || sourcePosition < 0
                    || sourcePosition >= total) {
                Log.d(TAG, "PreSubmitPositionMapSkipped"
                        + " reason=unresolvedPosition"
                        + " visualPosition=" + visualPosition
                        + " sourcePosition=" + sourcePosition);
                return false;
            }

            visualToSource[visualPosition] = sourcePosition;
        }

        boolean[] seen = new boolean[total];
        for (int sourcePosition : visualToSource) {
            if (sourcePosition < 0
                    || sourcePosition >= total
                    || seen[sourcePosition]) {
                Log.d(TAG, "PreSubmitPositionMapSkipped"
                        + " reason=notPermutation"
                        + " visualToSource="
                        + java.util.Arrays.toString(
                        visualToSource
                ));
                return false;
            }

            seen[sourcePosition] = true;
        }

        synchronized (adapterVisualToSourcePositions) {
            /*
             * A newly completed Library submission supersedes older adapter
             * instances. Keeping only the active map also prevents stale maps
             * from affecting a later pin/unpin physical move.
             */
            adapterVisualToSourcePositions.clear();
            adapterVisualToSourcePositions.put(
                    visualAdapter,
                    visualToSource
            );
        }

        activeAdapterProxyFactoryOwner = owner;
        activeAdapterProxyFactoryVisualAdapter = visualAdapter;
        activeLibraryAdapter = visualAdapter;

        Log.d(TAG, "PreSubmitPositionMap"
                + " installed=true"
                + " visualAdapterType="
                + objectTypeName(visualAdapter)
                + " visualAdapterIdentity="
                + identityString(visualAdapter)
                + " sourceAdapterType="
                + objectTypeName(sourceAdapter)
                + " visualToSource="
                + java.util.Arrays.toString(
                visualToSource
        ));

        return true;
    }

    private static void clearAdapterPositionRemapForOwner(
            @Nullable Object owner,
            String reason
    ) {
        if (owner == null) return;

        Object visualAdapter = findAdapterProxyVisualAdapter(owner);

        if (visualAdapter == null) return;

        boolean removed;
        synchronized (adapterVisualToSourcePositions) {
            removed =
                    adapterVisualToSourcePositions.remove(
                            visualAdapter
                    ) != null;
        }

        if (removed) {
            Log.d(TAG, "AdapterPositionMapCleared"
                    + " reason=" + reason
                    + " adapterIdentity="
                    + identityString(visualAdapter));
        }
    }

    /**
     * Drops only the currently installed permutation after a transient rebuild
     * failure. The active owner, visual adapter, and source-adapter bridge are
     * deliberately retained so the next pin action or adapter pass can rebuild
     * the map without requiring an app restart or Library recreation.
     */
    private static void clearActivePositionRemapPreservingContext(
            String reason
    ) {
        Object owner = activeAdapterProxyFactoryOwner;
        Object visualAdapter =
                activeAdapterProxyFactoryVisualAdapter;

        boolean removed = false;

        if (visualAdapter != null) {
            synchronized (adapterVisualToSourcePositions) {
                removed =
                        adapterVisualToSourcePositions.remove(
                                visualAdapter
                        ) != null;
            }

            synchronized (adapterVisualPlaylistIds) {
                adapterVisualPlaylistIds.remove(visualAdapter);
                adapterPinnedVisualPositions.remove(visualAdapter);
            }
        }

        if (owner != null) {
            synchronized (adapterProxyFactoryVisualToSource) {
                removed =
                        adapterProxyFactoryVisualToSource.remove(
                                owner
                        ) != null
                                || removed;
                adapterProxyFactorySourceCounts.remove(owner);
            }

            synchronized (ownerVisualPlaylistIds) {
                ownerVisualPlaylistIds.remove(owner);
                ownerPinnedVisualPositions.remove(owner);
            }
        }

        pendingAdapterPositionRemapTarget.remove();
        pendingAdapterPositionRemapKind.remove();

        Log.d(TAG, "ActivePositionMapCleared"
                + " reason=" + reason
                + " removed=" + removed
                + " ownerIdentity=" + identityString(owner)
                + " visualAdapterIdentity="
                + identityString(visualAdapter)
                + " activeContextPreserved=true");
    }

    private static void rememberVisibleBoundRow(
            @Nullable Object adapter,
            int visualPosition,
            @Nullable View itemView
    ) {
        if (adapter == null
                || itemView == null
                || visualPosition < 0) {
            return;
        }

        synchronized (adapterVisibleRowViews) {
            Map<Integer, View> rows =
                    adapterVisibleRowViews.get(adapter);

            if (rows == null) {
                rows = new LinkedHashMap<>();
                adapterVisibleRowViews.put(
                        adapter,
                        rows
                );
            }

            ArrayList<Integer> stalePositions =
                    new ArrayList<>();

            for (Map.Entry<Integer, View> entry :
                    rows.entrySet()) {
                if (entry.getValue() == itemView
                        && entry.getKey()
                        != visualPosition) {
                    stalePositions.add(entry.getKey());
                }
            }

            for (Integer stalePosition : stalePositions) {
                rows.remove(stalePosition);
            }

            rows.put(visualPosition, itemView);

            if (rows.size() > 64) {
                rows.clear();
                rows.put(visualPosition, itemView);
            }
        }
    }

    private static int refreshVisiblePinIndicators(
            @Nullable Object adapter
    ) {
        if (adapter == null) return 0;

        Map<Integer, View> rows;

        synchronized (adapterVisibleRowViews) {
            Map<Integer, View> stored =
                    adapterVisibleRowViews.get(adapter);

            if (stored == null || stored.isEmpty()) {
                return 0;
            }

            rows = new LinkedHashMap<>(stored);
        }

        int refreshed = 0;

        for (Map.Entry<Integer, View> entry :
                rows.entrySet()) {
            View rowView = entry.getValue();
            if (rowView == null) continue;

            if (!rowView.isAttachedToWindow()) {
                continue;
            }

            applyBoundRowPinIndicator(
                    adapter,
                    rowView,
                    entry.getKey()
            );
            refreshed++;
        }

        return refreshed;
    }

    @Nullable
    private static String findPersistedPlaylistIdBySignature(
            Context context,
            @Nullable String rowSignature
    ) {
        if (context == null || rowSignature == null) return null;

        String match = null;
        for (Map.Entry<String, String> entry :
                PinStore.getPlaylistSignatures(context).entrySet()) {
            if (!rowSignature.equals(entry.getValue())) continue;

            if (match != null && !match.equals(entry.getKey())) {
                return null;
            }
            match = entry.getKey();
        }

        return match;
    }

    private static int refreshVisiblePinIndicatorsFromSignatures(
            @Nullable Object adapter
    ) {
        if (adapter == null) return 0;

        Map<Integer, View> rows;
        synchronized (adapterVisibleRowViews) {
            Map<Integer, View> stored =
                    adapterVisibleRowViews.get(adapter);
            if (stored == null || stored.isEmpty()) return 0;
            rows = new LinkedHashMap<>(stored);
        }

        int refreshed = 0;
        for (View row : rows.values()) {
            if (row == null || !row.isAttachedToWindow()) continue;

            String signature = buildRowIdentitySignature(
                    collectRowTextValues(row)
            );
            Context context = row.getContext();
            String playlistId =
                    findPersistedPlaylistIdBySignature(context, signature);

            applyDirectFlyoutRowPinIndicator(
                    row,
                    PinStore.isPinned(context, playlistId),
                    playlistId,
                    "signature"
            );
            refreshed++;
        }

        return refreshed;
    }

    private static void postSignaturePinIndicatorRefresh(
            @Nullable Object adapter
    ) {
        if (adapter == null) return;

        /*
         * Row bind hooks already apply the current indicator during a normal
         * adapter notification. Keep one delayed compatibility fallback for
         * renderers that do not immediately rebind, instead of scanning every
         * visible row on three consecutive frames.
         */
        mainHandler.postDelayed(
                () -> refreshVisiblePinIndicatorsFromSignatures(adapter),
                80L
        );
    }

    private static void runVisiblePinIndicatorRefreshPass(
            @Nullable Object adapter,
            String pass
    ) {
        int refreshed =
                refreshVisiblePinIndicators(adapter);

        Log.d(TAG, "VisiblePinIndicatorRefresh"
                + " pass=" + pass
                + " adapterIdentity="
                + identityString(adapter)
                + " refreshedRows=" + refreshed);
    }

    private static void postVisiblePinIndicatorRefresh(
            @Nullable Object adapter
    ) {
        if (adapter == null) return;

        /*
         * A successful full adapter notification re-enters the bind hook,
         * which applies indicators row-by-row with no hierarchy-wide scan.
         * This method is only a compatibility fallback, so one settled pass is
         * sufficient and avoids three complete visible-row traversals.
         */
        mainHandler.postDelayed(
                () -> runVisiblePinIndicatorRefreshPass(
                        adapter,
                        "fallback"
                ),
                80L
        );
    }

    private static boolean applyDirectFlyoutRowPinIndicator(
            @Nullable View itemView,
            boolean pinned,
            @Nullable String playlistId,
            String pass
    ) {
        if (itemView == null) return false;

        RowTextViews rowTextViews =
                findRowTextViews(itemView);

        if (rowTextViews == null
                || rowTextViews.subtitle == null) {
            Log.d(TAG, "DirectFlyoutPinIndicatorRefresh"
                    + " pass=" + pass
                    + " applied=false"
                    + " reason=noSubtitle"
                    + " playlistId=" + playlistId);
            return false;
        }

        stripLegacyPinPrefix(rowTextViews.title);
        stripLegacyPinPrefix(rowTextViews.subtitle);

        TextView subtitleView =
                rowTextViews.subtitle;
        Drawable[] current =
                subtitleView.getCompoundDrawablesRelative();

        if (pinned) {
            synchronized (activePinIndicatorTextViews) {
                if (!activePinIndicatorTextViews.containsKey(
                        subtitleView
                )) {
                    originalSubtitleStartDrawables.put(
                            subtitleView,
                            current[0]
                    );
                    originalSubtitleDrawablePaddings.put(
                            subtitleView,
                            subtitleView.getCompoundDrawablePadding()
                    );
                }

                activePinIndicatorTextViews.put(
                        subtitleView,
                        Boolean.TRUE
                );
            }

            int iconSize = Math.max(
                    dpToPx(
                            subtitleView.getContext(),
                            16
                    ),
                    Math.round(
                            subtitleView.getTextSize()
                                    * 1.05f
                    )
            );

            PinIndicatorDrawable pinDrawable =
                    new PinIndicatorDrawable(
                            subtitleView.getCurrentTextColor(),
                            iconSize
                    );

            pinDrawable.setBounds(
                    0,
                    0,
                    iconSize,
                    iconSize
            );

            subtitleView.setCompoundDrawablesRelative(
                    pinDrawable,
                    current[1],
                    current[2],
                    current[3]
            );

            subtitleView.setCompoundDrawablePadding(
                    dpToPx(
                            subtitleView.getContext(),
                            2
                    )
            );
        } else {
            restoreSubtitleStartDrawable(
                    subtitleView,
                    current
            );
        }

        subtitleView.requestLayout();
        subtitleView.invalidate();
        itemView.invalidate();

        Log.d(TAG, "DirectFlyoutPinIndicatorRefresh"
                + " pass=" + pass
                + " applied=true"
                + " pinned=" + pinned
                + " playlistId=" + playlistId
                + " title="
                + textValue(rowTextViews.title)
                + " subtitle="
                + textValue(subtitleView));

        return true;
    }

    private static void postDirectFlyoutRowPinIndicatorRefresh(
            @Nullable View itemView,
            boolean pinned,
            @Nullable String playlistId
    ) {
        if (itemView == null) {
            Log.d(TAG, "DirectFlyoutPinIndicatorRefresh"
                    + " pass=scheduled"
                    + " applied=false"
                    + " reason=noCapturedRow"
                    + " playlistId=" + playlistId);
            return;
        }

        final String originalRowText =
                collectRowText(itemView);

        mainHandler.post(
                () -> applyDirectFlyoutRowPinIndicator(
                        itemView,
                        pinned,
                        playlistId,
                        "immediate"
                )
        );

        mainHandler.postDelayed(
                () -> {
                    if (!itemView.isAttachedToWindow()
                            || !originalRowText.equals(
                            collectRowText(itemView)
                    )) {
                        Log.d(TAG,
                                "DirectFlyoutPinIndicatorRefresh"
                                        + " pass=afterLayout"
                                        + " applied=false"
                                        + " reason=rowChanged"
                                        + " playlistId="
                                        + playlistId);
                        return;
                    }

                    applyDirectFlyoutRowPinIndicator(
                            itemView,
                            pinned,
                            playlistId,
                            "afterLayout"
                    );
                },
                48L
        );

        mainHandler.postDelayed(
                () -> {
                    if (!itemView.isAttachedToWindow()
                            || !originalRowText.equals(
                            collectRowText(itemView)
                    )) {
                        Log.d(TAG,
                                "DirectFlyoutPinIndicatorRefresh"
                                        + " pass=settled"
                                        + " applied=false"
                                        + " reason=rowChanged"
                                        + " playlistId="
                                        + playlistId);
                        return;
                    }

                    applyDirectFlyoutRowPinIndicator(
                            itemView,
                            pinned,
                            playlistId,
                            "settled"
                    );
                },
                160L
        );
    }

    private static void installAdapterPinIndicatorMetadata(
            @Nullable Object owner,
            @Nullable Object visualAdapter
    ) {
        if (owner == null || visualAdapter == null) return;

        Map<Integer, String> visualPlaylistIds;
        Set<Integer> pinnedVisualPositions;

        synchronized (ownerVisualPlaylistIds) {
            Map<Integer, String> storedIds =
                    ownerVisualPlaylistIds.get(owner);
            Set<Integer> storedPinned =
                    ownerPinnedVisualPositions.get(owner);

            if (storedIds == null || storedPinned == null) {
                return;
            }

            visualPlaylistIds =
                    new LinkedHashMap<>(storedIds);
            pinnedVisualPositions =
                    new LinkedHashSet<>(storedPinned);
        }

        synchronized (adapterVisualPlaylistIds) {
            adapterVisualPlaylistIds.clear();
            adapterPinnedVisualPositions.clear();

            adapterVisualPlaylistIds.put(
                    visualAdapter,
                    visualPlaylistIds
            );
            adapterPinnedVisualPositions.put(
                    visualAdapter,
                    pinnedVisualPositions
            );
        }

        Log.d(TAG, "LibraryPinIndicatorMetadata"
                + " adapterIdentity="
                + identityString(visualAdapter)
                + " playlistRows="
                + visualPlaylistIds.size()
                + " pinnedPositions="
                + pinnedVisualPositions);
    }

    private static void applyBoundRowPinIndicator(
            @Nullable Object adapter,
            @Nullable View itemView,
            int visualPosition
    ) {
        if (adapter == null || itemView == null) return;

        boolean isPlaylist;
        boolean isPinned;
        String playlistId;

        synchronized (adapterVisualPlaylistIds) {
            Map<Integer, String> playlistIds =
                    adapterVisualPlaylistIds.get(adapter);
            Set<Integer> pinnedPositions =
                    adapterPinnedVisualPositions.get(adapter);

            if (playlistIds == null || pinnedPositions == null) {
                return;
            }

            playlistId = playlistIds.get(visualPosition);
            isPinned = pinnedPositions.contains(
                    visualPosition
            );
            isPlaylist = playlistId != null || isPinned;
        }

        RowTextViews rowTextViews =
                findRowTextViews(itemView);
        if (rowTextViews == null
                || rowTextViews.subtitle == null) {
            return;
        }

        /*
         * Remove the legacy title prefix if a row survives an in-process
         * update, then place a native-style vector pin beside the subtitle.
         * A recycled playlist holder can later represent a fixed/non-playlist
         * row, so the non-playlist path must restore any prior pin drawable.
         */
        stripLegacyPinPrefix(rowTextViews.title);
        stripLegacyPinPrefix(rowTextViews.subtitle);

        TextView subtitleView = rowTextViews.subtitle;
        Drawable[] current =
                subtitleView.getCompoundDrawablesRelative();

        if (isPlaylist && isPinned) {
            synchronized (activePinIndicatorTextViews) {
                if (!activePinIndicatorTextViews.containsKey(
                        subtitleView
                )) {
                    originalSubtitleStartDrawables.put(
                            subtitleView,
                            current[0]
                    );
                    originalSubtitleDrawablePaddings.put(
                            subtitleView,
                            subtitleView.getCompoundDrawablePadding()
                    );
                }

                activePinIndicatorTextViews.put(
                        subtitleView,
                        Boolean.TRUE
                );
            }

            int iconSize = Math.max(
                    dpToPx(subtitleView.getContext(), 16),
                    Math.round(subtitleView.getTextSize() * 1.05f)
            );

            PinIndicatorDrawable pinDrawable =
                    new PinIndicatorDrawable(
                            subtitleView.getCurrentTextColor(),
                            iconSize
                    );
            pinDrawable.setBounds(
                    0,
                    0,
                    iconSize,
                    iconSize
            );

            subtitleView.setCompoundDrawablesRelative(
                    pinDrawable,
                    current[1],
                    current[2],
                    current[3]
            );
            subtitleView.setCompoundDrawablePadding(
                    dpToPx(subtitleView.getContext(), 2)
            );
        } else {
            restoreSubtitleStartDrawable(
                    subtitleView,
                    current
            );
        }

        if (isPlaylist && rowPinIndicatorLogCount < 12) {
            rowPinIndicatorLogCount++;

            Log.d(TAG, "LibraryPinIndicator"
                    + " visualPosition="
                    + visualPosition
                    + " pinned=" + isPinned
                    + " playlistId=" + playlistId
                    + " title="
                    + textValue(rowTextViews.title)
                    + " subtitle="
                    + textValue(subtitleView)
                    + " mode=subtitleVectorPin");
        }
    }

    @Nullable
    private static RowTextViews findRowTextViews(
            @Nullable View root
    ) {
        if (root == null) return null;

        ArrayList<TextView> candidates =
                new ArrayList<>();
        collectVisibleTextViews(
                root,
                candidates,
                0
        );

        if (candidates.isEmpty()) return null;

        TextView title = null;
        int titleIndex = -1;
        float largestTextSize = -1.0f;

        for (int index = 0;
             index < candidates.size();
             index++) {
            TextView candidate = candidates.get(index);
            CharSequence text = candidate.getText();

            if (text == null
                    || text.toString().trim().isEmpty()) {
                continue;
            }

            float textSize = candidate.getTextSize();

            if (title == null
                    || textSize > largestTextSize) {
                title = candidate;
                titleIndex = index;
                largestTextSize = textSize;
            }
        }

        if (title == null) return null;

        TextView subtitle = null;

        /*
         * Library rows traverse title then subtitle. Prefer the first nonempty
         * text view after the title whose type size does not exceed the title.
         */
        for (int index = titleIndex + 1;
             index < candidates.size();
             index++) {
            TextView candidate = candidates.get(index);
            CharSequence text = candidate.getText();

            if (text == null
                    || text.toString().trim().isEmpty()
                    || candidate.getTextSize()
                    > largestTextSize + 0.5f) {
                continue;
            }

            subtitle = candidate;
            break;
        }

        if (subtitle == null) {
            float bestSize = Float.MAX_VALUE;

            for (TextView candidate : candidates) {
                if (candidate == title) continue;

                CharSequence text = candidate.getText();
                if (text == null
                        || text.toString().trim().isEmpty()) {
                    continue;
                }

                float textSize = candidate.getTextSize();
                if (textSize < bestSize) {
                    subtitle = candidate;
                    bestSize = textSize;
                }
            }
        }

        return subtitle == null
                ? null
                : new RowTextViews(title, subtitle);
    }

    private static void collectVisibleTextViews(
            @Nullable View view,
            List<TextView> result,
            int depth
    ) {
        if (view == null
                || depth > 8
                || result.size() >= 16
                || view.getVisibility() != View.VISIBLE) {
            return;
        }

        if (view instanceof TextView) {
            result.add((TextView) view);
        }

        if (!(view instanceof ViewGroup)) return;

        ViewGroup group = (ViewGroup) view;
        int count = Math.min(
                group.getChildCount(),
                30
        );

        for (int index = 0;
             index < count;
             index++) {
            collectVisibleTextViews(
                    group.getChildAt(index),
                    result,
                    depth + 1
            );
        }
    }

    private static void stripLegacyPinPrefix(
            @Nullable TextView textView
    ) {
        if (textView == null) return;

        CharSequence text = textView.getText();
        if (text == null) return;

        String current = text.toString();
        if (current.startsWith(LEGACY_ROW_PIN_PREFIX)) {
            textView.setText(
                    current.substring(
                            LEGACY_ROW_PIN_PREFIX.length()
                    )
            );
        }
    }

    private static String textValue(
            @Nullable TextView textView
    ) {
        if (textView == null || textView.getText() == null) {
            return "null";
        }

        return textView.getText().toString();
    }

    private static int dpToPx(
            Context context,
            int dp
    ) {
        if (context == null) return dp;

        return Math.max(
                1,
                Math.round(
                        dp * context.getResources()
                                .getDisplayMetrics().density
                )
        );
    }

    private static void restoreSubtitleStartDrawable(
            TextView subtitleView,
            Drawable[] current
    ) {
        Drawable originalStart;
        Integer originalPadding;

        synchronized (activePinIndicatorTextViews) {
            if (!activePinIndicatorTextViews.containsKey(
                    subtitleView
            )) {
                return;
            }

            activePinIndicatorTextViews.remove(
                    subtitleView
            );
            originalStart =
                    originalSubtitleStartDrawables.remove(
                            subtitleView
                    );
            originalPadding =
                    originalSubtitleDrawablePaddings.remove(
                            subtitleView
                    );
        }

        subtitleView.setCompoundDrawablesRelative(
                originalStart,
                current[1],
                current[2],
                current[3]
        );

        if (originalPadding != null) {
            subtitleView.setCompoundDrawablePadding(
                    originalPadding
            );
        }
    }

    private static void clearAllVisiblePinIndicators() {
        ArrayList<TextView> markedViews;

        synchronized (activePinIndicatorTextViews) {
            markedViews =
                    new ArrayList<>(
                            activePinIndicatorTextViews.keySet()
                    );
        }

        for (TextView textView : markedViews) {
            if (textView == null) continue;

            Drawable[] current =
                    textView.getCompoundDrawablesRelative();
            restoreSubtitleStartDrawable(
                    textView,
                    current
            );
            stripLegacyPinPrefix(textView);
        }
    }

    private static final class RowTextViews {
        private final TextView title;
        private final TextView subtitle;

        private RowTextViews(
                TextView title,
                TextView subtitle
        ) {
            this.title = title;
            this.subtitle = subtitle;
        }
    }

    /**
     * Resource-independent menu icon owned entirely by the extension.
     *
     * A normal outline pin represents the Pin action. The Unpin action adds a
     * diagonal strike. The native ImageView's existing color filter is retained,
     * so the icon follows YouTube Music's light/dark and enabled-state tint.
     */
    private static final class LibraryPinMenuDrawable
            extends Drawable {
        private final Paint paint =
                new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final boolean unpinAction;
        private final int intrinsicSize;

        private LibraryPinMenuDrawable(
                boolean unpinAction,
                int intrinsicSize
        ) {
            this.unpinAction = unpinAction;
            this.intrinsicSize = intrinsicSize;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(1.65f);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setColor(0xFFFFFFFF);
        }

        @Override
        public void draw(Canvas canvas) {
            if (canvas == null || getBounds().isEmpty()) {
                return;
            }

            int save = canvas.save();
            canvas.translate(
                    getBounds().left,
                    getBounds().top
            );
            canvas.scale(
                    getBounds().width() / 24.0f,
                    getBounds().height() / 24.0f
            );

            int pinSave = canvas.save();
            canvas.translate(-1.75f, 0.0f);
            canvas.rotate(26.0f, 12.0f, 12.0f);

            path.reset();
            path.moveTo(7.22f, 1.00f);
            path.lineTo(6.72f, 2.09f);
            path.lineTo(7.09f, 2.61f);
            path.lineTo(7.98f, 2.83f);
            path.lineTo(8.13f, 4.07f);
            path.lineTo(7.67f, 8.87f);
            path.lineTo(6.87f, 10.00f);
            path.lineTo(5.96f, 10.72f);
            path.lineTo(5.48f, 12.26f);
            path.lineTo(5.46f, 13.54f);
            path.lineTo(6.30f, 14.15f);
            path.lineTo(9.41f, 14.41f);
            path.lineTo(10.26f, 14.80f);
            path.lineTo(9.63f, 21.04f);
            path.lineTo(10.11f, 22.70f);
            path.lineTo(10.52f, 23.00f);
            path.lineTo(11.04f, 22.63f);
            path.lineTo(11.78f, 21.35f);
            path.lineTo(12.30f, 15.80f);
            path.lineTo(12.70f, 14.83f);
            path.lineTo(16.85f, 15.30f);
            path.lineTo(17.39f, 14.76f);
            path.lineTo(17.70f, 12.24f);
            path.lineTo(16.28f, 10.17f);
            path.lineTo(16.89f, 4.00f);
            path.lineTo(18.22f, 3.65f);
            path.lineTo(18.59f, 2.65f);
            path.lineTo(18.00f, 2.17f);
            path.close();

            canvas.drawPath(path, paint);
            canvas.restoreToCount(pinSave);

            if (unpinAction) {
                canvas.drawLine(
                        4.0f,
                        4.0f,
                        20.0f,
                        20.0f,
                        paint
                );
            }

            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(
                @Nullable ColorFilter colorFilter
        ) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public int getIntrinsicWidth() {
            return intrinsicSize;
        }

        @Override
        public int getIntrinsicHeight() {
            return intrinsicSize;
        }
    }

    /**
     * Small resource-independent vector traced from the supplied native-looking push-pin silhouette
     * in the requested mockup. It inherits the subtitle's current text color,
     * so it automatically follows dark/light theme and disabled-state tint.
     */
    private static final class PinIndicatorDrawable
            extends Drawable {
        private final Paint paint =
                new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final int intrinsicSize;

        private PinIndicatorDrawable(
                int color,
                int intrinsicSize
        ) {
            this.intrinsicSize = intrinsicSize;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(color);
        }

        @Override
        public void draw(Canvas canvas) {
            if (canvas == null || getBounds().isEmpty()) {
                return;
            }

            int save = canvas.save();
            canvas.translate(
                    getBounds().left,
                    getBounds().top
            );
            canvas.scale(
                    getBounds().width() / 24.0f,
                    getBounds().height() / 24.0f
            );
            canvas.translate(-1.75f, 0.0f);
            canvas.rotate(26.0f, 12.0f, 12.0f);

            /*
             * Silhouette traced from the supplied native-looking pin:
             * wide rounded cap, tapered body, stepped shoulders, and a
             * longer narrow point. The path is kept upright here and the
             * requested 24-degree clockwise tilt is applied above.
             */
            path.reset();
            path.moveTo(7.22f, 1.00f);
            path.lineTo(6.72f, 2.09f);
            path.lineTo(7.09f, 2.61f);
            path.lineTo(7.98f, 2.83f);
            path.lineTo(8.13f, 4.07f);
            path.lineTo(7.67f, 8.87f);
            path.lineTo(6.87f, 10.00f);
            path.lineTo(5.96f, 10.72f);
            path.lineTo(5.48f, 12.26f);
            path.lineTo(5.46f, 13.54f);
            path.lineTo(6.30f, 14.15f);
            path.lineTo(9.41f, 14.41f);
            path.lineTo(10.26f, 14.80f);
            path.lineTo(9.63f, 21.04f);
            path.lineTo(10.11f, 22.70f);
            path.lineTo(10.52f, 23.00f);
            path.lineTo(11.04f, 22.63f);
            path.lineTo(11.78f, 21.35f);
            path.lineTo(12.30f, 15.80f);
            path.lineTo(12.70f, 14.83f);
            path.lineTo(16.85f, 15.30f);
            path.lineTo(17.39f, 14.76f);
            path.lineTo(17.70f, 12.24f);
            path.lineTo(16.28f, 10.17f);
            path.lineTo(16.89f, 4.00f);
            path.lineTo(18.22f, 3.65f);
            path.lineTo(18.59f, 2.65f);
            path.lineTo(18.00f, 2.17f);
            path.close();

            canvas.drawPath(path, paint);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(
                @Nullable ColorFilter colorFilter
        ) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public int getIntrinsicWidth() {
            return intrinsicSize;
        }

        @Override
        public int getIntrinsicHeight() {
            return intrinsicSize;
        }
    }

    private static boolean hasActiveFactoryMapForOwner(
            @Nullable Object owner,
            int expectedSize
    ) {
        if (owner == null || expectedSize <= 0) return false;

        Object visualAdapter = findAdapterProxyVisualAdapter(owner);

        return visualAdapter != null
                && hasActiveAdapterPositionMap(
                        visualAdapter,
                        expectedSize
                );
    }

    private static boolean refreshActiveFactoryPositionMap(
            @Nullable Context context
    ) {
        Object owner = activeAdapterProxyFactoryOwner;
        Object visualAdapter =
                activeAdapterProxyFactoryVisualAdapter;

        if (owner == null
                || visualAdapter == null
                || context == null) {
            Log.d(TAG, "PinTogglePositionMapRefreshSkipped"
                    + " reason=missingActiveContext"
                    + " owner=" + identityString(owner)
                    + " visualAdapter="
                    + identityString(visualAdapter)
                    + " contextAvailable="
                    + (context != null));
            return false;
        }

        Object sourceAdapter = getAdapterProxySourceAdapter(owner);
        Integer sourceCount =
                invokeIntNoArg(sourceAdapter, "a");

        if (sourceAdapter == null
                || sourceCount == null
                || sourceCount < 3
                || sourceCount > 24) {
            Log.d(TAG, "PinTogglePositionMapRefreshSkipped"
                    + " reason=invalidSource"
                    + " sourceAdapterType="
                    + objectTypeName(sourceAdapter)
                    + " sourceCount=" + sourceCount);
            return false;
        }

        int[] visualToSource =
                buildAdapterProxyFactoryPositionMap(
                        owner,
                        sourceAdapter,
                        sourceCount
                );

        if (visualToSource == null) {
            Log.d(TAG, "PinTogglePositionMapRefreshSkipped"
                    + " reason=mapUnavailable"
                    + " sourceCount=" + sourceCount);
            return false;
        }

        synchronized (adapterProxyFactoryVisualToSource) {
            adapterProxyFactoryVisualToSource.put(
                    owner,
                    visualToSource
            );
            adapterProxyFactorySourceCounts.put(
                    owner,
                    sourceCount
            );
        }

        /*
         * Do not replace the adapter map before notifying the RecyclerView.
         * installAdapterPermutation() compares the previous mapping with the
         * desired mapping, installs each intermediate state, and emits native
         * item-move notifications. If direct moves drift on a future release,
         * it falls back to the known full-refresh methods while preserving the
         * completed position map.
         *
         * V115 wrote the desired map first, attempted unrelated no-arg refresh
         * names, returned false when those names were absent, and the caller
         * immediately cleared the valid map through pinToggleFallback. That is
         * why 9.25.50 did not visibly reorder until a manual Library refresh.
         */
        String notifications = installAdapterPermutation(
                visualAdapter,
                visualToSource
        );

        installAdapterPinIndicatorMetadata(
                owner,
                visualAdapter
        );

        activeLibraryAdapter = visualAdapter;

        clearAllVisiblePinIndicators();

        /*
         * Match the reliable 9.24 behavior: once the completed permutation and
         * pin metadata are installed, force one native full adapter rebind.
         * Item-move notifications update positions, but a full rebind guarantees
         * every visible row reads the final map and reapplies its pin drawable.
         */
        boolean finalFullNotify =
                invokeAdapterFullRefresh(visualAdapter);

        if (!finalFullNotify) {
            postVisiblePinIndicatorRefresh(
                    visualAdapter
            );
        }

        Log.d(TAG, "PinTogglePositionMapRefreshed"
                + " adapterIdentity="
                + identityString(visualAdapter)
                + " sourceCount=" + sourceCount
                + " notifications=" + notifications
                + ",finalFullNotify=" + finalFullNotify
                + " visualToSource="
                + java.util.Arrays.toString(
                visualToSource
        ));

        /*
         * Reaching this point means the position map was rebuilt and installed.
         * Notification availability must not be used as the success signal;
         * otherwise the fallback path destroys the valid mapping.
         */
        return true;
    }

    private static boolean refreshStableDelegatePositionMapAfterToggle() {
        Object adapter = activeLibraryAdapter;
        if (adapter == null
                || !"hvx".equals(objectTypeName(adapter))) {
            return false;
        }

        Object controller = readFieldByName(adapter, "d");
        Object listObject = readFieldByName(controller, "b");
        if (!(listObject instanceof List)) return false;

        int total = ((List<?>) listObject).size();
        if (total < 2) return false;

        Context context = resolveApplicationContext();
        if (context == null) return false;

        if (PinStore.getPinnedIds(context).isEmpty()) {
            int[] nativeOrder = new int[total];
            for (int position = 0; position < total; position++) {
                nativeOrder[position] = position;
            }

            String notifications = installAdapterPermutation(
                    adapter,
                    nativeOrder
            );

            synchronized (adapterVisualPlaylistIds) {
                adapterVisualPlaylistIds.remove(adapter);
                adapterPinnedVisualPositions.remove(adapter);
            }
            synchronized (stablePrebindKeys) {
                stablePrebindKeys.remove(adapter);
            }

            Log.d(TAG, "StableDelegateLiveRestore"
                    + " total=" + total
                    + " notifications=" + notifications);
            return true;
        }

        stableDelegateLiveUpdateApplied = false;
        stableDelegateLiveUpdateRequested = true;
        try {
            prepareStableLibraryAdapter(adapter);
        } finally {
            stableDelegateLiveUpdateRequested = false;
        }

        return stableDelegateLiveUpdateApplied;
    }

    /** Installs the 9.15.51 hvx permutation before its first row bind. */
    public static void prepareStableLibraryAdapter(
            @Nullable Object adapter
    ) {
        if (!isFeatureEnabled()
                || !hasAnyPinsFast()
                || !"hvx".equals(objectTypeName(adapter))) {
            return;
        }

        Object controller = readFieldByName(adapter, "d");
        Object listObject = readFieldByName(controller, "b");
        if (!(listObject instanceof List)) return;

        List<?> items = (List<?>) listObject;
        int total = items.size();
        if (total < 10 || total > 18) return;

        Context context = resolveApplicationContext();
        if (context == null) return;

        List<String> pinOrder =
                new ArrayList<>(PinStore.getPinnedIds(context));
        if (pinOrder.isEmpty()) return;

        String prebindKey = stableIdsForItems(items).toString()
                + "|" + pinOrder;

        synchronized (stablePrebindKeys) {
            if (prebindKey.equals(stablePrebindKeys.get(adapter))
                    && hasActiveAdapterPositionMap(adapter, total)) {
                return;
            }
        }

        Object delegate = readFieldByName(controller, "d");
        Object delegateAdapter = delegate == null
                ? null
                : readFieldByName(delegate, "b");

        if (!"bdmq".equals(objectTypeName(delegateAdapter))) {
            Log.d(TAG, "StableDelegatePrebindSkipped"
                    + " reason=delegateUnavailable"
                    + " delegateType="
                    + objectTypeName(delegateAdapter));
            return;
        }

        Object sourceAdapter = readFieldByName(delegateAdapter, "f");
        Integer sourceCount = invokeIntNoArg(sourceAdapter, "a");

        if (sourceCount == null || sourceCount != total) {
            Log.d(TAG, "StableDelegatePrebindSkipped"
                    + " reason=countMismatch"
                    + " total=" + total
                    + " sourceCount=" + sourceCount);
            return;
        }

        int[] visualToSource = buildAdapterProxyFactoryPositionMap(
                delegateAdapter,
                sourceAdapter,
                sourceCount,
                "d"
        );

        if (visualToSource == null) {
            Log.d(TAG, "StableDelegatePrebindSkipped"
                    + " reason=sourceMapUnavailable"
                    + " total=" + total);
            return;
        }

        Map<Integer, String> visualPlaylistIds;
        Set<Integer> pinnedVisualPositions;

        synchronized (ownerVisualPlaylistIds) {
            Map<Integer, String> ids =
                    ownerVisualPlaylistIds.get(delegateAdapter);
            Set<Integer> pinned =
                    ownerPinnedVisualPositions.get(delegateAdapter);

            visualPlaylistIds = ids == null
                    ? new LinkedHashMap<Integer, String>()
                    : new LinkedHashMap<>(ids);
            pinnedVisualPositions = pinned == null
                    ? new LinkedHashSet<Integer>()
                    : new LinkedHashSet<>(pinned);
        }

        LinkedHashMap<Long, String> playlistIdByStableId =
                new LinkedHashMap<>();
        LinkedHashSet<Long> ordinaryStableIds =
                new LinkedHashSet<>();

        for (Map.Entry<Integer, String> entry
                : visualPlaylistIds.entrySet()) {
            int visualPosition = entry.getKey();
            if (visualPosition < 0
                    || visualPosition >= visualToSource.length) {
                continue;
            }

            int sourcePosition = visualToSource[visualPosition];
            if (sourcePosition < 0 || sourcePosition >= items.size()) {
                continue;
            }

            Object stableIdObject = readFieldByName(
                    items.get(sourcePosition),
                    "b"
            );
            if (!(stableIdObject instanceof Number)) continue;

            long stableId = ((Number) stableIdObject).longValue();
            playlistIdByStableId.put(stableId, entry.getValue());
            ordinaryStableIds.add(stableId);
        }

        synchronized (adapterVisualPlaylistIds) {
            adapterVisualPlaylistIds.put(adapter, visualPlaylistIds);
            adapterPinnedVisualPositions.put(
                    adapter,
                    pinnedVisualPositions
            );
        }
        synchronized (adapterPlaylistIds) {
            adapterPlaylistIds.put(adapter, playlistIdByStableId);
        }
        synchronized (adapterOrdinaryPlaylistRows) {
            adapterOrdinaryPlaylistRows.put(adapter, ordinaryStableIds);
        }
        synchronized (stablePrebindKeys) {
            stablePrebindKeys.put(adapter, prebindKey);
        }

        activeLibraryAdapter = adapter;
        activeLibraryBackingList = items;
        lastKnownLibraryPlaylistCount = visualPlaylistIds.size();

        String notifications;
        if (stableDelegateLiveUpdateRequested) {
            notifications = installAdapterPermutation(
                    adapter,
                    visualToSource
            );
            stableDelegateLiveUpdateApplied = true;
        } else {
            synchronized (adapterVisualToSourcePositions) {
                adapterVisualToSourcePositions.put(
                        adapter,
                        visualToSource
                );
            }
            notifications = "prebind";
        }

        Log.d(TAG, "StableDelegatePrebindInstalled"
                + " total=" + total
                + " pinOrder=" + pinOrder
                + " notifications=" + notifications
                + " visualToSource="
                + java.util.Arrays.toString(visualToSource));
    }

    @Nullable
    private static List<?> getLibraryAdapterBackingList(
            @Nullable Object adapter
    ) {
        if (adapter == null) return null;

        Object controller = readFieldByName(adapter, "d");
        Object listObject = readFieldByName(controller, "b");
        return listObject instanceof List
                ? (List<?>) listObject
                : null;
    }

    private static boolean hasCurrentAdapterPositionMap(
            @Nullable Object adapter
    ) {
        List<?> items = getLibraryAdapterBackingList(adapter);
        return items != null
                && hasActiveAdapterPositionMap(
                adapter,
                items.size()
        );
    }

    private static boolean hasActiveAdapterPositionMap(
            @Nullable Object adapter,
            int expectedSize
    ) {
        if (adapter == null || expectedSize <= 0) {
            return false;
        }

        synchronized (adapterVisualToSourcePositions) {
            int[] visualToSource =
                    adapterVisualToSourcePositions.get(adapter);

            return visualToSource != null
                    && visualToSource.length == expectedSize;
        }
    }

    private static void beginAdapterPositionRemap(
            @Nullable Object adapter,
            String kind
    ) {
        if (!isFeatureEnabled()
                || !hasAnyPinsFast()
                || !isConfirmedLibraryAdapterInstance(adapter)
                || !hasCurrentAdapterPositionMap(adapter)) {
            pendingAdapterPositionRemapTarget.remove();
            pendingAdapterPositionRemapKind.remove();
            return;
        }

        pendingAdapterPositionRemapTarget.set(adapter);
        pendingAdapterPositionRemapKind.set(kind);
    }

    public static void beginAdapterViewTypePositionRemap(
            @Nullable Object adapter
    ) {
        beginAdapterPositionRemap(adapter, "viewType");
    }

    public static void beginAdapterStableIdPositionRemap(
            @Nullable Object adapter
    ) {
        beginAdapterPositionRemap(adapter, "stableId");
    }

    public static void beginAdapterBindPositionRemap(
            @Nullable Object adapter
    ) {
        beginAdapterPositionRemap(adapter, "bind");
    }

    public static int remapAdapterPosition(int visualPosition) {
        if (!isFeatureEnabled()) {
            pendingAdapterPositionRemapTarget.remove();
            pendingAdapterPositionRemapKind.remove();
            return visualPosition;
        }

        Object adapter =
                pendingAdapterPositionRemapTarget.get();
        pendingAdapterPositionRemapKind.get();

        pendingAdapterPositionRemapTarget.remove();
        pendingAdapterPositionRemapKind.remove();

        if (adapter == null || visualPosition < 0) {
            return visualPosition;
        }

        int sourcePosition = visualPosition;

        synchronized (adapterVisualToSourcePositions) {
            int[] visualToSource =
                    adapterVisualToSourcePositions.get(adapter);

            if (visualToSource != null
                    && visualPosition
                    < visualToSource.length) {
                sourcePosition =
                        visualToSource[visualPosition];
            }
        }

        return sourcePosition;
    }

    private static int mappedSourcePosition(
            @Nullable Object adapter,
            int visualPosition
    ) {
        if (adapter == null || visualPosition < 0) {
            return visualPosition;
        }

        synchronized (adapterVisualToSourcePositions) {
            int[] visualToSource =
                    adapterVisualToSourcePositions.get(adapter);

            if (visualToSource != null
                    && visualPosition < visualToSource.length) {
                return visualToSource[visualPosition];
            }
        }

        return visualPosition;
    }








    private static List<AdapterProxySource>
    findLatestAdapterProxySourceBatch(
            Object owner,
            int expectedSize
    ) {
        if (owner == null || expectedSize <= 0) {
            return Collections.emptyList();
        }

        synchronized (adapterProxySourceHistory) {
            ArrayList<AdapterProxySource> history =
                    adapterProxySourceHistory.get(owner);

            if (history == null
                    || history.size() < expectedSize) {
                return Collections.emptyList();
            }

            long now = SystemClock.uptimeMillis();

            /*
             * Search newest-first for one contiguous set of source indices.
             * Full Library rebuilds call h(0), h(1), ... in a loop, but allow
             * a non-zero base for incremental insert/replace operations.
             */
            for (int end = history.size();
                 end >= expectedSize;
                 end--) {
                int start = end - expectedSize;
                int minIndex = Integer.MAX_VALUE;
                int maxIndex = Integer.MIN_VALUE;
                Set<Integer> seen = new LinkedHashSet<>();
                boolean valid = true;

                for (int index = start; index < end; index++) {
                    AdapterProxySource source =
                            history.get(index);

                    if (source == null
                            || source.owner != owner
                            || source.sourceObject == null
                            || now - source.completedAtMs > 5000L
                            || !seen.add(source.sourceIndex)) {
                        valid = false;
                        break;
                    }

                    minIndex = Math.min(
                            minIndex,
                            source.sourceIndex
                    );
                    maxIndex = Math.max(
                            maxIndex,
                            source.sourceIndex
                    );
                }

                if (!valid
                        || seen.size() != expectedSize
                        || maxIndex - minIndex + 1
                        != expectedSize) {
                    continue;
                }

                ArrayList<AdapterProxySource> ordered =
                        new ArrayList<>(
                                Collections.nCopies(
                                        expectedSize,
                                        (AdapterProxySource) null
                                )
                        );

                for (int index = start; index < end; index++) {
                    AdapterProxySource source =
                            history.get(index);
                    int position =
                            source.sourceIndex - minIndex;

                    if (position < 0
                            || position >= expectedSize
                            || ordered.get(position) != null) {
                        valid = false;
                        break;
                    }

                    ordered.set(position, source);
                }

                if (!valid || ordered.contains(null)) {
                    continue;
                }

                List<Integer> sourceIndices =
                        new ArrayList<>();
                List<String> sourceTypes =
                        new ArrayList<>();
                List<String> sourceIdentities =
                        new ArrayList<>();
                List<String> renderInfoIdentities =
                        new ArrayList<>();

                for (AdapterProxySource source : ordered) {
                    sourceIndices.add(source.sourceIndex);
                    sourceTypes.add(
                            objectTypeName(source.sourceObject)
                    );
                    sourceIdentities.add(
                            identityString(source.sourceObject)
                    );
                    renderInfoIdentities.add(
                            identityString(source.renderInfo)
                    );
                }

                Log.d(TAG, "PreSubmitOrderedSourceBatch"
                        + " size=" + expectedSize
                        + " sourceIndices=" + sourceIndices
                        + " sourceTypes=" + sourceTypes
                        + " sourceIdentities="
                        + sourceIdentities
                        + " renderInfoIdentities="
                        + renderInfoIdentities);

                history.subList(0, end).clear();

                return ordered;
            }
        }

        return Collections.emptyList();
    }

    @Nullable
    private static AdapterProxyMapping
    chooseAdapterProxyDirectSourceMapping(
            List<AdapterProxySource> orderedSources,
            List<?> renderInfos,
            Context context,
            List<String> pinOrder
    ) {
        int expected = lastKnownLibraryPlaylistCount;

        LinkedHashMap<String, String> signatureToId =
                new LinkedHashMap<>();

        synchronized (playlistIdByRowSignature) {
            signatureToId.putAll(playlistIdByRowSignature);
        }

        Map<String, String> persisted =
                PinStore.getPlaylistSignatures(context);

        for (Map.Entry<String, String> entry : persisted.entrySet()) {
            String playlistId = entry.getKey();
            String signature = entry.getValue();

            if (isPersistentPlaylistId(playlistId)
                    && signature != null
                    && !signature.isEmpty()) {
                signatureToId.put(signature, playlistId);
            }
        }

        LinkedHashMap<Integer, String> mapped =
                new LinkedHashMap<>();
        Set<String> distinctIds = new LinkedHashSet<>();
        boolean ambiguous = false;
        int capturedSourceObjects = 0;
        int canonicalMatches = 0;
        int signatureMatches = 0;

        for (int position = 0;
             position < renderInfos.size()
                     && position < orderedSources.size();
             position++) {
            AdapterProxySource source =
                    orderedSources.get(position);

            if (source == null
                    || source.sourceObject == null) {
                continue;
            }

            capturedSourceObjects++;

            Set<String> canonicalIds =
                    collectCanonicalPlaylistIds(
                            source.sourceObject,
                            10
                    );

                LinkedHashSet<String> persistentIds =
                        new LinkedHashSet<>();

                for (String candidate : canonicalIds) {
                    if (isPersistentPlaylistId(candidate)) {
                        persistentIds.add(candidate);
                    }
                }

                String playlistId = null;
                String identitySource = null;
                String matchedSignature = null;
                Set<String> sourceStrings =
                        Collections.emptySet();

                Set<String> knownPlaylistIds =
                        new LinkedHashSet<>();
                knownPlaylistIds.addAll(pinOrder);
                knownPlaylistIds.addAll(
                        signatureToId.values()
                );

                playlistId =
                        resolveCanonicalPlaylistId(
                                persistentIds,
                                pinOrder,
                                knownPlaylistIds
                        );

                if (playlistId != null) {
                    identitySource =
                            persistentIds.size() == 1
                                    ? "canonical"
                                    : "canonicalNormalized";
                    canonicalMatches++;
                } else if (persistentIds.size() > 1) {
                    ambiguous = true;
                    identitySource = "multipleCanonical";
                } else if (!signatureToId.isEmpty()) {
                    sourceStrings =
                            collectObjectStrings(
                                    source.sourceObject
                            );

                    matchedSignature =
                            findUniqueKnownRowSignature(
                                    sourceStrings,
                                    signatureToId
                            );

                    if (matchedSignature != null) {
                        playlistId =
                                signatureToId.get(
                                        matchedSignature
                                );
                        identitySource = "signature";
                        signatureMatches++;
                    }
                }

                if (playlistId != null) {
                    if (!distinctIds.add(playlistId)) {
                        ambiguous = true;
                    } else {
                        mapped.put(position, playlistId);
                    }
                }

                if (directSourceRowLogCount < 100) {
                    directSourceRowLogCount++;

                    List<String> sample = new ArrayList<>();
                    for (String value : sourceStrings) {
                        sample.add(
                                abbreviateDiagnosticValue(value)
                        );
                        if (sample.size() >= 8) break;
                    }

                    Log.d(TAG, "PreSubmitDirectSourceRow"
                            + " position=" + position
                            + " sourceIndex="
                            + source.sourceIndex
                            + " sourceType="
                            + objectTypeName(
                            source.sourceObject
                    )
                            + " playlistId=" + playlistId
                            + " identitySource="
                            + identitySource
                            + " canonicalIds="
                            + persistentIds
                            + " matchedSignature="
                            + matchedSignature
                            + " strings=" + sample);
                }
            }

        Set<String> pinnedPresent = new LinkedHashSet<>();
        for (String pinnedId : pinOrder) {
            if (distinctIds.contains(pinnedId)) {
                pinnedPresent.add(pinnedId);
            }
        }

        /*
         * A canonical mapping can safely work on the first load. A
         * signature-only mapping waits until the normal bind path has learned
         * the exact number of playlist rows.
         */
        int requiredPlaylistRows =
                expected >= 3
                        ? expected
                        : mapped.size();

        boolean enoughForFirstLoad =
                expected < 3
                        && mapped.size() >= 3
                        && !pinnedPresent.isEmpty();

        boolean completeKnownLibrary =
                expected >= 3
                        && mapped.size() == expected
                        && distinctIds.size() == expected
                        && !pinnedPresent.isEmpty();

        Log.d(TAG, "PreSubmitDirectSourceSummary"
                + " total=" + renderInfos.size()
                + " capturedSourceObjects="
                + capturedSourceObjects
                + " expected=" + expected
                + " required=" + requiredPlaylistRows
                + " mapped=" + mapped.size()
                + " canonicalMatches="
                + canonicalMatches
                + " signatureMatches="
                + signatureMatches
                + " ambiguous=" + ambiguous
                + " pinnedPresent=" + pinnedPresent);

        if (ambiguous
                || (!enoughForFirstLoad
                && !completeKnownLibrary)) {
            Log.d(TAG, "PreSubmitDirectSourceSkipped"
                    + " expected=" + expected
                    + " mapped=" + mapped.size()
                    + " distinct=" + distinctIds.size()
                    + " ambiguous=" + ambiguous
                    + " pinnedPresent=" + pinnedPresent);
            return null;
        }

        int score =
                (mapped.size() * 100)
                        + (canonicalMatches * 50)
                        + (pinnedPresent.size() * 100);

        return new AdapterProxyMapping(
                "directSourceObject",
                0,
                score,
                mapped,
                false
        );
    }

    @Nullable
    private static String resolveCanonicalPlaylistId(
            Set<String> rawCandidates,
            List<String> pinOrder,
            Set<String> knownPlaylistIds
    ) {
        if (rawCandidates == null
                || rawCandidates.isEmpty()) {
            return null;
        }

        LinkedHashSet<String> normalized =
                new LinkedHashSet<>();

        for (String raw : rawCandidates) {
            if (raw == null || raw.isEmpty()) continue;

            String candidate = raw;

            /*
             * The protobuf byte scan can include the field's leading "PL"
             * twice (PLPL...) or append the following field tag ("2").
             * Collapse the duplicated prefix first. The remaining prefix
             * relationship is resolved below.
             */
            while (candidate.startsWith("PLPL")
                    && candidate.length() > 4) {
                candidate = candidate.substring(2);
            }

            if (isPersistentPlaylistId(candidate)) {
                normalized.add(candidate);
            }
        }

        if (normalized.isEmpty()) return null;

        if (pinOrder != null) {
            for (String pinnedId : pinOrder) {
                if (normalized.contains(pinnedId)) {
                    return pinnedId;
                }
            }
        }

        if (knownPlaylistIds != null) {
            for (String knownId : knownPlaylistIds) {
                if (normalized.contains(knownId)) {
                    return knownId;
                }
            }
        }

        if (normalized.size() == 1) {
            return normalized.iterator().next();
        }

        List<String> byLength =
                new ArrayList<>(normalized);
        Collections.sort(
                byLength,
                (left, right) -> {
                    int lengthCompare =
                            Integer.compare(
                                    left.length(),
                                    right.length()
                            );
                    return lengthCompare != 0
                            ? lengthCompare
                            : left.compareTo(right);
                }
        );

        for (String candidate : byLength) {
            boolean commonPrefix = true;

            for (String other : normalized) {
                if (!other.equals(candidate)
                        && !other.startsWith(candidate)) {
                    commonPrefix = false;
                    break;
                }
            }

            if (commonPrefix) {
                return candidate;
            }
        }

        return null;
    }

    @Nullable
    private static String findUniqueKnownRowSignature(
            Set<String> itemStrings,
            Map<String, String> knownSignatures
    ) {
        if (itemStrings == null
                || itemStrings.isEmpty()
                || knownSignatures == null
                || knownSignatures.isEmpty()) {
            return null;
        }

        Set<String> normalizedStrings = new LinkedHashSet<>();
        for (String value : itemStrings) {
            String normalized = normalizeRowIdentityText(value);
            if (!normalized.isEmpty()) {
                normalizedStrings.add(normalized);
            }
        }

        String match = null;

        for (String signature : knownSignatures.keySet()) {
            int separator = signature.indexOf('\u001f');
            String title = separator >= 0
                    ? signature.substring(0, separator)
                    : signature;
            String subtitle = separator >= 0
                    ? signature.substring(separator + 1)
                    : "";

            if (!normalizedStrings.contains(title)) continue;
            if (!subtitle.isEmpty()
                    && !normalizedStrings.contains(subtitle)) {
                continue;
            }

            if (match != null && !match.equals(signature)) {
                return null;
            }

            match = signature;
        }

        return match;
    }






    private static String identityString(@Nullable Object value) {
        if (value == null) return "null";
        return Integer.toHexString(System.identityHashCode(value));
    }




    public static void beginBoundLibraryRow(
            @Nullable Object adapter,
            @Nullable Object holder,
            int position
    ) {
        if (!deferredBindHookLogged) {
            deferredBindHookLogged = true;
            Log.d(TAG, "DiagnosticBuild=" + BUILD_ID
                    + " bindCompletionHook=true"
                    + " adapterType=" + objectTypeName(adapter)
                    + " holderType=" + objectTypeName(holder));
        }

        if (!isConfirmedLibraryAdapterInstance(adapter)
                || holder == null) {
            return;
        }

        if (!isFeatureEnabled()
                || !hasAnyPinsFast()) {
            return;
        }

        if (isAdapterBindCaptureSuppressed(adapter)) {
            return;
        }

        List<?> items = getLibraryAdapterBackingList(adapter);
        if (items == null
                || !hasActiveAdapterPositionMap(
                adapter,
                items.size()
        )) {
            return;
        }

        if (position < 0 || position >= items.size()) return;

        int sourcePosition = mappedSourcePosition(adapter, position);
        if (sourcePosition < 0 || sourcePosition >= items.size()) return;

        Object item = items.get(sourcePosition);
        Object stableIdObject = readFieldByName(item, "b");
        if (!(stableIdObject instanceof Number)) return;

        Object itemViewObject = readFieldByName(holder, "a");
        if (!(itemViewObject instanceof View)) return;

        PendingBoundRow pending = new PendingBoundRow(
                adapter,
                holder,
                position,
                ((Number) stableIdObject).longValue(),
                (View) itemViewObject
        );

        synchronized (pendingBoundRows) {
            pendingBoundRows.put(holder, pending);
            pendingBoundRows.put(pending.itemView, pending);

            if (pendingBoundRows.size() > 512) {
                pendingBoundRows.clear();
                pendingBoundRows.put(holder, pending);
                pendingBoundRows.put(pending.itemView, pending);
            }
        }

    }

    public static void finishBoundLibraryRow(
            @Nullable Object holderOrView
    ) {
        if (holderOrView == null
                || !isFeatureEnabled()
                || !hasAnyPinsFast()) {
            return;
        }

        PendingBoundRow pending;
        synchronized (pendingBoundRows) {
            pending = pendingBoundRows.remove(holderOrView);
            if (pending == null) return;

            pendingBoundRows.remove(pending.holder);
            pendingBoundRows.remove(pending.itemView);
        }

        rememberVisibleBoundRow(
                pending.adapter,
                pending.position,
                pending.itemView
        );

        applyBoundRowPinIndicator(
                pending.adapter,
                pending.itemView,
                pending.position
        );

        captureBoundLibraryRow(
                pending.adapter,
                pending.holder,
                pending.position,
                pending.stableId
        );
    }

    private static void captureBoundLibraryRow(
            Object adapter,
            Object holder,
            int scheduledPosition,
            long stableId
    ) {
        captureBoundLibraryRow(
                adapter,
                holder,
                scheduledPosition,
                stableId,
                false
        );
    }

    private static void captureBoundLibraryRow(
            Object adapter,
            Object holder,
            int scheduledPosition,
            long stableId,
            boolean deferred
    ) {
        if (isAdapterBindCaptureSuppressed(adapter)) {
            return;
        }

        Object controller = readFieldByName(adapter, "d");
        Object listObject = readFieldByName(controller, "b");
        if (!(listObject instanceof List)) return;

        List<?> items = (List<?>) listObject;

        if (hasActiveAdapterPositionMap(
                adapter,
                items.size()
        )) {
            return;
        }

        Object itemViewObject = readFieldByName(holder, "a");
        if (!(itemViewObject instanceof View)) return;

        View itemView = (View) itemViewObject;
        List<String> rowTexts = collectRowTextValues(itemView);

        if (rowTexts.isEmpty() && !deferred) {
            itemView.postDelayed(
                    () -> captureBoundLibraryRow(
                            adapter,
                            holder,
                            scheduledPosition,
                            stableId,
                            true
                    ),
                    32L
            );
            return;
        }

        String rowText = rowTexts.isEmpty()
                ? "[]"
                : rowTexts.toString();
        String rowSignature =
                buildRowIdentitySignature(rowTexts);

        rememberAdapterNativeOrder(adapter, items);
        synchronized (adapterOrdinaryPlaylistRows) {
            Set<Long> ordinaryRows =
                    adapterOrdinaryPlaylistRows.get(adapter);

            if (ordinaryRows == null) {
                ordinaryRows = new LinkedHashSet<>();
                adapterOrdinaryPlaylistRows.put(adapter, ordinaryRows);
            }

            if (isOrdinaryPlaylistRow(rowTexts)) {
                ordinaryRows.add(stableId);
            } else {
                ordinaryRows.remove(stableId);
            }
        }

        /*
         * Menu opening persists the canonical ID-to-row-signature mapping.
         * Binding must stay cheap; walking every row's listener/tag graph made
         * Library refreshes take several seconds.
         */
        String candidatePlaylistId = null;
        Context context = itemView.getContext();
        String playlistId = resolveBoundPlaylistId(
                context,
                rowSignature,
                candidatePlaylistId
        );

        if (playlistId == null) {
            applyDirectFlyoutRowPinIndicator(
                    itemView,
                    false,
                    null,
                    "bound"
            );

            if (boundRowNoIdLogCount < 40
                    && items.size() >= 10) {
                boundRowNoIdLogCount++;
                Log.d(TAG, "BoundLibraryRowNoId"
                        + " scheduledPosition=" + scheduledPosition
                        + " total=" + items.size()
                        + " stableRowId=" + stableId
                        + " candidateId=" + candidatePlaylistId
                        + " rowSignature=" + rowSignature
                        + " rowText=" + rowText);
            }
            return;
        }

        playlistId = rememberBoundAdapterPlaylistId(
                adapter,
                stableId,
                playlistId
        );

        if (boundRowLogCount < 120) {
            boundRowLogCount++;
            Log.d(TAG, "BoundLibraryRow"
                    + " scheduledPosition=" + scheduledPosition
                    + " total=" + items.size()
                    + " stableRowId=" + stableId
                    + " playlistId=" + playlistId
                    + " candidateId=" + candidatePlaylistId
                    + " identitySource="
                    + (playlistId.equals(candidatePlaylistId)
                    ? "byhm"
                    : "rowSignature")
                    + " rowSignature=" + rowSignature
                    + " rowText=" + rowText);
        }

        if (context != null
                && rowSignature != null
                && !rowSignature.isEmpty()) {
            PinStore.setPlaylistSignature(
                    context,
                    playlistId,
                    rowSignature
            );
        }

        activeLibraryAdapter = adapter;
        activeLibraryBackingList = items;

        applyDirectFlyoutRowPinIndicator(
                itemView,
                context != null && PinStore.isPinned(context, playlistId),
                playlistId,
                "bound"
        );

        if (context != null
                && items.size() >= 10
                && !PinStore.getPinnedIds(context).isEmpty()) {
            if (hasActiveAdapterPositionMap(
                    adapter,
                    items.size()
            )) {
                if (adapterProxyFactoryInstallLogCount < 80) {
                    adapterProxyFactoryInstallLogCount++;

                    Log.d(TAG, "PostBindPhysicalReorderSkipped"
                            + " reason=positionMapActive"
                            + " adapterIdentity="
                            + identityString(adapter)
                            + " total=" + items.size());
                }
            } else {
                boolean mappingComplete =
                        isExpectedPlaylistMappingComplete(adapter);

                scheduleAdapterReorderAfterBinding(
                        adapter,
                        itemView,
                        mappingComplete
                );
            }
        }
    }

    @Nullable
    private static String resolveBoundPlaylistId(
            @Nullable Context context,
            @Nullable String rowSignature,
            @Nullable String candidatePlaylistId
    ) {
        if (rowSignature == null) {
            return candidatePlaylistId;
        }

        if (candidatePlaylistId == null && context != null) {
            for (Map.Entry<String, String> entry :
                    PinStore.getPlaylistSignatures(context).entrySet()) {
                if (!rowSignature.equals(entry.getValue())) continue;

                if (candidatePlaylistId != null
                        && !candidatePlaylistId.equals(entry.getKey())) {
                    synchronized (playlistIdByRowSignature) {
                        ambiguousRowSignatures.add(rowSignature);
                    }
                    return null;
                }

                candidatePlaylistId = entry.getKey();
            }
        }

        synchronized (playlistIdByRowSignature) {
            if (ambiguousRowSignatures.contains(rowSignature)) {
                return null;
            }

            String knownPlaylistId =
                    playlistIdByRowSignature.get(rowSignature);

            if (knownPlaylistId != null) {
                if (candidatePlaylistId != null
                        && !knownPlaylistId.equals(candidatePlaylistId)) {
                    playlistIdByRowSignature.remove(rowSignature);
                    rowSignatureByPlaylistId.remove(knownPlaylistId);
                    ambiguousRowSignatures.add(rowSignature);
                    return null;
                }
                return knownPlaylistId;
            }

            if (candidatePlaylistId == null) {
                return null;
            }

            String knownSignature =
                    rowSignatureByPlaylistId.get(candidatePlaylistId);

            if (knownSignature != null
                    && !knownSignature.equals(rowSignature)) {
                if (rowIdentityConflictLogCount < 30) {
                    rowIdentityConflictLogCount++;
                    Log.d(TAG, "Rejected stale bound-row playlist id"
                            + " candidateId=" + candidatePlaylistId
                            + " knownSignature=" + knownSignature
                            + " observedSignature=" + rowSignature);
                }
                return null;
            }

            playlistIdByRowSignature.put(
                    rowSignature,
                    candidatePlaylistId
            );
            rowSignatureByPlaylistId.put(
                    candidatePlaylistId,
                    rowSignature
            );

            if (playlistIdByRowSignature.size() > 256) {
                playlistIdByRowSignature.clear();
                rowSignatureByPlaylistId.clear();
                ambiguousRowSignatures.clear();

                playlistIdByRowSignature.put(
                        rowSignature,
                        candidatePlaylistId
                );
                rowSignatureByPlaylistId.put(
                        candidatePlaylistId,
                        rowSignature
                );
            }

            return candidatePlaylistId;
        }
    }

    @Nullable
    private static String buildRowIdentitySignature(
            List<String> rowTexts
    ) {
        if (rowTexts == null || rowTexts.isEmpty()) {
            return null;
        }

        String title = normalizeRowIdentityText(
                rowTexts.get(0)
        );
        if (title.isEmpty()) return null;

        String subtitle = rowTexts.size() > 1
                ? normalizeRowIdentityText(rowTexts.get(1))
                : "";

        return title + "\\u001f" + subtitle;
    }

    private static boolean isOrdinaryPlaylistRow(
            @Nullable List<String> rowTexts
    ) {
        if (rowTexts == null || rowTexts.size() < 2) return false;

        String subtitle = rowTexts.get(1);
        if (subtitle == null) return false;

        subtitle = subtitle.trim();
        return subtitle.equals("Playlist")
                || subtitle.startsWith("Playlist ");
    }

    private static String normalizeRowIdentityText(
            @Nullable String value
    ) {
        if (value == null) return "";

        String normalized = value.trim();

        if (normalized.startsWith("Playlist • ")) {
            normalized = normalized.substring(
                    "Playlist • ".length()
            );
        }

        return normalized.replaceAll("\\\\s+", " ");
    }

    private static Set<String> collectPlaylistIdsFromBoundView(
            View root
    ) {
        Set<String> ids = new LinkedHashSet<>();
        List<View> views = new ArrayList<>();
        views.add(root);

        /*
         * Only accept IDs extracted from an actual byhm playlist-row source.
         * Generic tag/listener graphs contain page constants and unrelated
         * playlist endpoints, which caused every row to inherit one ID.
         */
        int cursor = 0;
        while (cursor < views.size() && views.size() <= 100) {
            View view = views.get(cursor++);

            collectIdsFromByhmCarrier(
                    view.getTag(),
                    ids,
                    2,
                    new IdentityHashMap<Object, Boolean>()
            );
            if (!ids.isEmpty()) return ids;

            Object keyedTags = readFieldByName(view, "mKeyedTags");
            if (keyedTags instanceof SparseArray) {
                SparseArray<?> tags = (SparseArray<?>) keyedTags;
                int count = Math.min(tags.size(), 30);

                for (int index = 0; index < count; index++) {
                    collectIdsFromByhmCarrier(
                            tags.valueAt(index),
                            ids,
                            2,
                            new IdentityHashMap<Object, Boolean>()
                    );
                    if (!ids.isEmpty()) return ids;
                }
            }

            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                int count = Math.min(group.getChildCount(), 30);

                for (int index = 0; index < count; index++) {
                    if (views.size() >= 100) break;
                    views.add(group.getChildAt(index));
                }
            }
        }

        /*
         * The playlist overflow View uses bfge.onClick, and that listener owns
         * the byhm source passed to qot.k. Inspect only bfge listener objects.
         */
        for (View view : views) {
            if (!view.isClickable()) continue;

            Object listenerInfo = readFieldByName(view, "mListenerInfo");
            if (listenerInfo == null) continue;

            for (Class<?> current = listenerInfo.getClass();
                 current != null && current != Object.class;
                 current = current.getSuperclass()) {
                Field[] fields;
                try {
                    fields = current.getDeclaredFields();
                } catch (Throwable ignored) {
                    continue;
                }

                for (Field field : fields) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    if (field.getType().isPrimitive()) continue;

                    try {
                        field.setAccessible(true);
                        Object listener = field.get(listenerInfo);
                        if (listener == null
                                || !"bfge".equals(
                                listener.getClass().getName()
                        )) {
                            continue;
                        }

                        collectIdsFromByhmCarrier(
                                listener,
                                ids,
                                5,
                                new IdentityHashMap<Object, Boolean>()
                        );
                        if (!ids.isEmpty()) return ids;
                    } catch (Throwable ignored) {
                    }
                }
            }
        }

        return ids;
    }

    private static void collectIdsFromByhmCarrier(
            @Nullable Object value,
            Set<String> output,
            int remainingDepth,
            IdentityHashMap<Object, Boolean> visited
    ) {
        if (value == null || remainingDepth < 0 || !output.isEmpty()) return;

        Class<?> type = value.getClass();

        if ("byhm".equals(type.getName())) {
            String playlistId = findBestPlaylistId(
                    collectCanonicalPlaylistIds(value, 8)
            );

            if (playlistId != null) {
                output.add(playlistId);
            }
            return;
        }

        if (isTerminalType(type)
                || type.isPrimitive()
                || value instanceof byte[]
                || isByteContainer(type)) {
            return;
        }

        if (visited.put(value, Boolean.TRUE) != null) return;

        if (type.isArray()) {
            int count = Math.min(Array.getLength(value), 20);
            for (int index = 0; index < count; index++) {
                collectIdsFromByhmCarrier(
                        Array.get(value, index),
                        output,
                        remainingDepth - 1,
                        visited
                );
                if (!output.isEmpty()) return;
            }
            return;
        }

        if (value instanceof Iterable) {
            int count = 0;
            for (Object child : (Iterable<?>) value) {
                collectIdsFromByhmCarrier(
                        child,
                        output,
                        remainingDepth - 1,
                        visited
                );
                if (!output.isEmpty() || ++count >= 20) return;
            }
            return;
        }

        if (value instanceof Map) {
            int count = 0;
            for (Object child : ((Map<?, ?>) value).values()) {
                collectIdsFromByhmCarrier(
                        child,
                        output,
                        remainingDepth - 1,
                        visited
                );
                if (!output.isEmpty() || ++count >= 20) return;
            }
            return;
        }

        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (field.getType().isPrimitive()) continue;

                try {
                    field.setAccessible(true);
                    collectIdsFromByhmCarrier(
                            field.get(value),
                            output,
                            remainingDepth - 1,
                            visited
                    );
                    if (!output.isEmpty()) return;
                } catch (Throwable ignored) {
                }
            }
        }
    }

    @Nullable
    private static String rememberBoundAdapterPlaylistId(
            @Nullable Object adapter,
            long stableId,
            @Nullable String playlistId
    ) {
        if (adapter == null || playlistId == null) {
            return playlistId;
        }

        synchronized (adapterPlaylistIds) {
            Map<Long, String> mappings =
                    adapterPlaylistIds.get(adapter);

            if (mappings == null) {
                mappings = new LinkedHashMap<>();
                adapterPlaylistIds.put(adapter, mappings);
            }

            String existing = mappings.get(stableId);

            if (existing == null) {
                mappings.put(stableId, playlistId);
                return playlistId;
            }

            if (existing.equals(playlistId)) {
                return existing;
            }

            /*
             * hvg.b belongs to the backing-list item and does not change when
             * that item is moved. Recycled holder Views can temporarily show
             * text from a neighboring row after move/rebind notifications.
             * Never allow that transient View state to rewrite an established
             * stable-row identity. A new server/sort rebuild generates a new
             * stable-ID set, and rememberAdapterNativeOrder clears this map.
             */
            if (stableRowRemapConflictLogCount < 40) {
                stableRowRemapConflictLogCount++;
                Log.d(TAG, "Rejected conflicting stable-row remap"
                        + " stableRowId=" + stableId
                        + " existingId=" + existing
                        + " observedId=" + playlistId);
            }

            return existing;
        }
    }

    private static void rememberAdapterPlaylistId(
            @Nullable Object adapter,
            long stableId,
            @Nullable String playlistId
    ) {
        if (adapter == null || playlistId == null) return;

        synchronized (adapterPlaylistIds) {
            Map<Long, String> mappings =
                    adapterPlaylistIds.get(adapter);

            if (mappings == null) {
                mappings = new LinkedHashMap<>();
                adapterPlaylistIds.put(adapter, mappings);
            }

            mappings.put(stableId, playlistId);

            if (adapterPlaylistIds.size() > 30) {
                Object keep = activeLibraryAdapter;
                Map<Long, String> keepMappings =
                        keep == null ? null : adapterPlaylistIds.get(keep);

                adapterPlaylistIds.clear();

                if (keep != null && keepMappings != null) {
                    adapterPlaylistIds.put(keep, keepMappings);
                }
            }
        }
    }

    private static void rememberAdapterNativeOrder(
            Object adapter,
            List<?> items
    ) {
        List<Long> current = stableIdsForItems(items);
        if (current == null) return;

        synchronized (adapterBaseOrder) {
            List<Long> base = adapterBaseOrder.get(adapter);
            List<Long> lastApplied =
                    adapterLastAppliedOrder.get(adapter);

            boolean setChanged =
                    base == null
                            || base.size() != current.size()
                            || !new LinkedHashSet<>(base).equals(
                            new LinkedHashSet<>(current)
                    );

            boolean nativeOrderChanged =
                    lastApplied == null
                            ? base != null && !base.equals(current)
                            : !lastApplied.equals(current);

            if (setChanged || nativeOrderChanged) {
                adapterBaseOrder.put(
                        adapter,
                        new ArrayList<>(current)
                );

                if (setChanged) {
                    synchronized (adapterPlaylistIds) {
                        adapterPlaylistIds.remove(adapter);
                    }
                    synchronized (adapterOrdinaryPlaylistRows) {
                        adapterOrdinaryPlaylistRows.remove(adapter);
                    }
                    synchronized (adapterVisualToSourcePositions) {
                        adapterVisualToSourcePositions.remove(adapter);
                    }

                }

                Log.d(TAG, "Captured Library native order"
                        + " total=" + current.size()
                        + " ids=" + current);
            }
        }
    }

    @Nullable
    private static List<Long> stableIdsForItems(
            List<?> items
    ) {
        List<Long> ids = new ArrayList<>(items.size());

        for (Object item : items) {
            Object value = readFieldByName(item, "b");
            if (!(value instanceof Number)) return null;
            ids.add(((Number) value).longValue());
        }

        return ids;
    }

    private static boolean isAdapterBindCaptureSuppressed(
            Object adapter
    ) {
        long now = SystemClock.uptimeMillis();

        synchronized (adapterBindSuppressedUntilMs) {
            Long until = adapterBindSuppressedUntilMs.get(adapter);

            if (until == null) {
                return false;
            }

            if (until > now) {
                return true;
            }

            adapterBindSuppressedUntilMs.remove(adapter);
            return false;
        }
    }

    private static void suppressAdapterBindCapture(
            final Object adapter,
            long durationMs
    ) {
        synchronized (adapterBindSuppressedUntilMs) {
            adapterBindSuppressedUntilMs.put(
                    adapter,
                    SystemClock.uptimeMillis() + durationMs
            );
        }

        synchronized (adapterBindReorderGeneration) {
            adapterBindReorderGeneration.remove(adapter);
        }

        final int generation;
        synchronized (adapterSuppressionReconcileGeneration) {
            Integer previous =
                    adapterSuppressionReconcileGeneration.get(adapter);
            generation = previous == null ? 1 : previous + 1;
            adapterSuppressionReconcileGeneration.put(
                    adapter,
                    generation
            );
        }

        /*
         * A sort change can happen while notification-induced binds are being
         * suppressed. When that happens, those binds are intentionally ignored,
         * so perform one reconciliation after the suppression window. If the
         * native order changed, clear stale row mappings and force a clean bind
         * pass; normal bound-row capture then reapplies the pinned partition.
         */
        mainHandler.postDelayed(new Runnable() {
            @Override
            public void run() {
                synchronized (adapterSuppressionReconcileGeneration) {
                    Integer current =
                            adapterSuppressionReconcileGeneration.get(adapter);

                    if (current == null
                            || current != generation) {
                        return;
                    }

                    adapterSuppressionReconcileGeneration.remove(adapter);
                }

                reconcileAdapterAfterSuppression(adapter);
            }
        }, durationMs + 16L);
    }

    private static void reconcileAdapterAfterSuppression(
            Object adapter
    ) {
        Object controller = readFieldByName(adapter, "d");
        Object listObject = readFieldByName(controller, "b");
        if (!(listObject instanceof List)) return;

        List<Long> currentOrder =
                stableIdsForItems((List<?>) listObject);
        if (currentOrder == null) return;

        List<Long> lastApplied;
        synchronized (adapterLastAppliedOrder) {
            List<Long> existing =
                    adapterLastAppliedOrder.get(adapter);
            lastApplied = existing == null
                    ? null
                    : new ArrayList<>(existing);
        }

        if (lastApplied != null
                && lastApplied.equals(currentOrder)) {
            return;
        }

        synchronized (adapterPlaylistIds) {
            adapterPlaylistIds.remove(adapter);
        }

        synchronized (adapterBaseOrder) {
            adapterBaseOrder.put(
                    adapter,
                    new ArrayList<>(currentOrder)
            );
        }

        synchronized (adapterLastAppliedOrder) {
            adapterLastAppliedOrder.remove(adapter);
        }

        boolean remapNotify =
                invokeAdapterFullRefresh(adapter);

        Log.d(TAG, "Detected Library order change during bind suppression"
                + " remapNotify=" + remapNotify
                + " nativeOrder=" + currentOrder);
    }

    private static boolean isExpectedPlaylistMappingComplete(
            Object adapter
    ) {
        Integer expected;
        synchronized (adapterExpectedPlaylistCount) {
            expected = adapterExpectedPlaylistCount.get(adapter);
        }

        if (expected == null || expected < 3) {
            return false;
        }

        Set<String> distinct = new LinkedHashSet<>();
        synchronized (adapterPlaylistIds) {
            Map<Long, String> mappings =
                    adapterPlaylistIds.get(adapter);

            if (mappings == null) return false;

            for (String playlistId : mappings.values()) {
                if (isPersistentPlaylistId(playlistId)) {
                    distinct.add(playlistId);
                }
            }
        }

        return distinct.size() >= expected;
    }

    private static void scheduleAdapterReorderAfterBinding(
            final Object adapter,
            View anchor,
            boolean mappingComplete
    ) {
        if (mappingComplete) {
            synchronized (adapterBindReorderGeneration) {
                adapterBindReorderGeneration.remove(adapter);
            }

            scheduleAdapterReorder(adapter, anchor);
            return;
        }
        final int generation;

        synchronized (adapterBindReorderGeneration) {
            Integer previous =
                    adapterBindReorderGeneration.get(adapter);
            generation = previous == null ? 1 : previous + 1;
            adapterBindReorderGeneration.put(
                    adapter,
                    generation
            );
        }

        anchor.postDelayed(new Runnable() {
            @Override
            public void run() {
                synchronized (adapterBindReorderGeneration) {
                    Integer current =
                            adapterBindReorderGeneration.get(adapter);

                    if (current == null
                            || current != generation) {
                        return;
                    }

                    adapterBindReorderGeneration.remove(adapter);
                }

                applyPinnedOrder(adapter);
            }
        }, 16L);
    }

    private static void scheduleAdapterReorder(
            final Object adapter,
            View anchor
    ) {
        synchronized (adapterBindReorderGeneration) {
            adapterBindReorderGeneration.remove(adapter);
        }

        synchronized (adapterReorderPending) {
            if (Boolean.TRUE.equals(
                    adapterReorderPending.get(adapter)
            )) {
                return;
            }
            adapterReorderPending.put(adapter, true);
        }

        anchor.post(new Runnable() {
            @Override
            public void run() {
                synchronized (adapterReorderPending) {
                    adapterReorderPending.remove(adapter);
                }

                applyPinnedOrder(adapter);
            }
        });
    }

    private static void applyPinnedOrder(
            Object adapter
    ) {
        Object controller = readFieldByName(adapter, "d");
        Object listObject = readFieldByName(controller, "b");

        if (!(listObject instanceof List)) return;

        List list = (List) listObject;
        if (list.size() < 2) return;

        if (hasActiveAdapterPositionMap(
                adapter,
                list.size()
        )) {
            Log.d(TAG, "PostBindPhysicalReorderSkipped"
                    + " reason=positionMapActiveAtApply"
                    + " adapterIdentity="
                    + identityString(adapter)
                    + " total=" + list.size());
            return;
        }

        Context context = resolveApplicationContext();
        if (context == null) return;

        List<String> pinnedOrder =
                new ArrayList<>(PinStore.getPinnedIds(context));
        Set<String> pinnedIds =
                new LinkedHashSet<>(pinnedOrder);

        Map<Long, String> mappings;
        synchronized (adapterPlaylistIds) {
            Map<Long, String> existing =
                    adapterPlaylistIds.get(adapter);

            if (existing == null || existing.isEmpty()) return;
            mappings = new LinkedHashMap<>(existing);
        }

        Set<Long> ordinaryRowIds;
        synchronized (adapterOrdinaryPlaylistRows) {
            Set<Long> existing = adapterOrdinaryPlaylistRows.get(adapter);
            ordinaryRowIds = existing == null
                    ? Collections.<Long>emptySet()
                    : new LinkedHashSet<>(existing);
        }

        rememberAdapterNativeOrder(adapter, list);

        List<Long> base;
        synchronized (adapterBaseOrder) {
            List<Long> existing = adapterBaseOrder.get(adapter);
            if (existing == null) return;
            base = new ArrayList<>(existing);
        }

        Map<Long, Object> itemById = new LinkedHashMap<>();
        for (Object item : (List<?>) list) {
            Object value = readFieldByName(item, "b");
            if (!(value instanceof Number)) return;

            long id = ((Number) value).longValue();
            if (itemById.containsKey(id)) {
                Log.e(TAG, "Skipping reorder: duplicate stable row ID " + id);
                return;
            }
            itemById.put(id, item);
        }

        List<Object> nativeOrder = new ArrayList<>(list.size());
        Set<Long> added = new LinkedHashSet<>();

        for (Long id : base) {
            Object item = itemById.get(id);
            if (item != null) {
                nativeOrder.add(item);
                added.add(id);
            }
        }

        for (Map.Entry<Long, Object> entry : itemById.entrySet()) {
            if (!added.contains(entry.getKey())) {
                nativeOrder.add(entry.getValue());
            }
        }

        List<Integer> playlistSlots = new ArrayList<>();
        List<Object> pinned = new ArrayList<>();
        List<Object> unpinned = new ArrayList<>();
        List<Long> pinnedStableIds = new ArrayList<>();
        Set<String> distinctPlaylistIds = new LinkedHashSet<>();
        Map<String, Object> playlistItemById = new LinkedHashMap<>();
        Map<String, Long> playlistStableIdById = new LinkedHashMap<>();

        for (int index = 0; index < nativeOrder.size(); index++) {
            Object item = nativeOrder.get(index);
            Object value = readFieldByName(item, "b");
            long stableId = ((Number) value).longValue();
            String playlistId = mappings.get(stableId);

            if (!ordinaryRowIds.contains(stableId)
                    && !isPersistentPlaylistId(playlistId)) {
                continue;
            }

            playlistSlots.add(index);

            if (isPersistentPlaylistId(playlistId)) {
                distinctPlaylistIds.add(playlistId);
                playlistItemById.put(playlistId, item);
                playlistStableIdById.put(playlistId, stableId);
            }

            if (!isPersistentPlaylistId(playlistId)
                    || !pinnedIds.contains(playlistId)) {
                unpinned.add(item);
            }
        }

        /*
         * Pinned rows follow local pin chronology, never the active Library
         * sort. The first playlist pinned occupies the highest playlist slot,
         * the second occupies the next slot, and so on. Unpinned rows continue
         * to follow YouTube Music's native sort order.
         */
        for (String playlistId : pinnedOrder) {
            Object item = playlistItemById.get(playlistId);
            Long stableId = playlistStableIdById.get(playlistId);

            if (item == null || stableId == null) continue;

            pinned.add(item);
            pinnedStableIds.add(stableId);
        }

        if (playlistSlots.size() < 3) return;

        lastKnownLibraryPlaylistCount = playlistSlots.size();

        synchronized (adapterExpectedPlaylistCount) {
            adapterExpectedPlaylistCount.put(
                    adapter,
                    playlistSlots.size()
            );
        }

        List<Object> partitionedPlaylists =
                new ArrayList<>(playlistSlots.size());
        partitionedPlaylists.addAll(pinned);
        partitionedPlaylists.addAll(unpinned);

        if (partitionedPlaylists.size() != playlistSlots.size()) {
            Log.e(TAG, "Skipping reorder: ambiguous playlist identity"
                    + " slots=" + playlistSlots.size()
                    + " partitioned=" + partitionedPlaylists.size()
                    + " distinctIds=" + distinctPlaylistIds.size());
            return;
        }

        List<Object> desired = new ArrayList<>(nativeOrder);

        for (int index = 0; index < playlistSlots.size(); index++) {
            desired.set(
                    playlistSlots.get(index),
                    partitionedPlaylists.get(index)
            );
        }

        LinkedHashMap<Integer, String> visualPinnedIds =
                new LinkedHashMap<>();
        LinkedHashSet<Integer> pinnedVisualPositions =
                new LinkedHashSet<>();
        int pinnedVisualIndex = 0;
        for (String pinnedId : pinnedOrder) {
            if (!playlistItemById.containsKey(pinnedId)
                    || pinnedVisualIndex >= playlistSlots.size()) {
                continue;
            }
            int visualPosition =
                    playlistSlots.get(pinnedVisualIndex++);
            visualPinnedIds.put(visualPosition, pinnedId);
            pinnedVisualPositions.add(visualPosition);
        }
        synchronized (adapterVisualPlaylistIds) {
            adapterVisualPlaylistIds.put(adapter, visualPinnedIds);
            adapterPinnedVisualPositions.put(
                    adapter,
                    pinnedVisualPositions
            );
        }

        if (nativeOrder.size() == desired.size()
                && !nativeOrder.isEmpty()) {
            int[] permutation = new int[desired.size()];
            boolean validPermutation = true;

            for (int position = 0;
                 position < desired.size();
                 position++) {
                int sourcePosition = indexOfIdentity(
                        nativeOrder,
                        desired.get(position),
                        0
                );
                if (sourcePosition < 0) {
                    validPermutation = false;
                    break;
                }
                permutation[position] = sourcePosition;
            }

            if (validPermutation) {
                List<Long> nativeStableIds =
                        stableIdsForItems(nativeOrder);

                PinStore.setLibraryPermutation(
                        context,
                        pinnedIds,
                        permutation,
                        objectTypeName(nativeOrder.get(0)),
                        playlistSlots,
                        nativeStableIds
                );
            }
        }

        if (hasActiveAdapterPositionMap(adapter, list.size())) {
            synchronized (adapterLastAppliedOrder) {
                adapterLastAppliedOrder.put(
                        adapter,
                        stableIdsForItems(desired)
                );
            }
            Log.d(TAG, "Pinned Library order already virtualized"
                    + " total=" + list.size()
                    + " pinOrder=" + pinnedOrder
                    + " playlistSlots=" + playlistSlots);
            refreshVisiblePinIndicators(adapter);
            postSignaturePinIndicatorRefresh(adapter);
            return;
        }

        if (sameIdentityOrder(list, desired)) {
            synchronized (adapterLastAppliedOrder) {
                adapterLastAppliedOrder.put(
                        adapter,
                        stableIdsForItems(list)
                );
            }
            refreshVisiblePinIndicators(adapter);
            postSignaturePinIndicatorRefresh(adapter);
            return;
        }

        /*
         * Keep a short multi-frame guard around native Litho moves. The
         * stable-row remap guard now rejects recycled-holder conflicts, so the
         * earlier three-second suppression window only delayed rapid refreshes
         * and sort changes.
         */
        suppressAdapterBindCapture(adapter, 150L);

        List<String> nativeMoveNotifications =
                new ArrayList<>();
        List<String> fallbackMoveNotifications =
                new ArrayList<>();
        boolean usedFallbackMove = false;
        boolean fallbackFullNotify = false;

        try {
            /*
             * Use Litho's own adapter move pipeline. hyz.z(source, target)
             * delegates to hzc.I(source, target), allowing the renderer to
             * move its backing item and ComponentTree together. The earlier
             * remove/add + RecyclerView notification path changed hzc.b but
             * did not reliably keep the on-screen Litho rows aligned after a
             * Library sort rebuild.
             */
            for (int targetIndex = 0;
                 targetIndex < desired.size();
                 targetIndex++) {
                Object desiredItem = desired.get(targetIndex);

                if (list.get(targetIndex) == desiredItem) {
                    continue;
                }

                int sourceIndex = indexOfIdentity(
                        list,
                        desiredItem,
                        targetIndex + 1
                );

                if (sourceIndex < 0) {
                    throw new IllegalStateException(
                            "Desired Library item was not found"
                                    + " targetIndex=" + targetIndex
                    );
                }

                boolean nativeMoveInvoked = invokeTwoIntVoid(
                        adapter,
                        "z",
                        sourceIndex,
                        targetIndex
                );

                boolean nativeListMoved =
                        targetIndex < list.size()
                                && list.get(targetIndex) == desiredItem;

                nativeMoveNotifications.add(
                        sourceIndex + "->" + targetIndex
                                + ":invoked=" + nativeMoveInvoked
                                + ":listMoved=" + nativeListMoved
                );

                if (nativeMoveInvoked && nativeListMoved) {
                    continue;
                }

                /*
                 * Safety fallback for version drift. Only use the old direct
                 * list mutation when the native move path is absent or did
                 * not synchronously place the expected item.
                 */
                int fallbackSource = indexOfIdentity(
                        list,
                        desiredItem,
                        0
                );

                if (fallbackSource < 0) {
                    throw new IllegalStateException(
                            "Fallback Library item was not found"
                                    + " targetIndex=" + targetIndex
                    );
                }

                Object movedItem = list.remove(fallbackSource);
                list.add(targetIndex, movedItem);

                boolean moveNotified = invokeAdapterMove(
                        adapter,
                        fallbackSource,
                        targetIndex
                );

                fallbackMoveNotifications.add(
                        fallbackSource + "->" + targetIndex
                                + ":" + moveNotified
                );

                usedFallbackMove = true;

                if (!moveNotified) {
                    fallbackFullNotify = true;
                }
            }
        } catch (Throwable error) {
            Log.e(TAG, "Failed moving Library rows", error);
            return;
        }

        List<Long> applied = stableIdsForItems(list);
        synchronized (adapterLastAppliedOrder) {
            adapterLastAppliedOrder.put(adapter, applied);
        }

        if (fallbackFullNotify) {
            fallbackFullNotify = invokeAdapterFullRefresh(adapter);
        }

        Log.d(TAG, "Applied pinned Library order"
                + " total=" + list.size()
                + " pinnedRows=" + pinned.size()
                + " pinnedStableIds=" + pinnedStableIds
                + " pinOrder=" + pinnedOrder
                + " playlistSlots=" + playlistSlots
                + " bindCaptureSuppressedMs=150"
                + " nativeMoveNotifications="
                + nativeMoveNotifications
                + " usedFallbackMove=" + usedFallbackMove
                + " fallbackMoveNotifications="
                + fallbackMoveNotifications
                + " fallbackFullNotify=" + fallbackFullNotify
                + " order=" + applied);

        refreshVisiblePinIndicators(adapter);
        postSignaturePinIndicatorRefresh(adapter);
    }

    private static String installAdapterPermutation(
            Object adapter,
            int[] desired
    ) {
        int[] previous;

        synchronized (adapterVisualToSourcePositions) {
            int[] stored = adapterVisualToSourcePositions.get(adapter);

            if (stored == null || stored.length != desired.length) {
                previous = new int[desired.length];
                for (int index = 0; index < previous.length; index++) {
                    previous[index] = index;
                }
            } else {
                previous = stored.clone();
            }
        }

        if (java.util.Arrays.equals(previous, desired)) {
            synchronized (adapterVisualToSourcePositions) {
                adapterVisualToSourcePositions.put(
                        adapter,
                        desired.clone()
                );
            }
            return "unchanged";
        }

        int[] working = previous.clone();
        List<String> moves = new ArrayList<>();
        boolean movesSucceeded = true;

        for (int target = 0; target < desired.length; target++) {
            int desiredSource = desired[target];
            if (working[target] == desiredSource) continue;

            int source = -1;
            for (int index = target + 1;
                 index < working.length;
                 index++) {
                if (working[index] == desiredSource) {
                    source = index;
                    break;
                }
            }

            if (source < 0) {
                movesSucceeded = false;
                break;
            }

            int moved = working[source];
            System.arraycopy(
                    working,
                    target,
                    working,
                    target + 1,
                    source - target
            );
            working[target] = moved;

            synchronized (adapterVisualToSourcePositions) {
                adapterVisualToSourcePositions.put(
                        adapter,
                        working.clone()
                );
            }

            boolean notified = invokeAdapterMove(
                    adapter,
                    source,
                    target
            );
            moves.add(source + "->" + target + ":" + notified);

            if (!notified) {
                movesSucceeded = false;
                break;
            }
        }

        if (movesSucceeded
                && java.util.Arrays.equals(working, desired)) {
            return "moves=" + moves;
        }

        synchronized (adapterVisualToSourcePositions) {
            adapterVisualToSourcePositions.put(
                    adapter,
                    desired.clone()
            );
        }

        boolean fullNotify = invokeAdapterFullRefresh(adapter);
        return "moves=" + moves
                + ",fallbackFullNotify=" + fullNotify;
    }

    private static boolean isPersistentPlaylistId(
            @Nullable String playlistId
    ) {
        if (playlistId == null) return false;

        return playlistId.startsWith("PL")
                || playlistId.startsWith("OLAK5uy_")
                || playlistId.startsWith("LRSR");
    }

    private static int indexOfIdentity(
            List<?> values,
            Object target,
            int startIndex
    ) {
        int first = Math.max(0, startIndex);

        for (int index = first;
             index < values.size();
             index++) {
            if (values.get(index) == target) {
                return index;
            }
        }

        return -1;
    }

    private static boolean sameIdentityOrder(
            List<?> current,
            List<?> desired
    ) {
        if (current.size() != desired.size()) return false;

        for (int index = 0; index < current.size(); index++) {
            if (current.get(index) != desired.get(index)) {
                return false;
            }
        }

        return true;
    }


    private static boolean invokeAdapterMove(
            Object adapter,
            int source,
            int target
    ) {
        for (String methodName : ADAPTER_MOVE_NOTIFY_METHODS) {
            if (invokeTwoIntVoid(
                    adapter,
                    methodName,
                    source,
                    target
            )) {
                return true;
            }
        }

        return false;
    }

    private static boolean invokeAdapterFullRefresh(Object adapter) {
        for (String methodName : ADAPTER_FULL_NOTIFY_METHODS) {
            if (invokeNoArgVoid(adapter, methodName)) {
                return true;
            }
        }

        return false;
    }

    private static boolean invokeTwoIntVoid(
            Object receiver,
            String methodName,
            int first,
            int second
    ) {
        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Method method = current.getDeclaredMethod(
                        methodName,
                        Integer.TYPE,
                        Integer.TYPE
                );

                if (method.getReturnType() != Void.TYPE) {
                    continue;
                }

                method.setAccessible(true);
                method.invoke(receiver, first, second);
                return true;
            } catch (NoSuchMethodException ignored) {
            } catch (Throwable error) {
                Log.e(TAG, "Failed invoking "
                        + current.getName() + "." + methodName
                        + "(" + first + ", " + second + ")", error);
                return false;
            }
        }

        return false;
    }

    private static boolean invokeNoArgVoid(
            Object receiver,
            String methodName
    ) {
        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Method method = current.getDeclaredMethod(methodName);
                if (method.getParameterTypes().length != 0
                        || method.getReturnType() != Void.TYPE) {
                    continue;
                }

                method.setAccessible(true);
                method.invoke(receiver);
                return true;
            } catch (NoSuchMethodException ignored) {
            } catch (Throwable error) {
                Log.e(TAG, "Failed invoking "
                        + current.getName() + "." + methodName, error);
                return false;
            }
        }

        return false;
    }

    @Nullable
    private static String findOnlySupportedPlaylistId(
            Set<String> candidates
    ) {
        String resolved = null;

        if (candidates == null) return null;

        for (String candidate : candidates) {
            if (!PinStore.isSupportedPlaylistId(candidate)) {
                continue;
            }

            if (resolved != null
                    && !resolved.equals(candidate)) {
                Log.d(TAG, "FlyoutPageIdentityBridge"
                        + " rejectedAmbiguousIds=" + candidates);
                return null;
            }

            resolved = candidate;
        }

        return resolved;
    }

    private static Set<String> collectPlaylistIdsFromFlyoutView(
            View clickedView
    ) {
        Set<String> ids = new LinkedHashSet<>();
        View currentView = clickedView;

        for (int depth = 0;
             depth < 12 && currentView != null && ids.isEmpty();
             depth++) {
            collectIdsFromByhmCarrier(
                    currentView.getTag(),
                    ids,
                    4,
                    new IdentityHashMap<Object, Boolean>()
            );

            Object keyedTags =
                    readFieldByName(currentView, "mKeyedTags");

            if (ids.isEmpty() && keyedTags instanceof SparseArray) {
                SparseArray<?> tags = (SparseArray<?>) keyedTags;
                int count = Math.min(tags.size(), 30);

                for (int index = 0;
                     index < count && ids.isEmpty();
                     index++) {
                    collectIdsFromByhmCarrier(
                            tags.valueAt(index),
                            ids,
                            4,
                            new IdentityHashMap<Object, Boolean>()
                    );
                }
            }

            Object listenerInfo =
                    readFieldByName(currentView, "mListenerInfo");

            if (ids.isEmpty() && listenerInfo != null) {
                for (Field field :
                        getInstanceFields(listenerInfo.getClass())) {
                    if (field.getType().isPrimitive()) continue;

                    try {
                        field.setAccessible(true);
                        collectIdsFromByhmCarrier(
                                field.get(listenerInfo),
                                ids,
                                6,
                                new IdentityHashMap<Object, Boolean>()
                        );
                    } catch (Throwable ignored) {
                    }

                    if (!ids.isEmpty()) break;
                }
            }

            Object parent = currentView.getParent();
            currentView = parent instanceof View
                    ? (View) parent
                    : null;
        }

        return ids;
    }

    @Nullable
    private static String resolveFlyoutViewPlaylistId(
            View clickedView,
            Object sourceObject
    ) {
        String playlistId = findBestPlaylistId(
                collectObjectStrings(sourceObject)
        );

        if (PinStore.isSupportedPlaylistId(playlistId)) {
            return playlistId;
        }

        playlistId = findOnlySupportedPlaylistId(
                collectCanonicalPlaylistIds(sourceObject, 14)
        );

        if (PinStore.isSupportedPlaylistId(playlistId)) {
            Log.d(TAG, "FlyoutPageIdentityBridge"
                    + " source=canonicalSourceGraph"
                    + " playlistId=" + playlistId
                    + " sourceType=" + objectTypeName(sourceObject));
            return playlistId;
        }

        Set<String> viewIds =
                collectPlaylistIdsFromFlyoutView(clickedView);
        playlistId = findOnlySupportedPlaylistId(viewIds);

        if (PinStore.isSupportedPlaylistId(playlistId)) {
            Log.d(TAG, "FlyoutPageIdentityBridge"
                    + " source=viewCarrier"
                    + " playlistId=" + playlistId
                    + " sourceType=" + objectTypeName(sourceObject));
        }

        return playlistId;
    }

    public static void captureFlyoutViewContext(
            @Nullable View clickedView,
            @Nullable Object sourceObject
    ) {
        try {
            captureFlyoutViewContextInternal(
                    clickedView,
                    sourceObject
            );
        } catch (Throwable error) {
            Log.e(TAG, "Failed capturing flyout View context", error);
            clearActiveFlyoutRowContext();
            pendingFlyoutViewPlaylistId = null;
            pendingFlyoutViewCapturedAtMs = 0L;
        }
    }

    private static void captureFlyoutViewContextInternal(
            @Nullable View clickedView,
            @Nullable Object sourceObject
    ) {
        if (!isFeatureEnabled()) {
            return;
        }
        if (!flyoutViewEntryLogged) {
            flyoutViewEntryLogged = true;
            Log.d(TAG, "DiagnosticBuild=" + BUILD_ID
                    + " flyoutViewHook=true"
                    + " viewType=" + objectTypeName(clickedView)
                    + " sourceType=" + objectTypeName(sourceObject));
        }

        clearActiveFlyoutRowContext();
        pendingFlyoutViewPlaylistId = null;
        pendingFlyoutViewCapturedAtMs = 0L;

        if (clickedView == null || sourceObject == null) return;

        String playlistId = resolveFlyoutViewPlaylistId(
                clickedView,
                sourceObject
        );
        if (!PinStore.isSupportedPlaylistId(playlistId)) {
            Log.d(TAG, "FlyoutRowKey playlistId unavailable");
            return;
        }

        rememberPendingFlyoutViewPlaylistId(playlistId);

        View descendant = clickedView;
        Object current = clickedView;

        for (int depth = 0; depth < 14 && current != null; depth++) {
            if (current instanceof View
                    && current.getClass().getName().contains("RecyclerView")) {
                diagnoseFlyoutRecyclerRow(
                        current,
                        descendant,
                        playlistId
                );
                return;
            }

            if (current instanceof View) {
                descendant = (View) current;
                current = ((View) current).getParent();
            } else {
                current = invokeNoArg(current, "getParent");
            }
        }

        Log.d(TAG, "FlyoutRowKey RecyclerView not found"
                + " playlistId=" + playlistId);
    }

    private static void diagnoseFlyoutRecyclerRow(
            Object recycler,
            View directChild,
            String playlistId
    ) {
        Object adapter = invokeNoArg(recycler, "getAdapter");

        if (!isLibraryAdapter(adapter)) {
            adapter = readFieldByName(recycler, "m");
        }

        if (!isLibraryAdapter(adapter)) {
            adapter = findFieldValueByRuntimeTypes(
                    recycler,
                    LIBRARY_ADAPTER_CLASSES
            );
        }

        Object controller = readFieldByName(adapter, "d");
        Object listObject = readFieldByName(controller, "b");

        if (!(listObject instanceof List)) {
            Log.d(TAG, "FlyoutRowKey backing list unavailable"
                    + " playlistId=" + playlistId
                    + " recyclerType=" + objectTypeName(recycler)
                    + " adapterType=" + objectTypeName(adapter)
                    + " controllerType=" + objectTypeName(controller)
                    + " listType=" + objectTypeName(listObject));
            return;
        }

        activeFlyoutRowPlaylistId = playlistId;

        List<?> items = (List<?>) listObject;
        int childIndex = -1;

        if (recycler instanceof ViewGroup) {
            childIndex = ((ViewGroup) recycler).indexOfChild(directChild);
        }

        Object holder = findViewHolder(
                recycler,
                directChild
        );

        Map<String, Integer> recyclerPositions =
                invokeViewIntMethods(recycler, directChild);
        Map<String, Integer> holderPositions =
                invokeNoArgIntMethods(holder);
        Map<String, Long> holderPrimitiveFields =
                readPrimitiveNumberFields(holder);

        List<Long> stableIds = new ArrayList<>();
        for (Object item : items) {
            Object stableId = readFieldByName(item, "b");
            stableIds.add(stableId instanceof Number
                    ? ((Number) stableId).longValue()
                    : null);
        }

        int resolvedPosition = resolveRowPosition(
                items.size(),
                stableIds,
                recyclerPositions,
                holderPositions,
                holderPrimitiveFields
        );

        int resolvedSourcePosition =
                mappedSourcePosition(adapter, resolvedPosition);

        Long stableRowId = resolvedSourcePosition >= 0
                && resolvedSourcePosition < stableIds.size()
                ? stableIds.get(resolvedSourcePosition)
                : null;

        activeFlyoutAdapterPosition = resolvedPosition;
        activeFlyoutStableRowId = stableRowId;
        activeFlyoutRowView = directChild;
        activeLibraryAdapter = adapter;
        activeLibraryBackingList = items;

        String rowSignature = buildRowIdentitySignature(
                collectRowTextValues(directChild)
        );
        Context context = directChild.getContext();

        if (rowSignature != null && context != null) {
            resolveBoundPlaylistId(context, rowSignature, playlistId);
            PinStore.setPlaylistSignature(
                    context,
                    playlistId,
                    rowSignature
            );
        }

        if (stableRowId != null) {
            rememberAdapterPlaylistId(
                    adapter,
                    stableRowId,
                    playlistId
            );
            rememberAdapterNativeOrder(adapter, items);
        }

        Log.d(TAG, "FlyoutRowKey"
                + " playlistId=" + playlistId
                + " adapterType=" + objectTypeName(adapter)
                + " total=" + items.size()
                + " childIndex=" + childIndex
                + " rowType=" + objectTypeName(directChild)
                + " rowText=" + collectRowText(directChild)
                + " holderType=" + objectTypeName(holder)
                + " recyclerPositions=" + recyclerPositions
                + " holderPositions=" + holderPositions
                + " holderFields=" + holderPrimitiveFields
                + " stableIds=" + stableIds
                + " resolvedPosition=" + resolvedPosition
                + " resolvedSourcePosition=" + resolvedSourcePosition
                + " stableRowId=" + stableRowId);
    }

    @Nullable
    private static Object findFieldValueByRuntimeType(
            @Nullable Object receiver,
            String runtimeTypeName
    ) {
        if (receiver == null) return null;

        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (field.getType().isPrimitive()) continue;

                try {
                    field.setAccessible(true);
                    Object value = field.get(receiver);

                    if (value != null
                            && runtimeTypeName.equals(
                            value.getClass().getName()
                    )) {
                        return value;
                    }
                } catch (Throwable ignored) {
                }
            }
        }

        return null;
    }

    @Nullable
    private static Object findFieldValueByRuntimeTypes(
            @Nullable Object receiver,
            String[] runtimeTypeNames
    ) {
        for (String runtimeTypeName : runtimeTypeNames) {
            Object value = findFieldValueByRuntimeType(
                    receiver,
                    runtimeTypeName
            );

            if (value != null) return value;
        }

        return null;
    }

    @Nullable
    private static Object findViewHolder(
            Object recycler,
            View directChild
    ) {
        ViewGroup.LayoutParams layoutParams =
                directChild.getLayoutParams();

        if (layoutParams != null) {
            for (Class<?> current = layoutParams.getClass();
                 current != null && current != Object.class;
                 current = current.getSuperclass()) {
                Field[] fields;
                try {
                    fields = current.getDeclaredFields();
                } catch (Throwable ignored) {
                    continue;
                }

                for (Field field : fields) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    if (field.getType().isPrimitive()) continue;

                    try {
                        field.setAccessible(true);
                        Object value = field.get(layoutParams);

                        if (isViewHolderObject(value)) {
                            Log.d(TAG, "FlyoutRowHolder"
                                    + " source=layoutParams"
                                    + " field=" + current.getName()
                                    + "." + field.getName()
                                    + " valueType="
                                    + value.getClass().getName());
                            return value;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
        }

        for (Class<?> current = recycler.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Method[] methods;
            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }

            for (Method method : methods) {
                if (Modifier.isStatic(method.getModifiers())) continue;
                if (method.getParameterTypes().length != 1) continue;
                if (!method.getParameterTypes()[0].isAssignableFrom(
                        directChild.getClass()
                )) continue;
                if (method.getReturnType().isPrimitive()) continue;
                if (method.getReturnType() == Void.TYPE) continue;
                if (!isViewHolderClass(method.getReturnType())) continue;

                try {
                    method.setAccessible(true);
                    Object value = method.invoke(recycler, directChild);

                    if (isViewHolderObject(value)) {
                        Log.d(TAG, "FlyoutRowHolder"
                                + " source=method"
                                + " method=" + current.getName()
                                + "." + method.getName()
                                + " valueType="
                                + value.getClass().getName());
                        return value;
                    }
                } catch (Throwable ignored) {
                }
            }
        }

        return null;
    }

    private static boolean isViewHolderObject(
            @Nullable Object value
    ) {
        return value != null && isViewHolderClass(value.getClass());
    }

    private static boolean isViewHolderClass(
            @Nullable Class<?> type
    ) {
        for (Class<?> current = type;
             current != null;
             current = current.getSuperclass()) {
            if ("vt".equals(current.getName())) return true;
        }

        return false;
    }

    private static Map<String, Integer> invokeViewIntMethods(
            Object receiver,
            View argument
    ) {
        Map<String, Integer> results = new java.util.LinkedHashMap<>();

        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Method[] methods;
            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }

            for (Method method : methods) {
                if (Modifier.isStatic(method.getModifiers())) continue;
                if (method.getReturnType() != Integer.TYPE) continue;
                if (method.getParameterTypes().length != 1) continue;
                if (!method.getParameterTypes()[0].isAssignableFrom(
                        argument.getClass()
                )) continue;

                try {
                    method.setAccessible(true);
                    Object value = method.invoke(receiver, argument);
                    if (value instanceof Number) {
                        results.put(
                                current.getName() + "." + method.getName(),
                                ((Number) value).intValue()
                        );
                    }
                } catch (Throwable ignored) {
                }
            }
        }

        return results;
    }

    private static Map<String, Integer> invokeNoArgIntMethods(
            @Nullable Object receiver
    ) {
        Map<String, Integer> results = new java.util.LinkedHashMap<>();
        if (receiver == null) return results;

        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Method[] methods;
            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }

            for (Method method : methods) {
                if (Modifier.isStatic(method.getModifiers())) continue;
                if (method.getReturnType() != Integer.TYPE) continue;
                if (method.getParameterTypes().length != 0) continue;

                try {
                    method.setAccessible(true);
                    Object value = method.invoke(receiver);
                    if (value instanceof Number) {
                        results.put(
                                current.getName() + "." + method.getName(),
                                ((Number) value).intValue()
                        );
                    }
                } catch (Throwable ignored) {
                }
            }
        }

        return results;
    }

    private static Map<String, Long> readPrimitiveNumberFields(
            @Nullable Object receiver
    ) {
        Map<String, Long> results = new java.util.LinkedHashMap<>();
        if (receiver == null) return results;

        for (Class<?> current = receiver.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;

                Class<?> type = field.getType();
                if (type != Integer.TYPE
                        && type != Long.TYPE
                        && type != Short.TYPE
                        && type != Byte.TYPE) {
                    continue;
                }

                try {
                    field.setAccessible(true);
                    Object value = field.get(receiver);
                    if (value instanceof Number) {
                        results.put(
                                current.getName() + "." + field.getName(),
                                ((Number) value).longValue()
                        );
                    }
                } catch (Throwable ignored) {
                }
            }
        }

        return results;
    }

    private static int resolveRowPosition(
            int itemCount,
            List<Long> stableIds,
            Map<String, Integer> recyclerPositions,
            Map<String, Integer> holderPositions,
            Map<String, Long> holderFields
    ) {
        /*
         * Strongest signal: RecyclerView View->int methods. Obfuscation changes
         * their names, but getChildAdapterPosition/getChildLayoutPosition retain
         * this exact signature and return the same in-range position.
         */
        Set<Integer> recyclerCandidates = new LinkedHashSet<>();
        for (Integer value : recyclerPositions.values()) {
            if (value != null && value >= 0 && value < itemCount) {
                recyclerCandidates.add(value);
            }
        }

        if (recyclerCandidates.size() == 1) {
            return recyclerCandidates.iterator().next();
        }

        /*
         * Next strongest signal: the holder's stored item-id long matching
         * hyz.iv(position), which is hvg.b converted to long.
         */
        for (Long fieldValue : holderFields.values()) {
            if (fieldValue == null) continue;

            for (int index = 0; index < stableIds.size(); index++) {
                Long stableId = stableIds.get(index);
                if (stableId != null && stableId.equals(fieldValue)) {
                    return index;
                }
            }
        }

        Set<Integer> holderCandidates = new LinkedHashSet<>();

        for (Integer value : holderPositions.values()) {
            if (value != null && value >= 0 && value < itemCount) {
                holderCandidates.add(value);
            }
        }

        for (Long value : holderFields.values()) {
            if (value != null && value >= 0 && value < itemCount) {
                holderCandidates.add(value.intValue());
            }
        }

        if (holderCandidates.size() == 1) {
            return holderCandidates.iterator().next();
        }

        return -1;
    }

    private static String collectRowText(View root) {
        List<String> values = collectRowTextValues(root);

        if (values.isEmpty()) return "[]";
        return values.toString();
    }

    private static List<String> collectRowTextValues(
            View root
    ) {
        List<String> values = new ArrayList<>();
        collectRowTextRecursive(root, values, 0);
        return values;
    }

    private static void collectRowTextRecursive(
            View view,
            List<String> values,
            int depth
    ) {
        if (view == null || depth > 8 || values.size() >= 12) return;

        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            if (text != null) {
                String value = text.toString().trim();
                if (!value.isEmpty() && !values.contains(value)) {
                    values.add(value);
                }
            }
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            int count = Math.min(group.getChildCount(), 30);

            for (int index = 0; index < count; index++) {
                collectRowTextRecursive(
                        group.getChildAt(index),
                        values,
                        depth + 1
                );
            }
        }
    }







    @Nullable
    private static Object invokeNoArg(Object receiver, String methodName) {
        if (receiver == null) return null;

        try {
            Method method = receiver.getClass().getMethod(methodName);
            method.setAccessible(true);
            return method.invoke(receiver);
        } catch (Throwable ignored) {
            return null;
        }
    }

    @Nullable
    private static Object invokeOneIntArgument(
            @Nullable Object receiver,
            String methodName,
            int argument
    ) {
        if (receiver == null) return null;

        for (Class<?> current = receiver.getClass();
             current != null;
             current = current.getSuperclass()) {
            Method[] methods;

            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }

            for (Method method : methods) {
                if (!method.getName().equals(methodName)) {
                    continue;
                }

                Class<?>[] parameters =
                        method.getParameterTypes();

                if (parameters.length != 1
                        || parameters[0] != int.class) {
                    continue;
                }

                try {
                    method.setAccessible(true);
                    return method.invoke(
                            receiver,
                            argument
                    );
                } catch (Throwable ignored) {
                }
            }
        }

        return null;
    }

    @Nullable
    private static Integer invokeIntNoArg(Object receiver, String methodName) {
        Object result = invokeNoArg(receiver, methodName);
        return result instanceof Number ? ((Number) result).intValue() : null;
    }







    private static String objectTypeName(@Nullable Object value) {
        return value == null ? "null" : value.getClass().getName();
    }

    private static boolean isLibraryAdapter(@Nullable Object value) {
        if (value == null) return false;

        String typeName = value.getClass().getName();
        for (String candidate : LIBRARY_ADAPTER_CLASSES) {
            if (candidate.equals(typeName)) return true;
        }

        return false;
    }


    @Nullable
    private static String consumeActiveFlyoutPlaylistId() {
        String id = activeFlyoutPlaylistId;
        long capturedAt = activeFlyoutCapturedAtMs;
        long now = android.os.SystemClock.elapsedRealtime();

        activeFlyoutPlaylistId = null;
        activeFlyoutHasSpeedDial = false;
        activeFlyoutCapturedAtMs = 0L;

        if (id == null) return null;
        if (capturedAt <= 0L) return null;
        if (now - capturedAt > ACTIVE_FLYOUT_ID_TTL_MS) {
            Log.d(TAG, "Discarded stale active flyout playlist id=" + id);
            return null;
        }

        return id;
    }

    @Nullable
    private static String lookupPlaylistIdFromPresenterGraph(
            @Nullable Object presenter
    ) {
        if (presenter == null) return null;

        IdentityHashMap<Object, Boolean> visited = new IdentityHashMap<>();
        int[] visitedCount = new int[]{0};

        return lookupPlaylistIdFromPresenterGraphRecursive(
                presenter,
                visited,
                visitedCount,
                0
        );
    }

    @Nullable
    private static String lookupPlaylistIdFromPresenterGraphRecursive(
            @Nullable Object value,
            IdentityHashMap<Object, Boolean> visited,
            int[] visitedCount,
            int depth
    ) {
        if (value == null || depth > MAX_REFLECTION_DEPTH) return null;
        if (visitedCount[0] >= MAX_VISITED_OBJECTS_PER_ROW) return null;

        synchronized (flyoutPresenterIds) {
            String mapped = flyoutPresenterIds.get(value);
            if (mapped != null) return mapped;
        }

        Class<?> type = value.getClass();
        if (isTerminalType(type) || type.isPrimitive()) return null;
        if (value instanceof byte[] || isByteContainer(type)) return null;

        if (visited.put(value, Boolean.TRUE) != null) return null;
        visitedCount[0]++;

        if (type.isArray()) {
            int length = Array.getLength(value);
            for (int index = 0; index < length; index++) {
                String found = lookupPlaylistIdFromPresenterGraphRecursive(
                        Array.get(value, index),
                        visited,
                        visitedCount,
                        depth + 1
                );
                if (found != null) return found;
            }
            return null;
        }

        if (value instanceof Iterable) {
            for (Object item : (Iterable<?>) value) {
                String found = lookupPlaylistIdFromPresenterGraphRecursive(
                        item,
                        visited,
                        visitedCount,
                        depth + 1
                );
                if (found != null) return found;
            }
            return null;
        }

        if (value instanceof Map) {
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) value).entrySet()) {
                String found = lookupPlaylistIdFromPresenterGraphRecursive(
                        entry.getKey(),
                        visited,
                        visitedCount,
                        depth + 1
                );
                if (found != null) return found;

                found = lookupPlaylistIdFromPresenterGraphRecursive(
                        entry.getValue(),
                        visited,
                        visitedCount,
                        depth + 1
                );
                if (found != null) return found;
            }
            return null;
        }

        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable error) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (field.getType().isPrimitive()) continue;

                try {
                    field.setAccessible(true);
                    String found = lookupPlaylistIdFromPresenterGraphRecursive(
                            field.get(value),
                            visited,
                            visitedCount,
                            depth + 1
                    );
                    if (found != null) return found;
                } catch (Throwable ignored) {
                }
            }
        }

        return null;
    }

    @Nullable
    private static String lookupFlyoutPlaylistId(@Nullable Object menuItem) {
        if (menuItem == null) return null;

        synchronized (flyoutObjectIds) {
            return flyoutObjectIds.get(menuItem);
        }
    }


    private static void collectDiagnosticStringsRecursive(
            @Nullable Object value,
            Set<String> candidates,
            IdentityHashMap<Object, Boolean> visited,
            int[] visitedCount,
            int depth
    ) {
        if (value == null || depth > MAX_REFLECTION_DEPTH) return;
        if (visitedCount[0] >= MAX_VISITED_OBJECTS_PER_ROW) return;
        if (candidates.size() >= MAX_DIAGNOSTIC_STRINGS) return;

        if (value instanceof CharSequence) {
            addDiagnosticString(value.toString(), candidates);
            return;
        }

        byte[] bytes = extractByteContainer(value);
        if (bytes != null && bytes.length != 0) {
            addPrintableCandidates(bytes, candidates);

            if (value instanceof byte[] || isByteContainer(value.getClass())) {
                return;
            }
        }

        Class<?> type = value.getClass();
        if (isTerminalType(type)) return;

        if (visited.put(value, Boolean.TRUE) != null) return;
        visitedCount[0]++;

        if (type.isArray()) {
            int length = Array.getLength(value);
            for (int index = 0; index < length; index++) {
                collectDiagnosticStringsRecursive(
                        Array.get(value, index),
                        candidates,
                        visited,
                        visitedCount,
                        depth + 1
                );
                if (candidates.size() >= MAX_DIAGNOSTIC_STRINGS) return;
            }
            return;
        }

        if (value instanceof Iterable) {
            for (Object item : (Iterable<?>) value) {
                collectDiagnosticStringsRecursive(
                        item,
                        candidates,
                        visited,
                        visitedCount,
                        depth + 1
                );
                if (candidates.size() >= MAX_DIAGNOSTIC_STRINGS) return;
            }
            return;
        }

        if (value instanceof Map) {
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) value).entrySet()) {
                collectDiagnosticStringsRecursive(
                        entry.getKey(),
                        candidates,
                        visited,
                        visitedCount,
                        depth + 1
                );
                collectDiagnosticStringsRecursive(
                        entry.getValue(),
                        candidates,
                        visited,
                        visitedCount,
                        depth + 1
                );
                if (candidates.size() >= MAX_DIAGNOSTIC_STRINGS) return;
            }
            return;
        }

        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable error) {
                continue;
            }

            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (field.getType().isPrimitive()) continue;

                try {
                    field.setAccessible(true);
                    collectDiagnosticStringsRecursive(
                            field.get(value),
                            candidates,
                            visited,
                            visitedCount,
                            depth + 1
                    );
                } catch (Throwable ignored) {
                }

                if (candidates.size() >= MAX_DIAGNOSTIC_STRINGS) return;
            }
        }
    }

    private static void logCandidateSet(
            String prefix,
            Set<String> candidates
    ) {
        if (candidates == null || candidates.isEmpty()) {
            Log.d(TAG, prefix + "[none]");
            return;
        }

        int index = 0;
        for (String candidate : candidates) {
            Log.d(TAG, prefix + "[" + index + "]=" + candidate);
            index++;
        }
    }

    private static void addDiagnosticString(
            @Nullable String value,
            Set<String> diagnosticStrings
    ) {
        if (value == null || diagnosticStrings.size() >= MAX_DIAGNOSTIC_STRINGS) {
            return;
        }

        String candidate = value.trim();
        if (candidate.length() < 3 || candidate.length() > 180) return;

        // Keep likely YouTube identifiers and short human-readable protobuf
        // strings. This is diagnostic only and does not affect row ordering.
        boolean likelyIdentifier =
                candidate.startsWith("VL")
                || candidate.startsWith("PL")
                || candidate.startsWith("OLAK5uy_")
                || candidate.startsWith("RD")
                || candidate.startsWith("UC")
                || candidate.startsWith("MPRE")
                || candidate.contains("playlist")
                || candidate.contains("browse")
                || candidate.contains("navigation");

        boolean readable = true;
        for (int index = 0; index < candidate.length(); index++) {
            char character = candidate.charAt(index);
            if (character < 0x20 || character > 0x7e) {
                readable = false;
                break;
            }
        }

        if (likelyIdentifier || (readable && candidate.length() <= 80)) {
            diagnosticStrings.add(candidate);
        }
    }

    /**
     * Pulls printable protobuf string payloads out of serialized bytes without
     * needing the obfuscated schema. Protobuf length-delimited strings usually
     * appear as contiguous printable ASCII runs.
     */
    private static void addPrintableCandidates(
            byte[] bytes,
            Set<String> diagnosticStrings
    ) {
        if (diagnosticStrings.size() >= MAX_DIAGNOSTIC_STRINGS) return;

        int start = -1;

        for (int index = 0; index <= bytes.length; index++) {
            boolean printable =
                    index < bytes.length
                    && bytes[index] >= 0x20
                    && bytes[index] <= 0x7e;

            if (printable) {
                if (start < 0) start = index;
                continue;
            }

            if (start >= 0) {
                int length = index - start;
                if (length >= 3 && length <= 180) {
                    try {
                        addDiagnosticString(
                                new String(
                                        bytes,
                                        start,
                                        length,
                                        java.nio.charset.StandardCharsets.UTF_8
                                ),
                                diagnosticStrings
                        );
                    } catch (Throwable ignored) {
                    }
                }
                start = -1;

                if (diagnosticStrings.size() >= MAX_DIAGNOSTIC_STRINGS) {
                    return;
                }
            }
        }
    }

    /**
     * Returns bytes from either a raw byte[] or a protobuf ByteString-style
     * wrapper. Generated protobuf models commonly store endpoint payloads in
     * ByteString objects rather than directly in byte[] fields.
     */
    @Nullable
    private static byte[] extractByteContainer(@Nullable Object value) {
        if (value == null) return null;
        if (value instanceof byte[]) return (byte[]) value;

        Class<?> type = value.getClass();
        if (!isByteContainer(type)) return null;

        try {
            Method method = type.getMethod("toByteArray");
            if (method.getParameterTypes().length == 0
                    && method.getReturnType() == byte[].class) {
                Object result = method.invoke(value);
                return result instanceof byte[] ? (byte[]) result : null;
            }
        } catch (Throwable ignored) {
        }

        try {
            Method method = type.getDeclaredMethod("toByteArray");
            method.setAccessible(true);
            if (method.getParameterTypes().length == 0
                    && method.getReturnType() == byte[].class) {
                Object result = method.invoke(value);
                return result instanceof byte[] ? (byte[]) result : null;
            }
        } catch (Throwable ignored) {
        }

        return null;
    }

    private static boolean isByteContainer(Class<?> type) {
        if (type == byte[].class) return true;

        String name = type.getName();
        if (name.contains("ByteString")) return true;

        // Obfuscation may rename the class while retaining the public protobuf
        // API method. Only accept an exact no-argument toByteArray() -> byte[].
        for (Method method : type.getMethods()) {
            if (method.getName().equals("toByteArray")
                    && method.getParameterTypes().length == 0
                    && method.getReturnType() == byte[].class) {
                return true;
            }
        }

        return false;
    }

    private static boolean isTerminalType(Class<?> type) {
        if (type.isPrimitive() || type.isEnum()) return true;

        String name = type.getName();

        return name.equals("java.lang.String")
                || name.equals("java.lang.Class")
                || name.equals("java.lang.Boolean")
                || name.equals("java.lang.Byte")
                || name.equals("java.lang.Short")
                || name.equals("java.lang.Integer")
                || name.equals("java.lang.Long")
                || name.equals("java.lang.Float")
                || name.equals("java.lang.Double")
                || name.equals("java.lang.Character")
                || name.startsWith("java.lang.reflect.")
                || name.startsWith("android.view.")
                || name.startsWith("android.graphics.")
                || name.startsWith("android.content.res.");
    }

    @Nullable
    private static Context resolveApplicationContext() {
        Context cached = applicationContext;
        if (cached != null) return cached;

        try {
            Class<?> activityThread =
                    Class.forName("android.app.ActivityThread");
            Method currentApplication =
                    activityThread.getDeclaredMethod("currentApplication");
            currentApplication.setAccessible(true);

            Object application = currentApplication.invoke(null);
            if (application instanceof Context) {
                Context context =
                        ((Context) application).getApplicationContext();
                applicationContext = context;
                return context;
            }
        } catch (Throwable error) {
            Log.e(TAG, "Unable to resolve application Context", error);
        }

        return null;
    }

    private PinPlaylistPatch() {
    }
}
