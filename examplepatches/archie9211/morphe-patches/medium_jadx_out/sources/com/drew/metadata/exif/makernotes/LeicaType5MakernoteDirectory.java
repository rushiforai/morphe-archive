package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class LeicaType5MakernoteDirectory extends Directory {
    public static final int TagExposureMode = 1037;
    public static final int TagFilmMode = 1042;
    public static final int TagLensModel = 771;
    public static final int TagOriginalDirectory = 1032;
    public static final int TagOriginalFileName = 1031;
    public static final int TagShotInfo = 1040;
    public static final int TagWbRgbLevels = 1043;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(771, map, "Lens Model", TagOriginalFileName, "Original File Name");
        lv8.x(1032, map, "Original Directory", 1037, "Exposure Mode");
        lv8.x(1040, map, "Shot Info", 1042, "Film Mode");
        map.put(1043, "WB RGB Levels");
    }

    public LeicaType5MakernoteDirectory() {
        setDescriptor(new LeicaType5MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Leica Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
