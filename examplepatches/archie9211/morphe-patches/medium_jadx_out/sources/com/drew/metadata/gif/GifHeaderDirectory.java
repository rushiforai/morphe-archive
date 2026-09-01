package com.drew.metadata.gif;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class GifHeaderDirectory extends Directory {
    public static final int TAG_BACKGROUND_COLOR_INDEX = 8;
    public static final int TAG_BITS_PER_PIXEL = 6;
    public static final int TAG_COLOR_TABLE_SIZE = 4;
    public static final int TAG_GIF_FORMAT_VERSION = 1;
    public static final int TAG_HAS_GLOBAL_COLOR_TABLE = 7;
    public static final int TAG_IMAGE_HEIGHT = 3;
    public static final int TAG_IMAGE_WIDTH = 2;
    public static final int TAG_IS_COLOR_TABLE_SORTED = 5;
    public static final int TAG_PIXEL_ASPECT_RATIO = 9;

    @Deprecated
    public static final int TAG_TRANSPARENT_COLOR_INDEX = 8;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "GIF Format Version", 3, "Image Height");
        lv8.x(2, map, "Image Width", 4, "Color Table Size");
        lv8.x(5, map, "Is Color Table Sorted", 6, "Bits per Pixel");
        lv8.x(7, map, "Has Global Color Table", 8, "Background Color Index");
        map.put(9, "Pixel Aspect Ratio");
    }

    public GifHeaderDirectory() {
        setDescriptor(new GifHeaderDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "GIF Header";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
