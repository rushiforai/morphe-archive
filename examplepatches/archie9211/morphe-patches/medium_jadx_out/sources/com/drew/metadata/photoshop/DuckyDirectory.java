package com.drew.metadata.photoshop;

import com.drew.metadata.Directory;
import com.drew.metadata.TagDescriptor;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class DuckyDirectory extends Directory {
    public static final int TAG_COMMENT = 2;
    public static final int TAG_COPYRIGHT = 3;
    public static final int TAG_QUALITY = 1;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Quality", 2, "Comment");
        map.put(3, "Copyright");
    }

    public DuckyDirectory() {
        setDescriptor(new TagDescriptor<>(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Ducky";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
