package com.drew.metadata.jpeg;

import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Metadata;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegReader implements JpegSegmentMetadataReader {
    public final void extract(byte[] bArr, Metadata metadata, JpegSegmentType jpegSegmentType) {
        JpegDirectory jpegDirectory = new JpegDirectory();
        metadata.addDirectory(jpegDirectory);
        jpegDirectory.setInt(-3, jpegSegmentType.byteValue - JpegSegmentType.SOF0.byteValue);
        if (bArr.length < 6) {
            jpegDirectory.addError("Insufficient bytes for JPEG segment header.");
            return;
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
        try {
            jpegDirectory.setInt(0, sequentialByteArrayReader.getUInt8());
            jpegDirectory.setInt(1, sequentialByteArrayReader.getUInt16());
            jpegDirectory.setInt(3, sequentialByteArrayReader.getUInt16());
            short uInt8 = sequentialByteArrayReader.getUInt8();
            jpegDirectory.setInt(5, uInt8);
            if (sequentialByteArrayReader.available() < uInt8 * 3) {
                jpegDirectory.addError("Insufficient bytes for JPEG the requested number of JPEG components.");
                return;
            }
            for (int i = 0; i < uInt8; i++) {
                jpegDirectory.setObject(i + 6, new JpegComponent(sequentialByteArrayReader.getUInt8(), sequentialByteArrayReader.getUInt8(), sequentialByteArrayReader.getUInt8()));
            }
        } catch (IOException e) {
            jpegDirectory.addError(e.getMessage());
        }
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Arrays.asList(JpegSegmentType.SOF0, JpegSegmentType.SOF1, JpegSegmentType.SOF2, JpegSegmentType.SOF3, JpegSegmentType.SOF5, JpegSegmentType.SOF6, JpegSegmentType.SOF7, JpegSegmentType.SOF9, JpegSegmentType.SOF10, JpegSegmentType.SOF11, JpegSegmentType.SOF13, JpegSegmentType.SOF14, JpegSegmentType.SOF15);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        Iterator<byte[]> it2 = iterable.iterator();
        while (it2.hasNext()) {
            extract(it2.next(), metadata, jpegSegmentType);
        }
    }
}
