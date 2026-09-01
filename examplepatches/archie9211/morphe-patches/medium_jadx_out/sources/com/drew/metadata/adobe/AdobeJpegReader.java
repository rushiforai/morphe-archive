package com.drew.metadata.adobe;

import androidx.work.impl.yX.VrhD;
import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import java.io.IOException;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class AdobeJpegReader implements JpegSegmentMetadataReader {
    public static final String PREAMBLE = "Adobe";

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.APPE);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        for (byte[] bArr : iterable) {
            if (bArr.length == 12 && PREAMBLE.equalsIgnoreCase(new String(bArr, 0, 5))) {
                extract(new SequentialByteArrayReader(bArr, 0), metadata);
            }
        }
    }

    public final void extract(SequentialReader sequentialReader, Metadata metadata) {
        AdobeJpegDirectory adobeJpegDirectory = new AdobeJpegDirectory();
        metadata.addDirectory(adobeJpegDirectory);
        try {
            sequentialReader.setMotorolaByteOrder(false);
            if (!sequentialReader.getString(5).equals(PREAMBLE)) {
                adobeJpegDirectory.addError(VrhD.EiTUrLGOfSe);
                return;
            }
            adobeJpegDirectory.setInt(0, sequentialReader.getUInt16());
            adobeJpegDirectory.setInt(1, sequentialReader.getUInt16());
            adobeJpegDirectory.setInt(2, sequentialReader.getUInt16());
            adobeJpegDirectory.setInt(3, sequentialReader.getByte());
        } catch (IOException e) {
            adobeJpegDirectory.addError("IO exception processing data: " + e.getMessage());
        }
    }
}
