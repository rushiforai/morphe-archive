package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SampleDescription {
    String dataFormat;
    int dataReferenceIndex;
    long sampleDescriptionSize;

    public SampleDescription(SequentialReader sequentialReader) {
        this.sampleDescriptionSize = sequentialReader.getUInt32();
        this.dataFormat = sequentialReader.getString(4);
        sequentialReader.skip(6L);
        this.dataReferenceIndex = sequentialReader.getUInt16();
    }
}
