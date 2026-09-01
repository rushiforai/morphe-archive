package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.media.QuickTimeSoundDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SoundInformationMediaHeaderAtom extends FullAtom {
    int balance;

    public SoundInformationMediaHeaderAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
        this.balance = sequentialReader.getInt16();
        sequentialReader.skip(2L);
    }

    public final void addMetadata(QuickTimeSoundDirectory quickTimeSoundDirectory) {
        int i = this.balance;
        quickTimeSoundDirectory.setDouble(773, (((double) (i & 65535)) / Math.pow(2.0d, 4.0d)) + ((double) ((-65536) & i)));
    }
}
