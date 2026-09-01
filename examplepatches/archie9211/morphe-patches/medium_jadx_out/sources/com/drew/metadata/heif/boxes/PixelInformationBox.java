package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;
import com.drew.metadata.heif.HeifDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PixelInformationBox extends FullBox {
    int[] channels;
    int numChannels;

    public PixelInformationBox(SequentialReader sequentialReader, Box box) {
        super(sequentialReader, box);
        int uInt8 = sequentialReader.getUInt8();
        this.numChannels = uInt8;
        this.channels = new int[uInt8];
        int i = 0;
        while (true) {
            int[] iArr = this.channels;
            if (i >= iArr.length) {
                return;
            }
            iArr[i] = sequentialReader.getUInt8();
            i++;
        }
    }

    public final void addMetadata(HeifDirectory heifDirectory) {
        if (heifDirectory.containsTag(7)) {
            return;
        }
        heifDirectory.setObjectArray(7, this.channels);
    }
}
