package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AppleMakernoteDirectory extends Directory {
    public static final int TAG_ACCELERATION_VECTOR = 8;
    public static final int TAG_BURST_UUID = 11;
    public static final int TAG_CONTENT_IDENTIFIER = 17;
    public static final int TAG_HDR_IMAGE_TYPE = 10;
    public static final int TAG_IMAGE_UNIQUE_ID = 21;
    public static final int TAG_LIVE_PHOTO_ID = 23;
    public static final int TAG_RUN_TIME = 3;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(3, map, "Run Time", 8, "Acceleration Vector");
        lv8.x(10, map, "HDR Image Type", 11, "Burst UUID");
        lv8.x(17, map, "Content Identifier", 21, "Image Unique ID");
        map.put(23, "Live Photo ID");
    }

    public AppleMakernoteDirectory() {
        setDescriptor(new AppleMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Apple Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
