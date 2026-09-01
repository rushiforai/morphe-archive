package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;
import com.drew.metadata.heif.HeifDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ImageSpatialExtentsProperty extends FullBox {
    long height;
    long width;

    public ImageSpatialExtentsProperty(SequentialReader sequentialReader, Box box) {
        super(sequentialReader, box);
        this.width = sequentialReader.getUInt32();
        this.height = sequentialReader.getUInt32();
    }

    public final void addMetadata(HeifDirectory heifDirectory) {
        if (heifDirectory.containsTag(4) || heifDirectory.containsTag(5)) {
            return;
        }
        heifDirectory.setLong(4, this.width);
        heifDirectory.setLong(5, this.height);
    }
}
