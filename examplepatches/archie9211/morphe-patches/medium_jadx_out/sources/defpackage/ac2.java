package defpackage;

import java.io.IOException;
import java.io.OutputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ac2 extends OutputStream {
    public final OutputStream a;
    public int b = 0;

    public ac2(OutputStream outputStream) {
        this.a = outputStream;
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr) throws IOException {
        this.a.write(bArr);
        this.b += bArr.length;
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i, int i2) throws IOException {
        this.a.write(bArr, i, i2);
        this.b += i2;
    }

    @Override // java.io.OutputStream
    public final void write(int i) throws IOException {
        this.a.write(i);
        this.b++;
    }
}
