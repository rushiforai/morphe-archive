package com.drew.metadata.avi;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AviDirectory extends Directory {
    public static final String CHUNK_DATETIME_ORIGINAL = "IDIT";
    public static final String CHUNK_MAIN_HEADER = "avih";
    public static final String CHUNK_STREAM_HEADER = "strh";
    public static final String FORMAT = "AVI ";
    public static final String LIST_HEADER = "hdrl";
    public static final String LIST_STREAM_HEADER = "strl";
    public static final int TAG_AUDIO_CODEC = 5;
    public static final int TAG_DATETIME_ORIGINAL = 320;
    public static final int TAG_DURATION = 3;
    public static final int TAG_FRAMES_PER_SECOND = 1;
    public static final int TAG_HEIGHT = 7;
    public static final int TAG_SAMPLES_PER_SECOND = 2;
    public static final int TAG_STREAMS = 8;
    public static final int TAG_VIDEO_CODEC = 4;
    public static final int TAG_WIDTH = 6;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Frames Per Second", 2, "Samples Per Second");
        lv8.x(3, map, "Duration", 4, "Video Codec");
        lv8.x(5, map, "Audio Codec", 6, "Width");
        lv8.x(7, map, "Height", 8, "Stream Count");
        map.put(Integer.valueOf(TAG_DATETIME_ORIGINAL), "Date/Time Original");
    }

    public AviDirectory() {
        setDescriptor(new AviDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "AVI";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
