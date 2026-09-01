package defpackage;

import java.io.IOException;
import java.util.zip.Deflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w33 implements bfc {
    public final /* synthetic */ int a;
    public boolean b;
    public final Object c;
    public final Object d;

    public w33(hs5 hs5Var) {
        this.a = 2;
        this.d = hs5Var;
        this.c = new x05(((xua) hs5Var.c.d).a.b());
    }

    @Override // defpackage.bfc
    public final fmd b() {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                return ((xua) obj).a.b();
            case 1:
                return ((bfc) obj).b();
            default:
                return (x05) obj;
        }
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) throws IOException {
        int i = this.a;
        Object obj = this.d;
        switch (i) {
            case 0:
                Deflater deflater = (Deflater) obj;
                kz0Var.getClass();
                dm2.A(kz0Var.b, 0L, j);
                long j2 = j;
                while (j2 > 0) {
                    iwb iwbVar = kz0Var.a;
                    iwbVar.getClass();
                    int iMin = (int) Math.min(j2, iwbVar.c - iwbVar.b);
                    deflater.setInput(iwbVar.a, iwbVar.b, iMin);
                    f(false);
                    long j3 = iMin;
                    kz0Var.b -= j3;
                    int i2 = iwbVar.b + iMin;
                    iwbVar.b = i2;
                    if (i2 == iwbVar.c) {
                        kz0Var.a = iwbVar.a();
                        lwb.a(iwbVar);
                    }
                    j2 -= j3;
                }
                deflater.setInput(o7f.r, 0, 0);
                break;
            case 1:
                if (this.b) {
                    kz0Var.skip(j);
                } else {
                    try {
                        ((bfc) this.c).c0(kz0Var, j);
                    } catch (IOException e) {
                        this.b = true;
                        ((s0) obj).invoke(e);
                        return;
                    }
                }
                break;
            default:
                kz0Var.getClass();
                if (!this.b) {
                    egf.a(kz0Var.b, 0L, j);
                    ((xua) ((hs5) obj).c.d).c0(kz0Var, j);
                } else {
                    ygf.f("closed");
                }
                break;
        }
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws Throwable {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                Deflater deflater = (Deflater) obj2;
                if (this.b) {
                    return;
                }
                try {
                    deflater.finish();
                    f(false);
                    th = null;
                } catch (Throwable th) {
                    th = th;
                }
                try {
                    deflater.end();
                    break;
                } catch (Throwable th2) {
                    if (th == null) {
                        th = th2;
                    }
                }
                try {
                    ((xua) obj).close();
                    break;
                } catch (Throwable th3) {
                    if (th == null) {
                        th = th3;
                    }
                }
                this.b = true;
                if (th != null) {
                    throw th;
                }
                return;
            case 1:
                try {
                    ((bfc) obj).close();
                    return;
                } catch (IOException e) {
                    this.b = true;
                    ((s0) obj2).invoke(e);
                    return;
                }
            default:
                hs5 hs5Var = (hs5) obj2;
                if (this.b) {
                    return;
                }
                this.b = true;
                x05 x05Var = (x05) obj;
                fmd fmdVar = x05Var.e;
                x05Var.e = fmd.d;
                fmdVar.a();
                fmdVar.b();
                hs5Var.d = 3;
                return;
        }
    }

    public void f(boolean z) throws IOException {
        iwb iwbVarI0;
        int iDeflate;
        Deflater deflater = (Deflater) this.d;
        xua xuaVar = (xua) this.c;
        kz0 kz0Var = xuaVar.b;
        while (true) {
            iwbVarI0 = kz0Var.I0(1);
            byte[] bArr = iwbVarI0.a;
            int i = iwbVarI0.c;
            if (z) {
                try {
                    iDeflate = deflater.deflate(bArr, i, 8192 - i, 2);
                } catch (NullPointerException e) {
                    throw new IOException("Deflater already closed", e);
                }
            } else {
                iDeflate = deflater.deflate(bArr, i, 8192 - i);
            }
            if (iDeflate > 0) {
                iwbVarI0.c += iDeflate;
                kz0Var.b += (long) iDeflate;
                xuaVar.f();
            } else if (deflater.needsInput()) {
                break;
            }
        }
        if (iwbVarI0.b == iwbVarI0.c) {
            kz0Var.a = iwbVarI0.a();
            lwb.a(iwbVarI0);
        }
    }

    @Override // defpackage.bfc, java.io.Flushable
    public final void flush() throws IOException {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                f(true);
                ((xua) obj).flush();
                break;
            case 1:
                try {
                    ((bfc) obj).flush();
                } catch (IOException e) {
                    this.b = true;
                    ((s0) obj2).invoke(e);
                    return;
                }
                break;
            default:
                if (!this.b) {
                    ((xua) ((hs5) obj2).c.d).flush();
                    break;
                }
                break;
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return "DeflaterSink(" + ((xua) this.c) + ')';
            default:
                return super.toString();
        }
    }

    public /* synthetic */ w33(bfc bfcVar, Object obj, int i) {
        this.a = i;
        this.c = bfcVar;
        this.d = obj;
    }
}
