package com.drew.metadata.exif;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class PanasonicRawIFD0Directory extends Directory {
    public static final int TagBlackLevel1 = 8;
    public static final int TagBlackLevel2 = 9;
    public static final int TagBlackLevel3 = 10;
    public static final int TagBlackLevelBlue = 30;
    public static final int TagBlackLevelGreen = 29;
    public static final int TagBlackLevelRed = 28;
    public static final int TagBlueBalance = 18;
    public static final int TagCropBottom = 49;
    public static final int TagCropLeft = 48;
    public static final int TagCropRight = 50;
    public static final int TagCropTop = 47;
    public static final int TagDistortionInfo = 281;
    public static final int TagHighIsoMultiplierBlue = 26;
    public static final int TagHighIsoMultiplierGreen = 25;
    public static final int TagHighIsoMultiplierRed = 24;
    public static final int TagIso = 23;
    public static final int TagJpgFromRaw = 46;
    public static final int TagLinearityLimitBlue = 16;
    public static final int TagLinearityLimitGreen = 15;
    public static final int TagLinearityLimitRed = 14;
    public static final int TagMake = 271;
    public static final int TagModel = 272;
    public static final int TagOrientation = 274;
    public static final int TagPanasonicRawVersion = 1;
    public static final int TagRawDataOffset = 280;
    public static final int TagRedBalance = 17;
    public static final int TagRowsPerStrip = 278;
    public static final int TagSensorBottomBorder = 6;
    public static final int TagSensorHeight = 3;
    public static final int TagSensorLeftBorder = 5;
    public static final int TagSensorRightBorder = 7;
    public static final int TagSensorTopBorder = 4;
    public static final int TagSensorWidth = 2;
    public static final int TagStripByteCounts = 279;
    public static final int TagStripOffsets = 273;
    public static final int TagWbBlueLevel = 38;
    public static final int TagWbGreenLevel = 37;
    public static final int TagWbInfo = 19;
    public static final int TagWbInfo2 = 39;
    public static final int TagWbRedLevel = 36;
    private static final HashMap<Integer, String> _tagNameMap;

    public PanasonicRawIFD0Directory() {
        setDescriptor(new PanasonicRawIFD0Descriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PanasonicRaw Exif IFD0";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Panasonic Raw Version", 2, "Sensor Width");
        lv8.x(3, map, "Sensor Height", 4, "Sensor Top Border");
        lv8.x(5, map, "Sensor Left Border", 6, "Sensor Bottom Border");
        lv8.x(7, map, "Sensor Right Border", 8, "Black Level 1");
        lv8.x(9, map, "Black Level 2", 10, "Black Level 3");
        lv8.x(14, map, "Linearity Limit Red", 15, "Linearity Limit Green");
        lv8.x(16, map, "Linearity Limit Blue", 17, "Red Balance");
        lv8.x(18, map, "Blue Balance", 23, "ISO");
        lv8.x(24, map, "High ISO Multiplier Red", 25, CspinKvYN.JFOaPXK);
        lv8.x(26, map, "High ISO Multiplier Blue", 28, "Black Level Red");
        lv8.x(29, map, "Black Level Green", 30, "Black Level Blue");
        lv8.x(36, map, "WB Red Level", 37, "WB Green Level");
        lv8.x(38, map, "WB Blue Level", 46, "Jpg From Raw");
        lv8.x(47, map, "Crop Top", 48, "Crop Left");
        lv8.x(49, map, "Crop Bottom", 50, "Crop Right");
        lv8.x(271, map, "Make", 272, "Model");
        lv8.x(273, map, "Strip Offsets", 274, "Orientation");
        lv8.x(278, map, "Rows Per Strip", 279, "Strip Byte Counts");
        map.put(280, "Raw Data Offset");
    }
}
