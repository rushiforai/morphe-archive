package com.drew.metadata.heif.boxes;

import com.drew.lang.ByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.heif.HeifDirectory;
import com.drew.metadata.icc.IccReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ColourInformationBox extends Box {
    int colourPrimaries;
    String colourType;
    int fullRangeFlag;
    int matrixCoefficients;
    int transferCharacteristics;

    public ColourInformationBox(SequentialReader sequentialReader, Box box, Metadata metadata) {
        super(box);
        String string = sequentialReader.getString(4);
        this.colourType = string;
        if (string.equals("nclx")) {
            this.colourPrimaries = sequentialReader.getUInt16();
            this.transferCharacteristics = sequentialReader.getUInt16();
            this.matrixCoefficients = sequentialReader.getUInt16();
            this.fullRangeFlag = (sequentialReader.getUInt8() & 128) >> 7;
            return;
        }
        if (this.colourType.equals("rICC")) {
            new IccReader().extract(new ByteArrayReader(sequentialReader.getBytes((int) (this.size - 12)), 0), metadata, null);
        } else if (this.colourType.equals("prof")) {
            new IccReader().extract(new ByteArrayReader(sequentialReader.getBytes((int) (this.size - 12)), 0), metadata, null);
        }
    }

    public final void addMetadata(HeifDirectory heifDirectory) {
    }
}
