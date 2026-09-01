package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AppleRunTimeMakernoteDirectory extends Directory {
    public static final int CMTimeEpoch = 2;
    public static final int CMTimeFlags = 1;
    public static final int CMTimeScale = 3;
    public static final int CMTimeValue = 4;
    protected static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Flags", 2, "Epoch");
        lv8.x(3, map, "Scale", 4, "Value");
    }

    public AppleRunTimeMakernoteDirectory() {
        setDescriptor(new AppleRunTimeMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Apple Run Time";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
