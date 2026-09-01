package com.drew.metadata.mp4.media;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4UuidBoxDirectory extends Mp4MediaDirectory {
    private static final HashMap<Integer, String> _tagNameMap;
    public static final Integer TAG_UUID = 901;
    public static final Integer TAG_USER_DATA = 902;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        Mp4MediaDirectory.addMp4MediaTags(map);
        map.put(901, "UUID");
        map.put(902, "Data");
    }

    public Mp4UuidBoxDirectory() {
        setDescriptor(new Mp4UuidBoxDescriptor(this));
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final String getName() {
        return "UUID";
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
