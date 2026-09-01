package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class RicohMakernoteDirectory extends Directory {
    public static final int TAG_MAKERNOTE_DATA_TYPE = 1;
    public static final int TAG_PRINT_IMAGE_MATCHING_INFO = 3584;
    public static final int TAG_RICOH_CAMERA_INFO_MAKERNOTE_SUB_IFD_POINTER = 8193;
    public static final int TAG_VERSION = 2;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Makernote Data Type", 2, "Version");
        lv8.x(3584, map, "Print Image Matching (PIM) Info", 8193, "Ricoh Camera Info Makernote Sub-IFD");
    }

    public RicohMakernoteDirectory() {
        setDescriptor(new RicohMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Ricoh Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
