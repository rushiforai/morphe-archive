package com.drew.metadata.exif;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ExifInteropDirectory extends ExifDirectoryBase {
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        ExifDirectoryBase.addExifTagNames(map);
    }

    public ExifInteropDirectory() {
        setDescriptor(new ExifInteropDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Interoperability";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
