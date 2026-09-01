package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SanyoMakernoteDirectory extends Directory {
    public static final int TAG_CAMERA_ID = 521;
    public static final int TAG_COLOR_ADJUSTMENT_MODE = 528;
    public static final int TAG_DATA_DUMP = 3840;
    public static final int TAG_DIGITAL_ZOOM = 516;
    public static final int TAG_DIGITAL_ZOOM_ON = 539;
    public static final int TAG_FLASH_MODE = 549;
    public static final int TAG_FLICKER_REDUCE = 536;
    public static final int TAG_LIGHT_SOURCE_SPECIAL = 541;
    public static final int TAG_MACRO = 514;
    public static final int TAG_MAKERNOTE_OFFSET = 255;
    public static final int TAG_MANUAL_FOCUS_DISTANCE_OR_FACE_INFO = 547;
    public static final int TAG_OPTICAL_ZOOM_ON = 537;
    public static final int TAG_PICT_INFO = 520;
    public static final int TAG_PRINT_IMAGE_MATCHING_INFO = 3584;
    public static final int TAG_QUICK_SHOT = 531;
    public static final int TAG_RECORD_SHUTTER_RELEASE = 535;
    public static final int TAG_RESAVED = 542;
    public static final int TAG_SANYO_QUALITY = 513;
    public static final int TAG_SANYO_THUMBNAIL = 256;
    public static final int TAG_SCENE_SELECT = 543;
    public static final int TAG_SELF_TIMER = 532;
    public static final int TAG_SEQUENCE_SHOT_INTERVAL = 548;
    public static final int TAG_SEQUENTIAL_SHOT = 526;
    public static final int TAG_SOFTWARE_VERSION = 519;
    public static final int TAG_SPECIAL_MODE = 512;
    public static final int TAG_VOICE_MEMO = 534;
    public static final int TAG_WIDE_RANGE = 527;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(255, map, "Makernote Offset", 256, "Sanyo Thumbnail");
        lv8.x(512, map, "Special Mode", 513, "Sanyo Quality");
        lv8.x(514, map, "Macro", 516, "Digital Zoom");
        lv8.x(519, map, "Software Version", 520, "Pict Info");
        lv8.x(521, map, "Camera ID", TAG_SEQUENTIAL_SHOT, "Sequential Shot");
        lv8.x(527, map, "Wide Range", 528, "Color Adjustment Node");
        lv8.x(531, map, "Quick Shot", 532, "Self Timer");
        lv8.x(534, map, "Voice Memo", TAG_RECORD_SHUTTER_RELEASE, "Record Shutter Release");
        lv8.x(TAG_FLICKER_REDUCE, map, "Flicker Reduce", 537, "Optical Zoom On");
        lv8.x(539, map, "Digital Zoom On", TAG_LIGHT_SOURCE_SPECIAL, "Light Source Special");
        lv8.x(542, map, "Resaved", TAG_SCENE_SELECT, "Scene Select");
        lv8.x(547, map, "Manual Focus Distance or Face Info", TAG_SEQUENCE_SHOT_INTERVAL, "Sequence Shot Interval");
        lv8.x(549, map, "Flash Mode", 3584, "Print IM");
        map.put(3840, "Data Dump");
    }

    public SanyoMakernoteDirectory() {
        setDescriptor(new SanyoMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Sanyo Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
