package defpackage;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jz0 extends OutputStream {
    public final /* synthetic */ int a = 1;
    public final Object b;

    public jz0(FileOutputStream fileOutputStream) {
        this.b = fileOutputStream;
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        int i = this.a;
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public final void flush() throws IOException {
        switch (this.a) {
            case 0:
                break;
            default:
                ((FileOutputStream) this.b).flush();
                break;
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return ((kz0) this.b) + ".outputStream()";
            default:
                return super.toString();
        }
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i, int i2) throws IOException {
        int i3 = this.a;
        Object obj = this.b;
        bArr.getClass();
        switch (i3) {
            case 0:
                ((kz0) obj).write(bArr, i, i2);
                break;
            default:
                ((FileOutputStream) obj).write(bArr, i, i2);
                break;
        }
    }

    public jz0(kz0 kz0Var) {
        this.b = kz0Var;
    }

    private final void f() {
    }

    private final void m() {
    }

    private final void p() {
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr) throws IOException {
        switch (this.a) {
            case 1:
                bArr.getClass();
                ((FileOutputStream) this.b).write(bArr);
                break;
            default:
                super.write(bArr);
                break;
        }
    }

    @Override // java.io.OutputStream
    public final void write(int i) throws IOException {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                ((kz0) obj).K0(i);
                break;
            default:
                ((FileOutputStream) obj).write(i);
                break;
        }
    }
}
