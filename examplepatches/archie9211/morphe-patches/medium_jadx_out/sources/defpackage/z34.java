package defpackage;

import java.io.IOException;
import java.net.ProtocolException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z34 extends w05 {
    public final long b;
    public final boolean c;
    public long d;
    public boolean e;
    public boolean f;
    public boolean g;
    public final /* synthetic */ zf3 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z34(zf3 zf3Var, ikc ikcVar, long j, boolean z) {
        super(ikcVar);
        ikcVar.getClass();
        this.h = zf3Var;
        this.b = j;
        this.c = z;
        this.e = true;
        if (j == 0) {
            f(null);
        }
    }

    @Override // defpackage.w05, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.g) {
            return;
        }
        this.g = true;
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
        if (this.f) {
            return iOException;
        }
        this.f = true;
        if (iOException == null && this.e) {
            this.e = false;
        }
        return zf3.b(this.h, this.c, iOException, 8);
    }

    @Override // defpackage.w05, defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws IOException {
        zf3 zf3Var = this.h;
        kz0Var.getClass();
        if (this.g) {
            ygf.f("closed");
            return 0L;
        }
        try {
            long jQ0 = this.a.q0(kz0Var, j);
            if (this.e) {
                this.e = false;
            }
            if (jQ0 == -1) {
                f(null);
                return -1L;
            }
            long j2 = this.d + jQ0;
            long j3 = this.b;
            if (j3 == -1 || j2 <= j3) {
                this.d = j2;
                if (((b44) zf3Var.e).d()) {
                    f(null);
                }
                return jQ0;
            }
            throw new ProtocolException("expected " + j3 + " bytes but received " + j2);
        } catch (IOException e) {
            IOException iOExceptionF = f(e);
            iOExceptionF.getClass();
            throw iOExceptionF;
        }
    }
}
