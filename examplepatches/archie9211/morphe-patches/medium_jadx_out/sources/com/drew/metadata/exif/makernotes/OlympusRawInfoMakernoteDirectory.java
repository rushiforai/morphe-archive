package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class OlympusRawInfoMakernoteDirectory extends Directory {
    public static final int TagBlackLevel2 = 1536;
    public static final int TagCmContrast = 8226;
    public static final int TagCmExposureCompensation = 8192;
    public static final int TagCmHue = 8225;
    public static final int TagCmSaturation = 8224;
    public static final int TagCmSharpness = 8227;
    public static final int TagCmWhiteBalance = 8193;
    public static final int TagCmWhiteBalanceComp = 8194;
    public static final int TagCmWhiteBalanceGrayPoint = 8208;
    public static final int TagColorMatrix2 = 512;
    public static final int TagContrastSetting = 4114;
    public static final int TagCoringFilter = 784;
    public static final int TagCoringValues = 785;
    public static final int TagCropHeight = 1557;
    public static final int TagCropLeft = 1554;
    public static final int TagCropTop = 1555;
    public static final int TagCropWidth = 1556;
    public static final int TagHueSetting = 4113;
    public static final int TagLightSource = 4096;
    public static final int TagRawInfoVersion = 0;
    public static final int TagSaturationSetting = 4112;
    public static final int TagSharpnessSetting = 4115;
    public static final int TagValidPixelDepth = 1553;
    public static final int TagWbRbLevelsAuto = 272;
    public static final int TagWbRbLevelsCloudy = 289;
    public static final int TagWbRbLevelsCoolWhiteFluor = 306;
    public static final int TagWbRbLevelsDayWhiteFluor = 305;
    public static final int TagWbRbLevelsDaylightFluor = 304;
    public static final int TagWbRbLevelsEveningSunlight = 292;
    public static final int TagWbRbLevelsFineWeather = 290;
    public static final int TagWbRbLevelsShade = 288;
    public static final int TagWbRbLevelsTungsten = 291;
    public static final int TagWbRbLevelsUsed = 256;
    public static final int TagWbRbLevelsWhiteFluorescent = 307;
    public static final int TagWhiteBalanceComp = 4097;
    public static final int TagYCbCrCoefficients = 1537;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Raw Info Version", 256, "WB RB Levels Used");
        lv8.x(272, map, "WB RB Levels Auto", 288, "WB RB Levels Shade");
        lv8.x(289, map, "WB RB Levels Cloudy", TagWbRbLevelsFineWeather, "WB RB Levels Fine Weather");
        lv8.x(291, map, "WB RB Levels Tungsten", TagWbRbLevelsEveningSunlight, "WB RB Levels Evening Sunlight");
        lv8.x(304, map, "WB RB Levels Daylight Fluor", 305, "WB RB Levels Day White Fluor");
        lv8.x(306, map, "WB RB Levels Cool White Fluor", TagWbRbLevelsWhiteFluorescent, "WB RB Levels White Fluorescent");
        lv8.x(512, map, "Color Matrix 2", 784, "Coring Filter");
        lv8.x(785, map, "Coring Values", 1536, "Black Level 2");
        lv8.x(1537, map, "YCbCrCoefficients", 1553, "Valid Pixel Depth");
        lv8.x(1554, map, "Crop Left", 1555, "Crop Top");
        lv8.x(1556, map, "Crop Width", 1557, "Crop Height");
        lv8.x(4096, map, "Light Source", 4097, "White Balance Comp");
        lv8.x(4112, map, "Saturation Setting", 4113, "Hue Setting");
        lv8.x(4114, map, "Contrast Setting", 4115, "Sharpness Setting");
        lv8.x(8192, map, "CM Exposure Compensation", 8193, "CM White Balance");
        lv8.x(8194, map, "CM White Balance Comp", 8208, "CM White Balance Gray Point");
        lv8.x(8224, map, "CM Saturation", TagCmHue, "CM Hue");
        lv8.x(8226, map, "CM Contrast", TagCmSharpness, "CM Sharpness");
    }

    public OlympusRawInfoMakernoteDirectory() {
        setDescriptor(new OlympusRawInfoMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Olympus Raw Info";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
