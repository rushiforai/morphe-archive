package com.music.bitchord.download;

import android.content.Context;

import com.music.bitchord.data.model.Song;

import java.util.ArrayList;
import java.util.List;

public final class Downloads {
    public static final List<String> queued = new ArrayList<>();

    public static void enqueue(Context context, Song song, String from) {
        queued.add(from + ": " + song.videoId);
    }
}
