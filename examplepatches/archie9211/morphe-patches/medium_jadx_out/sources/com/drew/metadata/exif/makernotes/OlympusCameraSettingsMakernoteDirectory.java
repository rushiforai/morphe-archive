package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class OlympusCameraSettingsMakernoteDirectory extends Directory {
    public static final int TagAeLock = 513;
    public static final int TagAfAreas = 772;
    public static final int TagAfFineTune = 774;
    public static final int TagAfFineTuneAdj = 775;
    public static final int TagAfPointSelected = 773;
    public static final int TagAfSearch = 771;
    public static final int TagArtFilter = 1321;
    public static final int TagArtFilterEffect = 1327;
    public static final int TagCameraSettingsVersion = 0;
    public static final int TagColorCreatorEffect = 1330;
    public static final int TagColorSpace = 1287;
    public static final int TagCompressionFactor = 1293;
    public static final int TagContrastSetting = 1285;
    public static final int TagCustomSaturation = 1283;
    public static final int TagDateTimeUtc = 2312;
    public static final int TagDistortionCorrection = 1291;
    public static final int TagDriveMode = 1536;
    public static final int TagExposureMode = 512;
    public static final int TagExposureShift = 515;
    public static final int TagExtendedWBDetect = 2306;
    public static final int TagFlashControlMode = 1028;
    public static final int TagFlashExposureComp = 1025;
    public static final int TagFlashIntensity = 1029;
    public static final int TagFlashMode = 1024;
    public static final int TagFlashRemoteControl = 1027;
    public static final int TagFocusMode = 769;
    public static final int TagFocusProcess = 770;
    public static final int TagGradation = 1295;
    public static final int TagImageQuality2 = 1539;
    public static final int TagImageStabilization = 1540;
    public static final int TagMacroMode = 768;
    public static final int TagMagicFilter = 1324;
    public static final int TagManometerPressure = 2304;
    public static final int TagManometerReading = 2305;
    public static final int TagManualFlashStrength = 1030;
    public static final int TagMeteringMode = 514;
    public static final int TagModifiedSaturation = 1284;
    public static final int TagNdFilter = 516;
    public static final int TagNoiseFilter = 1319;
    public static final int TagNoiseReduction = 1290;
    public static final int TagPanoramaMode = 1537;
    public static final int TagPictureMode = 1312;
    public static final int TagPictureModeBWFilter = 1317;
    public static final int TagPictureModeContrast = 1315;
    public static final int TagPictureModeEffect = 1325;
    public static final int TagPictureModeHue = 1314;
    public static final int TagPictureModeSaturation = 1313;
    public static final int TagPictureModeSharpness = 1316;
    public static final int TagPictureModeTone = 1318;
    public static final int TagPitchAngle = 2308;
    public static final int TagPreviewImageLength = 258;
    public static final int TagPreviewImageStart = 257;
    public static final int TagPreviewImageValid = 256;
    public static final int TagRollAngle = 2307;
    public static final int TagSceneMode = 1289;
    public static final int TagShadingCompensation = 1292;
    public static final int TagSharpnessSetting = 1286;
    public static final int TagStackedImage = 2052;
    public static final int TagToneLevel = 1326;
    public static final int TagWhiteBalance2 = 1280;
    public static final int TagWhiteBalanceBracket = 1282;
    public static final int TagWhiteBalanceTemperature = 1281;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Camera Settings Version", 256, "Preview Image Valid");
        lv8.x(257, map, "Preview Image Start", 258, "Preview Image Length");
        lv8.x(512, map, "Exposure Mode", 513, "AE Lock");
        lv8.x(514, map, "Metering Mode", 515, "Exposure Shift");
        lv8.x(516, map, "ND Filter", 768, "Macro Mode");
        lv8.x(769, map, "Focus Mode", 770, "Focus Process");
        lv8.x(771, map, "AF Search", 772, "AF Areas");
        lv8.x(773, map, "AF Point Selected", 774, "AF Fine Tune");
        lv8.x(TagAfFineTuneAdj, map, "AF Fine Tune Adj", 1024, "Flash Mode");
        lv8.x(TagFlashExposureComp, map, "Flash Exposure Comp", 1027, "Flash Remote Control");
        lv8.x(1028, map, "Flash Control Mode", 1029, "Flash Intensity");
        lv8.x(1030, map, "Manual Flash Strength", 1280, "White Balance 2");
        lv8.x(1281, map, "White Balance Temperature", 1282, "White Balance Bracket");
        lv8.x(1283, map, "Custom Saturation", 1284, "Modified Saturation");
        lv8.x(1285, map, "Contrast Setting", 1286, "Sharpness Setting");
        lv8.x(1287, map, "Color Space", 1289, "Scene Mode");
        lv8.x(1290, map, "Noise Reduction", 1291, "Distortion Correction");
        lv8.x(1292, map, "Shading Compensation", 1293, "Compression Factor");
        lv8.x(1295, map, "Gradation", 1312, "Picture Mode");
        lv8.x(TagPictureModeSaturation, map, "Picture Mode Saturation", TagPictureModeHue, "Picture Mode Hue");
        lv8.x(TagPictureModeContrast, map, "Picture Mode Contrast", TagPictureModeSharpness, "Picture Mode Sharpness");
        lv8.x(TagPictureModeBWFilter, map, "Picture Mode BW Filter", TagPictureModeTone, "Picture Mode Tone");
        lv8.x(TagNoiseFilter, map, "Noise Filter", TagArtFilter, "Art Filter");
        lv8.x(TagMagicFilter, map, "Magic Filter", TagPictureModeEffect, "Picture Mode Effect");
        lv8.x(TagToneLevel, map, "Tone Level", TagArtFilterEffect, "Art Filter Effect");
        lv8.x(TagColorCreatorEffect, map, "Color Creator Effect", 1536, "Drive Mode");
        lv8.x(1537, map, "Panorama Mode", TagImageQuality2, "Image Quality 2");
        lv8.x(TagImageStabilization, map, "Image Stabilization", TagStackedImage, "Stacked Image");
        lv8.x(TagManometerPressure, map, "Manometer Pressure", TagManometerReading, "Manometer Reading");
        lv8.x(TagExtendedWBDetect, map, "Extended WB Detect", TagRollAngle, "Roll Angle");
        lv8.x(TagPitchAngle, map, "Pitch Angle", TagDateTimeUtc, "Date Time UTC");
    }

    public OlympusCameraSettingsMakernoteDirectory() {
        setDescriptor(new OlympusCameraSettingsMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Olympus Camera Settings";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
