package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zq5 extends p4d implements h55 {
    public r92 b;
    public zib c;
    public boolean d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public /* synthetic */ Object h;
    public /* synthetic */ rj2 i;
    public /* synthetic */ long j;
    public /* synthetic */ uq5 k;
    public /* synthetic */ f09 l;
    public /* synthetic */ zv7 m;
    public final /* synthetic */ ar5 n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zq5(ar5 ar5Var, n92 n92Var) {
        super(8, n92Var);
        this.n = ar5Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0111  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r25) {
        /*
            Method dump skipped, instruction units count: 280
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zq5.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.h55
    public final Object q(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Serializable serializable) {
        Object obj8 = ((bjb) obj).a;
        Object obj9 = ((bjb) obj2).a;
        long jLongValue = ((Number) obj4).longValue();
        zq5 zq5Var = new zq5(this.n, (n92) serializable);
        zq5Var.g = obj8;
        zq5Var.h = obj9;
        zq5Var.i = (rj2) obj3;
        zq5Var.j = jLongValue;
        zq5Var.k = (uq5) obj5;
        zq5Var.l = (f09) obj6;
        zq5Var.m = (zv7) obj7;
        return zq5Var.invokeSuspend(c1e.a);
    }
}
