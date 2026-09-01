package com.drew.metadata.file;

import com.drew.metadata.Metadata;
import defpackage.ik4;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FileSystemMetadataReader {
    public final void read(File file, Metadata metadata) throws IOException {
        if (!file.isFile()) {
            ik4.g("File object must reference a file");
            return;
        }
        if (!file.exists()) {
            ik4.g("File does not exist");
            return;
        }
        if (!file.canRead()) {
            ik4.g("File is not readable");
            return;
        }
        FileSystemDirectory fileSystemDirectory = (FileSystemDirectory) metadata.getFirstDirectoryOfType(FileSystemDirectory.class);
        if (fileSystemDirectory == null) {
            fileSystemDirectory = new FileSystemDirectory();
            metadata.addDirectory(fileSystemDirectory);
        }
        fileSystemDirectory.setString(1, file.getName());
        fileSystemDirectory.setLong(2, file.length());
        fileSystemDirectory.setObject(3, new Date(file.lastModified()));
    }
}
