package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ReconyxHyperFire2MakernoteDirectory extends Directory {
    public static final int TAG_AMBIENT_INFRARED = 92;
    public static final int TAG_AMBIENT_LIGHT = 94;
    public static final int TAG_AMBIENT_TEMPERATURE = 80;
    public static final int TAG_AMBIENT_TEMPERATURE_FAHRENHEIT = 78;
    public static final int TAG_BATTERY_TYPE = 102;
    public static final int TAG_BATTERY_VOLTAGE = 98;
    public static final int TAG_BATTERY_VOLTAGE_AVG = 100;
    public static final int TAG_BRIGHTNESS = 84;
    public static final int TAG_CONTRAST = 82;
    public static final int TAG_DATE_TIME_ORIGINAL = 62;
    public static final int TAG_DAY_OF_WEEK = 74;
    public static final int TAG_DIRECTORY_NUMBER = 18;
    public static final int TAG_EVENT_NUMBER = 58;
    public static final int TAG_FILE_NUMBER = 16;
    public static final int TAG_FIRMWARE_DATE = 48;
    public static final int TAG_FIRMWARE_VERSION = 42;
    public static final int TAG_FLASH = 90;
    public static final int TAG_MOON_PHASE = 76;
    public static final int TAG_MOTION_SENSITIVITY = 96;
    public static final int TAG_SATURATION = 88;
    public static final int TAG_SEQUENCE = 54;
    public static final int TAG_SERIAL_NUMBER = 126;
    public static final int TAG_SHARPNESS = 86;
    public static final int TAG_TRIGGER_MODE = 52;
    public static final int TAG_USER_LABEL = 104;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(16, map, "File Number", 18, "Directory Number");
        lv8.x(42, map, "Firmware Version", 48, "Firmware Date");
        lv8.x(52, map, "Trigger Mode", 54, "Sequence");
        lv8.x(58, map, "Event Number", 62, "Date/Time Original");
        lv8.x(74, map, "DaY of Week", 76, "Moon Phase");
        lv8.x(78, map, "Ambient Temperature Fahrenheit", 80, "Ambient Temperature");
        lv8.x(82, map, "Contrast", 84, "Brightness");
        lv8.x(86, map, "Sharpness", 88, "Saturation");
        lv8.x(90, map, "Flash", 92, "Ambient Infrared");
        lv8.x(94, map, "Ambient Light", 96, "Motion Sensitivity");
        lv8.x(98, map, "Battery Voltage", 100, "Battery Voltage Average");
        lv8.x(102, map, "Battery Type", 104, "User Label");
        map.put(Integer.valueOf(TAG_SERIAL_NUMBER), "Serial Number");
    }

    public ReconyxHyperFire2MakernoteDirectory() {
        setDescriptor(new ReconyxHyperFire2MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Reconyx HyperFire 2 Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
