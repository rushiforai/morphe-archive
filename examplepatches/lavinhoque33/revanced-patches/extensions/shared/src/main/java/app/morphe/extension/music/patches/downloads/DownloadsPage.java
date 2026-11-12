/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import androidx.annotation.Nullable;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.music.patches.downloads.DownloadsPageLogic.Layout;
import app.morphe.extension.music.patches.downloads.OfflineLibraryLogic.SourceRow;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * The stream copies inside the Library's Downloads chip view. The app builds that page itself, from its own
 * downloads, and hands it to a callback. The callback is replaced by one that adds the albums, playlists and songs of
 * the stream copies to the page before the app's own callback gets it, and takes out the app's empty state when
 * there is nothing else; the chips, Back and the Library page around it are the app's own. Nothing is written to the
 * app's downloads, so the stream copies stay apart from them.
 *
 * <p>Any failure hands the app's own page on, untouched, and the main thread never waits for the stores.
 */
public final class DownloadsPage {
    /** Added by the Downloads patch to the request of the page: its message, serialized. */
    public interface PageRequest {
        byte[] rvxRequestBytes();
    }

    /** Added by the Downloads patch to the page fragment: refreshes it as a pull to refresh does. */
    public interface PageHost {
        void rvxRefreshPage();
    }

    /** Added by the Downloads patch to the page response: the section list it holds, and a response with another. */
    public interface PageResponse {
        byte[] rvxPageBytes();

        Object rvxWithPageBytes(byte[] page);
    }

    private static final DownloadsPageLogic.Taps TAPS = new DownloadsPageLogic.Taps() {
        @Override public byte[] source(SourceRow row) {
            return OfflineLibraryLogic.browseCommand("VL" + row.sourceId());
        }
    };

    /** How long after a change of the copies, or after the page starts, it is refreshed if it is stale. */
    private static final long REFRESH_DELAY_MS = 800;

    private static final PageGeneration generation = new PageGeneration();
    private static final PageHosts hosts = new PageHosts();

    private DownloadsPage() {}

    /**
     * Wraps the callback of a page request. Hook entry, on the thread that asks for the page.
     *
     * @return the callback to ask with: the app's own for a page this does not touch, whatever goes wrong.
     */
    static Object wrap(Object request, Object options, Object callback) {
        try {
            if (NativeDownloads.deviceLibrary() || !OfflineReplay.enabled()
                    || !(request instanceof PageRequest page)) return callback;

            String token = DownloadsPageLogic.tokenOf(page.rvxRequestBytes());
            Layout layout = DownloadsPageLogic.layoutOf(token);
            Logger.printDebug(() -> "DownloadsPage: page token=" + token + " layout=" + layout);
            if (layout == Layout.NONE) return callback;

            hosts.downloadsLoaded();
            generation.built();
            OfflineCopyStore.warmUp();
            Class<?>[] interfaces = interfacesOf(callback.getClass()).toArray(new Class<?>[0]);
            return Proxy.newProxyInstance(callback.getClass().getClassLoader(), interfaces,
                    new Delivery(callback, layout));
        } catch (Exception ex) {
            Logger.printException(() -> "DownloadsPage: could not wrap the page callback", ex);
            return callback;
        }
    }

    /**
     * Called when the stream copies or the downloaded lists changed. A Downloads page that is on screen is refreshed
     * as a pull to refresh would; one that is not (a list page is on top of it) is refreshed when it starts again.
     * Not while a list downloads (its end calls again), and nothing for a page never opened since the app started,
     * so a restart never opens Downloads.
     */
    static void onCopiesChanged() {
        generation.changed();
        if (PlaylistDownloads.anyRunning()) return;

        Utils.runOnMainThreadDelayed(DownloadsPage::refreshIfStale, REFRESH_DELAY_MS);
    }

    /** Injection point: a page fragment started, new or from the back stack. */
    public static void onPageStarted(Object controller, Object host) {
        try {
            hosts.started(controller, host);
            Utils.runOnMainThreadDelayed(DownloadsPage::refreshIfStale, REFRESH_DELAY_MS);
        } catch (Exception ex) {
            Logger.printException(() -> "DownloadsPage: page start", ex);
        }
    }

    /** Injection point: a page fragment stopped (another page covers it, or the app left the screen). */
    public static void onPageStopped(Object controller) {
        try {
            hosts.stopped(controller);
        } catch (Exception ex) {
            Logger.printException(() -> "DownloadsPage: page stop", ex);
        }
    }

    private static void refreshIfStale() {
        if (!generation.isStale()) return;

        Object page = hosts.startedDownloadsPage();
        if (!(page instanceof PageHost host)) return;

        try {
            // The refresh builds the page again through the wrap, which notes it as current. A page that is not on
            // screen is not refreshed: it is, when it starts again.
            Logger.printDebug(() -> "DownloadsPage: refresh after a change");
            host.rvxRefreshPage();
        } catch (Exception ex) {
            Logger.printException(() -> "DownloadsPage: could not refresh the page", ex);
        }
    }

    /** Every interface a class implements, the ones of its superclasses and the inherited ones included. */
    private static Set<Class<?>> interfacesOf(Class<?> type) {
        Set<Class<?>> found = new LinkedHashSet<>();
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            for (Class<?> implemented : current.getInterfaces()) addWithParents(found, implemented);
        }
        return found;
    }

    private static void addWithParents(Set<Class<?>> found, Class<?> type) {
        if (!found.add(type)) return;

        for (Class<?> parent : type.getInterfaces()) addWithParents(found, parent);
    }

    /** Passes every call on to the app's callback; the page it is given is the one with the stream copies. */
    private static final class Delivery implements InvocationHandler {
        private final Object callback;
        private final Layout layout;

        Delivery(Object callback, Layout layout) {
            this.callback = callback;
            this.layout = layout;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            if (method.getDeclaringClass() == Object.class) return objectMethod(proxy, method, args);

            boolean page = args != null && args.length == 1 && method.getParameterTypes()[0] == Object.class
                    && args[0] instanceof PageResponse;
            if (!page) return call(method, args);

            PageResponse response = (PageResponse) args[0];
            if (Utils.isCurrentlyOnMainThread()) {
                Utils.runOnBackgroundThread(() -> {
                    Object answer = withCopies(response);
                    Utils.runOnMainThread(() -> deliver(method, answer));
                });
            } else {
                deliver(method, withCopies(response));
            }
            return null;
        }

        private Object objectMethod(Object proxy, Method method, Object[] args) throws Throwable {
            return switch (method.getName()) {
                case "equals" -> proxy == args[0];
                case "hashCode" -> System.identityHashCode(proxy);
                default -> callback.toString();
            };
        }

        private Object call(Method method, Object[] args) throws Throwable {
            try {
                return method.invoke(callback, args);
            } catch (InvocationTargetException ex) {
                throw ex.getCause() != null ? ex.getCause() : ex;
            }
        }

        private void deliver(Method method, Object response) {
            try {
                call(method, new Object[]{response});
            } catch (Throwable failure) {
                Logger.printException(() -> "DownloadsPage: the page callback failed", failure);
            }
        }

        /** The response with the stream copies in it, or the app's own when they cannot be added. */
        private Object withCopies(PageResponse response) {
            try {
                byte[] merged = DownloadsPageLogic.merge(response.rvxPageBytes(), copySections());
                Logger.printDebug(() -> "DownloadsPage: layout=" + layout + " merged=" + (merged != null));
                return merged == null ? response : response.rvxWithPageBytes(merged);
            } catch (Exception ex) {
                Logger.printException(() -> "DownloadsPage: could not add the stream copies", ex);
                return response;
            }
        }

        /** The sections of the stream copies for the layout, by the network state when the page is built. */
        private List<byte[]> copySections() {
            boolean online = Utils.isInternetReachable();
            List<byte[]> items = DownloadsPageLogic.sections(layout, online, sourceRows(), noPlaylistRow(), labels(),
                    TAPS, OfflineCopyStore::coverUrl);
            Logger.printDebug(() -> "DownloadsPage: online=" + online + " sections=" + items.size());
            return items;
        }
    }

    private static List<SourceRow> sourceRows() {
        return OfflineLibraryLogic.sourceRows(OfflineCopyStore.sources(), OfflineCopyStore::tracksOf);
    }

    /** The row of the songs no downloaded list holds, or null when there are none. */
    @Nullable
    private static SourceRow noPlaylistRow() {
        return OfflineLibraryLogic.noPlaylistRow(OfflineReplay.SONGS, str("morphe_music_downloads_no_playlist"),
                OfflineReplay.queueOf(OfflineReplay.SONGS));
    }

    private static DownloadsPageLogic.Labels labels() {
        return new DownloadsPageLogic.Labels(str("morphe_music_offline_library_albums"),
                str("morphe_music_downloads_no_playlist"), str("morphe_music_offline_library_untitled"),
                count -> count == 1
                        ? str("morphe_music_offline_library_song_one")
                        : str("morphe_music_offline_library_songs_count", count));
    }
}
