package com.drew.metadata.mov.media;

import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class QuickTimeVideoDirectory extends QuickTimeMediaDirectory {
    public static final int TAG_COLOR_TABLE = 13;
    public static final int TAG_COMPRESSION_TYPE = 10;
    public static final int TAG_COMPRESSOR_NAME = 8;
    public static final int TAG_DEPTH = 9;
    public static final int TAG_FRAME_RATE = 14;
    public static final int TAG_GRAPHICS_MODE = 11;
    public static final int TAG_HEIGHT = 5;
    public static final int TAG_HORIZONTAL_RESOLUTION = 6;
    public static final int TAG_OPCOLOR = 12;
    public static final int TAG_SPATIAL_QUALITY = 3;
    public static final int TAG_TEMPORAL_QUALITY = 2;
    public static final int TAG_VENDOR = 1;
    public static final int TAG_VERTICAL_RESOLUTION = 7;
    public static final int TAG_WIDTH = 4;
    private static final HashMap<Integer, String> _tagNameMap;

    public QuickTimeVideoDirectory() {
        setDescriptor(new QuickTimeVideoDescriptor(this));
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final String getName() {
        return "QuickTime Video";
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        QuickTimeMediaDirectory.addQuickTimeMediaTags(map);
        map.put(1, "Vendor");
        map.put(2, "Temporal Quality");
        lv8.x(3, map, "Spatial Quality", 4, "Width");
        lv8.x(5, map, "Height", 6, "Horizontal Resolution");
        lv8.x(7, map, ezwlgQm.HqiSpmRFfPAipS, 8, "Compressor Name");
        lv8.x(9, map, "Depth", 10, "Compression Type");
        lv8.x(11, map, "Graphics Mode", 12, "Opcolor");
        lv8.x(13, map, "Color Table", 14, "Frame Rate");
    }
}
