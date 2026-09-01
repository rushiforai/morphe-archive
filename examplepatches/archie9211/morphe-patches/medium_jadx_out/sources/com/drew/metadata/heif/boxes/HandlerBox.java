package com.drew.metadata.heif.boxes;

import com.drew.lang.Charsets;
import com.drew.lang.SequentialReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HandlerBox extends FullBox {
    String handlerType;
    String name;

    public HandlerBox(SequentialReader sequentialReader, Box box) {
        super(sequentialReader, box);
        sequentialReader.skip(4L);
        this.handlerType = sequentialReader.getString(4);
        sequentialReader.skip(12L);
        this.name = sequentialReader.getNullTerminatedString(((int) box.size) - 32, Charsets.UTF_8, false);
    }

    public final String getHandlerType() {
        return this.handlerType;
    }
}
