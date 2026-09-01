package defpackage;

import java.io.IOException;
import java.net.ProtocolException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y34 extends v05 {
    public final long b;
    public final boolean c;
    public boolean d;
    public long e;
    public boolean f;
    public boolean g;
    public final /* synthetic */ zf3 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y34(zf3 zf3Var, bfc bfcVar, long j, boolean z) {
        super(bfcVar);
        bfcVar.getClass();
        this.h = zf3Var;
        this.b = j;
        this.c = z;
        this.f = z;
    }

    @Override // defpackage.v05, defpackage.bfc
    public final void c0(kz0 kz0Var, long j) throws IOException {
        kz0Var.getClass();
        if (this.g) {
            ygf.f("closed");
            return;
        }
        long j2 = this.b;
        if (j2 != -1 && this.e + j > j2) {
            StringBuilder sbD = b09.D("expected ", " bytes but received ", j2);
            sbD.append(this.e + j);
            throw new ProtocolException(sbD.toString());
        }
        try {
            if (this.f) {
                this.f = false;
            }
            this.a.c0(kz0Var, j);
            this.e += j;
        } catch (IOException e) {
            IOException iOExceptionF = f(e);
            iOExceptionF.getClass();
            throw iOExceptionF;
        }
    }

    @Override // defpackage.v05, defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.g) {
            return;
        }
        this.g = true;
        long j = this.b;
        if (j != -1 && this.e != j) {
            lg8.k("unexpected end of stream");
            return;
        }
        try {
            super.close();
            f(null);
        } catch (IOException e) {
            IOException iOExceptionF = f(e);
            iOExceptionF.getClass();
            throw iOExceptionF;
        }
    }

    public final IOException f(IOException iOException) {
        if (this.d) {
            return iOException;
        }
        this.d = true;
        return zf3.b(this.h, this.c, iOException, 4);
    }

    @Override // defpackage.v05, defpackage.bfc, java.io.Flushable
    public final void flush() throws IOException {
        try {
            super.flush();
        } catch (IOException e) {
            IOException iOExceptionF = f(e);
            iOExceptionF.getClass();
            throw iOExceptionF;
        }
    }
}
