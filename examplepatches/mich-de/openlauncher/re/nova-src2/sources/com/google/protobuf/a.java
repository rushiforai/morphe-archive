package com.google.protobuf;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
public final class a extends FilterInputStream {

    /* renamed from: a, reason: collision with root package name */
    public int f34805a;

    public a(InputStream inputStream, int i5) {
        super(inputStream);
        this.f34805a = i5;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int available() {
        return Math.min(super.available(), this.f34805a);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read() throws IOException {
        if (this.f34805a <= 0) {
            return -1;
        }
        int i5 = super.read();
        if (i5 >= 0) {
            this.f34805a--;
        }
        return i5;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final long skip(long j11) {
        int iSkip = (int) super.skip(Math.min(j11, this.f34805a));
        if (iSkip >= 0) {
            this.f34805a -= iSkip;
        }
        return iSkip;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f34805a;
        if (i12 <= 0) {
            return -1;
        }
        int i13 = super.read(bArr, i5, Math.min(i11, i12));
        if (i13 >= 0) {
            this.f34805a -= i13;
        }
        return i13;
    }
}
