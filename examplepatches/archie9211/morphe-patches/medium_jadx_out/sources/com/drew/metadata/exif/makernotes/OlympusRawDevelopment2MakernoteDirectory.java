package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class OlympusRawDevelopment2MakernoteDirectory extends Directory {
    public static final int TagRawDevArtFilter = 289;
    public static final int TagRawDevAutoGradation = 281;
    public static final int TagRawDevColorSpace = 265;
    public static final int TagRawDevContrastValue = 261;
    public static final int TagRawDevEngine = 267;
    public static final int TagRawDevExposureBiasValue = 256;
    public static final int TagRawDevGradation = 274;
    public static final int TagRawDevGrayPoint = 260;
    public static final int TagRawDevMemoryColorEmphasis = 264;
    public static final int TagRawDevNoiseReduction = 266;
    public static final int TagRawDevPictureMode = 268;
    public static final int TagRawDevPmBwFilter = 272;
    public static final int TagRawDevPmContrast = 270;
    public static final int TagRawDevPmNoiseFilter = 288;
    public static final int TagRawDevPmPictureTone = 273;
    public static final int TagRawDevPmSaturation = 269;
    public static final int TagRawDevPmSharpness = 271;
    public static final int TagRawDevSaturation3 = 275;
    public static final int TagRawDevSaturationEmphasis = 263;
    public static final int TagRawDevSharpnessValue = 262;
    public static final int TagRawDevVersion = 0;
    public static final int TagRawDevWbFineAdjustment = 259;
    public static final int TagRawDevWhiteBalance = 257;
    public static final int TagRawDevWhiteBalanceValue = 258;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Raw Dev Version", 256, "Raw Dev Exposure Bias Value");
        lv8.x(257, map, "Raw Dev White Balance", 258, "Raw Dev White Balance Value");
        lv8.x(259, map, "Raw Dev WB Fine Adjustment", 260, "Raw Dev Gray Point");
        lv8.x(261, map, "Raw Dev Contrast Value", 262, "Raw Dev Sharpness Value");
        lv8.x(263, map, "Raw Dev Saturation Emphasis", 264, "Raw Dev Memory Color Emphasis");
        lv8.x(265, map, "Raw Dev Color Space", 266, "Raw Dev Noise Reduction");
        lv8.x(267, map, "Raw Dev Engine", 268, "Raw Dev Picture Mode");
        lv8.x(269, map, "Raw Dev PM Saturation", 270, "Raw Dev PM Contrast");
        lv8.x(271, map, "Raw Dev PM Sharpness", 272, "Raw Dev PM BW Filter");
        lv8.x(273, map, "Raw Dev PM Picture Tone", 274, "Raw Dev Gradation");
        lv8.x(275, map, "Raw Dev Saturation 3", 281, "Raw Dev Auto Gradation");
        lv8.x(288, map, "Raw Dev PM Noise Filter", 289, "Raw Dev Art Filter");
    }

    public OlympusRawDevelopment2MakernoteDirectory() {
        setDescriptor(new OlympusRawDevelopment2MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Olympus Raw Development 2";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
