package com.drew.metadata.mp4.media;

import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4HintDirectory extends Mp4MediaDirectory {
    public static final int TAG_AVERAGE_BITRATE = 104;
    public static final int TAG_AVERAGE_PDU_SIZE = 102;
    public static final int TAG_MAX_BITRATE = 103;
    public static final int TAG_MAX_PDU_SIZE = 101;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        Mp4MediaDirectory.addMp4MediaTags(map);
        map.put(101, "Max PDU Size");
        map.put(102, "Average PDU Size");
        lv8.x(103, map, "Max Bitrate", 104, "Average Bitrate");
    }

    public Mp4HintDirectory() {
        setDescriptor(new Mp4HintDescriptor(this));
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final String getName() {
        return "MP4 Hint";
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
