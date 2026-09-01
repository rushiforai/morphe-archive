package com.drew.metadata.png;

import com.drew.imaging.png.PngChunkType;
import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngDirectory extends Directory {
    public static final int TAG_BACKGROUND_COLOR = 15;
    public static final int TAG_BITS_PER_SAMPLE = 3;
    public static final int TAG_COLOR_TYPE = 4;
    public static final int TAG_COMPRESSION_TYPE = 5;
    public static final int TAG_FILTER_METHOD = 6;
    public static final int TAG_GAMMA = 11;
    public static final int TAG_ICC_PROFILE_NAME = 12;
    public static final int TAG_IMAGE_HEIGHT = 2;
    public static final int TAG_IMAGE_WIDTH = 1;
    public static final int TAG_INTERLACE_METHOD = 7;
    public static final int TAG_LAST_MODIFICATION_TIME = 14;
    public static final int TAG_PALETTE_HAS_TRANSPARENCY = 9;
    public static final int TAG_PALETTE_SIZE = 8;
    public static final int TAG_PIXELS_PER_UNIT_X = 16;
    public static final int TAG_PIXELS_PER_UNIT_Y = 17;
    public static final int TAG_SIGNIFICANT_BITS = 19;
    public static final int TAG_SRGB_RENDERING_INTENT = 10;
    public static final int TAG_TEXTUAL_DATA = 13;
    public static final int TAG_UNIT_SPECIFIER = 18;
    private static final HashMap<Integer, String> _tagNameMap;
    private final PngChunkType _pngChunkType;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(2, map, "Image Height", 1, "Image Width");
        lv8.x(3, map, "Bits Per Sample", 4, "Color Type");
        lv8.x(5, map, "Compression Type", 6, "Filter Method");
        lv8.x(7, map, "Interlace Method", 8, "Palette Size");
        lv8.x(9, map, "Palette Has Transparency", 10, "sRGB Rendering Intent");
        lv8.x(11, map, "Image Gamma", 12, "ICC Profile Name");
        lv8.x(13, map, "Textual Data", 14, "Last Modification Time");
        lv8.x(15, map, "Background Color", 16, "Pixels Per Unit X");
        lv8.x(17, map, "Pixels Per Unit Y", 18, "Unit Specifier");
        map.put(19, "Significant Bits");
    }

    public PngDirectory(PngChunkType pngChunkType) {
        this._pngChunkType = pngChunkType;
        setDescriptor(new PngDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PNG-".concat(this._pngChunkType.getIdentifier());
    }

    public final PngChunkType getPngChunkType() {
        return this._pngChunkType;
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
