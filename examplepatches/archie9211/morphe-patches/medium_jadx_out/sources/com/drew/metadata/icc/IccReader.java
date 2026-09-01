package com.drew.metadata.icc;

import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.ByteArrayReader;
import com.drew.lang.DateUtil;
import com.drew.lang.RandomAccessReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.MetadataReader;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import java.io.IOException;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class IccReader implements JpegSegmentMetadataReader, MetadataReader {
    public static final String JPEG_SEGMENT_PREAMBLE = "ICC_PROFILE";

    public static String getStringFromInt32(int i) {
        return new String(new byte[]{(byte) (((-16777216) & i) >> 24), (byte) ((16711680 & i) >> 16), (byte) ((65280 & i) >> 8), (byte) (i & 255)});
    }

    private void set4ByteString(Directory directory, int i, RandomAccessReader randomAccessReader) {
        int int32 = randomAccessReader.getInt32(i);
        if (int32 != 0) {
            directory.setObject(i, getStringFromInt32(int32));
        }
    }

    private void setDate(IccDirectory iccDirectory, int i, RandomAccessReader randomAccessReader) {
        int uInt16 = randomAccessReader.getUInt16(i);
        int uInt162 = randomAccessReader.getUInt16(i + 2);
        int uInt163 = randomAccessReader.getUInt16(i + 4);
        int uInt164 = randomAccessReader.getUInt16(i + 6);
        int uInt165 = randomAccessReader.getUInt16(i + 8);
        int uInt166 = randomAccessReader.getUInt16(i + 10);
        if (DateUtil.isValidDate(uInt16, uInt162 - 1, uInt163) && DateUtil.isValidTime(uInt164, uInt165, uInt166)) {
            iccDirectory.setObject(i, String.format("%04d:%02d:%02d %02d:%02d:%02d", Integer.valueOf(uInt16), Integer.valueOf(uInt162), Integer.valueOf(uInt163), Integer.valueOf(uInt164), Integer.valueOf(uInt165), Integer.valueOf(uInt166)));
        } else {
            iccDirectory.addError(String.format("ICC data describes an invalid date/time: year=%d month=%d day=%d hour=%d minute=%d second=%d", Integer.valueOf(uInt16), Integer.valueOf(uInt162), Integer.valueOf(uInt163), Integer.valueOf(uInt164), Integer.valueOf(uInt165), Integer.valueOf(uInt166)));
        }
    }

    private void setInt32(Directory directory, int i, RandomAccessReader randomAccessReader) {
        int int32 = randomAccessReader.getInt32(i);
        if (int32 != 0) {
            directory.setInt(i, int32);
        }
    }

    private void setInt64(Directory directory, int i, RandomAccessReader randomAccessReader) {
        long int64 = randomAccessReader.getInt64(i);
        if (int64 != 0) {
            directory.setLong(i, int64);
        }
    }

    public final void extract(RandomAccessReader randomAccessReader, Metadata metadata, Directory directory) {
        IccDirectory iccDirectory = new IccDirectory();
        if (directory != null) {
            iccDirectory.setParent(directory);
        }
        try {
            iccDirectory.setInt(0, randomAccessReader.getInt32(0));
            set4ByteString(iccDirectory, 4, randomAccessReader);
            setInt32(iccDirectory, 8, randomAccessReader);
            set4ByteString(iccDirectory, 12, randomAccessReader);
            set4ByteString(iccDirectory, 16, randomAccessReader);
            set4ByteString(iccDirectory, 20, randomAccessReader);
            setDate(iccDirectory, 24, randomAccessReader);
            set4ByteString(iccDirectory, 36, randomAccessReader);
            set4ByteString(iccDirectory, 40, randomAccessReader);
            setInt32(iccDirectory, 44, randomAccessReader);
            set4ByteString(iccDirectory, 48, randomAccessReader);
            int int32 = randomAccessReader.getInt32(52);
            if (int32 != 0) {
                if (int32 <= 538976288) {
                    iccDirectory.setInt(52, int32);
                } else {
                    iccDirectory.setObject(52, getStringFromInt32(int32));
                }
            }
            setInt32(iccDirectory, 64, randomAccessReader);
            setInt64(iccDirectory, 56, randomAccessReader);
            iccDirectory.setObject(68, new float[]{randomAccessReader.getS15Fixed16(68), randomAccessReader.getS15Fixed16(72), randomAccessReader.getS15Fixed16(76)});
            int int322 = randomAccessReader.getInt32(128);
            iccDirectory.setInt(128, int322);
            for (int i = 0; i < int322; i++) {
                int i2 = i * 12;
                iccDirectory.setObject(randomAccessReader.getInt32(i2 + NikonType2MakernoteDirectory.TAG_LENS), randomAccessReader.getBytes(randomAccessReader.getInt32(i2 + 136), randomAccessReader.getInt32(i2 + 140)));
            }
        } catch (IOException e) {
            iccDirectory.addError("Exception reading ICC profile: " + e.getMessage());
        }
        metadata.addDirectory(iccDirectory);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.APP2);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        byte[] bArr = null;
        for (byte[] bArr2 : iterable) {
            if (bArr2.length >= 11 && JPEG_SEGMENT_PREAMBLE.equalsIgnoreCase(new String(bArr2, 0, 11))) {
                if (bArr == null) {
                    bArr = new byte[bArr2.length - 14];
                    System.arraycopy(bArr2, 14, bArr, 0, bArr2.length - 14);
                } else {
                    byte[] bArr3 = new byte[(bArr.length + bArr2.length) - 14];
                    System.arraycopy(bArr, 0, bArr3, 0, bArr.length);
                    System.arraycopy(bArr2, 14, bArr3, bArr.length, bArr2.length - 14);
                    bArr = bArr3;
                }
            }
        }
        if (bArr != null) {
            extract(new ByteArrayReader(bArr, 0), metadata, null);
        }
    }

    @Override // com.drew.metadata.MetadataReader
    public final void extract(RandomAccessReader randomAccessReader, Metadata metadata) {
        extract(randomAccessReader, metadata, null);
    }
}
