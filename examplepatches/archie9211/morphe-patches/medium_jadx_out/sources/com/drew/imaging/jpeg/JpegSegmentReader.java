package com.drew.imaging.jpeg;

import com.drew.lang.SequentialReader;
import com.drew.lang.StreamReader;
import java.io.File;
import java.io.FileInputStream;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegSegmentReader {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final byte MARKER_EOI = -39;
    private static final byte SEGMENT_IDENTIFIER = -1;
    private static final byte SEGMENT_SOS = -38;

    private JpegSegmentReader() throws Exception {
        throw new Exception("Not intended for instantiation.");
    }

    public static JpegSegmentData readSegments(SequentialReader sequentialReader, Iterable<JpegSegmentType> iterable) throws JpegProcessingException {
        HashSet hashSet;
        int uInt16 = sequentialReader.getUInt16();
        if (uInt16 != 65496) {
            throw new JpegProcessingException("JPEG data is expected to begin with 0xFFD8 (ÿØ) not 0x" + Integer.toHexString(uInt16), null);
        }
        if (iterable != null) {
            HashSet hashSet2 = new HashSet();
            Iterator<JpegSegmentType> it2 = iterable.iterator();
            while (it2.hasNext()) {
                hashSet2.add(Byte.valueOf(it2.next().byteValue));
            }
            hashSet = hashSet2;
        } else {
            hashSet = null;
        }
        JpegSegmentData jpegSegmentData = new JpegSegmentData();
        while (true) {
            byte b = sequentialReader.getByte();
            byte b2 = sequentialReader.getByte();
            while (true) {
                if (b == -1 && b2 != -1 && b2 != 0) {
                    break;
                }
                byte b3 = b2;
                b2 = sequentialReader.getByte();
                b = b3;
            }
            if (b2 == -38 || b2 == -39) {
                break;
            }
            int uInt162 = sequentialReader.getUInt16() - 2;
            if (uInt162 < 0) {
                throw new JpegProcessingException("JPEG segment size would be less than zero", null);
            }
            if (hashSet == null || hashSet.contains(Byte.valueOf(b2))) {
                jpegSegmentData.addSegment(b2, sequentialReader.getBytes(uInt162));
            } else if (!sequentialReader.trySkip(uInt162)) {
                break;
            }
        }
        return jpegSegmentData;
    }

    public static JpegSegmentData readSegments(File file, Iterable<JpegSegmentType> iterable) throws Throwable {
        FileInputStream fileInputStream = null;
        try {
            FileInputStream fileInputStream2 = new FileInputStream(file);
            try {
                JpegSegmentData segments = readSegments(new StreamReader(fileInputStream2), iterable);
                fileInputStream2.close();
                return segments;
            } catch (Throwable th) {
                th = th;
                fileInputStream = fileInputStream2;
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }
}
