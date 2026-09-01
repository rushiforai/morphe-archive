package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class LeicaMakernoteDirectory extends Directory {
    public static final int TAG_APPROXIMATE_F_NUMBER = 787;
    public static final int TAG_CAMERA_TEMPERATURE = 800;
    public static final int TAG_CCD_BOARD_VERSION = 817;
    public static final int TAG_CCD_VERSION = 816;
    public static final int TAG_COLOR_TEMPERATURE = 801;
    public static final int TAG_CONTROLLER_BOARD_VERSION = 818;
    public static final int TAG_EXTERNAL_SENSOR_BRIGHTNESS_VALUE = 785;
    public static final int TAG_IMAGE_ID_NUMBER = 832;
    public static final int TAG_LENS_TYPE = 784;
    public static final int TAG_M16_C_VERSION = 819;
    public static final int TAG_MEASURED_LV = 786;
    public static final int TAG_QUALITY = 768;
    public static final int TAG_SERIAL_NUMBER = 771;
    public static final int TAG_USER_PROFILE = 770;
    public static final int TAG_WB_BLUE_LEVEL = 804;
    public static final int TAG_WB_GREEN_LEVEL = 803;
    public static final int TAG_WB_RED_LEVEL = 802;
    public static final int TAG_WHITE_BALANCE = 772;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(768, map, "Quality", 770, "User Profile");
        lv8.x(771, map, "Serial Number", 772, "White Balance");
        lv8.x(784, map, "Lens Type", 785, "External Sensor Brightness Value");
        lv8.x(TAG_MEASURED_LV, map, "Measured LV", TAG_APPROXIMATE_F_NUMBER, "Approximate F Number");
        lv8.x(TAG_CAMERA_TEMPERATURE, map, "Camera Temperature", TAG_COLOR_TEMPERATURE, "Color Temperature");
        lv8.x(TAG_WB_RED_LEVEL, map, "WB Red Level", TAG_WB_GREEN_LEVEL, "WB Green Level");
        lv8.x(TAG_WB_BLUE_LEVEL, map, "WB Blue Level", TAG_CCD_VERSION, "CCD Version");
        lv8.x(TAG_CCD_BOARD_VERSION, map, "CCD Board Version", TAG_CONTROLLER_BOARD_VERSION, "Controller Board Version");
        lv8.x(TAG_M16_C_VERSION, map, "M16 C Version", TAG_IMAGE_ID_NUMBER, "Image ID Number");
    }

    public LeicaMakernoteDirectory() {
        setDescriptor(new LeicaMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Leica Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
