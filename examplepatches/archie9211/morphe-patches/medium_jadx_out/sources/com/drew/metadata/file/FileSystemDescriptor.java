package com.drew.metadata.file;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FileSystemDescriptor extends TagDescriptor<FileSystemDirectory> {
    public FileSystemDescriptor(FileSystemDirectory fileSystemDirectory) {
        super(fileSystemDirectory);
    }

    private String getFileSizeDescription() {
        Long longObject = ((FileSystemDirectory) this._directory).getLongObject(2);
        if (longObject == null) {
            return null;
        }
        return Long.toString(longObject.longValue()) + " bytes";
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 2 ? super.getDescription(i) : getFileSizeDescription();
    }
}
