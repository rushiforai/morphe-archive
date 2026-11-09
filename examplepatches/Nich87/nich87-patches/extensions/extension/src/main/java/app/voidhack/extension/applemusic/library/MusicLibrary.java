package app.voidhack.extension.applemusic.library;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

import static app.voidhack.extension.applemusic.library.MusicReflection.call;
import static app.voidhack.extension.applemusic.library.MusicReflection.create;
import static app.voidhack.extension.applemusic.library.MusicReflection.invoke;

final class MusicLibrary {
    private static final String NATIVE = "com.apple.android.medialibrary.javanative.medialibrary.";
    final Object library;
    final Object pointer;
    final Object nativeLibrary;
    final AtomicBoolean cancelled;

    MusicLibrary(AtomicBoolean cancelled) throws ReflectiveOperationException, IOException {
        this.cancelled = cancelled;
        library = invoke("com.apple.android.medialibrary.library.a", "d0");
        if (library == null || !(Boolean) call(library, "isReady")) {
            throw new LibraryFailure("sync_required");
        }
        pointer = call(library, "n");
        nativeLibrary = call(pointer, "get");
    }

    void checkCancelled() {
        if (cancelled.get()) throw new CancellationException();
    }

    List<Object> songs() throws ReflectiveOperationException {
        return query("queryItemsFromLibrary", null, false);
    }

    List<Object> playlists() throws ReflectiveOperationException {
        return query("queryPlaylistsFromLibrary", null, true);
    }

    List<Object> playlistSongs(Object playlist) throws ReflectiveOperationException {
        long id = (Long) call(playlist, "getPersistentId");
        return playlistSongs(id);
    }

    List<Object> playlistSongs(long id) throws ReflectiveOperationException {
        try (MusicReflection.Handle item = itemInfo(1, 1, id)) {
            return query("queryItemsFromPlaylist", item.value, false);
        }
    }

    private List<Object> query(String method, Object item, boolean playlists) throws ReflectiveOperationException {
        checkCancelled();
        Object builder = create(playlists ? "N6.i$a" : "N6.f$a");
        Object params = call(builder, "a");
        if (item != null) {
            Object sort = invoke("N6.l", "a", Class.forName("N6.l$a").getField("NONE").get(null));
            call(params, "d", sort);
        }
        try (MusicReflection.Handle nativeParams = new MusicReflection.Handle(call(params, "i"))) {
            Object raw = item == null ? call(nativeLibrary, method, nativeParams.value)
                    : call(nativeLibrary, method, item, nativeParams.value);
            try (MusicReflection.Handle results = new MusicReflection.Handle(raw)) {
                Object result = results.get();
                int count = (Integer) call(result, "numOfItems");
                List<Object> items = new ArrayList<>(count);
                for (int i = 0; i < count; i++) {
                    checkCancelled();
                    try (MusicReflection.Handle entity = new MusicReflection.Handle(call(result, "getItemAtIdx", i))) {
                        items.add(invoke("C6.a", playlists ? "i" : "g", entity.value));
                    }
                }
                return items;
            }
        }
    }

    static MusicReflection.Handle itemInfo(int type, int idType, long id) throws ReflectiveOperationException {
        return new MusicReflection.Handle(invoke(NATIVE + "query.SVItemInfo$SVItemInfoNative", "create", type, idType, id));
    }

    void refreshCatalogItem(String catalogId) throws ReflectiveOperationException, IOException {
        try (MusicReflection.Handle item = itemInfo(0, 3, Long.parseLong(catalogId));
             MusicReflection.Handle vector = new MusicReflection.Handle(create(NATIVE + "query.ItemInfoVector$ItemInfoVectorNative"))) {
            call(vector.value, "pushBack", item.value);
            // The native metadata-refresh path explicitly disables cloud-library addition.
            try (MusicReflection.Handle result = new MusicReflection.Handle(call(nativeLibrary, "addStoreItemToLibrary", vector.value, false))) {
                checkError(result.value);
            }
        }
    }

    void addLibraryTracks(List<LibraryBackup.Track> tracks) throws ReflectiveOperationException, IOException {
        for (int start = 0; start < tracks.size(); start += 100) {
            checkCancelled();
            List<MusicReflection.Handle> handles = new ArrayList<>();
            try (MusicReflection.Handle vector = new MusicReflection.Handle(create(NATIVE + "query.ItemInfoVector$ItemInfoVectorNative"))) {
                try {
                    for (LibraryBackup.Track track : tracks.subList(start, Math.min(start + 100, tracks.size()))) {
                        MusicReflection.Handle item = itemInfo(0, 3, Long.parseLong(track.catalogId));
                        handles.add(item);
                        call(vector.value, "pushBack", item.value);
                    }
                    try (MusicReflection.Handle error = new MusicReflection.Handle(call(nativeLibrary, "addStoreItemToLibrary", vector.value, true))) {
                        checkError(error.value);
                    }
                } finally {
                    for (MusicReflection.Handle handle : handles) handle.close();
                }
            }
        }
    }

    long createPlaylist(LibraryBackup.Playlist playlist, List<Object> tracks) throws ReflectiveOperationException, IOException {
        checkCancelled();
        String type = NATIVE + "playlist.SVPlaylistSessionNative$SVPlaylistCreateSession";
        try (MusicReflection.Handle session = new MusicReflection.Handle(invoke(type, "create", pointer, -1L, false))) {
            Object editor = session.get();
            call(editor, "init");
            boolean saved = false;
            try {
                setProperty(editor, 0, playlist.name);
                setProperty(editor, 1, playlist.description);
                if (!tracks.isEmpty()) setPlaylistTracks(editor, tracks);
                checkCancelled();
                try (MusicReflection.Handle result = new MusicReflection.Handle(call(editor, "save"))) {
                    checkError(call(result.value, "getMediaError"));
                }
                saved = true;
                return (Long) call(editor, "persistentID");
            } finally {
                if (!saved) call(editor, "cancel");
            }
        }
    }

    private void setPlaylistTracks(Object editor, List<Object> tracks) throws ReflectiveOperationException, IOException {
        String vectorType = NATIVE + "ssnetwork.LookupItem$LookupItemPtrVector";
        try (MusicReflection.Handle vector = new MusicReflection.Handle(create(vectorType, (long) tracks.size()));
             MusicReflection.Handle missing = new MusicReflection.Handle(create(vectorType))) {
            long unresolved = 0;
            for (int i = 0; i < tracks.size(); i++) {
                checkCancelled();
                try (MusicReflection.Handle lookup = new MusicReflection.Handle(invoke(NATIVE + "ssnetwork.a", "a", tracks.get(i)))) {
                    call(vector.value, "put", (long) i, lookup.value);
                    if ((Long) call(tracks.get(i), "getPersistentId") == 0) {
                        call(missing.value, "resize", unresolved + 1);
                        call(missing.value, "put", unresolved++, lookup.value);
                    }
                }
            }
            if (unresolved > 0) {
                try (MusicReflection.Handle imported = new MusicReflection.Handle(call(editor, "importItems", missing.value))) {
                    for (int i = 0; i < tracks.size(); i++) {
                        if ((Long) call(tracks.get(i), "getPersistentId") != 0) continue;
                        checkCancelled();
                        long id = (Long) call(imported.get(), "at", MusicReflection.text(tracks.get(i), "getId"));
                        if (id == 0) throw new LibraryFailure("playlist_unresolved");
                        try (MusicReflection.Handle lookup = new MusicReflection.Handle(call(vector.value, "get", (long) i))) {
                            call(lookup.get(), "setValueForKeyLongLong", "persistentId", id);
                        }
                    }
                }
            }
            call(editor, "setItemsToSave", vector.value);
        }
    }

    static Object catalogSong(LibraryBackup.Track track) throws ReflectiveOperationException {
        Object song = create("com.apple.android.music.model." + (track.musicVideo ? "MusicVideo" : "Song"));
        call(song, "setId", track.catalogId);
        call(song, "setSubscriptionStoreId", track.catalogId);
        call(song, "setTitle", track.title);
        call(song, "setArtistName", track.artist);
        call(song, "setCollectionName", track.album);
        return song;
    }

    private static void setProperty(Object session, int property, String value) throws ReflectiveOperationException, IOException {
        byte[] bytes = value.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        try (MusicReflection.Handle data = new MusicReflection.Handle(invoke(
                "com.apple.android.mediaservices.javanative.common.Data$DataPtr", "create", bytes, bytes.length, true))) {
            try (MusicReflection.Handle error = new MusicReflection.Handle(call(session, "setPlaylistProperty", property, data.value))) {
                checkError(error.value);
            }
        }
    }

    private static void checkError(Object error) throws ReflectiveOperationException, IOException {
        int code = (Integer) call(error, "errorCode");
        if (code != 0) throw new LibraryFailure("native_error", code);
    }
}
