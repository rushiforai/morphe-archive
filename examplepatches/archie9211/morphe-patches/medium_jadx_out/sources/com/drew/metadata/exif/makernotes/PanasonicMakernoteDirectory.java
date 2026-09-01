package com.drew.metadata.exif.makernotes;

import com.drew.lang.ByteArrayReader;
import com.drew.metadata.Age;
import com.drew.metadata.Directory;
import com.drew.metadata.Face;
import defpackage.lv8;
import java.io.IOException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PanasonicMakernoteDirectory extends Directory {
    public static final int TAG_ACCELEROMETER_X = 141;
    public static final int TAG_ACCELEROMETER_Y = 142;
    public static final int TAG_ACCELEROMETER_Z = 140;
    public static final int TAG_ACCESSORY_SERIAL_NUMBER = 84;
    public static final int TAG_ACCESSORY_TYPE = 83;
    public static final int TAG_ADVANCED_SCENE_MODE = 61;
    public static final int TAG_AF_AREA_MODE = 15;
    public static final int TAG_AF_ASSIST_LAMP = 49;
    public static final int TAG_AF_POINT_POSITION = 77;
    public static final int TAG_AUDIO = 32;
    public static final int TAG_BABY_AGE = 51;
    public static final int TAG_BABY_AGE_1 = 32784;
    public static final int TAG_BABY_NAME = 102;
    public static final int TAG_BRACKET_SETTINGS = 69;
    public static final int TAG_BURST_MODE = 42;
    public static final int TAG_BURST_SPEED = 119;
    public static final int TAG_CAMERA_ORIENTATION = 143;
    public static final int TAG_CITY = 109;
    public static final int TAG_CITY2 = 128;
    public static final int TAG_CLEAR_RETOUCH = 124;
    public static final int TAG_CLEAR_RETOUCH_VALUE = 163;
    public static final int TAG_COLOR_EFFECT = 40;
    public static final int TAG_COLOR_MODE = 50;
    public static final int TAG_COLOR_TEMP_KELVIN = 68;
    public static final int TAG_CONTRAST = 57;
    public static final int TAG_CONTRAST_MODE = 44;
    public static final int TAG_CONVERSION_LENS = 53;
    public static final int TAG_COUNTRY = 105;
    public static final int TAG_EASY_MODE = 34;
    public static final int TAG_EXIF_VERSION = 38;
    public static final int TAG_FACES_DETECTED = 63;
    public static final int TAG_FACE_DETECTION_INFO = 78;
    public static final int TAG_FACE_RECOGNITION_INFO = 97;
    public static final int TAG_FILM_MODE = 66;
    public static final int TAG_FIRMWARE_VERSION = 2;
    public static final int TAG_FLASH_BIAS = 36;
    public static final int TAG_FLASH_CURTAIN = 72;
    public static final int TAG_FLASH_FIRED = 32775;
    public static final int TAG_FLASH_WARNING = 98;
    public static final int TAG_FOCUS_MODE = 7;
    public static final int TAG_HDR = 158;
    public static final int TAG_IMAGE_STABILIZATION = 26;
    public static final int TAG_INTELLIGENT_D_RANGE = 121;
    public static final int TAG_INTELLIGENT_EXPOSURE = 93;
    public static final int TAG_INTELLIGENT_RESOLUTION = 112;
    public static final int TAG_INTERNAL_ND_FILTER = 157;
    public static final int TAG_INTERNAL_SERIAL_NUMBER = 37;
    public static final int TAG_LANDMARK = 111;
    public static final int TAG_LENS_FIRMWARE_VERSION = 96;
    public static final int TAG_LENS_SERIAL_NUMBER = 82;
    public static final int TAG_LENS_TYPE = 81;
    public static final int TAG_LOCATION = 103;
    public static final int TAG_LONG_EXPOSURE_NOISE_REDUCTION = 73;
    public static final int TAG_MACRO_MODE = 28;
    public static final int TAG_MAKERNOTE_VERSION = 32768;
    public static final int TAG_NOISE_REDUCTION = 45;
    public static final int TAG_OPTICAL_ZOOM_MODE = 52;
    public static final int TAG_PANASONIC_IMAGE_HEIGHT = 76;
    public static final int TAG_PANASONIC_IMAGE_WIDTH = 75;
    public static final int TAG_PHOTO_STYLE = 137;
    public static final int TAG_PITCH_ANGLE = 145;
    public static final int TAG_PRINT_IMAGE_MATCHING_INFO = 3584;
    public static final int TAG_PROGRAM_ISO = 60;
    public static final int TAG_QUALITY_MODE = 1;
    public static final int TAG_RECOGNIZED_FACE_FLAGS = 99;
    public static final int TAG_RECORD_MODE = 31;
    public static final int TAG_ROLL_ANGLE = 144;
    public static final int TAG_ROTATION = 48;
    public static final int TAG_SATURATION = 64;
    public static final int TAG_SCENE_MODE = 32769;
    public static final int TAG_SELF_TIMER = 46;
    public static final int TAG_SEQUENCE_NUMBER = 43;
    public static final int TAG_SHADING_COMPENSATION = 138;
    public static final int TAG_SHARPNESS = 65;
    public static final int TAG_SHUTTER_TYPE = 159;
    public static final int TAG_STATE = 107;
    public static final int TAG_SWEEP_PANORAMA_DIRECTION = 147;
    public static final int TAG_SWEEP_PANORAMA_FIELD_OF_VIEW = 148;
    public static final int TAG_TEXT_STAMP = 59;
    public static final int TAG_TEXT_STAMP_1 = 62;
    public static final int TAG_TEXT_STAMP_2 = 32776;
    public static final int TAG_TEXT_STAMP_3 = 32777;
    public static final int TAG_TIMER_RECORDING = 150;
    public static final int TAG_TITLE = 101;
    public static final int TAG_TOUCH_AE = 171;
    public static final int TAG_TRANSFORM = 89;
    public static final int TAG_TRANSFORM_1 = 32786;
    public static final int TAG_TRAVEL_DAY = 54;
    public static final int TAG_UNKNOWN_DATA_DUMP = 33;
    public static final int TAG_UPTIME = 41;
    public static final int TAG_WB_ADJUST_AB = 70;
    public static final int TAG_WB_ADJUST_GM = 71;
    public static final int TAG_WB_BLUE_LEVEL = 32774;
    public static final int TAG_WB_GREEN_LEVEL = 32773;
    public static final int TAG_WB_RED_LEVEL = 32772;
    public static final int TAG_WHITE_BALANCE = 3;
    public static final int TAG_WHITE_BALANCE_BIAS = 35;
    public static final int TAG_WORLD_TIME_LOCATION = 58;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Quality Mode", 2, "Version");
        lv8.x(3, map, "White Balance", 7, "Focus Mode");
        lv8.x(15, map, "AF Area Mode", 26, "Image Stabilization");
        lv8.x(28, map, "Macro Mode", 31, "Record Mode");
        lv8.x(32, map, "Audio", 37, "Internal Serial Number");
        lv8.x(33, map, "Unknown Data Dump", 34, "Easy Mode");
        lv8.x(35, map, "White Balance Bias", 36, "Flash Bias");
        lv8.x(38, map, "Exif Version", 40, "Color Effect");
        lv8.x(41, map, "Camera Uptime", 42, "Burst Mode");
        lv8.x(43, map, "Sequence Number", 44, "Contrast Mode");
        lv8.x(45, map, "Noise Reduction", 46, "Self Timer");
        lv8.x(48, map, "Rotation", 49, "AF Assist Lamp");
        lv8.x(50, map, "Color Mode", 51, "Baby Age");
        lv8.x(52, map, "Optical Zoom Mode", 53, "Conversion Lens");
        lv8.x(54, map, "Travel Day", 57, "Contrast");
        lv8.x(58, map, "World Time Location", 59, "Text Stamp");
        lv8.x(60, map, "Program ISO", 61, "Advanced Scene Mode");
        lv8.x(3584, map, "Print Image Matching (PIM) Info", 63, "Number of Detected Faces");
        lv8.x(64, map, "Saturation", 65, "Sharpness");
        lv8.x(66, map, "Film Mode", 68, "Color Temp Kelvin");
        lv8.x(69, map, "Bracket Settings", 70, "White Balance Adjust (AB)");
        lv8.x(71, map, "White Balance Adjust (GM)", 72, "Flash Curtain");
        lv8.x(73, map, "Long Exposure Noise Reduction", 75, "Panasonic Image Width");
        lv8.x(76, map, "Panasonic Image Height", 77, "Af Point Position");
        lv8.x(78, map, "Face Detection Info", 81, "Lens Type");
        lv8.x(82, map, "Lens Serial Number", 83, "Accessory Type");
        lv8.x(84, map, "Accessory Serial Number", 89, "Transform");
        lv8.x(93, map, "Intelligent Exposure", 96, "Lens Firmware Version");
        lv8.x(97, map, "Face Recognition Info", 98, "Flash Warning");
        lv8.x(99, map, "Recognized Face Flags", 101, "Title");
        lv8.x(102, map, "Baby Name", 103, "Location");
        lv8.x(TAG_COUNTRY, map, "Country", 107, "State");
        lv8.x(109, map, "City", TAG_LANDMARK, "Landmark");
        lv8.x(TAG_INTELLIGENT_RESOLUTION, map, "Intelligent Resolution", TAG_BURST_SPEED, "Burst Speed");
        lv8.x(TAG_INTELLIGENT_D_RANGE, map, "Intelligent D-Range", TAG_CLEAR_RETOUCH, "Clear Retouch");
        lv8.x(128, map, "City 2", 137, "Photo Style");
        lv8.x(138, map, "Shading Compensation", 140, "Accelerometer Z");
        lv8.x(141, map, "Accelerometer X", 142, "Accelerometer Y");
        lv8.x(143, map, "Camera Orientation", 144, "Roll Angle");
        lv8.x(145, map, "Pitch Angle", 147, "Sweep Panorama Direction");
        lv8.x(148, map, "Sweep Panorama Field Of View", 150, "Timer Recording");
        lv8.x(157, map, "Internal ND Filter", 158, "HDR");
        lv8.x(159, map, "Shutter Type", 163, "Clear Retouch Value");
        lv8.x(171, map, "Touch AE", 32768, "Makernote Version");
        lv8.x(TAG_SCENE_MODE, map, "Scene Mode", TAG_WB_RED_LEVEL, "White Balance (Red)");
        lv8.x(TAG_WB_GREEN_LEVEL, map, "White Balance (Green)", TAG_WB_BLUE_LEVEL, "White Balance (Blue)");
        lv8.x(TAG_FLASH_FIRED, map, "Flash Fired", 62, "Text Stamp 1");
        lv8.x(TAG_TEXT_STAMP_2, map, "Text Stamp 2", TAG_TEXT_STAMP_3, "Text Stamp 3");
        lv8.x(TAG_BABY_AGE_1, map, "Baby Age 1", TAG_TRANSFORM_1, "Transform 1");
    }

    public PanasonicMakernoteDirectory() {
        setDescriptor(new PanasonicMakernoteDescriptor(this));
    }

    public final Age getAge(int i) {
        String string = getString(i);
        if (string == null) {
            return null;
        }
        return Age.fromPanasonicString(string);
    }

    public final Face[] getDetectedFaces() {
        byte[] byteArray = getByteArray(78);
        if (byteArray == null) {
            return null;
        }
        ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
        byteArrayReader.setMotorolaByteOrder(false);
        try {
            int uInt16 = byteArrayReader.getUInt16(0);
            if (uInt16 == 0) {
                return null;
            }
            Face[] faceArr = new Face[uInt16];
            for (int i = 0; i < uInt16; i++) {
                int i2 = i * 8;
                faceArr[i] = new Face(byteArrayReader.getUInt16(i2 + 2), byteArrayReader.getUInt16(i2 + 4), byteArrayReader.getUInt16(i2 + 6), byteArrayReader.getUInt16(i2 + 8), null, null);
            }
            return faceArr;
        } catch (IOException unused) {
            return null;
        }
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Panasonic Makernote";
    }

    public final Face[] getRecognizedFaces() {
        byte[] byteArray = getByteArray(97);
        if (byteArray == null) {
            return null;
        }
        ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
        byteArrayReader.setMotorolaByteOrder(false);
        try {
            int uInt16 = byteArrayReader.getUInt16(0);
            if (uInt16 == 0) {
                return null;
            }
            Face[] faceArr = new Face[uInt16];
            for (int i = 0; i < uInt16; i++) {
                int i2 = i * 44;
                faceArr[i] = new Face(byteArrayReader.getUInt16(i2 + 24), byteArrayReader.getUInt16(i2 + 26), byteArrayReader.getUInt16(i2 + 28), byteArrayReader.getUInt16(i2 + 30), byteArrayReader.getString(i2 + 4, 20, "ASCII").trim(), Age.fromPanasonicString(byteArrayReader.getString(i2 + 32, 20, "ASCII").trim()));
            }
            return faceArr;
        } catch (IOException unused) {
            return null;
        }
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
