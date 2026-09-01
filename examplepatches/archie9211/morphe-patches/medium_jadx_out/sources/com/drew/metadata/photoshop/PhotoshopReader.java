package com.drew.metadata.photoshop;

import com.drew.imaging.ImageProcessingException;
import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.ByteArrayReader;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.ExifReader;
import com.drew.metadata.icc.IccReader;
import com.drew.metadata.iptc.IptcReader;
import com.drew.metadata.xmp.XmpReader;
import java.util.Arrays;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PhotoshopReader implements JpegSegmentMetadataReader {
    private static final String JPEG_SEGMENT_PREAMBLE = "Photoshop 3.0";

    public final void extract(SequentialReader sequentialReader, int i, Metadata metadata, Directory directory) {
        int i2;
        Metadata metadata2;
        PhotoshopDirectory photoshopDirectory = new PhotoshopDirectory();
        metadata.addDirectory(photoshopDirectory);
        if (directory != null) {
            photoshopDirectory.setParent(directory);
        }
        int i3 = 0;
        int i4 = 0;
        while (i3 < i) {
            try {
                String string = sequentialReader.getString(4);
                int uInt16 = sequentialReader.getUInt16();
                short uInt8 = sequentialReader.getUInt8();
                int i5 = i3 + 7;
                if (uInt8 < 0 || (i2 = uInt8 + i5) > i) {
                    throw new ImageProcessingException("Invalid string length", null);
                }
                StringBuilder sb = new StringBuilder();
                while (i5 < i2) {
                    sb.append((char) sequentialReader.getUInt8());
                    i5++;
                }
                if (i5 % 2 != 0) {
                    sequentialReader.skip(1L);
                    i5++;
                }
                int int32 = sequentialReader.getInt32();
                byte[] bytes = sequentialReader.getBytes(int32);
                i3 = i5 + 4 + int32;
                if (i3 % 2 != 0) {
                    sequentialReader.skip(1L);
                    i3++;
                }
                if (string.equals("8BIM")) {
                    if (uInt16 == 1028) {
                        Metadata metadata3 = metadata;
                        new IptcReader().extract(new SequentialByteArrayReader(bytes, 0), metadata3, bytes.length, photoshopDirectory);
                        metadata2 = metadata3;
                    } else {
                        metadata2 = metadata;
                        if (uInt16 == 1039) {
                            new IccReader().extract(new ByteArrayReader(bytes, 0), metadata2, photoshopDirectory);
                        } else if (uInt16 == 1058 || uInt16 == 1059) {
                            new ExifReader().extract(new ByteArrayReader(bytes, 0), metadata2, 0, photoshopDirectory);
                        } else if (uInt16 == 1060) {
                            new XmpReader().extract(bytes, 0, bytes.length, metadata2, photoshopDirectory);
                        } else if (uInt16 < 2000 || uInt16 > 2998) {
                            photoshopDirectory.setObject(uInt16, bytes);
                        } else {
                            int i6 = i4 + 1;
                            byte[] bArrCopyOf = Arrays.copyOf(bytes, bytes.length + sb.length() + 1);
                            for (int length = (bArrCopyOf.length - sb.length()) - 1; length < bArrCopyOf.length; length++) {
                                if (length % (((bArrCopyOf.length - sb.length()) - 1) + sb.length()) == 0) {
                                    bArrCopyOf[length] = (byte) sb.length();
                                } else {
                                    bArrCopyOf[length] = (byte) sb.charAt(length - ((bArrCopyOf.length - sb.length()) - 1));
                                }
                            }
                            int i7 = i4 + 2000;
                            PhotoshopDirectory._tagNameMap.put(Integer.valueOf(i7), "Path Info " + i6);
                            photoshopDirectory.setObject(i7, bArrCopyOf);
                            i4 = i6;
                        }
                    }
                    if (uInt16 >= 4000 && uInt16 <= 4999) {
                        PhotoshopDirectory._tagNameMap.put(Integer.valueOf(uInt16), String.format("Plug-in %d Data", Integer.valueOf(uInt16 - 3999)));
                    }
                } else {
                    metadata2 = metadata;
                }
                metadata = metadata2;
            } catch (Exception e) {
                photoshopDirectory.addError(e.getMessage());
                return;
            }
        }
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.APPD);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        for (byte[] bArr : iterable) {
            if (bArr.length >= 14 && JPEG_SEGMENT_PREAMBLE.equals(new String(bArr, 0, 13))) {
                extract(new SequentialByteArrayReader(bArr, 14), bArr.length - 14, metadata, null);
            }
        }
    }

    public final void extract(SequentialReader sequentialReader, int i, Metadata metadata) {
        extract(sequentialReader, i, metadata, null);
    }
}
