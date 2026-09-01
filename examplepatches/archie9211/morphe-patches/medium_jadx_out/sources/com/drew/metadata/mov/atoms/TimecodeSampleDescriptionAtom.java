package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.media.QuickTimeTimecodeDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TimecodeSampleDescriptionAtom extends SampleDescriptionAtom<TimecodeSampleDescription> {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class TimecodeSampleDescription extends SampleDescription {
        int flags;
        int frameDuration;
        int numberOfFrames;
        int timeScale;

        public TimecodeSampleDescription(SequentialReader sequentialReader) {
            super(sequentialReader);
            sequentialReader.skip(4L);
            this.flags = sequentialReader.getInt32();
            this.timeScale = sequentialReader.getInt32();
            this.frameDuration = sequentialReader.getInt32();
            this.numberOfFrames = sequentialReader.getByte();
            sequentialReader.skip(1L);
        }
    }

    public TimecodeSampleDescriptionAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
    }

    public final void addMetadata(QuickTimeTimecodeDirectory quickTimeTimecodeDirectory) {
        if (this.sampleDescriptions.size() > 0) {
            TimecodeSampleDescription timecodeSampleDescription = (TimecodeSampleDescription) this.sampleDescriptions.get(0);
            quickTimeTimecodeDirectory.setBoolean(1, (timecodeSampleDescription.flags & 1) == 1);
            quickTimeTimecodeDirectory.setBoolean(2, (timecodeSampleDescription.flags & 2) == 2);
            quickTimeTimecodeDirectory.setBoolean(3, (timecodeSampleDescription.flags & 4) == 4);
            quickTimeTimecodeDirectory.setBoolean(4, (timecodeSampleDescription.flags & 8) == 8);
        }
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final SampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new TimecodeSampleDescription(sequentialReader);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final TimecodeSampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new TimecodeSampleDescription(sequentialReader);
    }
}
