package com.drew.imaging.raf;

import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.file.FileSystemMetadataReader;
import defpackage.ik4;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class RafMetadataReader {
    private RafMetadataReader() throws Exception {
        throw new Exception("Not intended for instantiation");
    }

    public static Metadata readMetadata(InputStream inputStream) throws IOException {
        if (!inputStream.markSupported()) {
            ik4.g("Stream must support mark/reset");
            return null;
        }
        inputStream.mark(512);
        byte[] bArr = new byte[512];
        int i = inputStream.read(bArr);
        if (i == -1) {
            ik4.g("Stream is empty");
            return null;
        }
        inputStream.reset();
        int i2 = 0;
        while (true) {
            if (i2 >= i - 2) {
                break;
            }
            if (bArr[i2] == -1 && bArr[i2 + 1] == -40 && bArr[i2 + 2] == -1) {
                long j = i2;
                if (inputStream.skip(j) != j) {
                    ik4.g("Skipping stream bytes failed");
                    return null;
                }
            } else {
                i2++;
            }
        }
        return JpegMetadataReader.readMetadata(inputStream, (Iterable<JpegSegmentMetadataReader>) null);
    }

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
}
