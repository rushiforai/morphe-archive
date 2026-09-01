package com.drew.metadata.ico;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class IcoDirectory extends Directory {
    public static final int TAG_BITS_PER_PIXEL = 7;
    public static final int TAG_COLOUR_PALETTE_SIZE = 4;
    public static final int TAG_COLOUR_PLANES = 5;
    public static final int TAG_CURSOR_HOTSPOT_X = 6;
    public static final int TAG_CURSOR_HOTSPOT_Y = 8;
    public static final int TAG_IMAGE_HEIGHT = 3;
    public static final int TAG_IMAGE_OFFSET_BYTES = 10;
    public static final int TAG_IMAGE_SIZE_BYTES = 9;
    public static final int TAG_IMAGE_TYPE = 1;
    public static final int TAG_IMAGE_WIDTH = 2;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Image Type", 2, "Image Width");
        lv8.x(3, map, "Image Height", 4, "Colour Palette Size");
        lv8.x(5, map, "Colour Planes", 6, "Hotspot X");
        lv8.x(7, map, "Bits Per Pixel", 8, "Hotspot Y");
        lv8.x(9, map, "Image Size Bytes", 10, "Image Offset Bytes");
    }

    public IcoDirectory() {
        setDescriptor(new IcoDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "ICO";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
