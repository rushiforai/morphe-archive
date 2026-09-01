package com.drew.metadata.gif;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class GifImageDirectory extends Directory {
    public static final int TAG_HAS_LOCAL_COLOUR_TABLE = 5;
    public static final int TAG_HEIGHT = 4;
    public static final int TAG_IS_COLOR_TABLE_SORTED = 7;
    public static final int TAG_IS_INTERLACED = 6;
    public static final int TAG_LEFT = 1;
    public static final int TAG_LOCAL_COLOUR_TABLE_BITS_PER_PIXEL = 8;
    public static final int TAG_TOP = 2;
    public static final int TAG_WIDTH = 3;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Left", 2, "Top");
        lv8.x(3, map, "Width", 4, "Height");
        lv8.x(5, map, "Has Local Colour Table", 6, "Is Interlaced");
        lv8.x(7, map, "Is Local Colour Table Sorted", 8, "Local Colour Table Bits Per Pixel");
    }

    public GifImageDirectory() {
        setDescriptor(new GifImageDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "GIF Image";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
