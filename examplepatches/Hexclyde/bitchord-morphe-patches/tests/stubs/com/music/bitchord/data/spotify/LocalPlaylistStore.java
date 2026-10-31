package com.music.bitchord.data.spotify;

import kotlinx.coroutines.flow.MutableStateFlow;
import kotlinx.coroutines.flow.StateFlowKt;

import java.util.ArrayList;
import java.util.List;

/** BitChord 1.8.1's playlist store, after shrinking: savePlaylist and the private flow. */
public final class LocalPlaylistStore {
    private static final MutableStateFlow<List<LocalPlaylist>> _playlists =
            StateFlowKt.MutableStateFlow(new ArrayList<>());
    private static int next;

    public static LocalPlaylist savePlaylist(String title, List<?> songs) {
        LocalPlaylist playlist = new LocalPlaylist("sp_local_" + next++, title, songs);
        List<LocalPlaylist> updated = new ArrayList<>();
        updated.add(playlist);
        updated.addAll(_playlists.getValue());
        _playlists.setValue(updated);
        return playlist;
    }

    public static List<LocalPlaylist> current() {
        return _playlists.getValue();
    }
}
