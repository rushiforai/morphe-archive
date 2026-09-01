package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FullBox extends Box {
    byte[] flags;
    int version;

    public FullBox(SequentialReader sequentialReader, Box box) {
        super(box);
        this.version = sequentialReader.getUInt8();
        this.flags = sequentialReader.getBytes(3);
    }

    public FullBox(FullBox fullBox) {
        super(fullBox);
        this.version = fullBox.version;
        this.flags = fullBox.flags;
    }
}
