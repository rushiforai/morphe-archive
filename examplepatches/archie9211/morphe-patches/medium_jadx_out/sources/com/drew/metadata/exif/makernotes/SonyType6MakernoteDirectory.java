package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SonyType6MakernoteDirectory extends Directory {
    public static final int TAG_MAKERNOTE_THUMB_LENGTH = 1300;
    public static final int TAG_MAKERNOTE_THUMB_OFFSET = 1299;
    public static final int TAG_MAKERNOTE_THUMB_VERSION = 8192;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1299, map, "Makernote Thumb Offset", 1300, "Makernote Thumb Length");
        map.put(8192, "Makernote Thumb Version");
    }

    public SonyType6MakernoteDirectory() {
        setDescriptor(new SonyType6MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Sony Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
