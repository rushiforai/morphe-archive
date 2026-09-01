package com.drew.metadata.exif.makernotes;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class OlympusImageProcessingMakernoteDirectory extends Directory {
    public static final int TagAspectFrame = 4371;
    public static final int TagAspectRatio = 4370;
    public static final int TagBlackLevel2 = 1536;
    public static final int TagCameraTemperature = 4870;
    public static final int TagColorMatrix = 512;
    public static final int TagCoringFilter = 784;
    public static final int TagCoringValues = 785;
    public static final int TagCropHeight = 1557;
    public static final int TagCropLeft = 1554;
    public static final int TagCropTop = 1555;
    public static final int TagCropWidth = 1556;
    public static final int TagDistortionCorrection2 = 4113;
    public static final int TagEnhancer = 768;
    public static final int TagEnhancerValues = 769;
    public static final int TagFaceDetectArea = 4609;
    public static final int TagFaceDetectFrameCrop = 4615;
    public static final int TagFaceDetectFrameSize = 4611;
    public static final int TagFacesDetected = 4608;
    public static final int TagGainBase = 1552;
    public static final int TagImageProcessingVersion = 0;
    public static final int TagKeystoneCompensation = 6400;
    public static final int TagKeystoneDirection = 6401;
    public static final int TagKeystoneValue = 6406;
    public static final int TagMaxFaces = 4610;
    public static final int TagMultipleExposureMode = 4124;
    public static final int TagNoiseReduction2 = 4112;
    public static final int TagSensorCalibration = 2053;
    public static final int TagShadingCompensation2 = 4114;
    public static final int TagUnknownBlock1 = 1589;
    public static final int TagUnknownBlock2 = 1590;
    public static final int TagUnknownBlock3 = 4355;
    public static final int TagUnknownBlock4 = 4356;
    public static final int TagValidBits = 1553;
    public static final int TagWbGLevel = 287;
    public static final int TagWbGLevel3000K = 275;
    public static final int TagWbGLevel3300K = 276;
    public static final int TagWbGLevel3600K = 277;
    public static final int TagWbGLevel3900K = 278;
    public static final int TagWbGLevel4000K = 279;
    public static final int TagWbGLevel4300K = 280;
    public static final int TagWbGLevel4500K = 281;
    public static final int TagWbGLevel4800K = 282;
    public static final int TagWbGLevel5300K = 283;
    public static final int TagWbGLevel6000K = 284;
    public static final int TagWbGLevel6600K = 285;
    public static final int TagWbGLevel7500K = 286;
    public static final int TagWbRbLevels = 256;
    public static final int TagWbRbLevels3000K = 258;
    public static final int TagWbRbLevels3300K = 259;
    public static final int TagWbRbLevels3600K = 260;
    public static final int TagWbRbLevels3900K = 261;
    public static final int TagWbRbLevels4000K = 262;
    public static final int TagWbRbLevels4300K = 263;
    public static final int TagWbRbLevels4500K = 264;
    public static final int TagWbRbLevels4800K = 265;
    public static final int TagWbRbLevels5300K = 266;
    public static final int TagWbRbLevels6000K = 267;
    public static final int TagWbRbLevels6600K = 268;
    public static final int TagWbRbLevels7500K = 269;
    public static final int TagWbRbLevelsCwB1 = 270;
    public static final int TagWbRbLevelsCwB2 = 271;
    public static final int TagWbRbLevelsCwB3 = 272;
    public static final int TagWbRbLevelsCwB4 = 273;
    private static final HashMap<Integer, String> _tagNameMap;

    public OlympusImageProcessingMakernoteDirectory() {
        setDescriptor(new OlympusImageProcessingMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Olympus Image Processing";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Image Processing Version", 256, "WB RB Levels");
        lv8.x(258, map, "WB RB Levels 3000K", 259, "WB RB Levels 3300K");
        lv8.x(260, map, "WB RB Levels 3600K", 261, "WB RB Levels 3900K");
        lv8.x(262, map, "WB RB Levels 4000K", 263, "WB RB Levels 4300K");
        lv8.x(264, map, "WB RB Levels 4500K", 265, "WB RB Levels 4800K");
        lv8.x(266, map, "WB RB Levels 5300K", 267, "WB RB Levels 6000K");
        lv8.x(268, map, "WB RB Levels 6600K", 269, "WB RB Levels 7500K");
        lv8.x(270, map, "WB RB Levels CWB1", 271, "WB RB Levels CWB2");
        lv8.x(272, map, "WB RB Levels CWB3", 273, "WB RB Levels CWB4");
        lv8.x(275, map, QFTsJPDEnO.ioGeIURKgdQB, 276, "WB G Level 3300K");
        lv8.x(277, map, "WB G Level 3600K", 278, "WB G Level 3900K");
        lv8.x(279, map, "WB G Level 4000K", 280, "WB G Level 4300K");
        lv8.x(281, map, "WB G Level 4500K", 282, "WB G Level 4800K");
        lv8.x(283, map, "WB G Level 5300K", 284, "WB G Level 6000K");
        lv8.x(285, map, "WB G Level 6600K", 286, "WB G Level 7500K");
        lv8.x(TagWbGLevel, map, "WB G Level", 512, "Color Matrix");
        lv8.x(768, map, "Enhancer", 769, "Enhancer Values");
        lv8.x(784, map, "Coring Filter", 785, "Coring Values");
        lv8.x(1536, map, "Black Level 2", TagGainBase, "Gain Base");
        lv8.x(1553, map, "Valid Bits", 1554, "Crop Left");
        lv8.x(1555, map, "Crop Top", 1556, "Crop Width");
        lv8.x(1557, map, "Crop Height", TagUnknownBlock1, "Unknown Block 1");
        lv8.x(TagUnknownBlock2, map, "Unknown Block 2", TagSensorCalibration, "Sensor Calibration");
        lv8.x(4112, map, "Noise Reduction 2", 4113, "Distortion Correction 2");
        lv8.x(4114, map, "Shading Compensation 2", 4124, "Multiple Exposure Mode");
        lv8.x(TagUnknownBlock3, map, "Unknown Block 3", TagUnknownBlock4, "Unknown Block 4");
        lv8.x(TagAspectRatio, map, "Aspect Ratio", TagAspectFrame, "Aspect Frame");
        lv8.x(TagFacesDetected, map, "Faces Detected", 4609, "Face Detect Area");
        lv8.x(TagMaxFaces, map, "Max Faces", 4611, "Face Detect Frame Size");
        lv8.x(TagFaceDetectFrameCrop, map, "Face Detect Frame Crop", TagCameraTemperature, "Camera Temperature");
        lv8.x(TagKeystoneCompensation, map, "Keystone Compensation", TagKeystoneDirection, "Keystone Direction");
        map.put(Integer.valueOf(TagKeystoneValue), "Keystone Value");
    }
}
