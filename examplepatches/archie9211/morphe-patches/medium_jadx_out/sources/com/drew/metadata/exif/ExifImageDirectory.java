package com.drew.metadata.exif;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ExifImageDirectory extends ExifDirectoryBase {
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        ExifDirectoryBase.addExifTagNames(map);
    }

    public ExifImageDirectory() {
        setDescriptor(new ExifImageDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Exif Image";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
