package com.drew.metadata.adobe;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AdobeJpegDirectory extends Directory {
    public static final int TAG_APP14_FLAGS0 = 1;
    public static final int TAG_APP14_FLAGS1 = 2;
    public static final int TAG_COLOR_TRANSFORM = 3;
    public static final int TAG_DCT_ENCODE_VERSION = 0;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "DCT Encode Version", 1, "Flags 0");
        lv8.x(2, map, "Flags 1", 3, "Color Transform");
    }

    public AdobeJpegDirectory() {
        setDescriptor(new AdobeJpegDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Adobe JPEG";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
