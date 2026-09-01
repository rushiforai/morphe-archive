package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CasioType1MakernoteDirectory extends Directory {
    public static final int TAG_CCD_SENSITIVITY = 20;
    public static final int TAG_CONTRAST = 12;
    public static final int TAG_DIGITAL_ZOOM = 10;
    public static final int TAG_FLASH_INTENSITY = 5;
    public static final int TAG_FLASH_MODE = 4;
    public static final int TAG_FOCUSING_MODE = 3;
    public static final int TAG_OBJECT_DISTANCE = 6;
    public static final int TAG_QUALITY = 2;
    public static final int TAG_RECORDING_MODE = 1;
    public static final int TAG_SATURATION = 13;
    public static final int TAG_SHARPNESS = 11;
    public static final int TAG_UNKNOWN_1 = 8;
    public static final int TAG_UNKNOWN_2 = 9;
    public static final int TAG_UNKNOWN_3 = 14;
    public static final int TAG_UNKNOWN_4 = 15;
    public static final int TAG_UNKNOWN_5 = 16;
    public static final int TAG_UNKNOWN_6 = 17;
    public static final int TAG_UNKNOWN_7 = 18;
    public static final int TAG_UNKNOWN_8 = 19;
    public static final int TAG_WHITE_BALANCE = 7;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(20, map, "CCD Sensitivity", 12, "Contrast");
        lv8.x(10, map, "Digital Zoom", 5, "Flash Intensity");
        lv8.x(4, map, "Flash Mode", 3, "Focusing Mode");
        lv8.x(6, map, "Object Distance", 2, "Quality");
        lv8.x(1, map, "Recording Mode", 13, "Saturation");
        lv8.x(11, map, "Sharpness", 8, "Makernote Unknown 1");
        lv8.x(9, map, "Makernote Unknown 2", 14, "Makernote Unknown 3");
        lv8.x(15, map, "Makernote Unknown 4", 16, "Makernote Unknown 5");
        lv8.x(17, map, "Makernote Unknown 6", 18, "Makernote Unknown 7");
        lv8.x(19, map, "Makernote Unknown 8", 7, "White Balance");
    }

    public CasioType1MakernoteDirectory() {
        setDescriptor(new CasioType1MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Casio Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
