package com.drew.metadata.png;

import com.drew.metadata.Directory;
import com.drew.metadata.TagDescriptor;
import defpackage.lv8;
import java.util.HashMap;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class PngChromaticitiesDirectory extends Directory {
    public static final int TAG_BLUE_X = 7;
    public static final int TAG_BLUE_Y = 8;
    public static final int TAG_GREEN_X = 5;
    public static final int TAG_GREEN_Y = 6;
    public static final int TAG_RED_X = 3;
    public static final int TAG_RED_Y = 4;
    public static final int TAG_WHITE_POINT_X = 1;
    public static final int TAG_WHITE_POINT_Y = 2;
    private static final HashMap<Integer, String> _tagNameMap;

    public PngChromaticitiesDirectory() {
        setDescriptor(new TagDescriptor<>(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PNG Chromaticities";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "White Point X", 2, "White Point Y");
        lv8.x(3, map, "Red X", 4, "Red Y");
        lv8.x(5, map, AEVqIoD.WvYj, 6, "Green Y");
        lv8.x(7, map, "Blue X", 8, "Blue Y");
    }
}
