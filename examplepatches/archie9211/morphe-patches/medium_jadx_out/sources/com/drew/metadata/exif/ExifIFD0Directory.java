package com.drew.metadata.exif;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ExifIFD0Directory extends ExifDirectoryBase {
    public static final int TAG_EXIF_SUB_IFD_OFFSET = 34665;
    public static final int TAG_GPS_INFO_OFFSET = 34853;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        ExifDirectoryBase.addExifTagNames(map);
    }

    public ExifIFD0Directory() {
        setDescriptor(new ExifIFD0Descriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Exif IFD0";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
