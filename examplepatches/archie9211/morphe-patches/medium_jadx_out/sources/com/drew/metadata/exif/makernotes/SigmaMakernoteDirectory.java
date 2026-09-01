package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SigmaMakernoteDirectory extends Directory {
    public static final int TAG_ADJUSTMENT_MODE = 21;
    public static final int TAG_AUTO_BRACKET = 25;
    public static final int TAG_AUTO_FOCUS_MODE = 5;
    public static final int TAG_COLOR_ADJUSTMENT = 20;
    public static final int TAG_COLOR_SPACE = 11;
    public static final int TAG_CONTRAST = 13;
    public static final int TAG_DRIVE_MODE = 3;
    public static final int TAG_EXPOSURE = 12;
    public static final int TAG_EXPOSURE_MODE = 8;
    public static final int TAG_FILL_LIGHT = 18;
    public static final int TAG_FIRMWARE = 23;
    public static final int TAG_FOCUS_SETTING = 6;
    public static final int TAG_HIGHLIGHT = 15;
    public static final int TAG_LENS_RANGE = 10;
    public static final int TAG_METERING_MODE = 9;
    public static final int TAG_QUALITY = 22;
    public static final int TAG_RESOLUTION_MODE = 4;
    public static final int TAG_SATURATION = 16;
    public static final int TAG_SERIAL_NUMBER = 2;
    public static final int TAG_SHADOW = 14;
    public static final int TAG_SHARPNESS = 17;
    public static final int TAG_SOFTWARE = 24;
    public static final int TAG_WHITE_BALANCE = 7;
    private static final HashMap<Integer, String> _tagNameMap;

    public SigmaMakernoteDirectory() {
        setDescriptor(new SigmaMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Sigma Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(2, map, "Serial Number", 3, "Drive Mode");
        lv8.x(4, map, "Resolution Mode", 5, "Auto Focus Mode");
        lv8.x(6, map, "Focus Setting", 7, "White Balance");
        lv8.x(8, map, "Exposure Mode", 9, "Metering Mode");
        lv8.x(10, map, "Lens Range", 11, "Color Space");
        lv8.x(12, map, "Exposure", 13, "Contrast");
        lv8.x(14, map, "Shadow", 15, "Highlight");
        lv8.x(16, map, "Saturation", 17, uvlZTF.qQMb);
        lv8.x(18, map, "Fill Light", 20, "Color Adjustment");
        lv8.x(21, map, "Adjustment Mode", 22, "Quality");
        lv8.x(23, map, "Firmware", 24, "Software");
        map.put(25, "Auto Bracket");
    }
}
