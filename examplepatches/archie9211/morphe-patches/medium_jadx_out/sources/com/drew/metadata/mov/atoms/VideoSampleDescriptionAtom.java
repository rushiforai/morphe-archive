package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.QuickTimeDictionary;
import com.drew.metadata.mov.media.QuickTimeVideoDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class VideoSampleDescriptionAtom extends SampleDescriptionAtom<VideoSampleDescription> {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class VideoSampleDescription extends SampleDescription {
        int colorTableID;
        String compressorName;
        long dataSize;
        int depth;
        int frameCount;
        int height;
        long horizontalResolution;
        int revisionLevel;
        long spatialQuality;
        long temporalQuality;
        String vendor;
        int version;
        long verticalResolution;
        int width;

        public VideoSampleDescription(SequentialReader sequentialReader) {
            super(sequentialReader);
            this.version = sequentialReader.getUInt16();
            this.revisionLevel = sequentialReader.getUInt16();
            this.vendor = sequentialReader.getString(4);
            this.temporalQuality = sequentialReader.getUInt32();
            this.spatialQuality = sequentialReader.getUInt32();
            this.width = sequentialReader.getUInt16();
            this.height = sequentialReader.getUInt16();
            this.horizontalResolution = sequentialReader.getUInt32();
            this.verticalResolution = sequentialReader.getUInt32();
            this.dataSize = sequentialReader.getUInt32();
            this.frameCount = sequentialReader.getUInt16();
            this.compressorName = sequentialReader.getString(32);
            this.depth = sequentialReader.getUInt16();
            this.colorTableID = sequentialReader.getInt16();
        }
    }

    public VideoSampleDescriptionAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
    }

    public final void addMetadata(QuickTimeVideoDirectory quickTimeVideoDirectory) {
        if (this.sampleDescriptions.size() == 0) {
            return;
        }
        VideoSampleDescription videoSampleDescription = (VideoSampleDescription) this.sampleDescriptions.get(0);
        QuickTimeDictionary.setLookup(1, videoSampleDescription.vendor, quickTimeVideoDirectory);
        QuickTimeDictionary.setLookup(10, videoSampleDescription.dataFormat, quickTimeVideoDirectory);
        quickTimeVideoDirectory.setLong(2, videoSampleDescription.temporalQuality);
        quickTimeVideoDirectory.setLong(3, videoSampleDescription.spatialQuality);
        quickTimeVideoDirectory.setInt(4, videoSampleDescription.width);
        quickTimeVideoDirectory.setInt(5, videoSampleDescription.height);
        String strTrim = videoSampleDescription.compressorName.trim();
        if (!strTrim.isEmpty()) {
            quickTimeVideoDirectory.setObject(8, strTrim);
        }
        quickTimeVideoDirectory.setInt(9, videoSampleDescription.depth);
        quickTimeVideoDirectory.setInt(13, videoSampleDescription.colorTableID);
        long j = videoSampleDescription.horizontalResolution;
        quickTimeVideoDirectory.setDouble(6, ((j & 65535) / Math.pow(2.0d, 4.0d)) + ((j & (-65536)) >> 16));
        long j2 = videoSampleDescription.verticalResolution;
        quickTimeVideoDirectory.setDouble(7, ((j2 & 65535) / Math.pow(2.0d, 4.0d)) + (((-65536) & j2) >> 16));
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final SampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new VideoSampleDescription(sequentialReader);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final VideoSampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new VideoSampleDescription(sequentialReader);
    }
}
