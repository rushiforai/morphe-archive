package com.drew.metadata.jfxx;

import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.ByteArrayReader;
import com.drew.lang.RandomAccessReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.MetadataReader;
import java.io.IOException;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JfxxReader implements JpegSegmentMetadataReader, MetadataReader {
    public static final String PREAMBLE = "JFXX";

    @Override // com.drew.metadata.MetadataReader
    public final void extract(RandomAccessReader randomAccessReader, Metadata metadata) {
        JfxxDirectory jfxxDirectory = new JfxxDirectory();
        metadata.addDirectory(jfxxDirectory);
        try {
            jfxxDirectory.setInt(5, randomAccessReader.getUInt8(5));
        } catch (IOException e) {
            jfxxDirectory.addError(e.getMessage());
        }
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.APP0);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        for (byte[] bArr : iterable) {
            if (bArr.length >= 4 && PREAMBLE.equals(new String(bArr, 0, 4))) {
                extract(new ByteArrayReader(bArr, 0), metadata);
            }
        }
    }
}
