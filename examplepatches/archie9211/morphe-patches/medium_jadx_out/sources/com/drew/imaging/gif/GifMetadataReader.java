package com.drew.imaging.gif;

import com.drew.lang.StreamReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.file.FileSystemMetadataReader;
import com.drew.metadata.gif.GifReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class GifMetadataReader {
    public static Metadata readMetadata(File file) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            Metadata metadata = readMetadata(fileInputStream);
            fileInputStream.close();
            new FileSystemMetadataReader().read(file, metadata);
            return metadata;
        } catch (Throwable th) {
            fileInputStream.close();
            throw th;
        }
    }

    public static Metadata readMetadata(InputStream inputStream) {
        Metadata metadata = new Metadata();
        new GifReader().extract(new StreamReader(inputStream), metadata);
        return metadata;
    }
}
