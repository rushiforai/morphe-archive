package com.drew.metadata.exif;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PanasonicRawWbInfo2Directory extends Directory {
    public static final int TagNumWbEntries = 0;
    public static final int TagWbRgbLevels1 = 2;
    public static final int TagWbRgbLevels2 = 6;
    public static final int TagWbRgbLevels3 = 10;
    public static final int TagWbRgbLevels4 = 14;
    public static final int TagWbRgbLevels5 = 18;
    public static final int TagWbRgbLevels6 = 22;
    public static final int TagWbRgbLevels7 = 26;
    public static final int TagWbType1 = 1;
    public static final int TagWbType2 = 5;
    public static final int TagWbType3 = 9;
    public static final int TagWbType4 = 13;
    public static final int TagWbType5 = 17;
    public static final int TagWbType6 = 21;
    public static final int TagWbType7 = 25;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        map.put(0, "Num WB Entries");
        map.put(0, "Num WB Entries");
        map.put(1, "WB Type 1");
        map.put(2, "WB RGB Levels 1");
        lv8.x(5, map, "WB Type 2", 6, "WB RGB Levels 2");
        lv8.x(9, map, "WB Type 3", 10, "WB RGB Levels 3");
        lv8.x(13, map, "WB Type 4", 14, "WB RGB Levels 4");
        lv8.x(17, map, "WB Type 5", 18, "WB RGB Levels 5");
        lv8.x(21, map, "WB Type 6", 22, "WB RGB Levels 6");
        lv8.x(25, map, "WB Type 7", 26, "WB RGB Levels 7");
    }

    public PanasonicRawWbInfo2Directory() {
        setDescriptor(new PanasonicRawWbInfo2Descriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PanasonicRaw WbInfo2";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
