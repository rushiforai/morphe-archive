package com.fyber.inneractive.sdk.protobuf;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
public final class a extends FilterInputStream {

    /* renamed from: a, reason: collision with root package name */
    public int f30756a;

    public a(InputStream inputStream, int i5) {
        super(inputStream);
        this.f30756a = i5;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int available() {
        return Math.min(super.available(), this.f30756a);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read() throws IOException {
        if (this.f30756a <= 0) {
            return -1;
        }
        int i5 = super.read();
        if (i5 >= 0) {
            this.f30756a--;
        }
        return i5;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final long skip(long j11) throws IOException {
        long jSkip = super.skip(Math.min(j11, this.f30756a));
        if (jSkip >= 0) {
            this.f30756a = (int) (this.f30756a - jSkip);
        }
        return jSkip;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f30756a;
        if (i12 <= 0) {
            return -1;
        }
        int i13 = super.read(bArr, i5, Math.min(i11, i12));
        if (i13 >= 0) {
            this.f30756a -= i13;
        }
        return i13;
    }
}
