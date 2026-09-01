package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HandlerReferenceAtom extends FullAtom {
    String componentName;
    String componentSubtype;
    String componentType;

    public HandlerReferenceAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
        this.componentType = sequentialReader.getString(4);
        this.componentSubtype = sequentialReader.getString(4);
        sequentialReader.skip(4L);
        sequentialReader.skip(4L);
        sequentialReader.skip(4L);
        this.componentName = sequentialReader.getString(sequentialReader.getUInt8());
    }

    public final String getComponentType() {
        return this.componentSubtype;
    }
}
