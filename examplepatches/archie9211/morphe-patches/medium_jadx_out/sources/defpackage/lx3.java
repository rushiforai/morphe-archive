package defpackage;

import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lx3 {
    public int a = 1;
    public final xz7 b;
    public xz7 c;
    public xz7 d;
    public int e;
    public int f;

    public lx3(xz7 xz7Var) {
        this.b = xz7Var;
        this.c = xz7Var;
    }

    public final void a() {
        this.a = 1;
        this.c = this.b;
        this.f = 0;
    }

    public final boolean b() {
        uz7 uz7VarB = this.c.b.b();
        int iA = uz7VarB.a(6);
        return !(iA == 0 || ((ByteBuffer) uz7VarB.d).get(iA + uz7VarB.a) == 0) || this.e == 65039;
    }
}
