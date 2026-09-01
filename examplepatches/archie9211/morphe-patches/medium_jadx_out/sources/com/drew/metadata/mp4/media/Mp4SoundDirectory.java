package com.drew.metadata.mp4.media;

import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4SoundDirectory extends Mp4MediaDirectory {
    public static final int TAG_AUDIO_FORMAT = 301;
    public static final int TAG_AUDIO_SAMPLE_RATE = 304;
    public static final int TAG_AUDIO_SAMPLE_SIZE = 303;
    public static final int TAG_NUMBER_OF_CHANNELS = 302;
    public static final int TAG_SOUND_BALANCE = 305;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        Mp4MediaDirectory.addMp4MediaTags(map);
        map.put(301, "Format");
        map.put(Integer.valueOf(TAG_NUMBER_OF_CHANNELS), "Number of Channels");
        lv8.x(TAG_AUDIO_SAMPLE_SIZE, map, "Sample Size", 304, "Sample Rate");
        map.put(305, "Balance");
    }

    public Mp4SoundDirectory() {
        setDescriptor(new Mp4SoundDescriptor(this));
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final String getName() {
        return "MP4 Sound";
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
