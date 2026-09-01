package defpackage;

import java.io.Closeable;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c68 implements Closeable {
    public final zz0 a;
    public final h21 b;
    public final h21 c;
    public int d;
    public boolean e;
    public boolean f;
    public b68 g;
    public final dw8 h;

    public c68(zz0 zz0Var, String str) {
        this.a = zz0Var;
        kz0 kz0Var = new kz0();
        kz0Var.R0("--");
        kz0Var.R0(str);
        this.b = kz0Var.r(kz0Var.b);
        kz0 kz0Var2 = new kz0();
        kz0Var2.R0("\r\n--");
        kz0Var2.R0(str);
        this.c = kz0Var2.r(kz0Var2.b);
        h21 h21Var = h21.d;
        this.h = mq7.E(dq1.o("\r\n--" + str + "--"), dq1.o("\r\n"), dq1.o("--"), dq1.o(" "), dq1.o("\t"));
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.e) {
            return;
        }
        this.e = true;
        this.g = null;
        this.a.close();
    }

    public final long f(long j) {
        h21 h21Var = this.c;
        long jE = h21Var.e();
        zz0 zz0Var = this.a;
        zz0Var.x0(jE);
        long jU0 = zz0Var.a().u0(h21Var);
        return jU0 == -1 ? Math.min(j, (zz0Var.a().b - ((long) h21Var.e())) + 1) : Math.min(j, jU0);
    }
}
