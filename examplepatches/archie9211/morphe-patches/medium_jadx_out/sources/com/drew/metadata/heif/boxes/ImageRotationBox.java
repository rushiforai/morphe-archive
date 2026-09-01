package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;
import com.drew.metadata.heif.HeifDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ImageRotationBox extends Box {
    int angle;

    public ImageRotationBox(SequentialReader sequentialReader, Box box) {
        super(box);
        this.angle = sequentialReader.getUInt8() & 3;
    }

    public final void addMetadata(HeifDirectory heifDirectory) {
        if (heifDirectory.containsTag(6)) {
            return;
        }
        heifDirectory.setInt(6, this.angle);
    }
}
