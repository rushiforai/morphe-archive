package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

/* renamed from: com.facebook.ads.redexgen.X.da, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1635da extends BufferedInputStream {
    public int A00;
    public int A01;
    public boolean A02;

    public C1635da(InputStream inputStream) {
        super(inputStream);
        this.A00 = LayoutNode.NotPlacedPlaceOrder;
    }

    public final boolean A00() {
        return this.A02;
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public final synchronized void mark(int i5) {
        this.A00 = i5;
        super.mark(i5);
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public final int read() throws IOException {
        if (this.A01 + 1 > this.A00) {
            this.A02 = true;
            return -1;
        }
        this.A01++;
        return super.read();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr) throws IOException {
        if (this.A01 + bArr.length > this.A00) {
            this.A02 = true;
            return -1;
        }
        return super.read(bArr);
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public final synchronized int read(byte[] bArr, int i5, int i11) throws IOException {
        if (this.A01 + i11 > this.A00) {
            this.A02 = true;
            return -1;
        }
        int i12 = super.read(bArr, i5, i11);
        int read = this.A01;
        this.A01 = read + i12;
        return i12;
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public final synchronized void reset() throws IOException {
        this.A00 = LayoutNode.NotPlacedPlaceOrder;
        super.reset();
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public final synchronized long skip(long j11) throws IOException {
        if (this.A01 + j11 > this.A00) {
            this.A02 = true;
            return 0L;
        }
        this.A01 += (int) j11;
        return super.skip(j11);
    }
}
