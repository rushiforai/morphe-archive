package com.drew.metadata.mp4.media;

import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4VideoDirectory extends Mp4MediaDirectory {
    public static final int TAG_COLOR_TABLE = 213;
    public static final int TAG_COMPRESSION_TYPE = 210;
    public static final int TAG_COMPRESSOR_NAME = 208;
    public static final int TAG_DEPTH = 209;
    public static final int TAG_FRAME_RATE = 214;
    public static final int TAG_GRAPHICS_MODE = 211;
    public static final int TAG_HEIGHT = 205;
    public static final int TAG_HORIZONTAL_RESOLUTION = 206;
    public static final int TAG_OPCOLOR = 212;
    public static final int TAG_SPATIAL_QUALITY = 203;
    public static final int TAG_TEMPORAL_QUALITY = 202;
    public static final int TAG_VENDOR = 201;
    public static final int TAG_VERTICAL_RESOLUTION = 207;
    public static final int TAG_WIDTH = 204;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        Mp4MediaDirectory.addMp4MediaTags(map);
        map.put(Integer.valueOf(TAG_VENDOR), "Vendor");
        map.put(Integer.valueOf(TAG_TEMPORAL_QUALITY), "Temporal Quality");
        lv8.x(TAG_SPATIAL_QUALITY, map, "Spatial Quality", TAG_WIDTH, "Width");
        lv8.x(TAG_HEIGHT, map, "Height", TAG_HORIZONTAL_RESOLUTION, "Horizontal Resolution");
        lv8.x(TAG_VERTICAL_RESOLUTION, map, "Vertical Resolution", 208, "Compressor Name");
        lv8.x(TAG_DEPTH, map, "Depth", TAG_COMPRESSION_TYPE, "Compression Type");
        lv8.x(TAG_GRAPHICS_MODE, map, "Graphics Mode", TAG_OPCOLOR, "Opcolor");
        lv8.x(TAG_COLOR_TABLE, map, "Color Table", TAG_FRAME_RATE, "Frame Rate");
    }

    public Mp4VideoDirectory() {
        setDescriptor(new Mp4VideoDescriptor(this));
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final String getName() {
        return "MP4 Video";
    }

    @Override // com.drew.metadata.mp4.Mp4Directory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
