package com.drew.metadata.mp4;

import com.drew.metadata.Directory;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class Mp4Directory extends Directory {
    public static final int TAG_COMPATIBLE_BRANDS = 3;
    public static final int TAG_CREATION_TIME = 256;
    public static final int TAG_CURRENT_TIME = 269;
    public static final int TAG_DURATION = 259;
    public static final int TAG_DURATION_SECONDS = 260;
    public static final int TAG_LATITUDE = 8193;
    public static final int TAG_LONGITUDE = 8194;
    public static final int TAG_MAJOR_BRAND = 1;
    public static final int TAG_MEDIA_TIME_SCALE = 774;
    public static final int TAG_MINOR_VERSION = 2;
    public static final int TAG_MODIFICATION_TIME = 257;
    public static final int TAG_NEXT_TRACK_ID = 270;
    public static final int TAG_POSTER_TIME = 266;
    public static final int TAG_PREFERRED_RATE = 261;
    public static final int TAG_PREFERRED_VOLUME = 262;
    public static final int TAG_PREVIEW_DURATION = 265;
    public static final int TAG_PREVIEW_TIME = 264;
    public static final int TAG_ROTATION = 512;
    public static final int TAG_SELECTION_DURATION = 268;
    public static final int TAG_SELECTION_TIME = 267;
    public static final int TAG_TIME_SCALE = 258;
    public static final int TAG_TRANSFORMATION_MATRIX = 271;
    private static final HashMap<Integer, String> _tagNameMap;

    public Mp4Directory() {
        setDescriptor(new Mp4Descriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public String getName() {
        return "MP4";
    }

    @Override // com.drew.metadata.Directory
    public HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Major Brand", 2, "Minor Version");
        lv8.x(3, map, "Compatible Brands", 256, "Creation Time");
        lv8.x(257, map, "Modification Time", 258, "Media Time Scale");
        lv8.x(259, map, "Duration", 260, "Duration in Seconds");
        lv8.x(261, map, "Preferred Rate", 262, "Preferred Volume");
        lv8.x(264, map, "Preview Time", 265, "Preview Duration");
        lv8.x(266, map, "Poster Time", 267, "Selection Time");
        lv8.x(268, map, "Selection Duration", 269, "Current Time");
        lv8.x(270, map, "Next Track ID", 271, "Transformation Matrix");
        lv8.x(512, map, JWcjNoweKCnTr.WkjnmbKzr, 8193, "Latitude");
        lv8.x(8194, map, "Longitude", 774, "Media Time Scale");
    }
}
