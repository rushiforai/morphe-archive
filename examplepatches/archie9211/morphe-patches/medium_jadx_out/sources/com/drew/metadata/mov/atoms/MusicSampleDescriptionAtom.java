package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.media.QuickTimeMusicDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class MusicSampleDescriptionAtom extends SampleDescriptionAtom<MusicSampleDescription> {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class MusicSampleDescription extends SampleDescription {
        long flags;

        public MusicSampleDescription(SequentialReader sequentialReader) {
            super(sequentialReader);
            this.flags = sequentialReader.getUInt32();
        }
    }

    public MusicSampleDescriptionAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final MusicSampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new MusicSampleDescription(sequentialReader);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final SampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new MusicSampleDescription(sequentialReader);
    }

    public final void addMetadata(QuickTimeMusicDirectory quickTimeMusicDirectory) {
    }
}
