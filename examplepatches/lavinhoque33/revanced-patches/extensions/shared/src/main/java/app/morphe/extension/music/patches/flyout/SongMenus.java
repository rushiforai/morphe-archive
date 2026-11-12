/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.flyout;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Dialog;
import android.view.View;

import androidx.annotation.Nullable;

import com.google.protobuf.MessageLite;

import java.io.File;
import java.lang.ref.WeakReference;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.music.patches.downloads.OfflineReplay;
import app.morphe.extension.music.patches.downloads.OfflineStreamBrowse;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Native song menus, kept whole so stock evaluates conditional items again with the current playback/network. */
@SuppressWarnings("unused")
public final class SongMenus {
    public interface Client {
        boolean rvxCanRequestMenu();

        Future<?> rvxRequestMenu(byte[] command, Executor executor);

        Object rvxRestoreSong(byte[] renderer);
    }

    public interface Host {
        void rvxShowSongMenu(View clicked, Object item);
    }

    public interface Response {
        List<?> rvxMenuItems();
    }

    public interface Item {
        Object rvxSongMenu();

        Object rvxSongRenderer();

        String rvxSongId();
    }

    private static final Executor DIRECT = Runnable::run;
    private static final AtomicBoolean backfilling = new AtomicBoolean();
    private static final AtomicInteger opening = new AtomicInteger();
    private static volatile WeakReference<Client> client = new WeakReference<>(null);
    private static WeakReference<View> anchor = new WeakReference<>(null);
    @Nullable private static String openSongId;
    private static WeakReference<Dialog> page = new WeakReference<>(null);
    private static boolean awaitingMenu;
    private static boolean presentingMenu;
    @Nullable private static Item openItem;

    private SongMenus() {}

    /** The native client reports itself independently of the Jam feature or any download-method setting. */
    public static void onClient(Object instance) {
        if (!(instance instanceof Client ready) || !ready.rvxCanRequestMenu()) return;
        client = new WeakReference<>(ready);
        backfill();
    }

    /** Fetches missing menus of older loose copies while online; never delays drawing their page. */
    public static void backfill() {
        if (!Utils.isInternetReachable() || !backfilling.compareAndSet(false, true)) return;
        Utils.runOnBackgroundThread(() -> {
            try {
                for (OfflineStreamBrowse.Track track : OfflineStreamBrowse.tracksOf(OfflineStreamBrowse.SONGS)) {
                    if (!file(track.videoId()).isFile() && Utils.isInternetReachable()) remember(track.videoId());
                }
            } finally {
                backfilling.set(false);
            }
        });
    }

    /** Called off-main-thread after saving an individual stream copy. A menu lookup cannot fail the download. */
    public static void remember(String songId) {
        try {
            if (Utils.isInternetReachable()) fetch(songId);
        } catch (Exception ex) {
            Logger.printException(() -> "SongMenus: could not keep the stock menu of " + songId, ex);
        }
    }

    /** Opens the clicked row's menu, without playing, queueing or consulting the current player's video ID. */
    public static void open(String songId, View clicked, Dialog parent) {
        int request = opening.incrementAndGet();
        Utils.runOnBackgroundThread(() -> {
            Item item = null;
            try {
                if (Utils.isInternetReachable()) {
                    try {
                        item = fetch(songId);
                    } catch (Exception ex) {
                        Logger.printException(() -> "SongMenus: could not refresh the stock menu of " + songId, ex);
                    }
                }
                if (item == null && file(songId).isFile()) {
                    Client available = client.get();
                    if (available != null && available.rvxRestoreSong(Files.readAllBytes(file(songId).toPath()))
                            instanceof Item restored) item = restored;
                }
            } catch (Exception ex) {
                Logger.printException(() -> "SongMenus: could not load the stock menu of " + songId, ex);
            }
            Item ready = item;
            Utils.runOnMainThread(() -> {
                if (request != opening.get() || !clicked.isAttachedToWindow()) return;
                if (ready == null || !songId.equals(ready.rvxSongId())
                        || !(ready.rvxSongMenu() instanceof MessageLite menu)) {
                    Utils.showToastLong(str("morphe_music_song_menu_needs_connection"));
                    return;
                }
                anchor = new WeakReference<>(clicked);
                openSongId = songId;
                openItem = ready;
                page = new WeakReference<>(parent);
                awaitingMenu = true;
                presentingMenu = false;
                if (!OfflineReplay.openSongMenu(menu.toByteArray(), clicked)) {
                    clear();
                    Utils.showToastShort(str("morphe_music_offline_library_not_ready"));
                }
            });
        });
    }

    /** Enter the stock presenter with the exact row item, including its alternate-controller path. */
    public static boolean present(Host host, Object menu) {
        Item selected = openItem;
        if (!awaitingMenu || selected == null) return false;
        View clicked = anchor.get();
        if (clicked == null || !clicked.isAttachedToWindow()
                || !selected.rvxSongId().equals(openSongId) || menu == null
                || !menu.equals(selected.rvxSongMenu())) return false;
        awaitingMenu = false;
        presentingMenu = true;
        host.rvxShowSongMenu(clicked, selected);
        return true;
    }

    /** A No Playlist menu may always remove its stream copy, even after selecting a different download method. */
    public static boolean isOpenFor(@Nullable String songId) {
        View view = anchor.get();
        return songId != null && songId.equals(openSongId) && view != null && view.isAttachedToWindow();
    }

    /** Stock may filter out the queue/mix items offline; keep the identity of this menu's opening command. */
    @Nullable
    static String targetOfMenu(@Nullable String scannedId) {
        if (!presentingMenu || !isOpenFor(openSongId)) return scannedId;
        presentingMenu = false;
        return openSongId;
    }

    /** Navigation from the native menu must not leave the custom page covering the destination. */
    public static void onCommand(Object command) {
        if (!isOpenFor(openSongId) || !(command instanceof MessageLite message)) return;
        ProtoMessage endpoint = new ProtoMessage(message.toByteArray());
        if (endpoint.messageField(48_687_626).isEmpty() && endpoint.messageField(48_687_757).isEmpty()) return;
        Dialog parent = page.get();
        clear();
        if (parent != null) parent.dismiss();
    }

    static void clear() {
        anchor.clear();
        openSongId = null;
        openItem = null;
        page.clear();
        awaitingMenu = false;
        presentingMenu = false;
    }

    @Nullable
    private static Item fetch(String songId) throws Exception {
        Client available = client.get();
        if (available == null) return null;

        Future<?> request = available.rvxRequestMenu(
                OfflineReplay.songMenuRequest(songId), DIRECT);
        try {
            Object result = request.get(10, TimeUnit.SECONDS);
            List<?> menuItems;
            if (result instanceof List<?> nativeItems) {
                menuItems = nativeItems;
            } else if (result instanceof Response response) {
                menuItems = response.rvxMenuItems();
            } else {
                return null;
            }
            for (Object candidate : menuItems) {
                if (!(candidate instanceof Item item) || !songId.equals(item.rvxSongId())
                        || !(item.rvxSongMenu() instanceof MessageLite)
                        || !(item.rvxSongRenderer() instanceof MessageLite renderer)) continue;
                byte[] bytes = renderer.toByteArray();

                File destination = file(songId);
                Files.createDirectories(destination.getParentFile().toPath());
                File pending = new File(destination.getPath() + ".tmp");
                synchronized (SongMenus.class) {
                    Files.write(pending.toPath(), bytes);
                    Files.move(pending.toPath(), destination.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
                return item;
            }
            return null;
        } finally {
            if (!request.isDone()) request.cancel(true);
        }
    }

    private static File file(String songId) {
        if (!songId.matches("[A-Za-z0-9_-]{11}")) throw new IllegalArgumentException("Invalid song ID");
        return new File(new File(Utils.getContext().getFilesDir(), "rvx_song_renderers"), songId + ".pb");
    }
}
