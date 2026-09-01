package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.media.QuickTimeSubtitleDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SubtitleSampleDescriptionAtom extends SampleDescriptionAtom<SubtitleSampleDescription> {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class SubtitleSampleDescription extends SampleDescription {
        long defaultTextBox;
        int displayFlags;
        int fontFace;
        int fontIdentifier;
        int fontSize;
        int[] foregroundColor;

        public SubtitleSampleDescription(SequentialReader sequentialReader) {
            super(sequentialReader);
            this.displayFlags = sequentialReader.getInt32();
            sequentialReader.skip(1L);
            sequentialReader.skip(1L);
            sequentialReader.skip(4L);
            this.defaultTextBox = sequentialReader.getInt64();
            sequentialReader.skip(4L);
            this.fontIdentifier = sequentialReader.getInt16();
            this.fontFace = sequentialReader.getByte();
            this.fontSize = sequentialReader.getByte();
            this.foregroundColor = new int[]{sequentialReader.getUInt16(), sequentialReader.getUInt16(), sequentialReader.getUInt16()};
        }
    }

    public SubtitleSampleDescriptionAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
    }

    public final void addMetadata(QuickTimeSubtitleDirectory quickTimeSubtitleDirectory) {
        if (this.sampleDescriptions.size() == 0) {
            return;
        }
        SubtitleSampleDescription subtitleSampleDescription = (SubtitleSampleDescription) this.sampleDescriptions.get(0);
        quickTimeSubtitleDirectory.setBoolean(1, (subtitleSampleDescription.displayFlags & 536870912) == 536870912);
        quickTimeSubtitleDirectory.setBoolean(2, (subtitleSampleDescription.displayFlags & 1073741824) == 1073741824);
        quickTimeSubtitleDirectory.setBoolean(3, (subtitleSampleDescription.displayFlags & (-1073741824)) == -1073741824);
        quickTimeSubtitleDirectory.setLong(4, subtitleSampleDescription.defaultTextBox);
        quickTimeSubtitleDirectory.setInt(5, subtitleSampleDescription.fontIdentifier);
        int i = subtitleSampleDescription.fontFace;
        if (i == 1) {
            quickTimeSubtitleDirectory.setObject(6, "Bold");
        } else if (i == 2) {
            quickTimeSubtitleDirectory.setObject(6, "Italic");
        } else if (i == 4) {
            quickTimeSubtitleDirectory.setObject(6, "Underline");
        }
        quickTimeSubtitleDirectory.setInt(7, subtitleSampleDescription.fontSize);
        quickTimeSubtitleDirectory.setObjectArray(8, subtitleSampleDescription.foregroundColor);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final SampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new SubtitleSampleDescription(sequentialReader);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final SubtitleSampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new SubtitleSampleDescription(sequentialReader);
    }
}
