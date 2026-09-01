package com.drew.metadata.mp4.media;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4TextDirectory extends Mp4MediaDirectory {
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        Mp4MediaDirectory.addMp4MediaTags(map);
    }

    public Mp4TextDirectory() {
        setDescriptor(new Mp4TextDescriptor(this));
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final String getName() {
        return "MP4 Text";
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
