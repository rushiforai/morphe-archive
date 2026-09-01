package com.drew.metadata.exif;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PanasonicRawDistortionDirectory extends Directory {
    public static final int TagDistortionCorrection = 7;
    public static final int TagDistortionN = 12;
    public static final int TagDistortionParam02 = 2;
    public static final int TagDistortionParam04 = 4;
    public static final int TagDistortionParam08 = 8;
    public static final int TagDistortionParam09 = 9;
    public static final int TagDistortionParam11 = 11;
    public static final int TagDistortionScale = 5;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(2, map, "Distortion Param 2", 4, "Distortion Param 4");
        lv8.x(5, map, "Distortion Scale", 7, "Distortion Correction");
        lv8.x(8, map, "Distortion Param 8", 9, "Distortion Param 9");
        lv8.x(11, map, "Distortion Param 11", 12, "Distortion N");
    }

    public PanasonicRawDistortionDirectory() {
        setDescriptor(new PanasonicRawDistortionDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PanasonicRaw DistortionInfo";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
