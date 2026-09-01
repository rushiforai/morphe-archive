package com.drew.imaging.jpeg;

import defpackage.rd6;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegSegmentData {
    private final HashMap<Byte, List<byte[]>> _segmentDataMap = new HashMap<>(10);

    private List<byte[]> getOrCreateSegmentList(byte b) {
        if (this._segmentDataMap.containsKey(Byte.valueOf(b))) {
            return this._segmentDataMap.get(Byte.valueOf(b));
        }
        ArrayList arrayList = new ArrayList();
        this._segmentDataMap.put(Byte.valueOf(b), arrayList);
        return arrayList;
    }

    private List<byte[]> getSegmentList(byte b) {
        return this._segmentDataMap.get(Byte.valueOf(b));
    }

    public final void addSegment(byte b, byte[] bArr) {
        getOrCreateSegmentList(b).add(bArr);
    }

    public final boolean containsSegment(byte b) {
        return this._segmentDataMap.containsKey(Byte.valueOf(b));
    }

    public final byte[] getSegment(byte b, int i) {
        List<byte[]> segmentList = getSegmentList(b);
        if (segmentList == null || segmentList.size() <= i) {
            return null;
        }
        return segmentList.get(i);
    }

    public final int getSegmentCount(byte b) {
        List<byte[]> segmentList = getSegmentList(b);
        if (segmentList == null) {
            return 0;
        }
        return segmentList.size();
    }

    public final Iterable<JpegSegmentType> getSegmentTypes() {
        HashSet hashSet = new HashSet();
        for (Byte b : this._segmentDataMap.keySet()) {
            JpegSegmentType jpegSegmentTypeFromByte = JpegSegmentType.fromByte(b.byteValue());
            if (jpegSegmentTypeFromByte == null) {
                rd6.g("Should not have a segmentTypeByte that is not in the enum: ", Integer.toHexString(b.byteValue()));
                return null;
            }
            hashSet.add(jpegSegmentTypeFromByte);
        }
        return hashSet;
    }

    public final Iterable<byte[]> getSegments(byte b) {
        List<byte[]> segmentList = getSegmentList(b);
        return segmentList == null ? new ArrayList() : segmentList;
    }

    public final void removeSegment(byte b) {
        this._segmentDataMap.remove(Byte.valueOf(b));
    }

    public final void removeSegmentOccurrence(byte b, int i) {
        this._segmentDataMap.get(Byte.valueOf(b)).remove(i);
    }

    public final void removeSegment(JpegSegmentType jpegSegmentType) {
        removeSegment(jpegSegmentType.byteValue);
    }

    public final boolean containsSegment(JpegSegmentType jpegSegmentType) {
        return containsSegment(jpegSegmentType.byteValue);
    }

    public final Iterable<byte[]> getSegments(JpegSegmentType jpegSegmentType) {
        return getSegments(jpegSegmentType.byteValue);
    }

    public final int getSegmentCount(JpegSegmentType jpegSegmentType) {
        return getSegmentCount(jpegSegmentType.byteValue);
    }

    public final void removeSegmentOccurrence(JpegSegmentType jpegSegmentType, int i) {
        removeSegmentOccurrence(jpegSegmentType.byteValue, i);
    }

    public final byte[] getSegment(JpegSegmentType jpegSegmentType) {
        return getSegment(jpegSegmentType.byteValue, 0);
    }

    public final byte[] getSegment(JpegSegmentType jpegSegmentType, int i) {
        return getSegment(jpegSegmentType.byteValue, i);
    }

    public final byte[] getSegment(byte b) {
        return getSegment(b, 0);
    }
}
