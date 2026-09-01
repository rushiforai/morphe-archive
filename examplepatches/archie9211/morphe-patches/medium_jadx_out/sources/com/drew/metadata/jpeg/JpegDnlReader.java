package com.drew.metadata.jpeg;

import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.ErrorDirectory;
import com.drew.metadata.Metadata;
import java.io.IOException;
import java.util.Collections;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegDnlReader implements JpegSegmentMetadataReader {
    public final void extract(byte[] bArr, Metadata metadata, JpegSegmentType jpegSegmentType) {
        JpegDirectory jpegDirectory = (JpegDirectory) metadata.getFirstDirectoryOfType(JpegDirectory.class);
        if (jpegDirectory == null) {
            ErrorDirectory errorDirectory = new ErrorDirectory();
            metadata.addDirectory(errorDirectory);
            errorDirectory.addError("DNL segment found without SOFx - illegal JPEG format");
            return;
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
        try {
            Integer integer = jpegDirectory.getInteger(1);
            if (integer != null && integer.intValue() != 0) {
                return;
            }
            jpegDirectory.setInt(1, sequentialByteArrayReader.getUInt16());
        } catch (IOException e) {
            jpegDirectory.addError(e.getMessage());
        }
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.DNL);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        Iterator<byte[]> it2 = iterable.iterator();
        while (it2.hasNext()) {
            extract(it2.next(), metadata, jpegSegmentType);
        }
    }
}
