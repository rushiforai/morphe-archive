package defpackage;

import java.io.Serializable;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xt2 extends p4d implements x45 {
    public Object b;
    public Serializable c;
    public Object d;
    public Object e;
    public Iterator f;
    public int g;
    public int h;
    public final /* synthetic */ mu2 i;
    public final /* synthetic */ n0c j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xt2(mu2 mu2Var, n0c n0cVar, n92 n92Var) {
        super(1, n92Var);
        this.i = mu2Var;
        this.j = n0cVar;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new xt2(this.i, this.j, n92Var);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return ((xt2) create((n92) obj)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0103  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) {
        /*
            Method dump skipped, instruction units count: 280
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xt2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
