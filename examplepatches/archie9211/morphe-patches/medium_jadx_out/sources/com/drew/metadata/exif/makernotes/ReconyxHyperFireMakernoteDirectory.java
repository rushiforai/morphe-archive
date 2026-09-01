package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ReconyxHyperFireMakernoteDirectory extends Directory {
    public static final int MAKERNOTE_VERSION = 61697;
    public static final int TAG_AMBIENT_TEMPERATURE = 40;
    public static final int TAG_AMBIENT_TEMPERATURE_FAHRENHEIT = 38;
    public static final int TAG_BATTERY_VOLTAGE = 84;
    public static final int TAG_BRIGHTNESS = 74;
    public static final int TAG_CONTRAST = 72;
    public static final int TAG_DATE_TIME_ORIGINAL = 22;
    public static final int TAG_EVENT_NUMBER = 18;
    public static final int TAG_FIRMWARE_VERSION = 2;
    public static final int TAG_INFRARED_ILLUMINATOR = 80;
    public static final int TAG_MAKERNOTE_VERSION = 0;
    public static final int TAG_MOON_PHASE = 36;
    public static final int TAG_MOTION_SENSITIVITY = 82;
    public static final int TAG_SATURATION = 78;
    public static final int TAG_SEQUENCE = 14;
    public static final int TAG_SERIAL_NUMBER = 42;
    public static final int TAG_SHARPNESS = 76;
    public static final int TAG_TRIGGER_MODE = 12;
    public static final int TAG_USER_LABEL = 86;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Makernote Version", 2, "Firmware Version");
        lv8.x(12, map, "Trigger Mode", 14, "Sequence");
        lv8.x(18, map, "Event Number", 22, "Date/Time Original");
        lv8.x(36, map, "Moon Phase", 38, "Ambient Temperature Fahrenheit");
        lv8.x(40, map, "Ambient Temperature", 42, "Serial Number");
        lv8.x(72, map, "Contrast", 74, "Brightness");
        lv8.x(76, map, "Sharpness", 78, "Saturation");
        lv8.x(80, map, "Infrared Illuminator", 82, "Motion Sensitivity");
        lv8.x(84, map, "Battery Voltage", 86, "User Label");
    }

    public ReconyxHyperFireMakernoteDirectory() {
        setDescriptor(new ReconyxHyperFireMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Reconyx HyperFire Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
