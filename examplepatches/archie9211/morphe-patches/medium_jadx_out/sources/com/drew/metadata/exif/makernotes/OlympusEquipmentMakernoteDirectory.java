package com.drew.metadata.exif.makernotes;

import com.drew.imaging.avi.hzjl.bPUi;
import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class OlympusEquipmentMakernoteDirectory extends Directory {
    public static final int TAG_BODY_FIRMWARE_VERSION = 260;
    public static final int TAG_CAMERA_TYPE_2 = 256;
    public static final int TAG_CONVERSION_LENS = 1027;
    public static final int TAG_EQUIPMENT_VERSION = 0;
    public static final int TAG_EXTENDER = 769;
    public static final int TAG_EXTENDER_FIRMWARE_VERSION = 772;
    public static final int TAG_EXTENDER_MODEL = 771;
    public static final int TAG_EXTENDER_SERIAL_NUMBER = 770;
    public static final int TAG_FLASH_FIRMWARE_VERSION = 4098;
    public static final int TAG_FLASH_MODEL = 4097;
    public static final int TAG_FLASH_SERIAL_NUMBER = 4099;
    public static final int TAG_FLASH_TYPE = 4096;
    public static final int TAG_FOCAL_PLANE_DIAGONAL = 259;
    public static final int TAG_INTERNAL_SERIAL_NUMBER = 258;
    public static final int TAG_LENS_FIRMWARE_VERSION = 516;
    public static final int TAG_LENS_MODEL = 515;
    public static final int TAG_LENS_PROPERTIES = 523;
    public static final int TAG_LENS_SERIAL_NUMBER = 514;
    public static final int TAG_LENS_TYPE = 513;
    public static final int TAG_MAX_APERTURE = 522;
    public static final int TAG_MAX_APERTURE_AT_MAX_FOCAL = 518;
    public static final int TAG_MAX_APERTURE_AT_MIN_FOCAL = 517;
    public static final int TAG_MAX_FOCAL_LENGTH = 520;
    public static final int TAG_MIN_FOCAL_LENGTH = 519;
    public static final int TAG_SERIAL_NUMBER = 257;
    private static final HashMap<Integer, String> _tagNameMap;

    public OlympusEquipmentMakernoteDirectory() {
        setDescriptor(new OlympusEquipmentMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Olympus Equipment";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Equipment Version", 256, "Camera Type 2");
        lv8.x(257, map, "Serial Number", 258, "Internal Serial Number");
        lv8.x(259, map, "Focal Plane Diagonal", 260, "Body Firmware Version");
        lv8.x(513, map, "Lens Type", 514, "Lens Serial Number");
        lv8.x(515, map, "Lens Model", 516, "Lens Firmware Version");
        lv8.x(517, map, "Max Aperture At Min Focal", 518, "Max Aperture At Max Focal");
        lv8.x(519, map, "Min Focal Length", 520, "Max Focal Length");
        lv8.x(522, map, "Max Aperture", 523, "Lens Properties");
        lv8.x(769, map, "Extender", 770, "Extender Serial Number");
        lv8.x(771, map, "Extender Model", 772, "Extender Firmware Version");
        lv8.x(1027, map, bPUi.tPeVCSRWJ, 4096, "Flash Type");
        lv8.x(4097, map, "Flash Model", 4098, "Flash Firmware Version");
        map.put(4099, "Flash Serial Number");
    }
}
