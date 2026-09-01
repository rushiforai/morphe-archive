package com.drew.metadata.exif.makernotes;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class CanonMakernoteDirectory extends Directory {
    private static final int TAG_AF_INFO_ARRAY = 18;
    public static final int TAG_AF_INFO_ARRAY_2 = 38;
    public static final int TAG_AF_POINTS_IN_FOCUS_1D = 148;
    public static final int TAG_AMBIANCE_INFO_ARRAY = 16416;
    public static final int TAG_ASPECT_INFO_ARRAY = 154;
    public static final int TAG_BLACK_LEVEL = 16392;
    public static final int TAG_CAMERA_INFO_ARRAY = 13;
    private static final int TAG_CAMERA_SETTINGS_ARRAY = 1;
    public static final int TAG_CANON_CUSTOM_FUNCTIONS_ARRAY = 15;
    public static final int TAG_CANON_FILE_LENGTH = 14;
    public static final int TAG_CANON_FIRMWARE_VERSION = 7;
    public static final int TAG_CANON_FLAGS_ARRAY = 176;
    public static final int TAG_CANON_IMAGE_NUMBER = 8;
    public static final int TAG_CANON_IMAGE_TYPE = 6;
    public static final int TAG_CANON_OWNER_NAME = 9;
    public static final int TAG_CANON_SERIAL_NUMBER = 12;
    public static final int TAG_CATEGORIES = 35;
    public static final int TAG_COLOR_BALANCE_ARRAY = 169;
    public static final int TAG_COLOR_DATA_ARRAY_2 = 16385;
    public static final int TAG_COLOR_INFO_ARRAY = 16403;
    public static final int TAG_COLOR_INFO_ARRAY_2 = 16387;
    public static final int TAG_COLOR_SPACE = 180;
    public static final int TAG_COLOR_TEMPERATURE = 174;
    public static final int TAG_CROP_INFO = 152;
    public static final int TAG_CRW_PARAM = 16386;
    public static final int TAG_CUSTOM_FUNCTIONS_1D_ARRAY = 144;
    public static final int TAG_CUSTOM_FUNCTIONS_ARRAY_2 = 153;
    public static final int TAG_CUSTOM_PICTURE_STYLE_FILE_NAME = 16400;
    public static final int TAG_DATE_STAMP_MODE = 28;
    public static final int TAG_DUST_REMOVAL_DATA = 151;
    public static final int TAG_FACE_DETECT_ARRAY_1 = 36;
    public static final int TAG_FACE_DETECT_ARRAY_2 = 37;
    public static final int TAG_FILE_INFO_ARRAY = 147;
    public static final int TAG_FILTER_INFO_ARRAY = 16420;
    public static final int TAG_FIRMWARE_REVISION = 30;
    private static final int TAG_FOCAL_LENGTH_ARRAY = 2;
    public static final int TAG_IMAGE_UNIQUE_ID = 40;
    public static final int TAG_LENS_INFO_ARRAY = 16409;
    public static final int TAG_LENS_MODEL = 149;
    public static final int TAG_LIGHTING_OPTIMIZER_ARRAY = 16408;
    public static final int TAG_MEASURED_COLOR_ARRAY = 170;
    public static final int TAG_MODEL_ID = 16;
    public static final int TAG_MODIFIED_INFO_ARRAY = 177;
    public static final int TAG_MOVIE_INFO_ARRAY = 17;
    public static final int TAG_MY_COLORS = 29;
    public static final int TAG_ORIGINAL_DECISION_DATA_OFFSET = 131;
    private static final int TAG_PANORAMA_ARRAY = 5;
    public static final int TAG_PERSONAL_FUNCTIONS_ARRAY = 145;
    public static final int TAG_PERSONAL_FUNCTION_VALUES_ARRAY = 146;
    public static final int TAG_PREVIEW_IMAGE_INFO_ARRAY = 182;
    public static final int TAG_PROCESSING_INFO_ARRAY = 160;
    public static final int TAG_RAW_DATA_OFFSET = 129;
    public static final int TAG_SENSOR_INFO_ARRAY = 224;
    public static final int TAG_SERIAL_INFO_ARRAY = 150;
    public static final int TAG_SERIAL_NUMBER_FORMAT = 21;
    public static final int TAG_SHARPNESS_FREQ_TABLE = 163;
    public static final int TAG_SHARPNESS_TABLE = 162;
    private static final int TAG_SHOT_INFO_ARRAY = 4;
    public static final int TAG_SUPER_MACRO = 26;
    public static final int TAG_THUMBNAIL_IMAGE_VALID_AREA = 19;
    public static final int TAG_TONE_CURVE_MATCHING = 178;
    public static final int TAG_TONE_CURVE_TABLE = 161;
    public static final int TAG_VIGNETTING_CORRECTION_ARRAY_1 = 16405;
    public static final int TAG_VIGNETTING_CORRECTION_ARRAY_2 = 16406;
    public static final int TAG_VRD_OFFSET = 208;
    public static final int TAG_WHITE_BALANCE_MATCHING = 179;
    public static final int TAG_WHITE_BALANCE_TABLE = 164;
    private static final HashMap<Integer, String> _tagNameMap;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes.dex */
    public static final class AFInfo {
        private static final int OFFSET = 53760;
        public static final int TAG_AF_AREA_HEIGHT = 53767;
        public static final int TAG_AF_AREA_WIDTH = 53766;
        public static final int TAG_AF_AREA_X_POSITIONS = 53768;
        public static final int TAG_AF_AREA_Y_POSITIONS = 53769;
        public static final int TAG_AF_IMAGE_HEIGHT = 53765;
        public static final int TAG_AF_IMAGE_WIDTH = 53764;
        public static final int TAG_AF_POINTS_IN_FOCUS = 53770;
        public static final int TAG_IMAGE_HEIGHT = 53763;
        public static final int TAG_IMAGE_WIDTH = 53762;
        public static final int TAG_NUM_AF_POINTS = 53760;
        public static final int TAG_PRIMARY_AF_POINT_1 = 53771;
        public static final int TAG_PRIMARY_AF_POINT_2 = 53772;
        public static final int TAG_VALID_AF_POINTS = 53761;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes.dex */
    public static final class CameraSettings {
        private static final int OFFSET = 49408;
        public static final int TAG_AE_SETTING = 49439;
        public static final int TAG_AF_POINT_SELECTED = 49427;
        public static final int TAG_COLOR_TONE = 49449;
        public static final int TAG_CONTINUOUS_DRIVE_MODE = 49413;
        public static final int TAG_CONTRAST = 49421;
        public static final int TAG_DIGITAL_ZOOM = 49420;
        public static final int TAG_DISPLAY_APERTURE = 49441;
        public static final int TAG_EASY_SHOOTING_MODE = 49419;
        public static final int TAG_EXPOSURE_MODE = 49428;
        public static final int TAG_FLASH_ACTIVITY = 49436;
        public static final int TAG_FLASH_DETAILS = 49437;
        public static final int TAG_FLASH_MODE = 49412;
        public static final int TAG_FOCAL_UNITS_PER_MM = 49433;
        public static final int TAG_FOCUS_CONTINUOUS = 49438;
        public static final int TAG_FOCUS_MODE_1 = 49415;
        public static final int TAG_FOCUS_MODE_2 = 49440;
        public static final int TAG_FOCUS_TYPE = 49426;
        public static final int TAG_IMAGE_SIZE = 49418;
        public static final int TAG_ISO = 49424;
        public static final int TAG_LENS_TYPE = 49430;
        public static final int TAG_LONG_FOCAL_LENGTH = 49431;
        public static final int TAG_MACRO_MODE = 49409;
        public static final int TAG_MANUAL_FLASH_OUTPUT = 49447;
        public static final int TAG_MAX_APERTURE = 49434;
        public static final int TAG_METERING_MODE = 49425;
        public static final int TAG_MIN_APERTURE = 49435;
        public static final int TAG_PHOTO_EFFECT = 49446;
        public static final int TAG_QUALITY = 49411;
        public static final int TAG_RECORD_MODE = 49417;
        public static final int TAG_SATURATION = 49422;
        public static final int TAG_SELF_TIMER_DELAY = 49410;
        public static final int TAG_SHARPNESS = 49423;
        public static final int TAG_SHORT_FOCAL_LENGTH = 49432;
        public static final int TAG_SPOT_METERING_MODE = 49445;
        public static final int TAG_SRAW_QUALITY = 49453;
        public static final int TAG_UNKNOWN_2 = 49414;
        public static final int TAG_UNKNOWN_3 = 49416;
        public static final int TAG_UNKNOWN_7 = 49429;
        public static final int TAG_ZOOM_SOURCE_WIDTH = 49442;
        public static final int TAG_ZOOM_TARGET_WIDTH = 49443;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes.dex */
    public static final class FocalLength {
        private static final int OFFSET = 49664;
        public static final int TAG_AEB_BRACKET_VALUE = 49681;
        public static final int TAG_AF_POINT_USED = 49678;
        public static final int TAG_AUTO_EXPOSURE_BRACKETING = 49680;
        public static final int TAG_FLASH_BIAS = 49679;
        public static final int TAG_SEQUENCE_NUMBER = 49673;
        public static final int TAG_SUBJECT_DISTANCE = 49683;
        public static final int TAG_WHITE_BALANCE = 49671;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes.dex */
    public static final class Panorama {
        private static final int OFFSET = 50432;
        public static final int TAG_PANORAMA_DIRECTION = 50437;
        public static final int TAG_PANORAMA_FRAME_NUMBER = 50434;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes.dex */
    public static final class ShotInfo {
        private static final int OFFSET = 50176;
        public static final int TAG_AEB_BRACKET_VALUE = 50193;
        public static final int TAG_AF_POINTS_IN_FOCUS = 50190;
        public static final int TAG_AUTO_EXPOSURE_BRACKETING = 50192;
        public static final int TAG_AUTO_ISO = 50177;
        public static final int TAG_AUTO_ROTATE = 50203;
        public static final int TAG_BASE_ISO = 50178;
        public static final int TAG_BULB_DURATION = 50200;
        public static final int TAG_CAMERA_TEMPERATURE = 50188;
        public static final int TAG_CAMERA_TYPE = 50202;
        public static final int TAG_CONTROL_MODE = 50194;
        public static final int TAG_EXPOSURE_COMPENSATION = 50182;
        public static final int TAG_EXPOSURE_TIME = 50198;
        public static final int TAG_FLASH_EXPOSURE_BRACKETING = 50191;
        public static final int TAG_FLASH_GUIDE_NUMBER = 50189;
        public static final int TAG_FLASH_OUTPUT = 50209;
        public static final int TAG_FOCUS_DISTANCE_LOWER = 50196;
        public static final int TAG_FOCUS_DISTANCE_UPPER = 50195;
        public static final int TAG_F_NUMBER = 50197;
        public static final int TAG_MEASURED_EV = 50179;
        public static final int TAG_MEASURED_EV_2 = 50199;
        public static final int TAG_ND_FILTER = 50204;
        public static final int TAG_OPTICAL_ZOOM_CODE = 50186;
        public static final int TAG_SELF_TIMER_2 = 50205;
        public static final int TAG_SEQUENCE_NUMBER = 50185;
        public static final int TAG_SLOW_SHUTTER = 50184;
        public static final int TAG_TARGET_APERTURE = 50180;
        public static final int TAG_TARGET_EXPOSURE_TIME = 50181;
        public static final int TAG_WHITE_BALANCE = 50183;
    }

    public CanonMakernoteDirectory() {
        setDescriptor(new CanonMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Canon Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    @Override // com.drew.metadata.Directory
    public final void setObjectArray(int i, Object obj) {
        if (!(obj instanceof int[])) {
            setObject(i, obj);
            return;
        }
        int i2 = 0;
        if (i == 1) {
            int[] iArr = (int[]) obj;
            while (i2 < iArr.length) {
                setInt(49408 + i2, iArr[i2]);
                i2++;
            }
            return;
        }
        if (i == 2) {
            int[] iArr2 = (int[]) obj;
            while (i2 < iArr2.length) {
                setInt(49664 + i2, iArr2[i2]);
                i2++;
            }
            return;
        }
        if (i == 4) {
            int[] iArr3 = (int[]) obj;
            while (i2 < iArr3.length) {
                setInt(50176 + i2, iArr3[i2]);
                i2++;
            }
            return;
        }
        if (i == 5) {
            int[] iArr4 = (int[]) obj;
            while (i2 < iArr4.length) {
                setInt(50432 + i2, iArr4[i2]);
                i2++;
            }
            return;
        }
        if (i != 18) {
            setObject(i, obj);
            return;
        }
        int[] iArr5 = (int[]) obj;
        int i3 = iArr5[0];
        int i4 = 0;
        int i5 = 0;
        while (i4 < iArr5.length) {
            int i6 = AFInfo.TAG_NUM_AF_POINTS + i5;
            if (i6 == 53768 || i6 == 53769) {
                if (iArr5.length - 1 >= i4 + i3) {
                    short[] sArr = new short[i3];
                    for (int i7 = 0; i7 < i3; i7++) {
                        sArr[i7] = (short) iArr5[i4 + i7];
                    }
                    setObject(i6, sArr);
                }
                i4 += i3 - 1;
            } else if (i6 == 53770) {
                int i8 = (i3 + 15) / 16;
                short[] sArr2 = new short[i8];
                if (iArr5.length - 1 >= i4 + i8) {
                    for (int i9 = 0; i9 < i8; i9++) {
                        sArr2[i9] = (short) iArr5[i4 + i9];
                    }
                    setObject(i6, sArr2);
                }
                i4 += i8 - 1;
            } else {
                setObject(i6, Integer.valueOf(iArr5[i4]));
            }
            i5++;
            i4++;
        }
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(7, map, "Firmware Version", 8, "Image Number");
        lv8.x(6, map, "Image Type", 9, "Owner Name");
        lv8.x(12, map, "Camera Serial Number", 13, "Camera Info Array");
        lv8.x(14, map, "File Length", 15, "Custom Functions");
        lv8.x(16, map, "Canon Model ID", 17, "Movie Info Array");
        lv8.x(CameraSettings.TAG_AF_POINT_SELECTED, map, "AF Point Selected", CameraSettings.TAG_CONTINUOUS_DRIVE_MODE, "Continuous Drive Mode");
        lv8.x(CameraSettings.TAG_CONTRAST, map, PqkdNGCEoxOKZk.stWZ, CameraSettings.TAG_EASY_SHOOTING_MODE, "Easy Shooting Mode");
        lv8.x(CameraSettings.TAG_EXPOSURE_MODE, map, "Exposure Mode", CameraSettings.TAG_FLASH_DETAILS, "Flash Details");
        lv8.x(CameraSettings.TAG_FLASH_MODE, map, "Flash Mode", CameraSettings.TAG_FOCAL_UNITS_PER_MM, "Focal Units per mm");
        lv8.x(CameraSettings.TAG_FOCUS_MODE_1, map, "Focus Mode", CameraSettings.TAG_FOCUS_MODE_2, "Focus Mode");
        lv8.x(CameraSettings.TAG_IMAGE_SIZE, map, "Image Size", CameraSettings.TAG_ISO, "Iso");
        lv8.x(CameraSettings.TAG_LONG_FOCAL_LENGTH, map, "Long Focal Length", CameraSettings.TAG_MACRO_MODE, "Macro Mode");
        lv8.x(CameraSettings.TAG_METERING_MODE, map, "Metering Mode", CameraSettings.TAG_SATURATION, "Saturation");
        lv8.x(CameraSettings.TAG_SELF_TIMER_DELAY, map, "Self Timer Delay", CameraSettings.TAG_SHARPNESS, "Sharpness");
        lv8.x(CameraSettings.TAG_SHORT_FOCAL_LENGTH, map, "Short Focal Length", CameraSettings.TAG_QUALITY, "Quality");
        lv8.x(CameraSettings.TAG_UNKNOWN_2, map, "Unknown Camera Setting 2", CameraSettings.TAG_UNKNOWN_3, "Unknown Camera Setting 3");
        lv8.x(CameraSettings.TAG_RECORD_MODE, map, "Record Mode", CameraSettings.TAG_DIGITAL_ZOOM, "Digital Zoom");
        lv8.x(CameraSettings.TAG_FOCUS_TYPE, map, "Focus Type", CameraSettings.TAG_UNKNOWN_7, "Unknown Camera Setting 7");
        lv8.x(CameraSettings.TAG_LENS_TYPE, map, "Lens Type", CameraSettings.TAG_MAX_APERTURE, "Max Aperture");
        lv8.x(CameraSettings.TAG_MIN_APERTURE, map, "Min Aperture", CameraSettings.TAG_FLASH_ACTIVITY, "Flash Activity");
        lv8.x(CameraSettings.TAG_FOCUS_CONTINUOUS, map, "Focus Continuous", CameraSettings.TAG_AE_SETTING, "AE Setting");
        lv8.x(CameraSettings.TAG_DISPLAY_APERTURE, map, "Display Aperture", CameraSettings.TAG_ZOOM_SOURCE_WIDTH, "Zoom Source Width");
        lv8.x(CameraSettings.TAG_ZOOM_TARGET_WIDTH, map, "Zoom Target Width", CameraSettings.TAG_SPOT_METERING_MODE, "Spot Metering Mode");
        lv8.x(CameraSettings.TAG_PHOTO_EFFECT, map, "Photo Effect", CameraSettings.TAG_MANUAL_FLASH_OUTPUT, "Manual Flash Output");
        lv8.x(CameraSettings.TAG_COLOR_TONE, map, "Color Tone", CameraSettings.TAG_SRAW_QUALITY, "SRAW Quality");
        lv8.x(FocalLength.TAG_WHITE_BALANCE, map, "White Balance", FocalLength.TAG_SEQUENCE_NUMBER, "Sequence Number");
        lv8.x(FocalLength.TAG_AF_POINT_USED, map, "AF Point Used", FocalLength.TAG_FLASH_BIAS, AXoTRPEGKEve.RNG);
        lv8.x(FocalLength.TAG_AUTO_EXPOSURE_BRACKETING, map, "Auto Exposure Bracketing", FocalLength.TAG_AEB_BRACKET_VALUE, "AEB Bracket Value");
        lv8.x(FocalLength.TAG_SUBJECT_DISTANCE, map, "Subject Distance", ShotInfo.TAG_AUTO_ISO, "Auto ISO");
        lv8.x(ShotInfo.TAG_BASE_ISO, map, "Base ISO", ShotInfo.TAG_MEASURED_EV, "Measured EV");
        lv8.x(ShotInfo.TAG_TARGET_APERTURE, map, "Target Aperture", ShotInfo.TAG_TARGET_EXPOSURE_TIME, "Target Exposure Time");
        lv8.x(ShotInfo.TAG_EXPOSURE_COMPENSATION, map, "Exposure Compensation", ShotInfo.TAG_WHITE_BALANCE, "White Balance");
        lv8.x(ShotInfo.TAG_SLOW_SHUTTER, map, "Slow Shutter", ShotInfo.TAG_SEQUENCE_NUMBER, "Sequence Number");
        lv8.x(ShotInfo.TAG_OPTICAL_ZOOM_CODE, map, "Optical Zoom Code", ShotInfo.TAG_CAMERA_TEMPERATURE, "Camera Temperature");
        lv8.x(ShotInfo.TAG_FLASH_GUIDE_NUMBER, map, "Flash Guide Number", ShotInfo.TAG_AF_POINTS_IN_FOCUS, "AF Points in Focus");
        lv8.x(ShotInfo.TAG_FLASH_EXPOSURE_BRACKETING, map, "Flash Exposure Compensation", ShotInfo.TAG_AUTO_EXPOSURE_BRACKETING, "Auto Exposure Bracketing");
        lv8.x(ShotInfo.TAG_AEB_BRACKET_VALUE, map, "AEB Bracket Value", ShotInfo.TAG_CONTROL_MODE, "Control Mode");
        lv8.x(ShotInfo.TAG_FOCUS_DISTANCE_UPPER, map, "Focus Distance Upper", ShotInfo.TAG_FOCUS_DISTANCE_LOWER, "Focus Distance Lower");
        lv8.x(ShotInfo.TAG_F_NUMBER, map, "F Number", ShotInfo.TAG_EXPOSURE_TIME, "Exposure Time");
        lv8.x(ShotInfo.TAG_MEASURED_EV_2, map, "Measured EV 2", ShotInfo.TAG_BULB_DURATION, "Bulb Duration");
        lv8.x(ShotInfo.TAG_CAMERA_TYPE, map, "Camera Type", ShotInfo.TAG_AUTO_ROTATE, "Auto Rotate");
        lv8.x(ShotInfo.TAG_ND_FILTER, map, "ND Filter", ShotInfo.TAG_SELF_TIMER_2, "Self Timer 2");
        lv8.x(ShotInfo.TAG_FLASH_OUTPUT, map, "Flash Output", Panorama.TAG_PANORAMA_FRAME_NUMBER, "Panorama Frame Number");
        lv8.x(Panorama.TAG_PANORAMA_DIRECTION, map, "Panorama Direction", AFInfo.TAG_NUM_AF_POINTS, "AF Point Count");
        lv8.x(AFInfo.TAG_VALID_AF_POINTS, map, "Valid AF Point Count", AFInfo.TAG_IMAGE_WIDTH, "Image Width");
        lv8.x(AFInfo.TAG_IMAGE_HEIGHT, map, "Image Height", AFInfo.TAG_AF_IMAGE_WIDTH, "AF Image Width");
        lv8.x(AFInfo.TAG_AF_IMAGE_HEIGHT, map, "AF Image Height", AFInfo.TAG_AF_AREA_WIDTH, "AF Area Width");
        lv8.x(AFInfo.TAG_AF_AREA_HEIGHT, map, "AF Area Height", AFInfo.TAG_AF_AREA_X_POSITIONS, "AF Area X Positions");
        lv8.x(AFInfo.TAG_AF_AREA_Y_POSITIONS, map, "AF Area Y Positions", AFInfo.TAG_AF_POINTS_IN_FOCUS, "AF Points in Focus");
        lv8.x(AFInfo.TAG_PRIMARY_AF_POINT_1, map, "Primary AF Point 1", AFInfo.TAG_PRIMARY_AF_POINT_2, "Primary AF Point 2");
        lv8.x(19, map, "Thumbnail Image Valid Area", 21, "Serial Number Format");
        lv8.x(26, map, "Super Macro", 28, "Date Stamp Mode");
        lv8.x(29, map, "My Colors", 30, "Firmware Revision");
        lv8.x(35, map, "Categories", 36, "Face Detect Array 1");
        lv8.x(37, map, "Face Detect Array 2", 38, "AF Info Array 2");
        lv8.x(40, map, "Image Unique ID", 129, "Raw Data Offset");
        lv8.x(131, map, "Original Decision Data Offset", 144, "Custom Functions (1D) Array");
        lv8.x(145, map, "Personal Functions Array", 146, "Personal Function Values Array");
        lv8.x(147, map, "File Info Array", 148, "AF Points in Focus (1D)");
        lv8.x(149, map, "Lens Model", 150, "Serial Info Array");
        lv8.x(151, map, "Dust Removal Data", 152, "Crop Info");
        lv8.x(153, map, "Custom Functions Array 2", 154, "Aspect Information Array");
        lv8.x(160, map, "Processing Information Array", TAG_TONE_CURVE_TABLE, "Tone Curve Table");
        lv8.x(162, map, "Sharpness Table", 163, "Sharpness Frequency Table");
        lv8.x(164, map, "White Balance Table", 169, "Color Balance Array");
        lv8.x(170, map, "Measured Color Array", 174, "Color Temperature");
        lv8.x(176, map, "Canon Flags Array", 177, "Modified Information Array");
        lv8.x(178, map, "Tone Curve Matching", 179, "White Balance Matching");
        lv8.x(180, map, "Color Space", 182, "Preview Image Info Array");
        lv8.x(208, map, "VRD Offset", TAG_SENSOR_INFO_ARRAY, "Sensor Information Array");
        lv8.x(TAG_COLOR_DATA_ARRAY_2, map, "Color Data Array 1", TAG_CRW_PARAM, "CRW Parameters");
        lv8.x(TAG_COLOR_INFO_ARRAY_2, map, "Color Data Array 2", TAG_BLACK_LEVEL, "Black Level");
        lv8.x(TAG_CUSTOM_PICTURE_STYLE_FILE_NAME, map, "Custom Picture Style File Name", TAG_COLOR_INFO_ARRAY, "Color Info Array");
        lv8.x(TAG_VIGNETTING_CORRECTION_ARRAY_1, map, "Vignetting Correction Array 1", TAG_VIGNETTING_CORRECTION_ARRAY_2, "Vignetting Correction Array 2");
        lv8.x(TAG_LIGHTING_OPTIMIZER_ARRAY, map, "Lighting Optimizer Array", TAG_LENS_INFO_ARRAY, "Lens Info Array");
        lv8.x(TAG_AMBIANCE_INFO_ARRAY, map, "Ambiance Info Array", TAG_FILTER_INFO_ARRAY, "Filter Info Array");
    }
}
