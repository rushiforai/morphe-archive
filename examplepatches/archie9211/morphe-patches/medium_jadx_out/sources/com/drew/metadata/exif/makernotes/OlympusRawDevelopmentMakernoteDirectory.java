package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class OlympusRawDevelopmentMakernoteDirectory extends Directory {
    public static final int TagRawDevColorSpace = 264;
    public static final int TagRawDevContrastValue = 262;
    public static final int TagRawDevEditStatus = 267;
    public static final int TagRawDevEngine = 265;
    public static final int TagRawDevExposureBiasValue = 256;
    public static final int TagRawDevGrayPoint = 259;
    public static final int TagRawDevMemoryColorEmphasis = 261;
    public static final int TagRawDevNoiseReduction = 266;
    public static final int TagRawDevSaturationEmphasis = 260;
    public static final int TagRawDevSettings = 268;
    public static final int TagRawDevSharpnessValue = 263;
    public static final int TagRawDevVersion = 0;
    public static final int TagRawDevWbFineAdjustment = 258;
    public static final int TagRawDevWhiteBalanceValue = 257;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Raw Dev Version", 256, "Raw Dev Exposure Bias Value");
        lv8.x(257, map, "Raw Dev White Balance Value", 258, "Raw Dev WB Fine Adjustment");
        lv8.x(259, map, "Raw Dev Gray Point", 260, "Raw Dev Saturation Emphasis");
        lv8.x(261, map, "Raw Dev Memory Color Emphasis", 262, "Raw Dev Contrast Value");
        lv8.x(263, map, "Raw Dev Sharpness Value", 264, "Raw Dev Color Space");
        lv8.x(265, map, "Raw Dev Engine", 266, "Raw Dev Noise Reduction");
        lv8.x(267, map, "Raw Dev Edit Status", 268, "Raw Dev Settings");
    }

    public OlympusRawDevelopmentMakernoteDirectory() {
        setDescriptor(new OlympusRawDevelopmentMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Olympus Raw Development";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
