package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PentaxMakernoteDirectory extends Directory {
    public static final int TAG_CAPTURE_MODE = 1;
    public static final int TAG_COLOUR = 23;
    public static final int TAG_CONTRAST = 12;
    public static final int TAG_DAYLIGHT_SAVINGS = 4097;
    public static final int TAG_DIGITAL_ZOOM = 10;
    public static final int TAG_FLASH_MODE = 4;
    public static final int TAG_FOCUS_MODE = 3;
    public static final int TAG_ISO_SPEED = 20;
    public static final int TAG_PRINT_IMAGE_MATCHING_INFO = 3584;
    public static final int TAG_QUALITY_LEVEL = 2;
    public static final int TAG_SATURATION = 13;
    public static final int TAG_SHARPNESS = 11;
    public static final int TAG_TIME_ZONE = 4096;
    public static final int TAG_WHITE_BALANCE = 7;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Capture Mode", 2, "Quality Level");
        lv8.x(3, map, "Focus Mode", 4, "Flash Mode");
        lv8.x(7, map, "White Balance", 10, "Digital Zoom");
        lv8.x(11, map, "Sharpness", 12, "Contrast");
        lv8.x(13, map, "Saturation", 20, "ISO Speed");
        lv8.x(23, map, "Colour", 3584, "Print Image Matching (PIM) Info");
        lv8.x(4096, map, "Time Zone", 4097, "Daylight Savings");
    }

    public PentaxMakernoteDirectory() {
        setDescriptor(new PentaxMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Pentax Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
