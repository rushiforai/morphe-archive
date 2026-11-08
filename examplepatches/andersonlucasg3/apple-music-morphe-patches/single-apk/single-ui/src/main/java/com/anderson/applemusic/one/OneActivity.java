package com.anderson.applemusic.one;

import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
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
    /** Time for the host activity to build its window/ComposeView before we drive it. */
    private static final long SIGN_IN_SETTLE_MS = 400L;
    /** How often the sign-in sheet state is checked while the engine host is on top. */
    private static final long AUTH_POLL_MS = 250L;
    /** Time to wait before reconnecting the MediaBrowser to the restarted engine service. */
    private static final long RECONNECT_DELAY_MS = 700L;
    private static final int MAX_RECONNECT_ATTEMPTS = 4;

    private static final long TICK_MS = 500L;
    private static final long ACTION_TIMEOUT_MS = 2500L;
    private static final String ACTION_CREATE_STATION = "CREATE_STATION";
    private static final String ACTION_FAVORITE = "FAVORITE";
    private static final String ACTION_ADD_TO_LIBRARY = "ADD_TO_LIBRARY";

    private static final int KIND_HOME = 0;
    private static final int KIND_RADIO = 1;
    private static final int KIND_LIBRARY = 2;

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
    private boolean refreshingCatalog;
    private int refreshAttempts;
    private Runnable authPoll;
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
    private final Map<String, ChildSink> pending = new HashMap<String, ChildSink>();
    private int selectedTab = -1;

    private MediaClient.Snapshot latest = new MediaClient.Snapshot();
    private boolean rootReceived;
    private boolean hasTouch;
    private boolean miniVisible;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        // Same style the injected android:theme points at; belt and braces if the binary
        // manifest keeps the engine's own theme.
        setTheme(android.R.style.Theme_Material_NoActionBar);
        Tokens.init(this);
        Inter.load(this);
        hasTouch = Tokens.touch();
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
        refreshAttempts = 0;
        setStatus("Atualizando o Apple Music…");
        client.disconnect();
        main.removeCallbacks(reconnect);
        main.postDelayed(reconnect, RECONNECT_DELAY_MS);
    }

    /** Drops the previous account's tabs, shelves, drill-down and covers. */
    private void resetBrowse() {
        rootReceived = false;
        disposeTabScreen();
        pending.clear();
        tabs.clear();
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
                v.setPadding(0, insets.getSystemWindowInsetTop(), 0,
                        insets.getSystemWindowInsetBottom());
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
        main.postDelayed(ticker, TICK_MS);
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
        setStatus("Conectado ao Apple Music");
        loadAsync(MediaClient.AUTO_ROOT);
    }

    @Override
    public void onDisconnected(String message) {
        Log.w(TAG, "disconnected: " + message);
        if ((reconnecting || refreshingCatalog) && refreshAttempts < MAX_RECONNECT_ATTEMPTS) {
            refreshAttempts++;
            reconnecting = true;
            setStatus("Reconectando ao Apple Music…");
            main.removeCallbacks(reconnect);
            main.postDelayed(reconnect, RECONNECT_DELAY_MS);
            return;
        }
        reconnecting = false;
        refreshingCatalog = false;
        setStatus(message);
    }

    @Override
    public void onChildrenFailed(String parentId) {
        Log.w(TAG, "children failed: " + parentId);
        if (MediaClient.AUTO_ROOT.equals(parentId) && retryCatalog()) return;
        ChildSink sink = pending.get(parentId);
        if (sink != null) {
            sink.onFailed(parentId);
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
        ChildSink sink = pending.get(parentId);
        if (sink != null) {
            sink.onChildren(parentId, children);
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
        refreshAttempts = 0;
        tabs.clear();
        tabs.addAll(found);
        String[] labels = new String[tabs.size()];
        for (int i = 0; i < tabs.size(); i++) labels[i] = label(tabs.get(i));
        topBar.setTabs(labels, 0);
        selectTab(0);
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

    /**
     * The engine service may still be restarting after sign-in; keep the browse session
     * reconnecting until the catalogue arrives or the attempts run out.
     */
    private boolean retryCatalog() {
        if (!refreshingCatalog || refreshAttempts >= MAX_RECONNECT_ATTEMPTS) return false;
        refreshAttempts++;
        reconnecting = true;
        setStatus("Aguardando o catálogo do Apple Music…");
        main.removeCallbacks(reconnect);
        main.postDelayed(reconnect, RECONNECT_DELAY_MS);
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
            homeScreen.bind(tab);
        } else if (kind == KIND_RADIO) {
            tabCollection = new RadioScreen(this, this, artwork, catalog);
            view = tabCollection.view();
            screenHost.addView(view, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            tabCollection.bind(tab.id, label(tab));
        } else {
            libraryScreen = new LibraryScreen(this, this, artwork, catalog);
            libraryScreen.setDownFocusId(miniPlayer.getId());
            view = libraryScreen.view();
            screenHost.addView(view, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
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
        pending.put(parentId, sink);
        loadAsync(parentId);
    }

    @Override
    public void forgetChildren(ChildSink sink) {
        List<String> drop = new ArrayList<String>();
        for (Map.Entry<String, ChildSink> entry : pending.entrySet()) {
            if (entry.getValue() == sink) drop.add(entry.getKey());
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
    }

    @Override
    public void openUpdates() {
        updatesScreen.open();
        updater.check();
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
    }

    @Override
    public void openCollection(String title, String parentId, boolean grid) {
        closeCollectionOverlay();
        overlayCollection = new CollectionScreen(this, this, artwork, catalog,
                grid ? CollectionScreen.GRID : CollectionScreen.LIST, Icons.NOTE);
        collectionHost.removeAllViews();
        collectionHost.addView(overlayCollection.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        overlayCollection.setExitOnRootBack(true);
        collectionHost.setVisibility(View.VISIBLE);
        overlayCollection.bind(parentId, title);
        setStatus("");
    }

    @Override
    public void openLibraryCollection(int kind, String title, String subtitle,
                                      String libraryId) {
        closeCollectionOverlay();
        overlayCollection = new CollectionScreen(this, this, artwork, catalog,
                CollectionScreen.LIST, Icons.NOTE);
        collectionHost.removeAllViews();
        collectionHost.addView(overlayCollection.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        overlayCollection.setExitOnRootBack(true);
        collectionHost.setVisibility(View.VISIBLE);
        overlayCollection.bindCollection(kind, title, subtitle, libraryId);
        setStatus("");
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

    @Override
    public void closePlayer() {
        playerScreen.close();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeSearch() {
        searchScreen.close();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeActions() {
        actionSheet.hide();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeUpdates() {
        updatesScreen.close();
        if (!hasTouch) focusSelectedTab();
    }

    @Override
    public void closeAccount() {
        accountScreen.close();
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
        boolean visible = snapshot.hasSession
                && (snapshot.title.length() > 0 || snapshot.playing);
        miniPlayer.setVisibility(visible ? View.VISIBLE : View.GONE);
        if (visible) miniPlayer.update(snapshot);
        if (visible != miniVisible) {
            miniVisible = visible;
            base.setPadding(0, 0, 0, visible ? Tokens.dp(84) : 0);
        }
        if (playerScreen.view().getVisibility() == View.VISIBLE) {
            playerScreen.update(snapshot);
        }
        if (tabCollection != null) tabCollection.updatePlayback(snapshot);
        if (libraryScreen != null) libraryScreen.updatePlayback(snapshot);
        if (overlayCollection != null) overlayCollection.updatePlayback(snapshot);
        if (detailScreen != null) detailScreen.updatePlayback(snapshot);
    }

    private final Runnable ticker = new Runnable() {
        @Override
        public void run() {
            if (latest.playing) client.refreshPlayback();
            main.postDelayed(this, TICK_MS);
        }
    };

    // --- actions ------------------------------------------------------------------

    private void showActions(String heading, String subtitle, final MediaClient.Item item) {
        final List<MediaClient.Action> actions = latest.actions;
        if (actions.isEmpty()) {
            setStatus("Nenhuma ação disponível nesta sessão");
            return;
        }
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
        if (actionId.endsWith(ACTION_FAVORITE)) return "Favorito aplicado";
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
        try {
            PackageInfo info = getPackageManager().getPackageInfo(getPackageName(), 0);
            return info.versionName + " (" + info.versionCode + ")";
        } catch (Throwable t) {
            return "?";
        }
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
        main.removeCallbacks(ticker);
        main.removeCallbacks(reconnect);
        if (authPoll != null) main.removeCallbacks(authPoll);
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
