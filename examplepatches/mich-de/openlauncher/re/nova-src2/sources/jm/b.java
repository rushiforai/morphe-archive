package jm;

import java.io.OutputStream;

/* loaded from: classes3.dex */
public final class b extends OutputStream {

    /* renamed from: a, reason: collision with root package name */
    public long f69596a;

    @Override // java.io.OutputStream
    public final void write(int i5) {
        this.f69596a++;
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr) {
        this.f69596a += bArr.length;
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i5, int i11) {
        int i12;
        if (i5 >= 0 && i5 <= bArr.length && i11 >= 0 && (i12 = i5 + i11) <= bArr.length && i12 >= 0) {
            this.f69596a += i11;
            return;
        }
        throw new IndexOutOfBoundsException();
    }
}
