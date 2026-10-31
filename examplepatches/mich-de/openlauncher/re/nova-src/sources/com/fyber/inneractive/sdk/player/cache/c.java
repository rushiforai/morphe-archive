package com.fyber.inneractive.sdk.player.cache;

import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class c extends FilterOutputStream {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f28840a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, FileOutputStream fileOutputStream) {
        super(fileOutputStream);
        this.f28840a = dVar;
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        try {
            ((FilterOutputStream) this).out.close();
        } catch (IOException unused) {
            this.f28840a.f28843c = true;
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Flushable
    public final void flush() throws IOException {
        try {
            ((FilterOutputStream) this).out.flush();
        } catch (IOException unused) {
            this.f28840a.f28843c = true;
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public final void write(int i5) throws IOException {
        try {
            ((FilterOutputStream) this).out.write(i5);
        } catch (IOException unused) {
            this.f28840a.f28843c = true;
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public final void write(byte[] bArr, int i5, int i11) throws IOException {
        try {
            ((FilterOutputStream) this).out.write(bArr, i5, i11);
        } catch (IOException unused) {
            this.f28840a.f28843c = true;
        }
    }
}
