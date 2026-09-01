package defpackage;

import java.io.IOException;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h31 implements ikc {
    public boolean a;
    public final /* synthetic */ zz0 b;
    public final /* synthetic */ ms c;
    public final /* synthetic */ xua d;

    public h31(zz0 zz0Var, ms msVar, xua xuaVar) {
        this.b = zz0Var;
        this.c = msVar;
        this.d = xuaVar;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.b.b();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        boolean zG;
        if (!this.a) {
            TimeZone timeZone = ggf.a;
            TimeUnit.MILLISECONDS.getClass();
            try {
                zG = ggf.g(this, 100);
            } catch (IOException unused) {
                zG = false;
            }
            if (!zG) {
                this.a = true;
                this.c.b();
            }
        }
        this.b.close();
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws IOException {
        kz0Var.getClass();
        try {
            long jQ0 = this.b.q0(kz0Var, j);
            xua xuaVar = this.d;
            if (jQ0 != -1) {
                kz0Var.I(xuaVar.b, kz0Var.b - jQ0, jQ0);
                xuaVar.f();
                return jQ0;
            }
            if (!this.a) {
                this.a = true;
                xuaVar.close();
            }
            return -1L;
        } catch (IOException e) {
            if (this.a) {
                throw e;
            }
            this.a = true;
            this.c.b();
            throw e;
        }
    }
}
