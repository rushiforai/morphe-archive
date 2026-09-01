package defpackage;

import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class glb extends g57 {
    public final elb l;
    public final hx4 m;
    public final boolean n;
    public final jlb o;
    public final AtomicBoolean p;
    public final AtomicBoolean q;
    public final AtomicBoolean r;
    public final ib2 s;
    public final pi9 t;

    public glb(elb elbVar, hx4 hx4Var, String[] strArr, pi9 pi9Var) {
        ib2 ib2Var;
        hx4Var.getClass();
        this.l = elbVar;
        this.m = hx4Var;
        this.n = true;
        this.o = new jlb(strArr, this);
        this.p = new AtomicBoolean(true);
        this.q = new AtomicBoolean(false);
        this.r = new AtomicBoolean(false);
        if (elbVar.k()) {
            ib2Var = elbVar.b;
            if (ib2Var == null) {
                g76.g0("transactionContext");
                throw null;
            }
        } else {
            ib2Var = zx3.a;
        }
        this.s = ib2Var;
        this.t = pi9Var;
    }

    @Override // defpackage.g57
    public final void f() {
        hx4 hx4Var = this.m;
        hx4Var.getClass();
        ((Set) hx4Var.c).add(this);
        k92 k92Var = this.l.a;
        n92 n92Var = null;
        if (k92Var == null) {
            g76.g0("coroutineScope");
            throw null;
        }
        vx0.c0(k92Var, this.s, null, new ilb(this, n92Var, 1), 2);
    }

    @Override // defpackage.g57
    public final void g() {
        hx4 hx4Var = this.m;
        hx4Var.getClass();
        ((Set) hx4Var.c).remove(this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c0 A[Catch: all -> 0x003b, Exception -> 0x003e, TRY_ENTER, TRY_LEAVE, TryCatch #0 {Exception -> 0x003e, blocks: (B:12:0x0031, B:44:0x00c0), top: B:61:0x0031, outer: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00dc A[Catch: all -> 0x003b, TRY_LEAVE, TryCatch #2 {all -> 0x003b, blocks: (B:12:0x0031, B:42:0x00ba, B:44:0x00c0, B:51:0x00dc, B:48:0x00d2, B:49:0x00d9), top: B:61:0x0031, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:41:0x00b8 -> B:42:0x00ba). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:55:0x00e7 -> B:56:0x00e8). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object k(defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 243
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.glb.k(p92):java.lang.Object");
    }
}
