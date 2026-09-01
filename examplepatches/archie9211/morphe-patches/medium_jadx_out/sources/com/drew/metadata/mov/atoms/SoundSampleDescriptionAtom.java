package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.QuickTimeDictionary;
import com.drew.metadata.mov.media.QuickTimeSoundDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SoundSampleDescriptionAtom extends SampleDescriptionAtom<SoundSampleDescription> {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class SoundSampleDescription extends SampleDescription {
        int compressionID;
        int numberOfChannels;
        int packetSize;
        int revisionLevel;
        long sampleRate;
        int sampleSize;
        int vendor;
        int version;

        public SoundSampleDescription(SequentialReader sequentialReader) {
            super(sequentialReader);
            this.version = sequentialReader.getUInt16();
            this.revisionLevel = sequentialReader.getUInt16();
            this.vendor = sequentialReader.getInt32();
            this.numberOfChannels = sequentialReader.getUInt16();
            this.sampleSize = sequentialReader.getUInt16();
            this.compressionID = sequentialReader.getUInt16();
            this.packetSize = sequentialReader.getUInt16();
            this.sampleRate = sequentialReader.getUInt32();
        }
    }

    public SoundSampleDescriptionAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
    }

    public final void addMetadata(QuickTimeSoundDirectory quickTimeSoundDirectory) {
        if (this.sampleDescriptions.size() > 0) {
            SoundSampleDescription soundSampleDescription = (SoundSampleDescription) this.sampleDescriptions.get(0);
            QuickTimeDictionary.setLookup(769, soundSampleDescription.dataFormat, quickTimeSoundDirectory);
            quickTimeSoundDirectory.setInt(770, soundSampleDescription.numberOfChannels);
            quickTimeSoundDirectory.setInt(771, soundSampleDescription.sampleSize);
        }
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final SampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new SoundSampleDescription(sequentialReader);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final SoundSampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new SoundSampleDescription(sequentialReader);
    }
}
