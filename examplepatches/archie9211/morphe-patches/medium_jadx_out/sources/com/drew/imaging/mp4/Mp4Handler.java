package com.drew.imaging.mp4;

import com.drew.metadata.Metadata;
import com.drew.metadata.mp4.Mp4Context;
import com.drew.metadata.mp4.Mp4Directory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class Mp4Handler<T extends Mp4Directory> {
    protected T directory;
    protected Metadata metadata;

    public Mp4Handler(Metadata metadata) {
        this.metadata = metadata;
        T t = (T) getDirectory();
        this.directory = t;
        metadata.addDirectory(t);
    }

    public final void addError(String str) {
        this.directory.addError(str);
    }

    public abstract T getDirectory();

    public abstract Mp4Handler<?> processBox(String str, byte[] bArr, long j, Mp4Context mp4Context);

    public final Mp4Handler<?> processContainer(String str, long j, Mp4Context mp4Context) {
        return processBox(str, null, j, mp4Context);
    }

    public abstract boolean shouldAcceptBox(String str);

    public abstract boolean shouldAcceptContainer(String str);
}
