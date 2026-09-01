package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.media.QuickTimeVideoDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class VideoInformationMediaHeaderAtom extends FullAtom {
    int graphicsMode;
    int[] opcolor;

    public VideoInformationMediaHeaderAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
        this.graphicsMode = sequentialReader.getUInt16();
        this.opcolor = new int[]{sequentialReader.getUInt16(), sequentialReader.getUInt16(), sequentialReader.getUInt16()};
    }

    public final void addMetadata(QuickTimeVideoDirectory quickTimeVideoDirectory) {
        quickTimeVideoDirectory.setObjectArray(12, this.opcolor);
        quickTimeVideoDirectory.setInt(11, this.graphicsMode);
    }
}
