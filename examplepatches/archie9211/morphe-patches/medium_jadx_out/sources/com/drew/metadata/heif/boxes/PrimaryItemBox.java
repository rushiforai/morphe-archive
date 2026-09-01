package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PrimaryItemBox extends FullBox {
    long itemID;

    public PrimaryItemBox(SequentialReader sequentialReader, Box box) {
        super(sequentialReader, box);
        if (this.version == 0) {
            this.itemID = sequentialReader.getUInt16();
        } else {
            this.itemID = sequentialReader.getUInt32();
        }
    }
}
