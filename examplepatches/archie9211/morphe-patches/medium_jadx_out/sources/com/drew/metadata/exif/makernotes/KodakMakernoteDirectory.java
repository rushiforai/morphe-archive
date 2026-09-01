package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class KodakMakernoteDirectory extends Directory {
    public static final int TAG_BURST_MODE = 10;
    public static final int TAG_BURST_MODE_2 = 24;
    public static final int TAG_COLOR_MODE = 102;
    public static final int TAG_DATE_TIME_STAMP = 100;
    public static final int TAG_DIGITAL_ZOOM = 104;
    public static final int TAG_EXPOSURE_COMPENSATION = 36;
    public static final int TAG_EXPOSURE_TIME = 32;
    public static final int TAG_FLASH_FIRED = 93;
    public static final int TAG_FLASH_MODE = 92;
    public static final int TAG_FOCUS_MODE = 56;
    public static final int TAG_F_NUMBER = 30;
    public static final int TAG_IMAGE_HEIGHT = 14;
    public static final int TAG_IMAGE_WIDTH = 12;
    public static final int TAG_ISO = 96;
    public static final int TAG_ISO_SETTING = 94;
    public static final int TAG_KODAK_MODEL = 0;
    public static final int TAG_METERING_MODE = 28;
    public static final int TAG_MONTH_DAY_CREATED = 18;
    public static final int TAG_QUALITY = 9;
    public static final int TAG_SEQUENCE_NUMBER = 29;
    public static final int TAG_SHARPNESS = 107;
    public static final int TAG_SHUTTER_MODE = 27;
    public static final int TAG_TIME_CREATED = 20;
    public static final int TAG_TOTAL_ZOOM = 98;
    public static final int TAG_WHITE_BALANCE = 64;
    public static final int TAG_YEAR_CREATED = 16;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Kodak Model", 9, "Quality");
        lv8.x(10, map, "Burst Mode", 12, "Image Width");
        lv8.x(14, map, "Image Height", 16, "Year Created");
        lv8.x(18, map, "Month/Day Created", 20, "Time Created");
        lv8.x(24, map, "Burst Mode 2", 27, "Shutter Speed");
        lv8.x(28, map, "Metering Mode", 29, "Sequence Number");
        lv8.x(30, map, "F Number", 32, "Exposure Time");
        lv8.x(36, map, "Exposure Compensation", 56, "Focus Mode");
        lv8.x(64, map, "White Balance", 92, "Flash Mode");
        lv8.x(93, map, "Flash Fired", 94, "ISO Setting");
        lv8.x(96, map, "ISO", 98, "Total Zoom");
        lv8.x(100, map, "Date/Time Stamp", 102, "Color Mode");
        lv8.x(104, map, "Digital Zoom", 107, "Sharpness");
    }

    public KodakMakernoteDirectory() {
        setDescriptor(new KodakMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Kodak Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
