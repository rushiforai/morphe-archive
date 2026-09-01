package defpackage;

import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g54 extends InputStream {
    public final InputStream a;
    public int b = 1073741824;

    public g54(InputStream inputStream) {
        this.a = inputStream;
    }

    @Override // java.io.InputStream
    public final int available() {
        return this.b;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.a.close();
    }

    @Override // java.io.InputStream
    public final int read() throws IOException {
        int i = this.a.read();
        if (i == -1) {
            this.b = 0;
        }
        return i;
    }

    @Override // java.io.InputStream
    public final long skip(long j) {
        return this.a.skip(j);
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr) throws IOException {
        int i = this.a.read(bArr);
        if (i == -1) {
            this.b = 0;
        }
        return i;
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i, int i2) throws IOException {
        int i3 = this.a.read(bArr, i, i2);
        if (i3 == -1) {
            this.b = 0;
        }
        return i3;
    }
}
