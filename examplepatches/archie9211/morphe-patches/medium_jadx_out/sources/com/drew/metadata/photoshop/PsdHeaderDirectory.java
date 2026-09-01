package com.drew.metadata.photoshop;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PsdHeaderDirectory extends Directory {
    public static final int TAG_BITS_PER_CHANNEL = 4;
    public static final int TAG_CHANNEL_COUNT = 1;
    public static final int TAG_COLOR_MODE = 5;
    public static final int TAG_IMAGE_HEIGHT = 2;
    public static final int TAG_IMAGE_WIDTH = 3;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Channel Count", 2, "Image Height");
        lv8.x(3, map, "Image Width", 4, "Bits Per Channel");
        map.put(5, "Color Mode");
    }

    public PsdHeaderDirectory() {
        setDescriptor(new PsdHeaderDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PSD Header";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
