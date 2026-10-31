package com.fyber.inneractive.sdk.player.exoplayer2.util;

import android.util.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes3.dex */
public final class b extends OutputStream {

    /* renamed from: a, reason: collision with root package name */
    public final FileOutputStream f30427a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f30428b = false;

    public b(File file) {
        this.f30427a = new FileOutputStream(file);
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.f30428b) {
            return;
        }
        this.f30428b = true;
        this.f30427a.flush();
        try {
            this.f30427a.getFD().sync();
        } catch (IOException e3) {
            Log.w("AtomicFile", "Failed to sync file descriptor:", e3);
        }
        this.f30427a.close();
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public final void flush() throws IOException {
        this.f30427a.flush();
    }

    @Override // java.io.OutputStream
    public final void write(int i5) throws IOException {
        this.f30427a.write(i5);
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr) throws IOException {
        this.f30427a.write(bArr);
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i5, int i11) throws IOException {
        this.f30427a.write(bArr, i5, i11);
    }
}
