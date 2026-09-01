package defpackage;

import java.io.IOException;
import java.util.zip.CRC32;
import java.util.zip.Deflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wh5 implements bfc {
    public final xua a;
    public final Deflater b;
    public final w33 c;
    public boolean d;
    public final CRC32 e;

    public wh5(bfc bfcVar) {
        xua xuaVar = new xua(bfcVar);
        this.a = xuaVar;
        Deflater deflater = new Deflater(-1, true);
        this.b = deflater;
        this.c = new w33(xuaVar, deflater, 0);
        this.e = new CRC32();
        kz0 kz0Var = xuaVar.b;
        kz0Var.P0(8075);
        kz0Var.K0(8);
        kz0Var.K0(0);
        kz0Var.N0(0);
        kz0Var.K0(0);
        kz0Var.K0(0);
    }

    @Override // defpackage.bfc
    public final fmd b() {
        return this.a.a.b();
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) throws IOException {
        kz0Var.getClass();
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return;
        }
        if (j == 0) {
            return;
        }
        iwb iwbVar = kz0Var.a;
        iwbVar.getClass();
        long j2 = j;
        while (j2 > 0) {
            int iMin = (int) Math.min(j2, iwbVar.c - iwbVar.b);
            this.e.update(iwbVar.a, iwbVar.b, iMin);
            j2 -= (long) iMin;
            iwbVar = iwbVar.f;
            iwbVar.getClass();
        }
        this.c.c0(kz0Var, j);
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws Throwable {
        Deflater deflater = this.b;
        xua xuaVar = this.a;
        if (this.d) {
            return;
        }
        try {
            w33 w33Var = this.c;
            ((Deflater) w33Var.d).finish();
            w33Var.f(false);
            xuaVar.F((int) this.e.getValue());
            xuaVar.F((int) deflater.getBytesRead());
            th = null;
        } catch (Throwable th) {
            th = th;
        }
        try {
            deflater.end();
        } catch (Throwable th2) {
            if (th == null) {
                th = th2;
            }
        }
        try {
            xuaVar.close();
        } catch (Throwable th3) {
            if (th == null) {
                th = th3;
            }
        }
        this.d = true;
        if (th != null) {
            throw th;
        }
    }

    @Override // defpackage.bfc, java.io.Flushable
    public final void flush() throws IOException {
        this.c.flush();
    }
}
