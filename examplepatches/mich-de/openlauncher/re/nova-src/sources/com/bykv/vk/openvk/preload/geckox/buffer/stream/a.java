package com.bykv.vk.openvk.preload.geckox.buffer.stream;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes2.dex */
public final class a extends InputStream {

    /* renamed from: a, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.geckox.buffer.a f22053a;

    /* renamed from: b, reason: collision with root package name */
    private long f22054b;

    public a(com.bykv.vk.openvk.preload.geckox.buffer.a aVar) {
        this.f22053a = aVar;
    }

    @Override // java.io.InputStream
    public final int available() throws IOException {
        long jB = this.f22053a.b() - this.f22053a.c();
        return jB > 2147483647L ? LayoutNode.NotPlacedPlaceOrder : (int) jB;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
    }

    @Override // java.io.InputStream
    public final synchronized void mark(int i5) {
        this.f22054b = i5;
    }

    @Override // java.io.InputStream
    public final boolean markSupported() {
        return true;
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr) throws IOException {
        return this.f22053a.b(bArr);
    }

    @Override // java.io.InputStream
    public final synchronized void reset() throws IOException {
        this.f22053a.b(this.f22054b);
    }

    @Override // java.io.InputStream
    public final long skip(long j11) throws IOException {
        return this.f22053a.a(j11);
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        return this.f22053a.b(bArr, i5, i11);
    }

    @Override // java.io.InputStream
    public final int read() throws IOException {
        return this.f22053a.d();
    }
}
