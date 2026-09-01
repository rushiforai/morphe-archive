package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ds5 implements bfc {
    public final x05 a;
    public boolean b;
    public final /* synthetic */ hs5 c;

    public ds5(hs5 hs5Var) {
        this.c = hs5Var;
        this.a = new x05(((xua) hs5Var.c.d).a.b());
    }

    @Override // defpackage.bfc
    public final fmd b() {
        return this.a;
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        if (this.b) {
            ygf.f("closed");
            return;
        }
        if (j == 0) {
            return;
        }
        xua xuaVar = (xua) this.c.c.d;
        if (xuaVar.c) {
            ygf.f("closed");
            return;
        }
        xuaVar.b.M0(j);
        xuaVar.f();
        xuaVar.Y("\r\n");
        xuaVar.c0(kz0Var, j);
        xuaVar.Y("\r\n");
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        if (this.b) {
            return;
        }
        this.b = true;
        ((xua) this.c.c.d).Y("0\r\n\r\n");
        x05 x05Var = this.a;
        fmd fmdVar = x05Var.e;
        x05Var.e = fmd.d;
        fmdVar.a();
        fmdVar.b();
        this.c.d = 3;
    }

    @Override // defpackage.bfc, java.io.Flushable
    public final synchronized void flush() {
        if (this.b) {
            return;
        }
        ((xua) this.c.c.d).flush();
    }
}
