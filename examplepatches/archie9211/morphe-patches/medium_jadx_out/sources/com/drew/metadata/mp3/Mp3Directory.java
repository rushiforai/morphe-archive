package com.drew.metadata.mp3;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp3Directory extends Directory {
    public static final int TAG_BITRATE = 3;
    public static final int TAG_COPYRIGHT = 7;
    public static final int TAG_EMPHASIS = 6;
    public static final int TAG_FRAME_SIZE = 8;
    public static final int TAG_FREQUENCY = 4;
    public static final int TAG_ID = 1;
    public static final int TAG_LAYER = 2;
    public static final int TAG_MODE = 5;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "ID", 2, "Layer");
        lv8.x(3, map, "Bitrate", 4, "Frequency");
        lv8.x(5, map, "Mode", 6, "Emphasis Method");
        lv8.x(7, map, "Copyright", 8, "Frame Size");
    }

    public Mp3Directory() {
        setDescriptor(new Mp3Descriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "MP3";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
