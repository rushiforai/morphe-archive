package app.originisland.extension;

import android.content.ComponentName;
import android.content.Context;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.service.media.MediaBrowserService;
import android.util.Base64;
import android.util.Log;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Loads lists of the library of the app through its own media browser service.
 *
 * The service only lets clients the app knows browse the library, such as Android Auto,
 * and gives each of them a tree of its own. This connects to the service from inside the app,
 * has the app take the connection for one of these clients, and looks for the list in its tree.
 */
@SuppressWarnings("unused")
public final class LibraryBrowser {

    interface Callback {
        /**
         * Called on the main thread.
         *
         * @param children The list, or null if it could not be loaded.
         */
        void onLoaded(List<MediaBrowser.MediaItem> children);
    }

    /**
     * A list of the library, and where it is in the tree of a client.
     * The root of the tree has the depth 0.
     */
    abstract static class LibraryList {
        final String name;
        /**
         * Clients that are given a tree with the list, in the order they are tried.
         */
        final String[] clients;

        LibraryList(String name, String... clients) {
            this.name = name;
            this.clients = clients;
        }

        /**
         * @return If the list can be below this node.
         */
        abstract boolean isOnPath(int depth, MediaBrowser.MediaItem node);

        /**
         * @return If these children of a node are the list.
         */
        abstract boolean isList(int depth, List<MediaBrowser.MediaItem> children);

        /**
         * @return If the children of a node are searched from the last to the first.
         */
        boolean isSearchedLastFirst(int depth) {
            return false;
        }

        /**
         * @return If the list is in the tree of a client from the start, and not only once the
         *         app has loaded the tree. If it is not found then, there is nothing in it.
         */
        boolean isOnDevice() {
            return false;
        }
    }

    private static final class Node {
        final String id;
        final int depth;

        Node(String id, int depth) {
            this.id = id;
            this.depth = depth;
        }
    }

    private static final String TAG = "OriginIslandMusicCard";

    private static final String BROWSER_SERVICE =
            "com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService";

    private static final String CLIENT_ANDROID_AUTO = "com.google.android.projection.gearhead";
    private static final long CONTROL_DISCONNECT_DELAY_MS = 5_000;
    /**
     * Test app of Google, which the app gives a tree of only what is on the device.
     */
    private static final String CLIENT_MEDIA_CONTROLLER_TEST = "com.example.android.mediacontroller";

    /**
     * Root hints of a connection from here: the client the app should take it for, and its uid.
     */
    private static final String HINT_CLIENT = "app.originisland.client";
    private static final String HINT_CLIENT_UID = "app.originisland.client_uid";

    private static final String OFFLINE_NODE_ID = "__LOCAL_CONTENT_PARENT_ROOT_ID__";
    private static final String DOWNLOADS_NODE_ID = "__OFFLINE_ROOT_ID__";

    /**
     * Playlist id of the liked songs, as a field of the media id of the playlist.
     */
    private static final byte[] LIKED_MUSIC_PLAYLIST_FIELD = {0x12, 0x02, 'L', 'M'};

    private static final int MAX_NODES_FOLLOWED_PER_NODE = 6;
    /**
     * Nodes loaded each time the tree of a client is searched.
     */
    private static final int MAX_NODES_LOADED = 12;
    private static final long TIMEOUT_MS = 15_000;

    /**
     * Until the app has loaded the tree of a client, which it starts to when the client asks
     * for it and can take seconds after the app is started, it gives the client a tree with
     * only what is on the device. The tree is searched again until the list is in it.
     */
    private static final long SEARCH_AGAIN_DELAY_MS = 1_000;
    /**
     * Times the tree of a client is searched before the next client is tried, if there is one.
     */
    private static final int MAX_SEARCHES_BEFORE_NEXT_CLIENT = 4;
    /**
     * Times the tree of a client is searched for a list that is in it from the start.
     * The card stops waiting for a list after a few seconds.
     */
    private static final int MAX_SEARCHES_ON_DEVICE = 2;

    /**
     * The downloaded playlists and mixes, which every client is given under the same ids.
     */
    static final LibraryList DOWNLOADS = new LibraryList("Downloads",
            CLIENT_ANDROID_AUTO, CLIENT_MEDIA_CONTROLLER_TEST) {
        @Override
        boolean isOnPath(int depth, MediaBrowser.MediaItem node) {
            // The downloads are below what is on the device, or right below the root in newer versions.
            return (depth == 1 && OFFLINE_NODE_ID.equals(node.getMediaId()))
                    || DOWNLOADS_NODE_ID.equals(node.getMediaId());
        }

        @Override
        boolean isList(int depth, List<MediaBrowser.MediaItem> children) {
            if (depth == 2) {
                return true;
            }
            if (depth != 1) {
                return false;
            }
            // What is on the device has the downloads below it, and the downloads have their items.
            for (MediaBrowser.MediaItem child : children) {
                if (DOWNLOADS_NODE_ID.equals(child.getMediaId())) {
                    return false;
                }
            }
            return true;
        }

        @Override
        boolean isOnDevice() {
            // The app leaves the downloads out of the tree if nothing is downloaded.
            return true;
        }
    };

    /**
     * The playlists of the library, which Android Auto is given under one of its tabs.
     * The tabs and what is under them have no names or ids to go by, since the names are
     * in the language of the user and the ids are different every time. The playlists are
     * recognized by the playlist of the liked songs instead, which is always one of them.
     */
    static final LibraryList PLAYLISTS = new LibraryList("Playlists", CLIENT_ANDROID_AUTO) {
        @Override
        boolean isOnPath(int depth, MediaBrowser.MediaItem node) {
            String id = node.getMediaId();
            // Only what is on the device has ids like this.
            return id != null && !id.startsWith("__");
        }

        @Override
        boolean isList(int depth, List<MediaBrowser.MediaItem> children) {
            if (depth != 2) {
                return false;
            }

            boolean hasLikedMusic = false;
            for (MediaBrowser.MediaItem child : children) {
                if (child.isBrowsable() || !child.isPlayable()) {
                    return false;
                }
                hasLikedMusic |= isLikedMusicPlaylist(child.getMediaId());
            }

            return hasLikedMusic;
        }

        @Override
        boolean isSearchedLastFirst(int depth) {
            // The tab of the library comes after the tabs of recommendations,
            // which have a lot more under them to search.
            return depth == 0;
        }
    };

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    /**
     * Lists that are being loaded.
     */
    private static final Map<LibraryList, LibraryBrowser> loading = new HashMap<>();

    private final Context context;
    private final LibraryList list;
    private final List<Callback> callbacks = new ArrayList<>();
    private final ArrayDeque<Node> nodes = new ArrayDeque<>();
    private final Runnable timeout = () -> finish(null, "timed out");
    private final Runnable searchAgain = this::search;
    private final long startTime = SystemClock.elapsedRealtime();

    private MediaBrowser browser;
    private int clientIndex = -1;
    private int searches;
    private int clientSearches;
    private int nodesLoaded;
    private boolean finished;

    private LibraryBrowser(Context context, LibraryList list) {
        this.context = context;
        this.list = list;
    }

    /**
     * Must be called on the main thread.
     */
    static void load(Context context, LibraryList list, Callback callback) {
        LibraryBrowser libraryBrowser = loading.get(list);
        if (libraryBrowser != null) {
            libraryBrowser.callbacks.add(callback);
            return;
        }

        libraryBrowser = new LibraryBrowser(context, list);
        libraryBrowser.callbacks.add(callback);
        loading.put(list, libraryBrowser);
        mainHandler.postDelayed(libraryBrowser.timeout, TIMEOUT_MS);

        try {
            libraryBrowser.connectAsNextClient();
        } catch (Exception ex) {
            Log.e(TAG, "load failure", ex);
            libraryBrowser.finish(null, "failed");
        }
    }

    interface Control {
        void run(MediaController.TransportControls controls);
    }

    interface Connected {
        void onConnected(MediaController controller);
    }

    static void control(Context context, Control control) {
        connectAsAndroidAuto(context, controller -> control.run(controller.getTransportControls()));
    }

    /**
     * Has the app do something as it does for Android Auto, which it lets control it.
     * Must not be called with a lock of the app held.
     */
    static void connectAsAndroidAuto(Context context, Connected connected) {
        mainHandler.post(() -> {
            try {
                int clientUid;
                try {
                    clientUid = context.getPackageManager().getPackageUid(CLIENT_ANDROID_AUTO, 0);
                } catch (Exception ex) {
                    clientUid = Process.myUid();
                }

                Bundle rootHints = new Bundle();
                rootHints.putString(HINT_CLIENT, CLIENT_ANDROID_AUTO);
                rootHints.putInt(HINT_CLIENT_UID, clientUid);

                MediaBrowser[] browser = {null};
                browser[0] = new MediaBrowser(context, new ComponentName(context, BROWSER_SERVICE),
                        new MediaBrowser.ConnectionCallback() {
                            @Override
                            public void onConnected() {
                                try {
                                    Log.i(TAG, "Connected to the app as Android Auto");
                                    connected.onConnected(new MediaController(context, browser[0].getSessionToken()));
                                } catch (Exception ex) {
                                    Log.e(TAG, "control failure", ex);
                                }
                                mainHandler.postDelayed(browser[0]::disconnect, CONTROL_DISCONNECT_DELAY_MS);
                            }

                            @Override
                            public void onConnectionFailed() {
                                Log.i(TAG, "The app refused to be controlled");
                            }
                        }, rootHints);
                browser[0].connect();
            } catch (Exception ex) {
                Log.e(TAG, "control failure", ex);
            }
        });
    }

    /**
     * Injection point.
     *
     * @return The package the app should take the client connecting to its media browser service for.
     */
    public static String getClientPackage(String clientPackageName, int clientUid, Bundle rootHints) {
        return isConnectionFromHere(clientUid, rootHints)
                ? rootHints.getString(HINT_CLIENT)
                : clientPackageName;
    }

    /**
     * Injection point.
     */
    public static int getClientUid(int clientUid, Bundle rootHints) {
        return isConnectionFromHere(clientUid, rootHints)
                ? rootHints.getInt(HINT_CLIENT_UID)
                : clientUid;
    }

    /**
     * Injection point. Called in place of {@link MediaBrowserService#getCurrentBrowserInfo()},
     * which the app asks for the client with every request.
     */
    public static MediaSessionManager.RemoteUserInfo getCurrentBrowserInfo(MediaBrowserService browserService) {
        MediaSessionManager.RemoteUserInfo info = browserService.getCurrentBrowserInfo();

        try {
            Bundle rootHints = browserService.getBrowserRootHints();
            if (isConnectionFromHere(info.getUid(), rootHints)) {
                return new MediaSessionManager.RemoteUserInfo(
                        rootHints.getString(HINT_CLIENT),
                        info.getPid(),
                        rootHints.getInt(HINT_CLIENT_UID)
                );
            }
        } catch (Exception ex) {
            Log.e(TAG, "getCurrentBrowserInfo failure", ex);
        }

        return info;
    }

    /**
     * Injection point. Called as the app asks the platform for the package of the controller of
     * a command to its session, which it trusts to play from a search.
     *
     * @return Android Auto for a command of this app, which are the ones of the extension,
     *         or null if the app should ask the platform.
     */
    public static String getCallingPackage(MediaSession session) {
        try {
            if (session != null && session.getCurrentControllerInfo().getUid() == Process.myUid()) {
                return CLIENT_ANDROID_AUTO;
            }
        } catch (Exception ex) {
            Log.e(TAG, "getCallingPackage failure", ex);
        }
        return null;
    }

    /**
     * No other app can connect with the uid of this app, whatever root hints it sends.
     */
    private static boolean isConnectionFromHere(int clientUid, Bundle rootHints) {
        return clientUid == Process.myUid() && rootHints != null && rootHints.getString(HINT_CLIENT) != null;
    }

    private static boolean isLikedMusicPlaylist(String mediaId) {
        try {
            if (mediaId == null) {
                return false;
            }

            byte[] id = Base64.decode(mediaId, Base64.URL_SAFE);
            for (int i = 0; i + LIKED_MUSIC_PLAYLIST_FIELD.length <= id.length; i++) {
                int matched = 0;
                while (matched < LIKED_MUSIC_PLAYLIST_FIELD.length
                        && id[i + matched] == LIKED_MUSIC_PLAYLIST_FIELD[matched]) {
                    matched++;
                }
                if (matched == LIKED_MUSIC_PLAYLIST_FIELD.length) {
                    return true;
                }
            }
        } catch (IllegalArgumentException ex) {
            // Not every media id is encoded.
        }

        return false;
    }

    private void connectAsNextClient() {
        if (browser != null) {
            browser.disconnect();
            browser = null;
        }
        clientSearches = 0;

        if (++clientIndex >= list.clients.length) {
            finish(null, "not found");
            return;
        }

        String client = list.clients[clientIndex];
        int clientUid;
        try {
            clientUid = context.getPackageManager().getPackageUid(client, 0);
        } catch (Exception ex) {
            // The app only compares the uid if it was told to.
            clientUid = Process.myUid();
        }

        Bundle rootHints = new Bundle();
        rootHints.putString(HINT_CLIENT, client);
        rootHints.putInt(HINT_CLIENT_UID, clientUid);

        MediaBrowser clientBrowser = new MediaBrowser(context, new ComponentName(context, BROWSER_SERVICE),
                new MediaBrowser.ConnectionCallback() {
                    @Override
                    public void onConnected() {
                        search();
                    }

                    @Override
                    public void onConnectionFailed() {
                        try {
                            if (!finished) {
                                Log.i(TAG, list.name + ": connection as " + client + " refused");
                                connectAsNextClient();
                            }
                        } catch (Exception ex) {
                            Log.e(TAG, "onConnectionFailed failure", ex);
                            finish(null, "failed");
                        }
                    }
                }, rootHints);
        browser = clientBrowser;
        clientBrowser.connect();
    }

    /**
     * Searches the tree of the client for the list, from its root.
     */
    private void search() {
        try {
            if (finished || browser == null) {
                return;
            }

            searches++;
            clientSearches++;
            nodesLoaded = 0;
            nodes.clear();
            nodes.add(new Node(browser.getRoot(), 0));
            loadNextNode();
        } catch (Exception ex) {
            Log.e(TAG, "search failure", ex);
            finish(null, "failed");
        }
    }

    private void loadNextNode() {
        Node node = nodes.pollFirst();
        if (node == null || nodesLoaded >= MAX_NODES_LOADED) {
            if (list.isOnDevice() && clientSearches >= MAX_SEARCHES_ON_DEVICE) {
                finish(new ArrayList<>(), "nothing as " + list.clients[clientIndex]);
                return;
            }

            boolean isLastClient = clientIndex == list.clients.length - 1;
            if (isLastClient || clientSearches < MAX_SEARCHES_BEFORE_NEXT_CLIENT) {
                mainHandler.postDelayed(searchAgain, SEARCH_AGAIN_DELAY_MS);
            } else {
                connectAsNextClient();
            }
            return;
        }
        nodesLoaded++;

        MediaBrowser nodeBrowser = browser;
        nodeBrowser.subscribe(node.id, new MediaBrowser.SubscriptionCallback() {
            private boolean loaded;

            @Override
            public void onChildrenLoaded(String parentId, List<MediaBrowser.MediaItem> children) {
                onLoaded(children);
            }

            @Override
            public void onError(String parentId) {
                onLoaded(null);
            }

            private void onLoaded(List<MediaBrowser.MediaItem> children) {
                try {
                    // The app can load the children of a node again later.
                    if (loaded || finished || nodeBrowser != browser) {
                        return;
                    }
                    loaded = true;
                    nodeBrowser.unsubscribe(node.id);

                    if (children != null) {
                        if (list.isList(node.depth, children)) {
                            finish(children, "as " + list.clients[clientIndex]);
                            return;
                        }
                        followChildren(node, children);
                    }

                    loadNextNode();
                } catch (Exception ex) {
                    Log.e(TAG, "onLoaded failure", ex);
                    finish(null, "failed");
                }
            }
        });
    }

    /**
     * Adds the children of a node that the list can be below,
     * so that they are loaded before the nodes found earlier.
     */
    private void followChildren(Node node, List<MediaBrowser.MediaItem> children) {
        int childDepth = node.depth + 1;
        boolean lastFirst = list.isSearchedLastFirst(node.depth);
        int followed = 0;

        ArrayDeque<Node> childNodes = new ArrayDeque<>();
        for (int i = 0; i < children.size() && followed < MAX_NODES_FOLLOWED_PER_NODE; i++) {
            MediaBrowser.MediaItem child = children.get(lastFirst ? children.size() - 1 - i : i);
            if (child.isBrowsable() && list.isOnPath(childDepth, child)) {
                childNodes.addLast(new Node(child.getMediaId(), childDepth));
                followed++;
            }
        }

        while (!childNodes.isEmpty()) {
            nodes.addFirst(childNodes.pollLast());
        }
    }

    private void finish(List<MediaBrowser.MediaItem> children, String outcome) {
        if (finished) {
            return;
        }
        finished = true;
        mainHandler.removeCallbacks(timeout);
        mainHandler.removeCallbacks(searchAgain);
        loading.remove(list);

        if (browser != null) {
            browser.disconnect();
            browser = null;
        }

        Log.i(TAG, list.name + ": " + (children == null ? "not loaded" : children.size() + " loaded")
                + ", " + outcome + ", " + searches + " searches in "
                + (SystemClock.elapsedRealtime() - startTime) + " ms");

        for (Callback callback : callbacks) {
            callback.onLoaded(children);
        }
    }
}
