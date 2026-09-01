package com.drew.imaging.heif;

import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.heif.HeifDirectory;
import com.drew.metadata.heif.boxes.Box;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class HeifHandler<T extends HeifDirectory> {
    protected T directory;
    protected Metadata metadata;

    public HeifHandler(Metadata metadata) {
        this.metadata = metadata;
        T t = (T) getDirectory();
        this.directory = t;
        metadata.addDirectory(t);
    }

    public abstract T getDirectory();

    public abstract HeifHandler<?> processBox(Box box, byte[] bArr);

    public abstract void processContainer(Box box, SequentialReader sequentialReader);

    public abstract boolean shouldAcceptBox(Box box);

    public abstract boolean shouldAcceptContainer(Box box);
}
