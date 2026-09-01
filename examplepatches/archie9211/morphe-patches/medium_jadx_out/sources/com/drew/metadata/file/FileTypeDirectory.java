package com.drew.metadata.file;

import com.drew.imaging.FileType;
import com.drew.metadata.Directory;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class FileTypeDirectory extends Directory {
    public static final int TAG_DETECTED_FILE_MIME_TYPE = 3;
    public static final int TAG_DETECTED_FILE_TYPE_LONG_NAME = 2;
    public static final int TAG_DETECTED_FILE_TYPE_NAME = 1;
    public static final int TAG_EXPECTED_FILE_NAME_EXTENSION = 4;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Detected File Type Name", 2, "Detected File Type Long Name");
        lv8.x(3, map, "Detected MIME Type", 4, "Expected File Name Extension");
    }

    public FileTypeDirectory(FileType fileType) {
        setDescriptor(new FileTypeDescriptor(this));
        setString(1, fileType.getName());
        setString(2, fileType.getLongName());
        if (fileType.getMimeType() != null) {
            setString(3, fileType.getMimeType());
        }
        if (fileType.getCommonExtension() != null) {
            setString(4, fileType.getCommonExtension());
        }
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return JWcjNoweKCnTr.KYpQwQ;
    }
}
