package com.drew.metadata.file;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FileSystemDirectory extends Directory {
    public static final int TAG_FILE_MODIFIED_DATE = 3;
    public static final int TAG_FILE_NAME = 1;
    public static final int TAG_FILE_SIZE = 2;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "File Name", 2, "File Size");
        map.put(3, "File Modified Date");
    }

    public FileSystemDirectory() {
        setDescriptor(new FileSystemDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "File";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
