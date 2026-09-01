package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Atom {
    public long size;
    public String type;

    public Atom(SequentialReader sequentialReader) {
        long uInt32 = sequentialReader.getUInt32();
        this.size = uInt32;
        if (uInt32 == 0) {
            this.size = sequentialReader.getUInt32();
        }
        this.type = sequentialReader.getString(4);
        long j = this.size;
        if (j == 1) {
            this.size = sequentialReader.getInt64();
        } else if (j == 0) {
            this.size = -1L;
        }
    }

    public Atom(Atom atom) {
        this.size = atom.size;
        this.type = atom.type;
    }
}
