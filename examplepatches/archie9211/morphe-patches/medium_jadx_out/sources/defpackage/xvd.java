package defpackage;

import java.util.ArrayDeque;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class xvd {
    public final boolean a;
    public final boolean b;
    public final bo1 c;
    public final rn6 d;
    public int e;
    public ArrayDeque f;
    public zgc g;

    public xvd(boolean z, boolean z2, bo1 bo1Var, rn6 rn6Var, sn6 sn6Var) {
        this.a = z;
        this.b = z2;
        this.c = bo1Var;
        this.d = rn6Var;
    }

    public final void a() {
        ArrayDeque arrayDeque = this.f;
        arrayDeque.getClass();
        arrayDeque.clear();
        zgc zgcVar = this.g;
        zgcVar.getClass();
        zgcVar.clear();
    }

    public boolean b(qn6 qn6Var, qn6 qn6Var2) {
        qn6Var.getClass();
        return true;
    }

    public final void c() {
        if (this.f == null) {
            this.f = new ArrayDeque(4);
        }
        if (this.g == null) {
            this.g = new zgc();
        }
    }
}
