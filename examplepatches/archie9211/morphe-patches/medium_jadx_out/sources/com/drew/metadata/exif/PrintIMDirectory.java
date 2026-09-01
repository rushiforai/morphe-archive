package com.drew.metadata.exif;

import com.drew.metadata.Directory;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PrintIMDirectory extends Directory {
    public static final int TagPrintImVersion = 0;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        map.put(0, "PrintIM Version");
    }

    public PrintIMDirectory() {
        setDescriptor(new PrintIMDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PrintIM";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
