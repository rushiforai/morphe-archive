package com.drew.metadata.heif.boxes;

import com.drew.lang.SequentialReader;
import com.drew.metadata.mp4.Mp4BoxTypes;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Box {
    public long size;
    public String type;
    String usertype;

    public Box(SequentialReader sequentialReader) {
        this.size = sequentialReader.getUInt32();
        this.type = sequentialReader.getString(4);
        long j = this.size;
        if (j == 1) {
            this.size = sequentialReader.getInt64();
        } else if (j == 0) {
            this.size = -1L;
        }
        if (this.type.equals(Mp4BoxTypes.BOX_USER_DEFINED)) {
            this.usertype = sequentialReader.getString(16);
        }
    }

    public Box(Box box) {
        this.size = box.size;
        this.type = box.type;
        this.usertype = box.usertype;
    }
}
