package defpackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class iz0 extends InputStream {
    public final /* synthetic */ int a;
    public final /* synthetic */ zz0 b;

    public /* synthetic */ iz0(zz0 zz0Var, int i) {
        this.a = i;
        this.b = zz0Var;
    }

    @Override // java.io.InputStream
    public final int available() throws IOException {
        int i = this.a;
        zz0 zz0Var = this.b;
        switch (i) {
            case 0:
                return (int) Math.min(((kz0) zz0Var).b, 2147483647L);
            default:
                yua yuaVar = (yua) zz0Var;
                if (!yuaVar.c) {
                    return (int) Math.min(yuaVar.b.b, 2147483647L);
                }
                ik4.g("closed");
                return 0;
        }
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        switch (this.a) {
            case 0:
                break;
            default:
                ((yua) this.b).close();
                break;
        }
    }

    @Override // java.io.InputStream
    public final int read() throws IOException {
        int i = this.a;
        zz0 zz0Var = this.b;
        switch (i) {
            case 0:
                kz0 kz0Var = (kz0) zz0Var;
                if (kz0Var.b > 0) {
                    return kz0Var.readByte() & 255;
                }
                return -1;
            default:
                yua yuaVar = (yua) zz0Var;
                kz0 kz0Var2 = yuaVar.b;
                if (yuaVar.c) {
                    ik4.g("closed");
                    return 0;
                }
                if (kz0Var2.b == 0 && yuaVar.a.q0(kz0Var2, 8192L) == -1) {
                    return -1;
                }
                return kz0Var2.readByte() & 255;
        }
    }

    public final String toString() {
        int i = this.a;
        zz0 zz0Var = this.b;
        switch (i) {
            case 0:
                return ((kz0) zz0Var) + ".inputStream()";
            default:
                return ((yua) zz0Var) + ".inputStream()";
        }
    }

    @Override // java.io.InputStream
    public long transferTo(OutputStream outputStream) throws IOException {
        switch (this.a) {
            case 1:
                outputStream.getClass();
                yua yuaVar = (yua) this.b;
                kz0 kz0Var = yuaVar.b;
                if (yuaVar.c) {
                    ik4.g("closed");
                    return 0L;
                }
                long j = 0;
                while (true) {
                    if (kz0Var.b == 0 && yuaVar.a.q0(kz0Var, 8192L) == -1) {
                        return j;
                    }
                    long j2 = kz0Var.b;
                    j += j2;
                    dm2.A(j2, 0L, j2);
                    iwb iwbVar = kz0Var.a;
                    while (j2 > 0) {
                        iwbVar.getClass();
                        int iMin = (int) Math.min(j2, iwbVar.c - iwbVar.b);
                        outputStream.write(iwbVar.a, iwbVar.b, iMin);
                        int i = iwbVar.b + iMin;
                        iwbVar.b = i;
                        long j3 = iMin;
                        kz0Var.b -= j3;
                        j2 -= j3;
                        if (i == iwbVar.c) {
                            iwb iwbVarA = iwbVar.a();
                            kz0Var.a = iwbVarA;
                            lwb.a(iwbVar);
                            iwbVar = iwbVarA;
                        }
                    }
                }
                break;
            default:
                return super.transferTo(outputStream);
        }
    }

    private final void f() {
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i, int i2) throws IOException {
        int i3 = this.a;
        zz0 zz0Var = this.b;
        bArr.getClass();
        switch (i3) {
            case 0:
                return ((kz0) zz0Var).read(bArr, i, i2);
            default:
                yua yuaVar = (yua) zz0Var;
                kz0 kz0Var = yuaVar.b;
                if (!yuaVar.c) {
                    dm2.A(bArr.length, i, i2);
                    if (kz0Var.b == 0 && yuaVar.a.q0(kz0Var, 8192L) == -1) {
                        return -1;
                    }
                    return kz0Var.read(bArr, i, i2);
                }
                ik4.g("closed");
                return 0;
        }
    }
}
