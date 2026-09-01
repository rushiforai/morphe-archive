package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class NikonType1MakernoteDirectory extends Directory {
    public static final int TAG_CCD_SENSITIVITY = 6;
    public static final int TAG_COLOR_MODE = 4;
    public static final int TAG_CONVERTER = 11;
    public static final int TAG_DIGITAL_ZOOM = 10;
    public static final int TAG_FOCUS = 8;
    public static final int TAG_IMAGE_ADJUSTMENT = 5;
    public static final int TAG_QUALITY = 3;
    public static final int TAG_UNKNOWN_1 = 2;
    public static final int TAG_UNKNOWN_2 = 9;
    public static final int TAG_UNKNOWN_3 = 3840;
    public static final int TAG_WHITE_BALANCE = 7;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(6, map, "CCD Sensitivity", 4, "Color Mode");
        lv8.x(10, map, "Digital Zoom", 11, "Fisheye Converter");
        lv8.x(8, map, "Focus", 5, "Image Adjustment");
        lv8.x(3, map, "Quality", 2, "Makernote Unknown 1");
        lv8.x(9, map, "Makernote Unknown 2", 3840, "Makernote Unknown 3");
        map.put(7, "White Balance");
    }

    public NikonType1MakernoteDirectory() {
        setDescriptor(new NikonType1MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Nikon Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
