package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class KyoceraMakernoteDirectory extends Directory {
    public static final int TAG_PRINT_IMAGE_MATCHING_INFO = 3584;
    public static final int TAG_PROPRIETARY_THUMBNAIL = 1;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Proprietary Thumbnail Format Data", 3584, "Print Image Matching (PIM) Info");
    }

    public KyoceraMakernoteDirectory() {
        setDescriptor(new KyoceraMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Kyocera/Contax Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
