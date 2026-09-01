package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.atoms.SampleDescription;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class SampleDescriptionAtom<T extends SampleDescription> extends FullAtom {
    protected long numberOfEntries;
    protected ArrayList<T> sampleDescriptions;

    public SampleDescriptionAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
        long uInt32 = sequentialReader.getUInt32();
        this.numberOfEntries = uInt32;
        if (uInt32 > 2147483647L) {
            this.numberOfEntries = 0L;
            this.sampleDescriptions = new ArrayList<>();
        } else {
            this.sampleDescriptions = new ArrayList<>((int) this.numberOfEntries);
            for (long j = 0; j < this.numberOfEntries; j++) {
                this.sampleDescriptions.add((T) getSampleDescription(sequentialReader));
            }
        }
    }

    public abstract T getSampleDescription(SequentialReader sequentialReader);
}
