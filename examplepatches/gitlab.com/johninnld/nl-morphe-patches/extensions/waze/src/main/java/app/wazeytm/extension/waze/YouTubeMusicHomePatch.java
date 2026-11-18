package app.wazeytm.extension.waze;

import android.content.ComponentName;
import android.content.Context;
import android.media.MediaDescription;
import android.media.browse.MediaBrowser;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import app.wazeytm.extension.waze.settings.MorpheSettings;

/** Feed existing Morphe Home browse routes into Waze's native shelf list. */
public final class YouTubeMusicHomePatch {
    private static final String TAG = "WazeYTMusicHome";
    private static final String ORIGINAL = "com.google.android.apps.youtube.music";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<String, List<MediaBrowser.MediaItem>> shelves = new LinkedHashMap<>();
    private static final class Snapshot {
        final String packageName;
        final List<Object> items;
        Snapshot(String packageName, List<Object> items) {
            this.packageName = packageName;
            this.items = items;
        }
    }
    private static volatile Snapshot snapshot;
    private static final Set<Object> closedAdapters = Collections.synchronizedSet(
            Collections.newSetFromMap(new WeakHashMap<>()));
    private static volatile Object nativeAdapter;
    private static MediaBrowser browser;
    private static String browserPackage;
    private static long lastAttempt;
    private static long lastLoad;

    private YouTubeMusicHomePatch() { }

    private static String getConfiguredShelfTitles() {
        return "Mixed for you|Covers and remixes|Long listens";
    }

    public static List<?> getItems(Object adapter) {
        try {
            Class<?> type = Class.forName(WazeAudioBindings.adapterClass());
            String pkg = (String) WazeFieldAccess.find(type, String.class, false).get(adapter);
            if (ORIGINAL.equals(pkg) || !ORIGINAL.equals(PatchedYouTubeMusicSupportPatch.getIconPackageName(pkg))
                    || !MorpheSettings.isEnabled(MorpheSettings.Feature.PATCHED_YOUTUBE_MUSIC)) return null;
            if (closedAdapters.contains(adapter)) return Collections.emptyList();
            nativeAdapter = adapter;
            MAIN.post(() -> {
                if (!closedAdapters.contains(adapter)) ensureBrowser(pkg);
            });
            Snapshot home = snapshot;
            return home == null || !pkg.equals(home.packageName) ? Collections.emptyList() : home.items;
        } catch (Exception exception) {
            Log.e(TAG, "Cannot read native audio list", exception);
            return null;
        }
    }

    public static void onDisconnected(Object adapter) {
        closedAdapters.add(adapter);
        MAIN.post(() -> {
            if (nativeAdapter != adapter) return;
            nativeAdapter = null;
            if (browser != null) browser.disconnect();
            browser = null;
            browserPackage = null;
            lastAttempt = 0;
            lastLoad = 0;
            shelves.clear();
            snapshot = null;
            Log.i(TAG, "Closed Home browser with native provider adapter");
        });
    }

    private static void ensureBrowser(String pkg) {
        if (browser != null && !pkg.equals(browserPackage)) {
            browser.disconnect();
            browser = null;
            snapshot = null;
            shelves.clear();
        }
        if (browser != null) {
            if (browser.isConnected() && System.currentTimeMillis() - lastLoad > 300_000) loadShelves(browser, pkg);
            return;
        }
        if (System.currentTimeMillis() - lastAttempt < 30_000) return;
        lastAttempt = System.currentTimeMillis();
        browserPackage = pkg;
        Context context = MorpheSettings.getContext();
        if (context == null) return;
        final MediaBrowser[] owned = new MediaBrowser[1];
        owned[0] = new MediaBrowser(context, new ComponentName(pkg,
                "com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService"),
                new MediaBrowser.ConnectionCallback() {
                    @Override public void onConnected() {
                        if (browser == owned[0]) loadShelves(owned[0], pkg);
                    }
                    @Override public void onConnectionFailed() { disconnected(owned[0]); }
                    @Override public void onConnectionSuspended() { disconnected(owned[0]); }
                }, null);
        browser = owned[0];
        browser.connect();
    }

    private static void disconnected(MediaBrowser owned) {
        if (browser != owned) return;
        owned.disconnect();
        browser = null;
        Log.i(TAG, "Home browser disconnected; retry available after cooldown");
    }

    private static void loadShelves(MediaBrowser owned, String pkg) {
        lastLoad = System.currentTimeMillis();
        LinkedHashMap<String, String> requests = new LinkedHashMap<>();
        requests.put("Speed dial", "morphe:aa:speed-dial");
        for (String value : getConfiguredShelfTitles().split("\\|")) {
            String title = value.trim();
            if (!title.isEmpty() && !requests.containsKey(title))
                requests.put(title, "morphe-aa-home://section/" + Uri.encode(title));
        }
        for (Map.Entry<String, String> request : requests.entrySet()) {
            shelves.putIfAbsent(request.getKey(), Collections.emptyList());
            owned.unsubscribe(request.getValue());
            owned.subscribe(request.getValue(), new MediaBrowser.SubscriptionCallback() {
                @Override public void onChildrenLoaded(String parent, List<MediaBrowser.MediaItem> items) {
                    if (browser != owned) return;
                    List<MediaBrowser.MediaItem> playable = new ArrayList<>();
                    for (MediaBrowser.MediaItem item : items) if (item.isPlayable()) playable.add(item);
                    shelves.put(request.getKey(), playable);
                    Log.i(TAG, "Home shelf " + request.getKey() + ": " + playable.size() + " playable items");
                    publish(pkg);
                }
                @Override public void onError(String parent) {
                    if (browser != owned) return;
                    shelves.put(request.getKey(), Collections.emptyList());
                    publish(pkg);
                }
            });
        }
    }

    private static Object compatItem(MediaBrowser.MediaItem item, Class<?> compat) throws Exception {
        Parcel parcel = Parcel.obtain();
        try {
            item.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            Parcelable.Creator<?> creator = (Parcelable.Creator<?>) compat.getField("CREATOR").get(null);
            return creator.createFromParcel(parcel);
        } finally {
            parcel.recycle();
        }
    }

    private static void publish(String pkg) {
        try {
            Class<?> compat = Class.forName(WazeAudioBindings.mediaItemClass());
            Class<?> groupType = Class.forName(WazeAudioBindings.groupClass());
            Constructor<?> constructor = groupType.getDeclaredConstructor(compat);
            constructor.setAccessible(true);
            Field children = WazeFieldAccess.find(groupType, List.class, false);
            List<Object> groups = new ArrayList<>();
            for (Map.Entry<String, List<MediaBrowser.MediaItem>> shelf : shelves.entrySet()) {
                if (shelf.getValue().isEmpty()) continue;
                MediaDescription description = new MediaDescription.Builder().setTitle(shelf.getKey())
                        .setMediaId("waze-yt-home:" + shelf.getKey()).build();
                Object group = constructor.newInstance(compatItem(new MediaBrowser.MediaItem(description,
                        MediaBrowser.MediaItem.FLAG_BROWSABLE), compat));
                List<Object> items = new ArrayList<>();
                for (MediaBrowser.MediaItem item : shelf.getValue()) items.add(compatItem(item, compat));
                children.set(group, items);
                groups.add(group);
            }
            List<Object> completed = Collections.unmodifiableList(groups);
            snapshot = new Snapshot(pkg, completed);
            Class<?> manager = Class.forName(WazeAudioBindings.managerClass());
            Method instance = manager.getDeclaredMethod(WazeAudioBindings.managerInstanceMethod());
            instance.setAccessible(true);
            Method update = manager.getDeclaredMethod(WazeAudioBindings.publishMethod(), String.class, List.class);
            update.setAccessible(true);
            update.invoke(instance.invoke(null), pkg, completed);
        } catch (Exception exception) {
            Log.e(TAG, "Cannot publish Home shelves to native Waze list", exception);
        }
    }
}
