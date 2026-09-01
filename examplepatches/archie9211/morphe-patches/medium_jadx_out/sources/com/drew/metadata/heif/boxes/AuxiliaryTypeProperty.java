package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AuxiliaryTypeProperty extends FullBox {
    int[] auxSubtype;
    String auxType;

    public AuxiliaryTypeProperty(SequentialReader sequentialReader, Box box) {
        super(sequentialReader, box);
        this.auxType = getZeroTerminatedString(((int) box.size) - 12, sequentialReader);
    }

    private String getZeroTerminatedString(int i, SequentialReader sequentialReader) {
        StringBuilder sb = new StringBuilder();
        for (int i2 = 0; i2 < i; i2++) {
            sb.append((char) sequentialReader.getByte());
            if (sb.charAt(sb.length() - 1) == 0) {
                break;
            }
        }
        return sb.toString().trim();
    }
}
