package com.drew.metadata.heif;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HeifDirectory extends Directory {
    public static final int TAG_BITS_PER_CHANNEL = 7;
    public static final int TAG_COMPATIBLE_BRANDS = 3;
    public static final int TAG_IMAGE_HEIGHT = 5;
    public static final int TAG_IMAGE_ROTATION = 6;
    public static final int TAG_IMAGE_WIDTH = 4;
    public static final int TAG_MAJOR_BRAND = 1;
    public static final int TAG_MINOR_VERSION = 2;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Major Brand", 2, "Minor Version");
        lv8.x(3, map, "Compatible Brands", 4, "Width");
        lv8.x(5, map, "Height", 6, "Rotation");
        map.put(7, "Bits Per Channel");
    }

    public HeifDirectory() {
        setDescriptor(new HeifDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "HEIF";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
