package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SonyType1MakernoteDirectory extends Directory {
    public static final int TAG_9050A = 48;
    public static final int TAG_9050B = 36944;
    public static final int TAG_9050C = 64;
    public static final int TAG_AF_ILLUMINATOR = 45124;
    public static final int TAG_AF_MODE = 45123;
    public static final int TAG_AF_POINT_SELECTED = 8222;
    public static final int TAG_ANTI_BLUR = 45131;
    public static final int TAG_AUTO_PORTRAIT_FRAMED = 8214;
    public static final int TAG_BRIGHTNESS = 8199;
    public static final int TAG_CAMERA_INFO = 16;
    public static final int TAG_CAMERA_SETTINGS = 276;
    public static final int TAG_COLOR_COMPENSATION_FILTER = 45090;
    public static final int TAG_COLOR_MODE = 45097;
    public static final int TAG_COLOR_MODE_SETTING = 45088;
    public static final int TAG_COLOR_TEMPERATURE = 45089;
    public static final int TAG_CONTRAST = 8196;
    public static final int TAG_DISTORTION_CORRECTION = 8211;
    public static final int TAG_DYNAMIC_RANGE_OPTIMISER = 45093;
    public static final int TAG_DYNAMIC_RANGE_OPTIMIZER = 45135;
    public static final int TAG_EXPOSURE_MODE = 45121;
    public static final int TAG_EXTRA_INFO = 278;
    public static final int TAG_FILE_FORMAT = 45056;
    public static final int TAG_FLASH_EXPOSURE_COMP = 260;
    public static final int TAG_FLASH_LEVEL = 45128;
    public static final int TAG_FOCUS_INFO = 32;
    public static final int TAG_FOCUS_MODE = 8219;
    public static final int TAG_FOCUS_MODE_2 = 45122;
    public static final int TAG_FULL_IMAGE_SIZE = 45099;
    public static final int TAG_HDR = 8202;
    public static final int TAG_HIGH_ISO_NOISE_REDUCTION = 8201;
    public static final int TAG_HIGH_ISO_NOISE_REDUCTION_2 = 45136;
    public static final int TAG_IMAGE_QUALITY = 258;
    public static final int TAG_IMAGE_STABILISATION = 45094;
    public static final int TAG_INTELLIGENT_AUTO = 45138;
    public static final int TAG_JPEG_QUALITY = 45127;
    public static final int TAG_LATERAL_CHROMATIC_ABERRATION = 8210;
    public static final int TAG_LENS_ID = 45095;
    public static final int TAG_LENS_SPEC = 45098;
    public static final int TAG_LONG_EXPOSURE_NOISE_REDUCTION = 8200;
    public static final int TAG_LONG_EXPOSURE_NOISE_REDUCTION_OR_FOCUS_MODE = 45134;
    public static final int TAG_MACRO = 45120;
    public static final int TAG_MINOLTA_MAKERNOTE = 45096;
    public static final int TAG_MULTI_BURST_IMAGE_HEIGHT = 4098;
    public static final int TAG_MULTI_BURST_IMAGE_WIDTH = 4097;
    public static final int TAG_MULTI_BURST_MODE = 4096;
    public static final int TAG_MULTI_FRAME_NOISE_REDUCTION = 8203;
    public static final int TAG_NO_PRINT = 65535;
    public static final int TAG_PANORAMA = 4099;
    public static final int TAG_PICTURE_EFFECT = 8206;
    public static final int TAG_PREVIEW_IMAGE = 8193;
    public static final int TAG_PREVIEW_IMAGE_SIZE = 45100;
    public static final int TAG_PRINT_IMAGE_MATCHING_INFO = 3584;
    public static final int TAG_RATING = 8194;
    public static final int TAG_RELEASE_MODE = 45129;
    public static final int TAG_SATURATION = 8197;
    public static final int TAG_SCENE_MODE = 45091;
    public static final int TAG_SEQUENCE_NUMBER = 45130;
    public static final int TAG_SHARPNESS = 8198;
    public static final int TAG_SHOT_INFO = 12288;
    public static final int TAG_SOFT_SKIN_EFFECT = 8207;
    public static final int TAG_SONY_MODEL_ID = 45057;
    public static final int TAG_TELECONVERTER = 261;
    public static final int TAG_VIGNETTING_CORRECTION = 8209;
    public static final int TAG_WB_SHIFT_AMBER_MAGENTA = 8212;
    public static final int TAG_WHITE_BALANCE = 277;
    public static final int TAG_WHITE_BALANCE_2 = 45140;
    public static final int TAG_WHITE_BALANCE_FINE_TUNE = 274;
    public static final int TAG_ZONE_MATCHING = 45092;
    private static final HashMap<Integer, String> _tagNameMap;

    public SonyType1MakernoteDirectory() {
        setDescriptor(new SonyType1MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Sony Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(16, map, "Camera Info", 32, "Focus Info");
        lv8.x(258, map, "Image Quality", 260, "Flash Exposure Compensation");
        lv8.x(261, map, "Teleconverter Model", 274, "White Balance Fine Tune Value");
        lv8.x(276, map, "Camera Settings", 277, "White Balance");
        lv8.x(278, map, "Extra Info", 3584, "Print Image Matching (PIM) Info");
        lv8.x(4096, map, "Multi Burst Mode", 4097, "Multi Burst Image Width");
        lv8.x(4098, map, "Multi Burst Image Height", 4099, "Panorama");
        lv8.x(8193, map, "Preview Image", 8194, "Rating");
        lv8.x(TAG_CONTRAST, map, "Contrast", TAG_SATURATION, "Saturation");
        lv8.x(TAG_SHARPNESS, map, "Sharpness", TAG_BRIGHTNESS, "Brightness");
        lv8.x(TAG_LONG_EXPOSURE_NOISE_REDUCTION, map, "Long Exposure Noise Reduction", TAG_HIGH_ISO_NOISE_REDUCTION, "High ISO Noise Reduction");
        lv8.x(TAG_HDR, map, "HDR", TAG_MULTI_FRAME_NOISE_REDUCTION, "Multi Frame Noise Reduction");
        lv8.x(TAG_PICTURE_EFFECT, map, "Picture Effect", TAG_SOFT_SKIN_EFFECT, "Soft Skin Effect");
        lv8.x(8209, map, "Vignetting Correction", 8210, "Lateral Chromatic Aberration");
        lv8.x(TAG_DISTORTION_CORRECTION, map, "Distortion Correction", TAG_WB_SHIFT_AMBER_MAGENTA, "WB Shift Amber/Magenta");
        lv8.x(TAG_AUTO_PORTRAIT_FRAMED, map, "Auto Portrait Framing", TAG_FOCUS_MODE, "Focus Mode");
        lv8.x(TAG_AF_POINT_SELECTED, map, "AF Point Selected", 12288, "Shot Info");
        lv8.x(TAG_FILE_FORMAT, map, pUlNWdybf.DhlIxMXbiOWNbAw, TAG_SONY_MODEL_ID, "Sony Model ID");
        lv8.x(TAG_COLOR_MODE_SETTING, map, "Color Mode Setting", TAG_COLOR_TEMPERATURE, "Color Temperature");
        lv8.x(TAG_COLOR_COMPENSATION_FILTER, map, "Color Compensation Filter", TAG_SCENE_MODE, "Scene Mode");
        lv8.x(TAG_ZONE_MATCHING, map, "Zone Matching", TAG_DYNAMIC_RANGE_OPTIMISER, "Dynamic Range Optimizer");
        lv8.x(TAG_IMAGE_STABILISATION, map, "Image Stabilisation", TAG_LENS_ID, "Lens ID");
        lv8.x(TAG_MINOLTA_MAKERNOTE, map, "Minolta Makernote", TAG_COLOR_MODE, "Color Mode");
        lv8.x(TAG_LENS_SPEC, map, "Lens Spec", TAG_FULL_IMAGE_SIZE, "Full Image Size");
        lv8.x(TAG_PREVIEW_IMAGE_SIZE, map, "Preview Image Size", TAG_MACRO, "Macro");
        lv8.x(TAG_EXPOSURE_MODE, map, "Exposure Mode", TAG_FOCUS_MODE_2, "Focus Mode");
        lv8.x(TAG_AF_MODE, map, "AF Mode", TAG_AF_ILLUMINATOR, "AF Illuminator");
        lv8.x(TAG_JPEG_QUALITY, map, "Quality", TAG_FLASH_LEVEL, "Flash Level");
        lv8.x(TAG_RELEASE_MODE, map, "Release Mode", TAG_SEQUENCE_NUMBER, "Sequence Number");
        lv8.x(TAG_ANTI_BLUR, map, "Anti Blur", TAG_LONG_EXPOSURE_NOISE_REDUCTION_OR_FOCUS_MODE, "Long Exposure Noise Reduction");
        lv8.x(TAG_DYNAMIC_RANGE_OPTIMIZER, map, "Dynamic Range Optimizer", TAG_HIGH_ISO_NOISE_REDUCTION_2, "High ISO Noise Reduction");
        lv8.x(TAG_INTELLIGENT_AUTO, map, "Intelligent Auto", TAG_WHITE_BALANCE_2, "White Balance 2");
        map.put(65535, "No Print");
    }
}
