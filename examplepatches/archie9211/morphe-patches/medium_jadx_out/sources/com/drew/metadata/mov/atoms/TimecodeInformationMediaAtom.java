package com.drew.metadata.mov.atoms;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mov.media.QuickTimeTimecodeDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TimecodeInformationMediaAtom extends FullAtom {
    int[] backgroundColor;
    String fontName;
    int[] textColor;
    int textFace;
    int textFont;
    int textSize;

    public TimecodeInformationMediaAtom(SequentialReader sequentialReader, Atom atom) {
        super(sequentialReader, atom);
        this.textFont = sequentialReader.getInt16();
        this.textFace = sequentialReader.getInt16();
        this.textSize = sequentialReader.getInt16();
        sequentialReader.skip(2L);
        this.textColor = new int[]{sequentialReader.getUInt16(), sequentialReader.getUInt16(), sequentialReader.getUInt16()};
        this.backgroundColor = new int[]{sequentialReader.getUInt16(), sequentialReader.getUInt16(), sequentialReader.getUInt16()};
        this.fontName = sequentialReader.getString(sequentialReader.getUInt8());
    }

    public final void addMetadata(QuickTimeTimecodeDirectory quickTimeTimecodeDirectory) {
        quickTimeTimecodeDirectory.setInt(5, this.textFont);
        int i = this.textFace;
        if (i == 1) {
            quickTimeTimecodeDirectory.setObject(6, "Bold");
        } else if (i == 2) {
            quickTimeTimecodeDirectory.setObject(6, "Italic");
        } else if (i == 4) {
            quickTimeTimecodeDirectory.setObject(6, "Underline");
        } else if (i == 8) {
            quickTimeTimecodeDirectory.setObject(6, "Outline");
        } else if (i == 16) {
            quickTimeTimecodeDirectory.setObject(6, "Shadow");
        } else if (i == 32) {
            quickTimeTimecodeDirectory.setObject(6, "Condense");
        } else if (i == 64) {
            quickTimeTimecodeDirectory.setObject(6, "Extend");
        }
        quickTimeTimecodeDirectory.setInt(7, this.textSize);
        quickTimeTimecodeDirectory.setObjectArray(8, this.textColor);
        quickTimeTimecodeDirectory.setObjectArray(9, this.backgroundColor);
        quickTimeTimecodeDirectory.setString(10, this.fontName);
    }
}
