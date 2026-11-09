package com.anderson.applemusic.one;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import com.anderson.applemusic.one.media.ArtworkLoader;
import com.anderson.applemusic.one.media.CatalogSearch;
import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.screen.AccountScreen;
import com.anderson.applemusic.one.screen.ChildSink;
import com.anderson.applemusic.one.screen.CollectionScreen;
import com.anderson.applemusic.one.screen.DetailScreen;
import com.anderson.applemusic.one.screen.HomeScreen;
import com.anderson.applemusic.one.screen.LibraryScreen;
import com.anderson.applemusic.one.screen.NowPlayingScreen;
import com.anderson.applemusic.one.screen.RadioScreen;
import com.anderson.applemusic.one.screen.ScreenHost;
import com.anderson.applemusic.one.screen.SearchScreen;
import com.anderson.applemusic.one.screen.UpdatesScreen;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.ActionSheet;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.MiniPlayer;
import com.anderson.applemusic.one.widget.TopBar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The single-APK shell: framework-only views (no resources, no AndroidX, no Compose) so the
 * UI can live as an extra dex inside the patched Apple Music engine APK.
 *
 * <p>This class owns the engine wiring (MediaBrowser, updater, Apple ID sheet, install
 * status) and the overlay navigation; the pixels live in {@code theme/}, {@code widget/}
 * and {@code screen/}.
 */
public final class OneActivity extends Activity
        implements MediaClient.Listener, UpdateManager.Listener, ScreenHost {

    private static final String TAG = "AppleMusicOne";
    static final String ACTION_INSTALL_STATUS = "com.anderson.applemusic.one.INSTALL_STATUS";

    /** Auth type we ask the engine for: always show the Apple ID page. */
    private static final String AUTH_TYPE_CLASS =
            "com.apple.mediaservices.amskit.authentication.AuthenticateRequest$Type";
    /** Validated engine deep link: ACTION_VIEW + MainActivity opens its Account screen. */
    private static final String ACCOUNT_SUMMARY_URL =
            "https://itunes.apple.com/accountSummary";
    /** R8-renamed navigation helper used by the engine to reach its settings fragment. */
    private static final String SETTINGS_NAV_CLASS = "M9.p";
    private static final String SETTINGS_DESTINATION = "action_settings";
    /** Time for the host activity to build its window/ComposeView before we drive it. */
    private static final long SIGN_IN_SETTLE_MS = 400L;
    /** How often the sign-in sheet state is checked while the engine host is on top. */
    private static final long AUTH_POLL_MS = 250L;
    /** MediaBrowser reconnection backoff: 0.5 s, 1 s, 2 s, 4 s, 8 s, ... capped at 30 s. */
    private static final long RECONNECT_INITIAL_MS = 500L;
    private static final long RECONNECT_MAX_MS = 30000L;

    private static final long TICK_MS = 500L;
    private static final long ACTION_TIMEOUT_MS = 2500L;
    private static final String ACTION_CREATE_STATION = "CREATE_STATION";
    private static final String ACTION_SHUFFLE = "SHUFFLE";
    private static final String ACTION_REPEAT = "REPEAT";
    private static final String ACTION_FAVORITE = "FAVORITE";
    private static final String ACTION_ADD_TO_LIBRARY = "ADD_TO_LIBRARY";

    private static final int KIND_HOME = 0;
    private static final int KIND_RADIO = 1;
    private static final int KIND_LIBRARY = 2;

    /** Stable library tab node; the cache is keyed by it even before the tabs arrive. */
    private static final String LIBRARY_ROOT = "__AUTO_ROOT__/library";

    /** Saved state keys: the screen the user was on, not just the tab. */
    private static final String KEY_TAB = "one.tab";
    private static final String KEY_TAB_ID = "one.tab.id";
    private static final String KEY_REFRESH = "one.refreshOnResume";
    private static final String KEY_ACCOUNT = "one.account.open";
    private static final String KEY_UPDATES = "one.updates.open";
    private static final String KEY_PLAYER = "one.player.open";
    private static final String KEY_QUEUE = "one.player.queue";
    private static final String KEY_ACTIONS = "one.actions.open";
    private static final String KEY_ACTIONS_HEADING = "one.actions.heading";
    private static final String KEY_ACTIONS_SUBTITLE = "one.actions.subtitle";
    private static final String KEY_ACTIONS_ITEM = "one.actions.hasItem";
    private static final String KEY_ACTIONS_ID = "one.actions.id";
    private static final String KEY_ACTIONS_TITLE = "one.actions.title";
    private static final String KEY_ACTIONS_DETAIL = "one.actions.detail";
    private static final String KEY_ACTIONS_ART = "one.actions.art";
    private static final String KEY_ACTIONS_BROWSABLE = "one.actions.browsable";
    private static final String KEY_ACTIONS_PLAYABLE = "one.actions.playable";
    private static final String KEY_COLLECTION_GRID = "one.collection.grid";
    private static final String PREFIX_COLLECTION = "one.collection";
    private static final String PREFIX_RADIO = "one.radio";

    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService loader = Executors.newSingleThreadExecutor();

    private MediaClient client;
    private ArtworkLoader artwork;
    private CatalogSearch catalog;
    private UpdateManager updater;

    /** The engine activity ran; rebuild the browse tree when we are back on top. */
    private boolean refreshOnResume;
    /** A reconnect to the engine service is wanted (it may still be restarting). */
    private boolean reconnecting;
    /** A reconnect is pending while the activity is stopped; it restarts in onStart. */
    private boolean reconnectPending;
    /** Current backoff step; reset when the MediaBrowser connects. */
    private long reconnectDelay = RECONNECT_INITIAL_MS;
    private boolean started;
    private boolean tickerRunning;
    private boolean destroyed;
    private boolean refreshingCatalog;
    private Runnable authPoll;
    private Application.ActivityLifecycleCallbacks accountWatcher;
    private Runnable accountWatcherTimeout;
    private final Runnable reconnect = new Runnable() {
        @Override
        public void run() {
            if (!reconnecting) return;
            Log.i(TAG, "reconnecting to the engine");
            client.disconnect();
            client.connect();
        }
    };

    private FrameLayout rootFrame;
    private LinearLayout base;
    private TopBar topBar;
    private FrameLayout screenHost;
    private TextView status;
    private MiniPlayer miniPlayer;

    private HomeScreen homeScreen;
    private CollectionScreen tabCollection;
    private LibraryScreen libraryScreen;
    private FrameLayout collectionHost;
    private CollectionScreen overlayCollection;
    private FrameLayout detailHost;
    private DetailScreen detailScreen;

    private NowPlayingScreen playerScreen;
    private SearchScreen searchScreen;
    private ActionSheet actionSheet;
    private UpdatesScreen updatesScreen;
    private AccountScreen accountScreen;

    private final List<MediaClient.Item> tabs = new ArrayList<MediaClient.Item>();
    /** Library sections kept in memory so a rotation does not lose the local search scope. */
    private static List<LibrarySection> librarySnapshot;
    /** Browse subscriptions waiting for children; more than one screen can want a node. */
    private final Map<String, List<ChildSink>> pending =
            new HashMap<String, List<ChildSink>>();
    private int selectedTab = -1;

    /** State of the activity that was destroyed by a rotation, until the tree arrives. */
    private Bundle restoreState;
    private int restoreTabIndex = -1;
    private String restoreTabId;
    private boolean restorePlayer;
    private boolean restoreQueue;
    private boolean restoreActions;
    private String actionsHeading = "Ações";
    private String actionsSubtitle;
    private MediaClient.Item actionsItem;
    private boolean overlayGrid;

    private MediaClient.Snapshot latest = new MediaClient.Snapshot();
    private boolean rootReceived;
    private boolean hasTouch;
    private boolean miniVisible;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        // Same style the injected android:theme points at; belt and braces if the binary
        // manifest keeps the engine's own theme. On API < 30 the compile-time framework id
        // may not exist, so the engine theme wins and its windowLayoutInDisplayCutoutMode=3
        // crashes PhoneWindow.generateLayout; resolve the style by name at runtime.
        int themeId;
        if (Build.VERSION.SDK_INT < 30) {
            themeId = getResources().getIdentifier("Theme_Material_NoActionBar", "style", "android");
            if (themeId == 0) {
                themeId = getResources().getIdentifier("Theme.Material.NoActionBar", "style", "android");
            }
        } else {
            themeId = android.R.style.Theme_Material_NoActionBar;
        }
        if (themeId != 0) {
            setTheme(themeId);
        }
        // The engine's application theme is compiled against API 36 and carries
        // windowLayoutInDisplayCutoutMode=3, which API 29 rejects while installing the
        // window decor. Replace the theme contents with a clean framework theme so the
        // attribute never reaches PhoneWindow.generateLayout.
        if (Build.VERSION.SDK_INT < 30) {
            android.content.res.Resources.Theme clean =
                    android.content.res.Resources.getSystem().newTheme();
            getTheme().setTo(clean);
            try {
                getTheme().applyStyle(android.R.style.Theme_Material_NoActionBar, true);
            } catch (Throwable ignored) {
                // An id that this ROM does not know is fine: the clean theme is enough.
            }
        }
        android.util.Log.i("OneTheme", "cutout themeId=" + themeId + " sdk=" + Build.VERSION.SDK_INT);
        Tokens.init(this);
        Inter.load(this);
        hasTouch = Tokens.touch();
        restoreState = state;
        if (state != null) {
            restoreTabIndex = state.getInt(KEY_TAB, -1);
            restoreTabId = state.getString(KEY_TAB_ID);
            refreshOnResume = state.getBoolean(KEY_REFRESH, false);
        }
        client = new MediaClient(this);
        artwork = new ArtworkLoader(this);
        catalog = new CatalogSearch(this);
        updater = new UpdateManager(this);
        updater.setListener(this);
        client.setListener(this);
        buildUi();
        client.connect();
        handleInstallStatus(getIntent());
        updater.autoCheck();
        restoreShell(state);
    }

    /**
     * Resumes the position ticker and any reconnection that was paused while the activity
     * was stopped. Nothing polls the engine in the background.
     */
    @Override
    protected void onStart() {
        super.onStart();
        started = true;
        if (!tickerRunning) {
            tickerRunning = true;
            main.removeCallbacks(ticker);
            main.postDelayed(ticker, TICK_MS);
        }
        if (reconnectPending) {
            reconnectPending = false;
            scheduleReconnect();
        }
    }

    @Override
    protected void onStop() {
        started = false;
        tickerRunning = false;
        main.removeCallbacks(ticker);
        main.removeCallbacks(reconnect);
        reconnectPending = reconnecting;
        super.onStop();
    }

    /**
     * Overlays that do not depend on the browse tree (account, updates, the catalogue
     * search) are reopened right away; the tab and the browse/detail overlays wait for
     * {@code __AUTO_ROOT__} so they subscribe to a connected {@link MediaClient}.
     */
    private void restoreShell(Bundle state) {
        if (state == null) return;
        if (state.getBoolean(KEY_ACCOUNT, false)) accountScreen.open();
        if (state.getBoolean(KEY_UPDATES, false)) updatesScreen.open();
        if (state.getBoolean("one.search.open", false)) {
            searchScreen.restoreState(state);
            searchScreen.openRestored();
        }
        restorePlayer = state.getBoolean(KEY_PLAYER, false);
        restoreQueue = state.getBoolean(KEY_QUEUE, false);
        restoreActions = state.getBoolean(KEY_ACTIONS, false);
        if (restoreActions) {
            actionsHeading = state.getString(KEY_ACTIONS_HEADING, "Ações");
            actionsSubtitle = state.getString(KEY_ACTIONS_SUBTITLE, "");
            if (state.getBoolean(KEY_ACTIONS_ITEM, false)) {
                actionsItem = new MediaClient.Item(state.getString(KEY_ACTIONS_ID),
                        state.getString(KEY_ACTIONS_TITLE),
                        state.getString(KEY_ACTIONS_DETAIL),
                        state.getString(KEY_ACTIONS_ART),
                        state.getBoolean(KEY_ACTIONS_BROWSABLE, false),
                        state.getBoolean(KEY_ACTIONS_PLAYABLE, false));
            }
        }
        refreshAccessibility();
    }

    /**
     * The engine activity (sign-in host or the plain account screen) changes the account
     * or restarts its playback service; either way the tree, cache and covers are stale
     * when we come back, so reconnect and rebuild from {@code __AUTO_ROOT__}.
     */
    @Override
    protected void onResume() {
        super.onResume();
        if (refreshOnResume) {
            refreshOnResume = false;
            accountScreen.close();
            refreshFromEngine();
        }
    }

    private void refreshFromEngine() {
        Log.i(TAG, "back from the engine, rebuilding the browse session");
        resetBrowse();
        refreshingCatalog = true;
        reconnecting = true;
        reconnectDelay = RECONNECT_INITIAL_MS;
        setStatus("Atualizando o Apple Music…");
        client.disconnect();
        scheduleReconnect();
    }

    /**
     * Retries the MediaBrowser connection with exponential backoff (0.5 s doubling to
     * 30 s) while the activity is started. A failed/suspended service, a destroyed
     * session or an empty catalogue all land here, so a restarted engine is picked up
     * without the user reopening the app.
     */
    private void scheduleReconnect() {
        if (client == null || destroyed) return;
        reconnecting = true;
        main.removeCallbacks(reconnect);
        if (!started) {
            // No polling in the background: resume the attempt in onStart().
            reconnectPending = true;
            return;
        }
        reconnectPending = false;
        Log.i(TAG, "reconnect in " + reconnectDelay + " ms");
        main.postDelayed(reconnect, reconnectDelay);
        reconnectDelay = Math.min(reconnectDelay * 2L, RECONNECT_MAX_MS);
    }

    /** Drops the previous account's tabs, shelves, drill-down and covers. */
    private void resetBrowse() {
        rootReceived = false;
        disposeTabScreen();
        pending.clear();
        tabs.clear();
        librarySnapshot = null;
        topBar.setTabs(new String[0], -1);
        selectedTab = -1;
        closeCollectionOverlay();
        closeDetailOverlay();
        setStatus("");
    }

    // --- UI scaffolding -----------------------------------------------------------

    private void buildUi() {
        rootFrame = new FrameLayout(this);
        rootFrame.setBackgroundColor(Tokens.BG);
        // Android 15+ draws edge-to-edge for targetSdk 35+; keep the UI out of the
        // status/navigation bars on touch devices and TV alike.
        rootFrame.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public android.view.WindowInsets onApplyWindowInsets(View v,
                                                                 android.view.WindowInsets insets) {
                // All four sides: in landscape the (3-button) navigation bar sits on the
                // right and used to cover "Atualizações" and the mini player's play button.
                int left;
                int top;
                int right;
                int bottom;
                if (Build.VERSION.SDK_INT >= 30) {
                    android.graphics.Insets bars = insets.getInsets(
                            android.view.WindowInsets.Type.systemBars()
                                    | android.view.WindowInsets.Type.displayCutout());
                    left = bars.left;
                    top = bars.top;
                    right = bars.right;
                    bottom = bars.bottom;
                } else {
                    left = insets.getSystemWindowInsetLeft();
                    top = insets.getSystemWindowInsetTop();
                    right = insets.getSystemWindowInsetRight();
                    bottom = insets.getSystemWindowInsetBottom();
                    android.view.DisplayCutout cutout = insets.getDisplayCutout();
                    if (cutout != null) {
                        left = Math.max(left, cutout.getSafeInsetLeft());
                        top = Math.max(top, cutout.getSafeInsetTop());
                        right = Math.max(right, cutout.getSafeInsetRight());
                        bottom = Math.max(bottom, cutout.getSafeInsetBottom());
                    }
                }
                v.setPadding(left, top, right, bottom);
                return insets;
            }
        });

        base = new LinearLayout(this);
        base.setOrientation(LinearLayout.VERTICAL);
        base.setBackgroundColor(Tokens.BG);
        rootFrame.addView(base, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        topBar = new TopBar(this, new TopBar.Listener() {
            @Override
            public void onTabSelected(int index) {
                selectTab(index);
            }

            @Override
            public void onSearch() {
                openSearch();
            }

            @Override
            public void onAccount() {
                accountScreen.open();
                refreshAccessibility();
            }

            @Override
            public void onUpdates() {
                openUpdates();
            }

            @Override
            public void onDownFromChrome() {
                View target = firstFocusable(screenHost);
                if (target != null) target.requestFocus();
            }
        });
        base.addView(topBar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        screenHost = new FrameLayout(this);
        base.addView(screenHost, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        status = Inter.text(this, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        status.setPadding(Tokens.dp(16), Tokens.dp(3), Tokens.dp(16), Tokens.dp(4));
        status.setMaxLines(2);
        status.setEllipsize(TextUtils.TruncateAt.END);
        status.setVisibility(View.GONE);
        base.addView(status, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Overlays, bottom-up: collection browser, search, mini player, full player,
        // actions sheet, updates, account.
        collectionHost = new FrameLayout(this);
        collectionHost.setBackgroundColor(Tokens.BG);
        collectionHost.setVisibility(View.GONE);
        rootFrame.addView(collectionHost, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        searchScreen = new SearchScreen(this, this, artwork, catalog);
        rootFrame.addView(searchScreen.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Catalogue detail stack, above search and the collection browser so opening an
        // artist/album from either one keeps that screen underneath for BACK.
        detailHost = new FrameLayout(this);
        detailHost.setBackgroundColor(Tokens.BG);
        detailHost.setVisibility(View.GONE);
        rootFrame.addView(detailHost, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        miniPlayer = new MiniPlayer(this, new MiniPlayer.Listener() {
            @Override
            public void onOpen() {
                openPlayer();
            }

            @Override
            public void onToggle() {
                client.togglePlayPause();
            }
        });
        miniPlayer.setId(View.generateViewId());
        miniPlayer.setVisibility(View.GONE);
        FrameLayout.LayoutParams miniParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM);
        miniParams.leftMargin = Tokens.dp(12);
        miniParams.rightMargin = Tokens.dp(12);
        miniParams.bottomMargin = Tokens.dp(10);
        rootFrame.addView(miniPlayer, miniParams);

        playerScreen = new NowPlayingScreen(this, this);
        rootFrame.addView(playerScreen.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        actionSheet = new ActionSheet(this);
        rootFrame.addView(actionSheet, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        updatesScreen = new UpdatesScreen(this, this, updater,
                Version.NAME + " (" + Version.CODE + ")", engineVersion());
        rootFrame.addView(updatesScreen.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        accountScreen = new AccountScreen(this, this);
        rootFrame.addView(accountScreen.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        setContentView(rootFrame);
        registerBackHandler();
        refreshAccessibility();
    }

    /**
     * Keeps only the active layer in the accessibility tree. Every visible overlay makes
     * the layers underneath {@code IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS}, so
     * TalkBack and {@code uiautomator} do not walk into covered screens (the player used
     * to expose the whole Início tree behind it). The mini player floats above the
     * collection/search/detail overlays but is covered by the player and the sheets.
     */
    private void refreshAccessibility() {
        View[] layers = {collectionHost, searchScreen.view(), detailHost,
                playerScreen.view(), actionSheet, updatesScreen.view(), accountScreen.view()};
        int active = -1;
        for (int i = 0; i < layers.length; i++) {
            if (layers[i] != null && layers[i].getVisibility() == View.VISIBLE) active = i;
        }
        for (int i = 0; i < layers.length; i++) {
            if (layers[i] == null) continue;
            layers[i].setImportantForAccessibility(i < active
                    ? View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS
                    : View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
        }
        base.setImportantForAccessibility(active < 0
                ? View.IMPORTANT_FOR_ACCESSIBILITY_AUTO
                : View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        miniPlayer.setImportantForAccessibility(active < 3
                ? View.IMPORTANT_FOR_ACCESSIBILITY_AUTO
                : View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
    }

    private static View firstFocusable(View root) {
        if (root == null) return null;
        if (root.isFocusable() && root.getVisibility() == View.VISIBLE) return root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = firstFocusable(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    // --- tabs and screens ---------------------------------------------------------

    @Override
    public void onConnected() {
        Log.i(TAG, "connected");
        reconnecting = false;
        reconnectPending = false;
        main.removeCallbacks(reconnect);
        // During a post-login rebuild the catalogue is still coming; only reset the
        // backoff once a plain service restart has reconnected.
        if (!refreshingCatalog) reconnectDelay = RECONNECT_INITIAL_MS;
        setStatus("Conectado ao Apple Music");
        loadAsync(MediaClient.AUTO_ROOT);
    }

    @Override
    public void onDisconnected(String message) {
        Log.w(TAG, "disconnected: " + message);
        setStatus("Reconectando ao Apple Music…");
        scheduleReconnect();
    }

    @Override
    public void onChildrenFailed(String parentId) {
        Log.w(TAG, "children failed: " + parentId);
        if (MediaClient.AUTO_ROOT.equals(parentId) && retryCatalog()) return;
        List<ChildSink> sinks = pending.get(parentId);
        if (sinks != null && !sinks.isEmpty()) {
            for (ChildSink sink : new ArrayList<ChildSink>(sinks)) {
                sink.onFailed(parentId);
            }
        } else {
            setStatus("Não foi possível carregar " + parentId);
        }
    }

    @Override
    public void onChildren(String parentId, List<MediaClient.Item> children) {
        if (MediaClient.AUTO_ROOT.equals(parentId)) {
            onRoot(children);
            return;
        }
        List<ChildSink> sinks = pending.get(parentId);
        if (sinks != null && !sinks.isEmpty()) {
            for (ChildSink sink : new ArrayList<ChildSink>(sinks)) {
                sink.onChildren(parentId, children);
            }
            return;
        }
        Log.w(TAG, "unhandled children for " + parentId);
    }

    private void onRoot(List<MediaClient.Item> children) {
        if (rootReceived) return;
        List<MediaClient.Item> found = new ArrayList<MediaClient.Item>();
        for (MediaClient.Item item : children) {
            if (item.browsable) found.add(item);
        }
        if (found.isEmpty()) {
            if (retryCatalog()) return;
            setStatus("Apple Music não expôs o catálogo de mídia");
            return;
        }
        rootReceived = true;
        refreshingCatalog = false;
        reconnectDelay = RECONNECT_INITIAL_MS;
        tabs.clear();
        tabs.addAll(found);
        String[] labels = new String[tabs.size()];
        for (int i = 0; i < tabs.size(); i++) labels[i] = label(tabs.get(i));
        final Bundle saved = restoreState;
        restoreState = null;
        int index = saved == null ? 0 : restoredTab();
        Log.i(TAG, "root arrived, tab=" + index + (saved == null ? "" : " (restored)"));
        topBar.setTabs(labels, index);
        selectTab(index, saved);
        if (saved != null) restoreOverlays(saved);
        // TV has no touch: start the D-pad on the selected tab, not on the top bar.
        if (!hasTouch) {
            main.post(new Runnable() {
                @Override
                public void run() {
                    focusSelectedTab();
                }
            });
        }
    }

    /** Index of the tab that was selected before the rotation, by id with index fallback. */
    private int restoredTab() {
        if (restoreTabId != null) {
            for (int i = 0; i < tabs.size(); i++) {
                if (restoreTabId.equals(tabs.get(i).id)) return i;
            }
        }
        if (restoreTabIndex >= 0 && restoreTabIndex < tabs.size()) return restoreTabIndex;
        return 0;
    }

    /**
     * Puts the overlays back on top of the restored tab. Collection and detail reload only
     * their top level (the breadcrumb keeps the path); the player/queue/actions wait for
     * the session snapshot in {@link #applyPlayback()}.
     */
    private void restoreOverlays(Bundle saved) {
        int collectionCount = saved.getInt(PREFIX_COLLECTION + ".count", 0);
        if (collectionCount > 0) {
            closeCollectionOverlay();
            int mode = saved.getBoolean(KEY_COLLECTION_GRID, false)
                    ? CollectionScreen.GRID : CollectionScreen.LIST;
            overlayGrid = mode == CollectionScreen.GRID;
            overlayCollection = new CollectionScreen(this, this, artwork, catalog, mode,
                    Icons.NOTE);
            collectionHost.removeAllViews();
            collectionHost.addView(overlayCollection.view(), new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            overlayCollection.setExitOnRootBack(true);
            collectionHost.setVisibility(View.VISIBLE);
            overlayCollection.restoreState(saved, PREFIX_COLLECTION);
        }
        if (saved.getInt("one.detail.count", 0) > 0) {
            closeDetailOverlay();
            detailScreen = new DetailScreen(this, this, artwork, catalog);
            detailHost.removeAllViews();
            detailHost.addView(detailScreen.view(), new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            detailScreen.setExitOnRootBack(true);
            detailHost.setVisibility(View.VISIBLE);
            setDetailFocus(true);
            detailScreen.restoreState(saved);
        }
        Log.i(TAG, "overlays restored: collection=" + (collectionCount > 0)
                + " detail=" + (saved.getInt("one.detail.count", 0) > 0)
                + " player=" + saved.getBoolean(KEY_PLAYER, false)
                + " queue=" + saved.getBoolean(KEY_QUEUE, false)
                + " actions=" + saved.getBoolean(KEY_ACTIONS, false));
        refreshAccessibility();
    }

    /**
     * The engine service may still be restarting after sign-in; keep retrying (with the
     * same backoff) until the catalogue arrives.
     */
    private boolean retryCatalog() {
        if (!refreshingCatalog) return false;
        setStatus("Aguardando o catálogo do Apple Music…");
        scheduleReconnect();
        return true;
    }

    private void focusSelectedTab() {
        View tab = topBar.tabAt(selectedTab);
        if (tab != null) tab.requestFocus();
    }

    private static int kindOf(MediaClient.Item tab) {
        String id = tab.id.toLowerCase(Locale.ROOT);
        String title = tab.title.toLowerCase(Locale.ROOT);
        if (id.contains("radio") || title.contains("radio") || title.contains("rádio")) {
            return KIND_RADIO;
        }
        if (id.contains("library") || title.contains("library") || title.contains("biblioteca")) {
            return KIND_LIBRARY;
        }
        return KIND_HOME;
    }

    private static String label(MediaClient.Item tab) {
        switch (kindOf(tab)) {
            case KIND_RADIO:
                return "Rádio";
            case KIND_LIBRARY:
                return "Biblioteca";
            default:
                return "Início";
        }
    }

    private void selectTab(int index) {
        selectTab(index, null);
    }

    private void selectTab(int index, Bundle saved) {
        if (index < 0 || index >= tabs.size()) return;
        disposeTabScreen();
        selectedTab = index;
        topBar.select(index);
        MediaClient.Item tab = tabs.get(index);
        int kind = kindOf(tab);
        View view;
        if (kind == KIND_HOME) {
            homeScreen = new HomeScreen(this, this, artwork);
            homeScreen.setDownFocusId(miniPlayer.getId());
            view = homeScreen.view();
            screenHost.addView(view, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            if (saved != null) homeScreen.restoreState(saved);
            homeScreen.bind(tab);
        } else if (kind == KIND_RADIO) {
            tabCollection = new RadioScreen(this, this, artwork, catalog);
            view = tabCollection.view();
            screenHost.addView(view, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            boolean restored = saved != null
                    && tabCollection.restoreState(saved, PREFIX_RADIO);
            if (!restored) tabCollection.bind(tab.id, label(tab));
        } else {
            libraryScreen = new LibraryScreen(this, this, artwork, catalog);
            libraryScreen.setDownFocusId(miniPlayer.getId());
            view = libraryScreen.view();
            screenHost.addView(view, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            if (saved != null) libraryScreen.restoreState(saved);
            libraryScreen.bind(tab.id, label(tab));
        }
        setStatus("Carregando " + label(tab) + "…");
    }

    private void disposeTabScreen() {
        if (homeScreen != null) {
            homeScreen.dispose();
            homeScreen = null;
        }
        if (tabCollection != null) {
            tabCollection.dispose();
            tabCollection = null;
        }
        if (libraryScreen != null) {
            libraryScreen.dispose();
            libraryScreen = null;
        }
        screenHost.removeAllViews();
    }

    // --- ScreenHost ---------------------------------------------------------------

    @Override
    public void loadChildren(String parentId, ChildSink sink) {
        // Two screens can be restored on top of each other (a tab and its "Ver tudo"
        // overlay); a node that is already in the client's cache is answered straight
        // away instead of issuing a second subscription.
        List<MediaClient.Item> cached = client.cachedChildren(parentId);
        if (cached != null) {
            sink.onChildren(parentId, cached);
            return;
        }
        List<ChildSink> sinks = pending.get(parentId);
        if (sinks == null) {
            sinks = new ArrayList<ChildSink>();
            pending.put(parentId, sinks);
        }
        sinks.add(sink);
        loadAsync(parentId);
    }

    @Override
    public List<LibrarySection> librarySections() {
        List<LibrarySection> built = buildLibrarySections();
        if (built != null) {
            librarySnapshot = built;
            return built;
        }
        // New activity (rotation) has a fresh client cache; the snapshot survives it.
        return librarySnapshot;
    }

    /** Reads the library sections from the browse cache; null when the tab never loaded. */
    private List<LibrarySection> buildLibrarySections() {
        String rootId = null;
        for (MediaClient.Item tab : tabs) {
            if (kindOf(tab) == KIND_LIBRARY) {
                rootId = tab.id;
                break;
            }
        }
        if (rootId == null) rootId = LIBRARY_ROOT;
        List<MediaClient.Item> categories = client.cachedChildren(rootId);
        if (categories == null) return null;
        List<LibrarySection> sections = new ArrayList<LibrarySection>();
        for (MediaClient.Item category : categories) {
            List<MediaClient.Item> items = client.cachedChildren(category.id);
            if (items == null || items.isEmpty()) continue;
            sections.add(new LibrarySection(category.title, items));
        }
        return sections;
    }

    @Override
    public void openLibrary() {
        if (searchScreen.isOpen()) closeSearch();
        for (int i = 0; i < tabs.size(); i++) {
            if (kindOf(tabs.get(i)) == KIND_LIBRARY) {
                selectTab(i);
                refreshAccessibility();
                return;
            }
        }
        setStatus("Biblioteca indisponível");
    }

    @Override
    public void refreshChildren(final String parentId, ChildSink sink) {
        // Explicit refresh: replace the subscribers of this node and ask the engine again
        // instead of answering from the cache.
        List<ChildSink> sinks = new ArrayList<ChildSink>();
        sinks.add(sink);
        pending.put(parentId, sinks);
        loader.execute(new Runnable() {
            @Override
            public void run() {
                client.invalidate(parentId);
                client.subscribe(parentId);
            }
        });
    }

    @Override
    public void forgetChildren(ChildSink sink) {
        List<String> drop = new ArrayList<String>();
        for (Map.Entry<String, List<ChildSink>> entry : pending.entrySet()) {
            List<ChildSink> sinks = entry.getValue();
            while (sinks.remove(sink)) {
                // Remove every occurrence (loadChildren never adds the same sink twice).
            }
            if (sinks.isEmpty()) drop.add(entry.getKey());
        }
        for (String key : drop) pending.remove(key);
    }

    private void loadAsync(final String parentId) {
        loader.execute(new Runnable() {
            @Override
            public void run() {
                client.subscribe(parentId);
            }
        });
    }

    @Override
    public void play(MediaClient.Item item) {
        if (item == null) return;
        if (item.playable) {
            client.play(item.id);
            setStatus("Tocando " + item.title);
        } else if (item.browsable) {
            openCollection(item.title, item.id, false);
        } else {
            setStatus("Item não reproduzível");
        }
    }

    @Override
    public void playId(String mediaId, String label) {
        client.play(mediaId);
        setStatus("Tocando " + label);
    }

    @Override
    public void playCollectionFrom(String collectionId, String label, int index,
                                   MediaClient.Item track) {
        if (collectionId == null) return;
        client.playCollectionFrom(collectionId, index, track == null ? null : track.id);
        setStatus(index <= 0 ? "Tocando " + label
                : "Tocando " + label + " · faixa " + (index + 1));
    }

    @Override
    public void skipToQueue(long queueId) {
        client.skipToQueueItem(queueId);
    }

    @Override
    public MediaClient.Snapshot nowPlaying() {
        return latest;
    }

    @Override
    public void togglePlayPause() {
        client.togglePlayPause();
    }

    @Override
    public void skipNext() {
        client.skipNext();
    }

    @Override
    public void skipPrevious() {
        client.skipPrevious();
    }

    @Override
    public void seek(long positionMs) {
        client.seekTo(positionMs);
    }

    @Override
    public void status(String message) {
        setStatus(message);
    }

    @Override
    public void openSearch() {
        searchScreen.open();
        refreshAccessibility();
    }

    @Override
    public void openUpdates() {
        updatesScreen.open();
        updater.check();
        refreshAccessibility();
    }

    @Override
    public void openPlayer() {
        if (!latest.hasSession) {
            setStatus("Nada tocando");
            return;
        }
        playerScreen.update(latest);
        playerScreen.view().setVisibility(View.VISIBLE);
        playerScreen.focus();
        refreshAccessibility();
    }

    @Override
    public void openCollection(String title, String parentId, boolean grid) {
        closeCollectionOverlay();
        overlayGrid = grid;
        overlayCollection = new CollectionScreen(this, this, artwork, catalog,
                grid ? CollectionScreen.GRID : CollectionScreen.LIST, Icons.NOTE);
        collectionHost.removeAllViews();
        collectionHost.addView(overlayCollection.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        overlayCollection.setExitOnRootBack(true);
        collectionHost.setVisibility(View.VISIBLE);
        overlayCollection.bind(parentId, title);
        setStatus("");
        refreshAccessibility();
    }

    @Override
    public void openLibraryCollection(int kind, String title, String subtitle,
                                      String libraryId) {
        closeCollectionOverlay();
        overlayGrid = false;
        overlayCollection = new CollectionScreen(this, this, artwork, catalog,
                CollectionScreen.LIST, Icons.NOTE);
        collectionHost.removeAllViews();
        collectionHost.addView(overlayCollection.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        overlayCollection.setExitOnRootBack(true);
        collectionHost.setVisibility(View.VISIBLE);
        overlayCollection.bindCollection(kind, title, subtitle, libraryId);
        setStatus("");
        refreshAccessibility();
    }

    @Override
    public void openArtist(String id, String name, String artworkUrl) {
        openDetail(DetailScreen.ARTIST, id, name, "", artworkUrl);
    }

    @Override
    public void openAlbum(String id, String title, String artist, String artworkUrl) {
        openDetail(DetailScreen.ALBUM, id, title, artist, artworkUrl);
    }

    @Override
    public void openPlaylist(String id, String title, String curator, String artworkUrl) {
        openDetail(DetailScreen.PLAYLIST, id, title, curator, artworkUrl);
    }

    @Override
    public void openSong(String id, String title, String artist, String artworkUrl) {
        openDetail(DetailScreen.SONG, id, title, artist, artworkUrl);
    }

    private void openDetail(int kind, String id, String title, String subtitle,
                            String artworkUrl) {
        if (id == null || id.length() == 0) {
            setStatus("Item sem id de catálogo");
            return;
        }
        closeDetailOverlay();
        detailScreen = new DetailScreen(this, this, artwork, catalog);
        detailHost.removeAllViews();
        detailHost.addView(detailScreen.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        detailScreen.setExitOnRootBack(true);
        detailHost.setVisibility(View.VISIBLE);
        setDetailFocus(true);
        switch (kind) {
            case DetailScreen.ARTIST:
                detailScreen.openArtist(id, title, artworkUrl);
                break;
            case DetailScreen.ALBUM:
                detailScreen.openAlbum(id, title, subtitle, artworkUrl);
                break;
            case DetailScreen.PLAYLIST:
                detailScreen.openPlaylist(id, title, subtitle, artworkUrl);
                break;
            default:
                detailScreen.openSong(id, title, subtitle, artworkUrl);
                break;
        }
        setStatus("");
        refreshAccessibility();
    }

    @Override
    public void closeDetail() {
        closeDetailOverlay();
        if (!hasTouch) focusSelectedTab();
    }

    private void closeDetailOverlay() {
        if (detailScreen != null) {
            detailScreen.dispose();
            detailScreen = null;
        }
        if (detailHost != null) {
            detailHost.removeAllViews();
            detailHost.setVisibility(View.GONE);
        }
        setDetailFocus(false);
        refreshAccessibility();
    }

    /**
     * The detail stack is an overlay over the tabs/search/collection browser; on TV the
     * D-pad must not walk into those hidden screens, so their descendants are blocked
     * while the overlay is on top (and unblocked when it closes).
     */
    private void setDetailFocus(boolean detailOpen) {
        int mode = detailOpen ? ViewGroup.FOCUS_BLOCK_DESCENDANTS
                : ViewGroup.FOCUS_AFTER_DESCENDANTS;
        if (base != null) base.setDescendantFocusability(mode);
        if (collectionHost != null) collectionHost.setDescendantFocusability(mode);
        if (searchScreen != null) {
            ((ViewGroup) searchScreen.view()).setDescendantFocusability(mode);
        }
    }

    @Override
    public void sessionActions() {
        showActions("Ações", latest.title, null);
    }

    @Override
    public void itemActions(MediaClient.Item item) {
        if (item == null) return;
        showActions(item.title, "Aplicar a " + item.title, item);
    }

    @Override
    public void createStation() {
        MediaClient.Action station = latest.findActionEndingWith(ACTION_CREATE_STATION);
        if (station == null) {
            setStatus("Criar estação indisponível nesta faixa");
            return;
        }
        client.sendCustomAction(station.action);
        setStatus("Criando estação…");
    }

    /**
     * Player toggles (aleatório/repetir/favorito) are sent straight from the player; the
     * engine does not publish the resulting shuffle/repeat state, so the confirmation says
     * the action was toggled instead of claiming a new state.
     */
    @Override
    public String sessionAction(String actionId) {
        client.sendCustomAction(actionId);
        String feedback = feedback(actionId);
        setStatus(feedback);
        return feedback;
    }

    /** Session actions minus the three that now live as player buttons. */
    private static List<MediaClient.Action> itemActionsOf(List<MediaClient.Action> actions) {
        List<MediaClient.Action> remaining = new ArrayList<MediaClient.Action>();
        for (MediaClient.Action action : actions) {
            if (action.action.endsWith(ACTION_SHUFFLE)
                    || action.action.endsWith(ACTION_REPEAT)
                    || action.action.endsWith(ACTION_FAVORITE)) continue;
            remaining.add(action);
        }
        return remaining;
    }

    @Override
    public void closePlayer() {
        playerScreen.close();
        refreshAccessibility();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeSearch() {
        searchScreen.close();
        refreshAccessibility();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeActions() {
        actionSheet.hide();
        refreshAccessibility();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeUpdates() {
        updatesScreen.close();
        refreshAccessibility();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeAccount() {
        accountScreen.close();
        refreshAccessibility();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeCollection() {
        closeCollectionOverlay();
        if (!hasTouch) focusSelectedTab();
    }

    private void closeCollectionOverlay() {
        if (overlayCollection != null) {
            overlayCollection.dispose();
            overlayCollection = null;
        }
        collectionHost.removeAllViews();
        collectionHost.setVisibility(View.GONE);
        refreshAccessibility();
    }

    @Override
    public int downFocusId() {
        return miniPlayer == null ? View.NO_ID : miniPlayer.getId();
    }

    @Override
    public boolean isTv() {
        return !hasTouch;
    }

    // --- playback -----------------------------------------------------------------

    @Override
    public void onPlayback(MediaClient.Snapshot snapshot) {
        latest = snapshot;
        applyPlayback();
    }

    private void applyPlayback() {
        MediaClient.Snapshot snapshot = latest;
        if (restorePlayer && snapshot.hasSession) {
            restorePlayer = false;
            openPlayer();
            if (restoreQueue) {
                restoreQueue = false;
                playerScreen.openQueueRestored();
            }
        }
        if (restoreActions && snapshot.hasSession) {
            restoreActions = false;
            showActions(actionsHeading, actionsSubtitle, actionsItem);
        }
        boolean visible = snapshot.hasSession
                && (snapshot.title.length() > 0 || snapshot.playing);
        miniPlayer.setVisibility(visible ? View.VISIBLE : View.GONE);
        if (visible) miniPlayer.update(snapshot);
        if (visible != miniVisible) {
            miniVisible = visible;
            base.setPadding(0, 0, 0, visible ? Tokens.dp(84) : 0);
            refreshAccessibility();
        }
        if (playerScreen.view().getVisibility() == View.VISIBLE) {
            playerScreen.update(snapshot);
        }
        if (tabCollection != null) tabCollection.updatePlayback(snapshot);
        if (libraryScreen != null) libraryScreen.updatePlayback(snapshot);
        if (overlayCollection != null) overlayCollection.updatePlayback(snapshot);
        if (detailScreen != null) detailScreen.updatePlayback(snapshot);
    }

    /** Advances the position only; metadata and queue arrive through the callbacks. */
    private final Runnable ticker = new Runnable() {
        @Override
        public void run() {
            if (latest.playing) client.refreshPlayback();
            main.postDelayed(this, TICK_MS);
        }
    };

    // --- actions ------------------------------------------------------------------

    private void showActions(String heading, String subtitle, final MediaClient.Item item) {
        final List<MediaClient.Action> actions = itemActionsOf(latest.actions);
        if (actions.isEmpty()) {
            setStatus(latest.actions.isEmpty()
                    ? "Nenhuma ação disponível nesta sessão"
                    : "As ações desta sessão já estão nos botões do player");
            return;
        }
        actionsHeading = heading;
        actionsSubtitle = subtitle;
        actionsItem = item;
        actionSheet.show(heading, subtitle, actions, new ActionSheet.Listener() {
            @Override
            public void onAction(MediaClient.Action action) {
                if (item == null) {
                    client.sendCustomAction(action.action);
                    String feedback = feedback(action.action);
                    actionSheet.setFeedback(feedback);
                    setStatus(feedback);
                } else {
                    runItemAction(item, action);
                }
            }

            @Override
            public void onClose() {
                closeActions();
            }
        });
        refreshAccessibility();
    }

    private void runItemAction(final MediaClient.Item item, final MediaClient.Action action) {
        if (item.playable) {
            String message = action.action.endsWith(ACTION_CREATE_STATION)
                    ? "Criando estação…" : action.title + "…";
            actionSheet.setFeedback(message);
            setStatus(message);
            client.play(item.id);
            pollAction(action.action, SystemClock.elapsedRealtime() + ACTION_TIMEOUT_MS);
            return;
        }
        if (latest.hasAction(action.action)) {
            client.sendCustomAction(action.action);
            String feedback = feedback(action.action);
            actionSheet.setFeedback(feedback);
            setStatus(feedback);
        } else {
            actionSheet.setFeedback("Indisponível para este item");
            setStatus("Indisponível para este item");
        }
    }

    /** The engine only publishes actions for the current track; wait for PLAYING. */
    private void pollAction(final String actionId, final long deadline) {
        main.postDelayed(new Runnable() {
            @Override
            public void run() {
                MediaClient.Snapshot snapshot = latest;
                if (snapshot.playing && snapshot.hasAction(actionId)) {
                    client.sendCustomAction(actionId);
                    String feedback = feedback(actionId);
                    actionSheet.setFeedback(feedback);
                    setStatus(feedback);
                    return;
                }
                if (SystemClock.elapsedRealtime() < deadline) {
                    main.postDelayed(this, 150L);
                } else {
                    actionSheet.setFeedback("Indisponível para este item");
                    setStatus("Indisponível para este item");
                }
            }
        }, 150L);
    }

    private static String feedback(String actionId) {
        if (actionId.endsWith(ACTION_CREATE_STATION)) return "Criando estação…";
        if (actionId.endsWith(ACTION_SHUFFLE)) return "Aleatório alternado";
        if (actionId.endsWith(ACTION_REPEAT)) return "Repetir alternado";
        if (actionId.endsWith(ACTION_FAVORITE)) return "Favorito alternado";
        if (actionId.endsWith(ACTION_ADD_TO_LIBRARY)) return "Adicionado à Biblioteca";
        return "Ação enviada";
    }

    // --- account / sign-in --------------------------------------------------------

    /**
     * Starts the engine's Apple ID sign-in from our UI.
     *
     * <p>The engine has no auth activity: the sign-in is the Compose
     * {@code AuthenticationDialogAms}, rendered over the engine's {@code MainActivity} (a
     * {@code StoreBaseActivity}) by its {@code DialogConnectorViewModel}. We start the
     * engine activity, then by reflection: {@code S()} installs the full-screen
     * StoreApiDialogs ComposeView (so its home is covered) and
     * {@code showAMSAuthWithType(Interactive)} opens the AMS dialog, which performs the
     * sign-in itself. BACK returns to this activity; when the sheet is closed (X) or the
     * sign-in finishes, the host activity is finished by {@link #watchAuthClose(Activity)}.
     */
    @Override
    public void openAccount() {
        refreshOnResume = true;
        final Application app = getApplication();
        final ActivityWatcher watcher = new ActivityWatcher(MediaClient.ACCOUNT_ACTIVITY) {
            @Override
            void onTarget(Activity activity) {
                app.unregisterActivityLifecycleCallbacks(this);
                showAppleIdDialog(activity);
            }
        };
        try {
            Intent intent = new Intent();
            intent.setClassName(MediaClient.PACKAGE, MediaClient.ACCOUNT_ACTIVITY);
            app.registerActivityLifecycleCallbacks(watcher);
            startActivity(intent);
        } catch (Throwable t) {
            app.unregisterActivityLifecycleCallbacks(watcher);
            Log.e(TAG, "sign-in host unavailable, falling back to the engine UI", t);
            openEngine();
        }
    }

    private void showAppleIdDialog(final Activity host) {
        main.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    Class<?> authType = Class.forName(AUTH_TYPE_CLASS);
                    Object interactive = null;
                    for (Object value : authType.getEnumConstants()) {
                        if ("Interactive".equals(((Enum<?>) value).name())) interactive = value;
                    }
                    if (interactive == null) throw new IllegalStateException("no Interactive type");
                    // S(): adds the StoreApiDialogs ComposeView over the engine's screen.
                    host.getClass().getMethod("S").invoke(host);
                    // U(): the activity-scoped DialogConnectorViewModel; show the AMS dialog,
                    // which starts the sign-in itself (AuthenticationDialogAms -> startSignIn).
                    Object vm = host.getClass().getMethod("U").invoke(host);
                    vm.getClass().getMethod("showAMSAuthWithType", authType).invoke(vm, interactive);
                    watchAuthClose(host);
                } catch (Throwable t) {
                    Log.e(TAG, "cannot show the Apple ID dialog, falling back to the engine UI", t);
                    openEngine();
                }
            }
        }, SIGN_IN_SETTLE_MS);
    }

    /**
     * The AMS sheet is a Compose overlay in the engine's MainActivity: closing it (X) or
     * finishing the sign-in only hides the sheet, leaving the engine home on screen. Poll
     * the activity-scoped {@code DialogConnectorViewModel} until the sheet has been seen
     * and then disappears, and finish the host so the user lands back on this UI.
     *
     * <p>Finishing on a successful sign-in too is deliberate: this UI is the main screen
     * and reloads the account state in {@link #onResume()}, while the engine process and
     * its playback service stay alive as the backend.
     */
    private void watchAuthClose(final Activity host) {
        authPoll = new Runnable() {
            @Override
            public void run() {
                if (host.isFinishing() || host.isDestroyed()) return;
                try {
                    Object vm = host.getClass().getMethod("U").invoke(host);
                    Object flow = vm.getClass().getMethod("getShouldShowAMSAuthWithType").invoke(vm);
                    Object value = flow.getClass().getMethod("getValue").invoke(flow);
                    if (value != null) {
                        main.postDelayed(this, AUTH_POLL_MS);
                        return;
                    }
                    Log.i(TAG, "Apple ID sheet dismissed, finishing the engine host");
                    host.finish();
                } catch (Throwable t) {
                    Log.w(TAG, "cannot watch the Apple ID sheet", t);
                }
            }
        };
        main.postDelayed(authPoll, AUTH_POLL_MS);
    }

    private void openEngine() {
        refreshOnResume = true;
        try {
            Intent intent = new Intent();
            intent.setClassName(MediaClient.PACKAGE, MediaClient.ACCOUNT_ACTIVITY);
            startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "cannot open the engine account screen", t);
            setStatus("Não foi possível abrir o Apple Music");
        }
    }

    /**
     * Account/subscription management lives in the engine. The validated path is
     * {@code ACTION_VIEW https://itunes.apple.com/accountSummary} on the engine's
     * {@code MainActivity}. The engine is {@code singleTask}, so an existing instance is
     * reused and only resumes; the watcher therefore hooks the resume too. Once the
     * engine screen is up, its BACK is redirected here: the account page is a nav
     * destination inside the engine's activity, so otherwise BACK would pop to the
     * engine home instead of returning to this UI.
     *
     * <p>The account action is registered from the activity, so it disappears with it.
     * If the component or the deep link is gone, fall back to the plain engine activity
     * instead of dead-ending the tap.
     */
    @Override
    public void openAccountSummary() {
        final Application app = getApplication();
        clearAccountWatcher(app);
        final ActivityWatcher watcher = new ActivityWatcher(MediaClient.ACCOUNT_ACTIVITY) {
            @Override
            void onTarget(final Activity activity) {
                clearAccountWatcher(app);
                // The engine installs its own navigator callback while the Compose screen
                // settles: hook after it so clearing its callbacks actually removes it.
                main.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        if (activity.isFinishing() || activity.isDestroyed()) return;
                        interceptAccountBack(activity);
                    }
                }, 1200L);
            }
        };
        accountWatcher = watcher;
        app.registerActivityLifecycleCallbacks(watcher);
        accountWatcherTimeout = new Runnable() {
            @Override
            public void run() {
                Log.w(TAG, "the account screen did not come up");
                clearAccountWatcher(app);
            }
        };
        main.postDelayed(accountWatcherTimeout, 5000L);
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW,
                    Uri.parse(ACCOUNT_SUMMARY_URL));
            intent.setClassName(MediaClient.PACKAGE, MediaClient.ACCOUNT_ACTIVITY);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        } catch (Throwable t) {
            clearAccountWatcher(app);
            Log.w(TAG, "account deep link unavailable, opening the engine home", t);
            openEngine();
        }
    }

    // --- engine settings ----------------------------------------------------------

    @Override
    public boolean engineSettingsAvailable() {
        return engineSettingsId() != 0
                && hasEngineClass(SETTINGS_NAV_CLASS)
                && hasEngineClass(MediaClient.ACCOUNT_ACTIVITY);
    }

    /**
     * The engine has no settings activity: {@code SettingsFragment} is a navigation
     * destination inside {@code MainActivity}, reached through its R8-renamed helper
     * {@code M9.p.a(Context, R.id.action_settings)}. Start the engine activity, wait for
     * its NavHost, navigate, and leave BACK finishing the engine so the user lands here.
     */
    @Override
    public void openEngineSettings() {
        final Application app = getApplication();
        clearAccountWatcher(app);
        final ActivityWatcher watcher = new ActivityWatcher(MediaClient.ACCOUNT_ACTIVITY) {
            @Override
            void onTarget(final Activity activity) {
                clearAccountWatcher(app);
                main.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        navigateToEngineSettings(activity, engineSettingsId(), 0);
                    }
                }, 700L);
            }
        };
        accountWatcher = watcher;
        app.registerActivityLifecycleCallbacks(watcher);
        accountWatcherTimeout = new Runnable() {
            @Override
            public void run() {
                Log.w(TAG, "the engine settings host did not come up");
                clearAccountWatcher(app);
                setStatus("Não foi possível abrir os Ajustes do Apple Music");
            }
        };
        main.postDelayed(accountWatcherTimeout, 5000L);
        try {
            Intent intent = new Intent();
            intent.setClassName(MediaClient.PACKAGE, MediaClient.ACCOUNT_ACTIVITY);
            startActivity(intent);
        } catch (Throwable t) {
            clearAccountWatcher(app);
            Log.e(TAG, "cannot open the engine settings host", t);
            setStatus("Não foi possível abrir os Ajustes do Apple Music");
        }
    }

    private int engineSettingsId() {
        try {
            return getResources().getIdentifier(SETTINGS_DESTINATION, "id", MediaClient.PACKAGE);
        } catch (Throwable t) {
            return 0;
        }
    }

    private static boolean hasEngineClass(String name) {
        try {
            Class.forName(name, false, OneActivity.class.getClassLoader());
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Waits for the engine's NavHost (it is added after the host activity resumes) before
     * calling the navigation helper; the helper throws when the host is not ready, so a
     * bounded retry runs instead of showing the engine home.
     */
    private void navigateToEngineSettings(final Activity host, final int id, final int attempt) {
        if (host.isFinishing() || host.isDestroyed()) return;
        if (attempt > 20) {
            Log.w(TAG, "cannot navigate to the engine settings after " + attempt + " tries");
            setStatus("Não foi possível abrir os Ajustes do Apple Music");
            host.finish();
            return;
        }
        boolean retry;
        try {
            Class<?> nav = Class.forName(SETTINGS_NAV_CLASS);
            Object navHost = nav.getMethod("g", Context.class).invoke(null, host);
            if (navHost == null) {
                retry = true;
            } else {
                nav.getMethod("a", Context.class, int.class).invoke(null, host, id);
                Log.i(TAG, "engine settings opened id=0x" + Integer.toHexString(id));
                main.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        interceptAccountBack(host);
                    }
                }, 1000L);
                retry = false;
            }
        } catch (Throwable t) {
            Log.w(TAG, "engine settings navigation attempt " + attempt + ": " + t);
            retry = true;
        }
        if (retry) {
            main.postDelayed(new Runnable() {
                @Override
                public void run() {
                    navigateToEngineSettings(host, id, attempt + 1);
                }
            }, 250L);
        }
    }

    /** One BACK on the engine's account screen returns to this UI, not to the engine home. */
    private void interceptAccountBack(final Activity host) {
        boolean hooked = hookEngineBackDispatcher(host);
        if (Build.VERSION.SDK_INT >= 33) {
            // Predictive back: an overlay callback wins over the engine's navigator even
            // when the dispatcher hook above did not run in time.
            registerAccountBack(host, OnBackInvokedDispatcher.PRIORITY_OVERLAY);
        } else if (!hooked) {
            Log.w(TAG, "account BACK redirection needs API 33+");
        }
    }

    /**
     * The account page is a navigation destination inside the engine's own activity, so
     * its BACK pops to the engine home. The activity's AndroidX back dispatcher is the
     * only hook that covers both the legacy BACK key (TV/API 34) and predictive back:
     * replace its fallback with {@code finish()} and clear the engine's callbacks, so any
     * BACK leaves the account screen instead of navigating inside the engine.
     *
     * <p>The dispatcher accessor is the engine's R8-renamed
     * {@code ComponentActivity.getOnBackPressedDispatcher()} and the field types are
     * discovered at runtime; if the engine build changes, this returns false and the
     * OnBackInvoked fallback below takes over.
     */
    private boolean hookEngineBackDispatcher(final Activity host) {
        try {
            Object dispatcher = host.getClass().getMethod("m0").invoke(host);
            if (dispatcher == null) return false;
            boolean hookedFallback = false;
            boolean clearedCallbacks = false;
            for (java.lang.reflect.Field field : dispatcher.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                Object value = field.get(dispatcher);
                if (value instanceof Runnable && !hookedFallback) {
                    field.set(dispatcher, new Runnable() {
                        @Override
                        public void run() {
                            Log.i(TAG, "account screen BACK, returning to the UI");
                            host.finish();
                        }
                    });
                    hookedFallback = true;
                } else if (value instanceof java.util.Collection) {
                    ((java.util.Collection<?>) value).clear();
                    clearedCallbacks = true;
                }
            }
            if (hookedFallback && clearedCallbacks) {
                Log.i(TAG, "account BACK hooked on the engine back dispatcher");
                return true;
            }
            Log.w(TAG, "engine back dispatcher has an unexpected shape");
        } catch (Throwable t) {
            Log.w(TAG, "cannot hook the engine back dispatcher", t);
        }
        return false;
    }

    private void registerAccountBack(final Activity host, int priority) {
        try {
            host.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    priority,
                    new OnBackInvokedCallback() {
                        @Override
                        public void onBackInvoked() {
                            Log.i(TAG, "account screen BACK, returning to the UI");
                            host.finish();
                        }
                    });
            Log.i(TAG, "account BACK registered priority=" + priority + " on " + host);
        } catch (Throwable t) {
            Log.w(TAG, "cannot take over the account screen BACK (priority " + priority + ")", t);
        }
    }

    private void clearAccountWatcher(Application app) {
        if (accountWatcherTimeout != null) {
            main.removeCallbacks(accountWatcherTimeout);
            accountWatcherTimeout = null;
        }
        if (accountWatcher != null) {
            app.unregisterActivityLifecycleCallbacks(accountWatcher);
            accountWatcher = null;
        }
    }

    /** Detects the engine activity we just started so it can be driven by reflection. */
    private abstract static class ActivityWatcher implements Application.ActivityLifecycleCallbacks {
        private final String target;

        ActivityWatcher(String target) {
            this.target = target;
        }

        abstract void onTarget(Activity activity);

        @Override
        public void onActivityCreated(Activity activity, Bundle state) {
            if (target.equals(activity.getClass().getName())) onTarget(activity);
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityResumed(Activity activity) {
            // The engine activities are singleTask: a reused instance only resumes.
            if (target.equals(activity.getClass().getName())) onTarget(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle state) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }

    // --- updates -------------------------------------------------------------------

    @Override
    public void onUpdateState(UpdateManager.State state) {
        updatesScreen.setState(state);
        if (updatesScreen.isOpen()) return;
        if (state.phase == UpdateManager.AVAILABLE && state.update != null) {
            setStatus("Atualização " + state.update.version + " disponível — toque em Atualizações");
        } else if (state.phase == UpdateManager.INSTALLED || state.phase == UpdateManager.ERROR) {
            setStatus(state.message);
        }
    }

    private String engineVersion() {
        return Version.ENGINE;
    }

    /**
     * PackageInstaller sends the session status to the PendingIntent built in
     * {@link UpdateManager}. For {@code STATUS_PENDING_USER_ACTION} the system intent is
     * forwarded from this foreground activity (a background receiver would be blocked on
     * Android 10+).
     */
    private void handleInstallStatus(Intent intent) {
        if (intent == null) return;
        int installStatus = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, Integer.MIN_VALUE);
        if (installStatus == Integer.MIN_VALUE) return;
        // Mark handled so a recreation of the activity does not replay the dialog.
        intent.putExtra(PackageInstaller.EXTRA_STATUS, Integer.MIN_VALUE);
        if (installStatus == PackageInstaller.STATUS_PENDING_USER_ACTION) {
            Intent confirm = intent.getParcelableExtra(Intent.EXTRA_INTENT);
            intent.removeExtra(Intent.EXTRA_INTENT);
            if (confirm == null) {
                updater.onInstallResult(false, "O instalador não retornou a confirmação.");
                return;
            }
            confirm.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            try {
                startActivity(confirm);
            } catch (Throwable t) {
                Log.e(TAG, "cannot open the package installer", t);
                updater.onInstallResult(false, "Não foi possível abrir o instalador do sistema.");
            }
            return;
        }
        String detail = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE);
        boolean ok = installStatus == PackageInstaller.STATUS_SUCCESS;
        updater.onInstallResult(ok, ok
                ? "Atualização instalada."
                : "Instalação não concluída"
                + (detail != null && detail.length() > 0 ? ": " + detail : "."));
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        handleInstallStatus(intent);
    }

    /**
     * A rotation recreates the activity, so the screen itself is state: the selected tab,
     * the overlay stack (collection/detail with their ids and breadcrumb, search term,
     * player/queue/actions/account/updates), the Biblioteca filter and the scroll offsets.
     */
    @Override
    protected void onSaveInstanceState(Bundle out) {
        super.onSaveInstanceState(out);
        if (restoreState != null && !rootReceived) {
            // Rotated again before the browse tree arrived: carry the pending restore over.
            out.putAll(restoreState);
            return;
        }
        out.putInt(KEY_TAB, selectedTab);
        if (selectedTab >= 0 && selectedTab < tabs.size()) {
            out.putString(KEY_TAB_ID, tabs.get(selectedTab).id);
        }
        out.putBoolean(KEY_REFRESH, refreshOnResume);
        if (homeScreen != null) homeScreen.saveState(out);
        if (libraryScreen != null) libraryScreen.saveState(out);
        if (tabCollection != null) tabCollection.saveState(out, PREFIX_RADIO);
        if (overlayCollection != null) {
            overlayCollection.saveState(out, PREFIX_COLLECTION);
            out.putBoolean(KEY_COLLECTION_GRID, overlayGrid);
        }
        if (detailScreen != null) detailScreen.saveState(out);
        if (searchScreen != null) searchScreen.saveState(out);
        if (playerScreen != null) {
            out.putBoolean(KEY_PLAYER, playerScreen.isOpen());
            out.putBoolean(KEY_QUEUE, playerScreen.isQueueOpen());
        }
        if (actionSheet != null && actionSheet.isOpen()) {
            out.putBoolean(KEY_ACTIONS, true);
            out.putString(KEY_ACTIONS_HEADING, actionsHeading);
            out.putString(KEY_ACTIONS_SUBTITLE, actionsSubtitle);
            out.putBoolean(KEY_ACTIONS_ITEM, actionsItem != null);
            if (actionsItem != null) {
                out.putString(KEY_ACTIONS_ID, actionsItem.id);
                out.putString(KEY_ACTIONS_TITLE, actionsItem.title);
                out.putString(KEY_ACTIONS_DETAIL, actionsItem.subtitle);
                out.putString(KEY_ACTIONS_ART, actionsItem.artworkUri);
                out.putBoolean(KEY_ACTIONS_BROWSABLE, actionsItem.browsable);
                out.putBoolean(KEY_ACTIONS_PLAYABLE, actionsItem.playable);
            }
        }
        if (updatesScreen != null) out.putBoolean(KEY_UPDATES, updatesScreen.isOpen());
        if (accountScreen != null) out.putBoolean(KEY_ACCOUNT, accountScreen.isOpen());
    }

    // --- misc ----------------------------------------------------------------------

    private void setStatus(String message) {
        status.setText(message == null ? "" : message);
        status.setVisibility(message == null || message.length() == 0
                ? View.GONE : View.VISIBLE);
        Log.i(TAG, "status: " + message);
    }

    private boolean backInTabScreen() {
        if (tabCollection != null && tabCollection.back()) return true;
        return libraryScreen != null && libraryScreen.back();
    }

    /**
     * Android 15+ (targetSdk 35/36) enables predictive back by default, so the system no
     * longer calls {@link #onBackPressed()}: the same close order is registered on the
     * {@link OnBackInvokedDispatcher} and the legacy method stays for API 29-32 devices.
     */
    private void registerBackHandler() {
        if (Build.VERSION.SDK_INT < 33) return;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                new OnBackInvokedCallback() {
                    @Override
                    public void onBackInvoked() {
                        if (!handleBack()) finish();
                    }
                });
    }

    private boolean handleBack() {
        if (actionSheet.isOpen()) {
            closeActions();
            return true;
        }
        if (updatesScreen.isOpen()) {
            closeUpdates();
            return true;
        }
        if (accountScreen.isOpen()) {
            closeAccount();
            return true;
        }
        if (playerScreen.view().getVisibility() == View.VISIBLE) {
            if (playerScreen.isQueueOpen()) {
                playerScreen.closeQueue();
                return true;
            }
            closePlayer();
            return true;
        }
        if (detailHost != null && detailHost.getVisibility() == View.VISIBLE
                && detailScreen != null) {
            detailScreen.back();
            return true;
        }
        if (searchScreen.isOpen()) {
            closeSearch();
            return true;
        }
        if (overlayCollection != null) {
            closeCollection();
            return true;
        }
        return backInTabScreen();
    }

    @Override
    public void onBackPressed() {
        if (!handleBack()) super.onBackPressed();
    }

    @Override
    protected void onDestroy() {
        started = false;
        tickerRunning = false;
        reconnectPending = false;
        destroyed = true;
        main.removeCallbacks(ticker);
        main.removeCallbacks(reconnect);
        if (authPoll != null) main.removeCallbacks(authPoll);
        clearAccountWatcher(getApplication());
        disposeTabScreen();
        if (overlayCollection != null) overlayCollection.dispose();
        if (detailScreen != null) detailScreen.dispose();
        if (searchScreen != null) searchScreen.dispose();
        if (client != null) client.disconnect();
        if (artwork != null) artwork.shutdown();
        if (catalog != null) catalog.shutdown();
        if (updater != null) updater.shutdown();
        loader.shutdownNow();
        super.onDestroy();
    }
}
