package com.apm.insight.k;

import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.GZIPOutputStream;

/* loaded from: classes2.dex */
public final class k extends GZIPOutputStream {
    public k(OutputStream outputStream) throws IOException {
        super(outputStream);
    }

    public final void a() throws IOException {
        super.close();
    }

    public final void b() throws IOException {
        super.finish();
    }

    @Override // java.util.zip.DeflaterOutputStream, java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
    }

    @Override // java.util.zip.GZIPOutputStream, java.util.zip.DeflaterOutputStream
    public final void finish() throws IOException {
    }
}
