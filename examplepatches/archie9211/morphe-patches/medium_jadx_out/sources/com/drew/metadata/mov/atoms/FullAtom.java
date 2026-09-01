package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FullAtom extends Atom {
    byte[] flags;
    int version;

    public FullAtom(SequentialReader sequentialReader, Atom atom) {
        super(atom);
        this.version = sequentialReader.getUInt8();
        this.flags = sequentialReader.getBytes(3);
    }
}
