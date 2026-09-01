package com.drew.imaging.eps;

import com.drew.metadata.Metadata;
import com.drew.metadata.eps.EpsReader;
import com.drew.metadata.file.FileSystemMetadataReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class EpsMetadataReader {
    public static Metadata readMetadata(File file) throws IOException {
        Metadata metadata = new Metadata();
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            new EpsReader().extract(fileInputStream, metadata);
            fileInputStream.close();
            new FileSystemMetadataReader().read(file, metadata);
            return metadata;
        } catch (Throwable th) {
            fileInputStream.close();
            throw th;
        }
    }

    public static Metadata readMetadata(InputStream inputStream) throws Throwable {
        Metadata metadata = new Metadata();
        new EpsReader().extract(inputStream, metadata);
        return metadata;
    }
}
