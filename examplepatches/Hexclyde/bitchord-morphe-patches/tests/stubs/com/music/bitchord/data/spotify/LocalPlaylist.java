package com.music.bitchord.data.spotify;

import java.util.List;

public final class LocalPlaylist {
    private final String id;
    public final String title;
    public final List<?> songs;

    LocalPlaylist(String id, String title, List<?> songs) {
        this.id = id;
        this.title = title;
        this.songs = songs;
    }

    public String id() {
        return id;
    }
}
