package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import java.io.InputStream;

/* loaded from: classes3.dex */
public final class j extends InputStream {

    /* renamed from: a, reason: collision with root package name */
    public final h f30359a;

    /* renamed from: b, reason: collision with root package name */
    public final k f30360b;

    /* renamed from: f, reason: collision with root package name */
    public long f30364f;

    /* renamed from: d, reason: collision with root package name */
    public boolean f30362d = false;

    /* renamed from: e, reason: collision with root package name */
    public boolean f30363e = false;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f30361c = new byte[1];

    public j(h hVar, k kVar) {
        this.f30359a = hVar;
        this.f30360b = kVar;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (this.f30363e) {
            return;
        }
        this.f30359a.close();
        this.f30363e = true;
    }

    @Override // java.io.InputStream
    public final int read() {
        byte[] bArr = this.f30361c;
        if (read(bArr, 0, bArr.length) == -1) {
            return -1;
        }
        return this.f30361c[0] & 255;
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr) {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) {
        if (!this.f30363e) {
            if (!this.f30362d) {
                this.f30359a.a(this.f30360b);
                this.f30362d = true;
            }
            int i12 = this.f30359a.read(bArr, i5, i11);
            if (i12 == -1) {
                return -1;
            }
            this.f30364f += i12;
            return i12;
        }
        throw new IllegalStateException();
    }
}
