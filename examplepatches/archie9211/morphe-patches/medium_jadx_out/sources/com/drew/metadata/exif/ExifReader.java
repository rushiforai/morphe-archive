package com.drew.metadata.exif;

import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.imaging.tiff.TiffProcessingException;
import com.drew.imaging.tiff.TiffReader;
import com.drew.lang.ByteArrayReader;
import com.drew.lang.RandomAccessReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import java.io.IOException;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ExifReader implements JpegSegmentMetadataReader {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final String JPEG_SEGMENT_PREAMBLE = "Exif\u0000\u0000";

    public static boolean startsWithJpegExifPreamble(byte[] bArr) {
        return bArr.length >= 6 && new String(bArr, 0, 6).equals(JPEG_SEGMENT_PREAMBLE);
    }

    public final void extract(RandomAccessReader randomAccessReader, Metadata metadata, int i, Directory directory) {
        ExifTiffHandler exifTiffHandler = new ExifTiffHandler(metadata, directory, i);
        try {
            new TiffReader().processTiff(randomAccessReader, exifTiffHandler, i);
        } catch (TiffProcessingException e) {
            exifTiffHandler.error("Exception processing TIFF data: " + e.getMessage());
        } catch (IOException e2) {
            exifTiffHandler.error("Exception processing TIFF data: " + e2.getMessage());
        }
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.APP1);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        for (byte[] bArr : iterable) {
            if (startsWithJpegExifPreamble(bArr)) {
                extract(new ByteArrayReader(bArr, 0), metadata, 6);
            }
        }
    }

    public final void extract(RandomAccessReader randomAccessReader, Metadata metadata, int i) {
        extract(randomAccessReader, metadata, i, null);
    }

    public final void extract(RandomAccessReader randomAccessReader, Metadata metadata) {
        extract(randomAccessReader, metadata, 0, null);
    }
}
