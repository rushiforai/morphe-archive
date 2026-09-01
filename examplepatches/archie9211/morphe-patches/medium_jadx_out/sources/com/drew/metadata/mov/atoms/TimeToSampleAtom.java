package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.media.QuickTimeVideoDirectory;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TimeToSampleAtom extends FullAtom {
    private final ArrayList<Entry> entries;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class Entry {
        long sampleCount;
        long sampleDuration;

        public Entry(SequentialReader sequentialReader) {
            this.sampleCount = sequentialReader.getUInt32();
            this.sampleDuration = sequentialReader.getUInt32();
        }
    }

    public TimeToSampleAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
        long uInt32 = sequentialReader.getUInt32();
        if (uInt32 >= 2147483647L) {
            this.entries = new ArrayList<>();
            return;
        }
        this.entries = new ArrayList<>((int) uInt32);
        for (int i = 0; i < uInt32; i++) {
            this.entries.add(new Entry(sequentialReader));
        }
    }

    public final void addMetadata(QuickTimeVideoDirectory quickTimeVideoDirectory, QuickTimeContext quickTimeContext) {
        if (quickTimeContext.timeScale == null || this.entries.size() <= 0) {
            return;
        }
        quickTimeVideoDirectory.setFloat(14, quickTimeContext.timeScale.longValue() / this.entries.get(0).sampleDuration);
    }
}
