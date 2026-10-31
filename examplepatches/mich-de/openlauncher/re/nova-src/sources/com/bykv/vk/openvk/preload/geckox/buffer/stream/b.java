package com.bykv.vk.openvk.preload.geckox.buffer.stream;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes2.dex */
public abstract class b extends OutputStream {
    public abstract void write(long j11, int i5) throws IOException;

    public abstract void write(long j11, byte[] bArr) throws IOException;

    public abstract void write(long j11, byte[] bArr, int i5, int i11) throws IOException;
}
