package com.drew.metadata.mov;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeDirectory extends Directory {
    public static final int TAG_ADOBE_XMP = 12288;
    public static final int TAG_CANON_THUMBNAIL_DT = 8192;
    public static final int TAG_COMPATIBLE_BRANDS = 4098;
    public static final int TAG_CREATION_TIME = 256;
    public static final int TAG_CURRENT_TIME = 268;
    public static final int TAG_DURATION = 259;
    public static final int TAG_DURATION_SECONDS = 260;
    public static final int TAG_MAJOR_BRAND = 4096;
    public static final int TAG_MEDIA_TIME_SCALE = 774;
    public static final int TAG_MINOR_VERSION = 4097;
    public static final int TAG_MODIFICATION_TIME = 257;
    public static final int TAG_NEXT_TRACK_ID = 269;
    public static final int TAG_POSTER_TIME = 265;
    public static final int TAG_PREFERRED_RATE = 261;
    public static final int TAG_PREFERRED_VOLUME = 262;
    public static final int TAG_PREVIEW_DURATION = 264;
    public static final int TAG_PREVIEW_TIME = 263;
    public static final int TAG_ROTATION = 270;
    public static final int TAG_SELECTION_DURATION = 267;
    public static final int TAG_SELECTION_TIME = 266;
    public static final int TAG_TIME_SCALE = 258;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(4096, map, "Major Brand", 4097, "Minor Version");
        lv8.x(4098, map, "Compatible Brands", 256, "Creation Time");
        lv8.x(257, map, "Modification Time", 258, "Media Time Scale");
        lv8.x(259, map, "Duration", 260, "Duration in Seconds");
        lv8.x(261, map, "Preferred Rate", 262, "Preferred Volume");
        lv8.x(263, map, "Preview Time", 264, "Preview Duration");
        lv8.x(265, map, "Poster Time", 266, "Selection Time");
        lv8.x(267, map, "Selection Duration", 268, "Current Time");
        lv8.x(269, map, "Next Track ID", 270, "Rotation");
        lv8.x(774, map, "Media Time Scale", 8192, "Canon Thumbnail DateTime");
        map.put(12288, "Adobe Bridge XMP");
    }

    public QuickTimeDirectory() {
        setDescriptor(new QuickTimeDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public String getName() {
        return "QuickTime";
    }

    @Override // com.drew.metadata.Directory
    public HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
