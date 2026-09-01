package defpackage;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o1 extends FilterInputStream {
    public final /* synthetic */ int a;
    public int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o1(InputStream inputStream, int i, int i2) {
        super(inputStream);
        this.a = i2;
        this.b = i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int available() {
        switch (this.a) {
        }
        return Math.min(super.available(), this.b);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr, int i, int i2) throws IOException {
        switch (this.a) {
            case 0:
                int i3 = this.b;
                if (i3 <= 0) {
                    return -1;
                }
                int i4 = super.read(bArr, i, Math.min(i2, i3));
                if (i4 >= 0) {
                    this.b -= i4;
                }
                return i4;
            default:
                int i5 = this.b;
                if (i5 <= 0) {
                    return -1;
                }
                int i6 = super.read(bArr, i, Math.min(i2, i5));
                if (i6 >= 0) {
                    this.b -= i6;
                }
                return i6;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final long skip(long j) throws IOException {
        switch (this.a) {
            case 0:
                long jSkip = super.skip(Math.min(j, this.b));
                if (jSkip >= 0) {
                    this.b = (int) (((long) this.b) - jSkip);
                }
                return jSkip;
            default:
                int iSkip = (int) super.skip(Math.min(j, this.b));
                if (iSkip >= 0) {
                    this.b -= iSkip;
                }
                return iSkip;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read() throws IOException {
        switch (this.a) {
            case 0:
                if (this.b <= 0) {
                    return -1;
                }
                int i = super.read();
                if (i >= 0) {
                    this.b--;
                }
                return i;
            default:
                if (this.b <= 0) {
                    return -1;
                }
                int i2 = super.read();
                if (i2 >= 0) {
                    this.b--;
                }
                return i2;
        }
    }
}
