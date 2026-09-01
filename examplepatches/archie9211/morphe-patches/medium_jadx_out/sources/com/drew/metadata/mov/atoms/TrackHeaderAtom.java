package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.QuickTimeDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TrackHeaderAtom extends FullAtom {
    long height;
    int[] matrix;
    long width;

    public TrackHeaderAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
        this.matrix = new int[9];
        if (this.version == 1) {
            sequentialReader.skip(48L);
        } else {
            sequentialReader.skip(36L);
        }
        for (int i = 0; i < 9; i++) {
            this.matrix[i] = sequentialReader.getInt32();
        }
        this.width = sequentialReader.getInt32();
        this.height = sequentialReader.getInt32();
    }

    public final void addMetadata(QuickTimeDirectory quickTimeDirectory) {
        if (this.width == 0 || this.height == 0 || quickTimeDirectory.getDoubleObject(512) != null) {
            return;
        }
        int[] iArr = this.matrix;
        quickTimeDirectory.setDouble(270, Math.toDegrees(Math.atan2(iArr[0] + iArr[3], iArr[1] + iArr[4])) - 45.0d);
    }
}
