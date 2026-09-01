package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.QuickTimeContext;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class MediaHeaderAtom extends FullAtom {
    public MediaHeaderAtom(SequentialReader sequentialReader, Atom atom, QuickTimeContext quickTimeContext) {
        super(sequentialReader, atom);
        quickTimeContext.creationTime = Long.valueOf(sequentialReader.getUInt32());
        quickTimeContext.modificationTime = Long.valueOf(sequentialReader.getUInt32());
        quickTimeContext.timeScale = Long.valueOf(sequentialReader.getUInt32());
        quickTimeContext.duration = Long.valueOf(sequentialReader.getUInt32());
        sequentialReader.getUInt16();
        sequentialReader.getUInt16();
    }
}
