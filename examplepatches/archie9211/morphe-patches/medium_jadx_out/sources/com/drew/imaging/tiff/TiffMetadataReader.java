package com.drew.imaging.tiff;

import com.drew.lang.RandomAccessFileReader;
import com.drew.lang.RandomAccessReader;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.ExifTiffHandler;
import com.drew.metadata.file.FileSystemMetadataReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TiffMetadataReader {
    public static Metadata readMetadata(File file) throws IOException {
        RandomAccessFile randomAccessFile = new RandomAccessFile(file, "r");
        try {
            Metadata metadata = readMetadata(new RandomAccessFileReader(randomAccessFile, 0));
            randomAccessFile.close();
            new FileSystemMetadataReader().read(file, metadata);
            return metadata;
        } catch (Throwable th) {
            randomAccessFile.close();
            throw th;
        }
    }

    public static Metadata readMetadata(InputStream inputStream) {
        return readMetadata(new RandomAccessStreamReader(inputStream));
    }

    public static Metadata readMetadata(RandomAccessReader randomAccessReader) throws Throwable {
        Metadata metadata = new Metadata();
        new TiffReader().processTiff(randomAccessReader, new ExifTiffHandler(metadata, null, 0), 0);
        return metadata;
    }
}
