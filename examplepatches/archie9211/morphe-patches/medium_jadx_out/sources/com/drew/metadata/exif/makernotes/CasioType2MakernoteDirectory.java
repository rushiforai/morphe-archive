package com.drew.metadata.exif.makernotes;

import com.drew.imaging.riff.pvS.uuLAxLN;
import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class CasioType2MakernoteDirectory extends Directory {
    public static final int TAG_BESTSHOT_MODE = 12295;
    public static final int TAG_CCD_ISO_SENSITIVITY = 12308;
    public static final int TAG_COLOUR_MODE = 12309;
    public static final int TAG_CONTRAST = 32;
    public static final int TAG_ENHANCEMENT = 12310;
    public static final int TAG_FILTER = 12311;
    public static final int TAG_FLASH_DISTANCE = 8244;
    public static final int TAG_FOCAL_LENGTH = 29;
    public static final int TAG_FOCUS_MODE_1 = 13;
    public static final int TAG_FOCUS_MODE_2 = 12291;
    public static final int TAG_IMAGE_SIZE = 9;
    public static final int TAG_ISO_SENSITIVITY = 20;
    public static final int TAG_OBJECT_DISTANCE = 8226;
    public static final int TAG_PREVIEW_THUMBNAIL = 8192;
    public static final int TAG_PRINT_IMAGE_MATCHING_INFO = 3584;
    public static final int TAG_QUALITY = 12290;
    public static final int TAG_QUALITY_MODE = 8;
    public static final int TAG_RECORD_MODE = 12288;
    public static final int TAG_SATURATION = 31;
    public static final int TAG_SELF_TIMER = 12289;
    public static final int TAG_SHARPNESS = 33;
    public static final int TAG_THUMBNAIL_DIMENSIONS = 2;
    public static final int TAG_THUMBNAIL_OFFSET = 4;
    public static final int TAG_THUMBNAIL_SIZE = 3;
    public static final int TAG_TIME_ZONE = 12294;
    public static final int TAG_WHITE_BALANCE_1 = 25;
    public static final int TAG_WHITE_BALANCE_2 = 8210;
    public static final int TAG_WHITE_BALANCE_BIAS = 8209;
    private static final HashMap<Integer, String> _tagNameMap;

    public CasioType2MakernoteDirectory() {
        setDescriptor(new CasioType2MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Casio Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(2, map, "Thumbnail Dimensions", 3, "Thumbnail Size");
        lv8.x(4, map, "Thumbnail Offset", 8, "Quality Mode");
        lv8.x(9, map, "Image Size", 13, "Focus Mode");
        lv8.x(20, map, "ISO Sensitivity", 25, "White Balance");
        lv8.x(29, map, "Focal Length", 31, "Saturation");
        lv8.x(32, map, "Contrast", 33, "Sharpness");
        lv8.x(3584, map, "Print Image Matching (PIM) Info", 8192, "Casio Preview Thumbnail");
        lv8.x(8209, map, "White Balance Bias", 8210, "White Balance");
        lv8.x(8226, map, "Object Distance", TAG_FLASH_DISTANCE, "Flash Distance");
        lv8.x(12288, map, "Record Mode", TAG_SELF_TIMER, uuLAxLN.cmqb);
        lv8.x(TAG_QUALITY, map, "Quality", TAG_FOCUS_MODE_2, "Focus Mode");
        lv8.x(TAG_TIME_ZONE, map, "Time Zone", TAG_BESTSHOT_MODE, "BestShot Mode");
        lv8.x(TAG_CCD_ISO_SENSITIVITY, map, "CCD ISO Sensitivity", TAG_COLOUR_MODE, "Colour Mode");
        lv8.x(TAG_ENHANCEMENT, map, "Enhancement", TAG_FILTER, "Filter");
    }
}
