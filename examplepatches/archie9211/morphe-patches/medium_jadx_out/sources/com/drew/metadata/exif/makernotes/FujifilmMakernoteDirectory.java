package com.drew.metadata.exif.makernotes;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class FujifilmMakernoteDirectory extends Directory {
    public static final int TAG_AUTO_BRACKETING = 4352;
    public static final int TAG_AUTO_DYNAMIC_RANGE = 5131;
    public static final int TAG_AUTO_EXPOSURE_WARNING = 4866;
    public static final int TAG_BLUR_WARNING = 4864;
    public static final int TAG_COLOR_SATURATION = 4099;
    public static final int TAG_COLOR_TEMPERATURE = 4101;
    public static final int TAG_CONTRAST = 4102;
    public static final int TAG_DEVELOPMENT_DYNAMIC_RANGE = 5123;
    public static final int TAG_DYNAMIC_RANGE = 5120;
    public static final int TAG_DYNAMIC_RANGE_SETTING = 5122;
    public static final int TAG_EXR_AUTO = 4147;
    public static final int TAG_EXR_MODE = 4148;
    public static final int TAG_FACES_DETECTED = 16640;
    public static final int TAG_FACE_POSITIONS = 16643;
    public static final int TAG_FACE_REC_INFO = 17026;
    public static final int TAG_FILE_SOURCE = 32768;
    public static final int TAG_FILM_MODE = 5121;
    public static final int TAG_FINE_PIX_COLOR = 4624;
    public static final int TAG_FLASH_EV = 4113;
    public static final int TAG_FLASH_MODE = 4112;
    public static final int TAG_FOCUS_MODE = 4129;
    public static final int TAG_FOCUS_PIXEL = 4131;
    public static final int TAG_FOCUS_WARNING = 4865;
    public static final int TAG_FRAME_NUMBER = 32771;
    public static final int TAG_GE_IMAGE_SIZE = 4868;
    public static final int TAG_HIGH_ISO_NOISE_REDUCTION = 4110;
    public static final int TAG_IMAGE_NUMBER = 5176;
    public static final int TAG_MACRO = 4128;
    public static final int TAG_MAKERNOTE_VERSION = 0;
    public static final int TAG_MAX_APERTURE_AT_MAX_FOCAL = 5127;
    public static final int TAG_MAX_APERTURE_AT_MIN_FOCAL = 5126;
    public static final int TAG_MAX_FOCAL_LENGTH = 5125;
    public static final int TAG_MIN_FOCAL_LENGTH = 5124;
    public static final int TAG_NOISE_REDUCTION = 4107;
    public static final int TAG_ORDER_NUMBER = 32770;
    public static final int TAG_PARALLAX = 45585;
    public static final int TAG_PICTURE_MODE = 4145;
    public static final int TAG_QUALITY = 4096;
    public static final int TAG_SEQUENCE_NUMBER = 4353;
    public static final int TAG_SERIAL_NUMBER = 16;
    public static final int TAG_SHARPNESS = 4097;
    public static final int TAG_SLOW_SYNC = 4144;
    public static final int TAG_TONE = 4100;
    public static final int TAG_WHITE_BALANCE = 4098;
    public static final int TAG_WHITE_BALANCE_FINE_TUNE = 4106;
    private static final HashMap<Integer, String> _tagNameMap;

    public FujifilmMakernoteDirectory() {
        setDescriptor(new FujifilmMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Fujifilm Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Makernote Version", 16, "Serial Number");
        lv8.x(4096, map, "Quality", 4097, "Sharpness");
        lv8.x(4098, map, "White Balance", 4099, "Color Saturation");
        lv8.x(4100, map, "Tone (Contrast)", 4101, "Color Temperature");
        lv8.x(4102, map, "Contrast", 4106, "White Balance Fine Tune");
        lv8.x(4107, map, "Noise Reduction", 4110, "High ISO Noise Reduction");
        lv8.x(4112, map, "Flash Mode", 4113, "Flash Strength");
        lv8.x(4128, map, "Macro", 4129, "Focus Mode");
        lv8.x(4131, map, "Focus Pixel", 4144, "Slow Sync");
        lv8.x(4145, map, "Picture Mode", 4147, "EXR Auto");
        lv8.x(4148, map, "EXR Mode", TAG_AUTO_BRACKETING, "Auto Bracketing");
        lv8.x(TAG_SEQUENCE_NUMBER, map, "Sequence Number", TAG_FINE_PIX_COLOR, "FinePix Color Setting");
        lv8.x(TAG_BLUR_WARNING, map, "Blur Warning", TAG_FOCUS_WARNING, "Focus Warning");
        lv8.x(TAG_AUTO_EXPOSURE_WARNING, map, PdtluglzAX.aPPxqdereGkPN, TAG_GE_IMAGE_SIZE, "GE Image Size");
        lv8.x(TAG_DYNAMIC_RANGE, map, "Dynamic Range", TAG_FILM_MODE, "Film Mode");
        lv8.x(TAG_DYNAMIC_RANGE_SETTING, map, "Dynamic Range Setting", TAG_DEVELOPMENT_DYNAMIC_RANGE, "Development Dynamic Range");
        lv8.x(TAG_MIN_FOCAL_LENGTH, map, "Minimum Focal Length", TAG_MAX_FOCAL_LENGTH, "Maximum Focal Length");
        lv8.x(TAG_MAX_APERTURE_AT_MIN_FOCAL, map, "Maximum Aperture at Minimum Focal Length", TAG_MAX_APERTURE_AT_MAX_FOCAL, "Maximum Aperture at Maximum Focal Length");
        lv8.x(TAG_AUTO_DYNAMIC_RANGE, map, "Auto Dynamic Range", TAG_FACES_DETECTED, "Faces Detected");
        lv8.x(TAG_FACE_POSITIONS, map, "Face Positions", TAG_FACE_REC_INFO, "Face Detection Data");
        lv8.x(32768, map, "File Source", TAG_ORDER_NUMBER, "Order Number");
        lv8.x(TAG_FRAME_NUMBER, map, "Frame Number", TAG_PARALLAX, "Parallax");
        map.put(Integer.valueOf(TAG_IMAGE_NUMBER), "Image Number");
    }
}
