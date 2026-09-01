package com.drew.imaging.jpeg;

import com.drew.metadata.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public interface JpegSegmentMetadataReader {
    Iterable<JpegSegmentType> getSegmentTypes();

    void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType);
}
