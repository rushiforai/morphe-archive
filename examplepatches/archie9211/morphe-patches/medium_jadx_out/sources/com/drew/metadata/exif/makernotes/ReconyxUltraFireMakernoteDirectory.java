package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ReconyxUltraFireMakernoteDirectory extends Directory {
    public static final int MAKERNOTE_ID = 65536;
    public static final int MAKERNOTE_PUBLIC_ID = 133234689;
    public static final int TAG_AMBIENT_TEMPERATURE = 70;
    public static final int TAG_AMBIENT_TEMPERATURE_FAHRENHEIT = 68;
    public static final int TAG_BATTERY_VOLTAGE = 73;
    public static final int TAG_BTL_VERSION = 38;
    public static final int TAG_CAMERA_VERSION = 24;
    public static final int TAG_DATE_TIME_ORIGINAL = 59;
    public static final int TAG_DAY_OF_WEEK = 66;
    public static final int TAG_EVENT_NUMBER = 55;
    public static final int TAG_EVENT_TYPE = 52;
    public static final int TAG_FLASH = 72;
    public static final int TAG_LABEL = 0;
    public static final int TAG_MAKERNOTE_ID = 10;
    public static final int TAG_MAKERNOTE_PUBLIC_ID = 18;
    public static final int TAG_MAKERNOTE_PUBLIC_SIZE = 22;
    public static final int TAG_MAKERNOTE_SIZE = 14;
    public static final int TAG_MOON_PHASE = 67;
    public static final int TAG_PEX_VERSION = 45;
    public static final int TAG_SEQUENCE = 53;
    public static final int TAG_SERIAL_NUMBER = 75;
    public static final int TAG_UIB_VERSION = 31;
    public static final int TAG_USER_LABEL = 80;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Makernote Label", 10, "Makernote ID");
        lv8.x(14, map, "Makernote Size", 18, "Makernote Public ID");
        lv8.x(22, map, "Makernote Public Size", 24, "Camera Version");
        lv8.x(31, map, "Uib Version", 38, "Btl Version");
        lv8.x(45, map, "Pex Version", 52, "Event Type");
        lv8.x(53, map, "Sequence", 55, "Event Number");
        lv8.x(59, map, "Date/Time Original", 66, "Day of Week");
        lv8.x(67, map, "Moon Phase", 68, "Ambient Temperature Fahrenheit");
        lv8.x(70, map, "Ambient Temperature", 72, "Flash");
        lv8.x(73, map, "Battery Voltage", 75, "Serial Number");
        map.put(80, "User Label");
    }

    public ReconyxUltraFireMakernoteDirectory() {
        setDescriptor(new ReconyxUltraFireMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Reconyx UltraFire Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
