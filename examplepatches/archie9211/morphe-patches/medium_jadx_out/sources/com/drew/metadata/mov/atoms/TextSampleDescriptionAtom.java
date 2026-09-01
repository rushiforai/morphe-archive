package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.mov.media.QuickTimeTextDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TextSampleDescriptionAtom extends SampleDescriptionAtom<TextSampleDescription> {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class TextSampleDescription extends SampleDescription {
        int[] backgroundColor;
        long defaultTextBox;
        int displayFlags;
        int fontFace;
        int fontNumber;
        int[] foregroundColor;
        int textJustification;
        String textName;

        public TextSampleDescription(SequentialReader sequentialReader) {
            super(sequentialReader);
            this.displayFlags = sequentialReader.getInt32();
            this.textJustification = sequentialReader.getInt32();
            this.backgroundColor = new int[]{sequentialReader.getUInt16(), sequentialReader.getUInt16(), sequentialReader.getUInt16()};
            this.defaultTextBox = sequentialReader.getInt64();
            sequentialReader.skip(8L);
            this.fontNumber = sequentialReader.getUInt16();
            this.fontFace = sequentialReader.getUInt16();
            sequentialReader.skip(1L);
            sequentialReader.skip(2L);
            this.foregroundColor = new int[]{sequentialReader.getUInt16(), sequentialReader.getUInt16(), sequentialReader.getUInt16()};
            this.textName = sequentialReader.getString(sequentialReader.getUInt8());
        }
    }

    public TextSampleDescriptionAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
    }

    public final void addMetadata(QuickTimeTextDirectory quickTimeTextDirectory) {
        if (this.sampleDescriptions.size() == 0) {
            return;
        }
        TextSampleDescription textSampleDescription = (TextSampleDescription) this.sampleDescriptions.get(0);
        quickTimeTextDirectory.setBoolean(1, (textSampleDescription.displayFlags & 2) == 2);
        quickTimeTextDirectory.setBoolean(2, (textSampleDescription.displayFlags & 8) == 8);
        quickTimeTextDirectory.setBoolean(3, (textSampleDescription.displayFlags & 32) == 32);
        quickTimeTextDirectory.setBoolean(4, (textSampleDescription.displayFlags & 64) == 64);
        quickTimeTextDirectory.setObject(5, (textSampleDescription.displayFlags & 128) == 128 ? "Horizontal" : "Vertical");
        quickTimeTextDirectory.setObject(6, (textSampleDescription.displayFlags & 256) == 256 ? "Reverse" : "Normal");
        quickTimeTextDirectory.setBoolean(7, (textSampleDescription.displayFlags & 512) == 512);
        quickTimeTextDirectory.setBoolean(8, (textSampleDescription.displayFlags & 4096) == 4096);
        quickTimeTextDirectory.setBoolean(9, (textSampleDescription.displayFlags & 8192) == 8192);
        quickTimeTextDirectory.setBoolean(10, (textSampleDescription.displayFlags & OlympusMakernoteDirectory.TAG_MAIN_INFO) == 16384);
        int i = textSampleDescription.textJustification;
        if (i == -1) {
            quickTimeTextDirectory.setObject(11, "Right");
        } else if (i == 0) {
            quickTimeTextDirectory.setObject(11, "Left");
        } else if (i == 1) {
            quickTimeTextDirectory.setObject(11, "Center");
        }
        quickTimeTextDirectory.setObjectArray(12, textSampleDescription.backgroundColor);
        quickTimeTextDirectory.setLong(13, textSampleDescription.defaultTextBox);
        quickTimeTextDirectory.setInt(14, textSampleDescription.fontNumber);
        int i2 = textSampleDescription.fontFace;
        if (i2 == 1) {
            quickTimeTextDirectory.setObject(15, "Bold");
        } else if (i2 == 2) {
            quickTimeTextDirectory.setObject(15, "Italic");
        } else if (i2 == 4) {
            quickTimeTextDirectory.setObject(15, "Underline");
        } else if (i2 == 8) {
            quickTimeTextDirectory.setObject(15, "Outline");
        } else if (i2 == 16) {
            quickTimeTextDirectory.setObject(15, "Shadow");
        } else if (i2 == 32) {
            quickTimeTextDirectory.setObject(15, "Condense");
        } else if (i2 == 64) {
            quickTimeTextDirectory.setObject(15, "Extend");
        }
        quickTimeTextDirectory.setObjectArray(16, textSampleDescription.foregroundColor);
        quickTimeTextDirectory.setString(17, textSampleDescription.textName);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final SampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new TextSampleDescription(sequentialReader);
    }

    @Override // com.drew.metadata.mov.atoms.SampleDescriptionAtom
    public final TextSampleDescription getSampleDescription(SequentialReader sequentialReader) {
        return new TextSampleDescription(sequentialReader);
    }
}
