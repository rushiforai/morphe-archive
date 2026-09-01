package com.drew.metadata.exif;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PanasonicRawWbInfoDirectory extends Directory {
    public static final int TagNumWbEntries = 0;
    public static final int TagWbRbLevels1 = 2;
    public static final int TagWbRbLevels2 = 5;
    public static final int TagWbRbLevels3 = 8;
    public static final int TagWbRbLevels4 = 11;
    public static final int TagWbRbLevels5 = 14;
    public static final int TagWbRbLevels6 = 17;
    public static final int TagWbRbLevels7 = 20;
    public static final int TagWbType1 = 1;
    public static final int TagWbType2 = 4;
    public static final int TagWbType3 = 7;
    public static final int TagWbType4 = 10;
    public static final int TagWbType5 = 13;
    public static final int TagWbType6 = 16;
    public static final int TagWbType7 = 19;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Num WB Entries", 1, "WB Type 1");
        lv8.x(2, map, "WB RGB Levels 1", 4, "WB Type 2");
        lv8.x(5, map, "WB RGB Levels 2", 7, "WB Type 3");
        lv8.x(8, map, "WB RGB Levels 3", 10, "WB Type 4");
        lv8.x(11, map, "WB RGB Levels 4", 13, "WB Type 5");
        lv8.x(14, map, "WB RGB Levels 5", 16, "WB Type 6");
        lv8.x(17, map, "WB RGB Levels 6", 19, "WB Type 7");
        map.put(20, "WB RGB Levels 7");
    }

    public PanasonicRawWbInfoDirectory() {
        setDescriptor(new PanasonicRawWbInfoDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PanasonicRaw WbInfo";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
