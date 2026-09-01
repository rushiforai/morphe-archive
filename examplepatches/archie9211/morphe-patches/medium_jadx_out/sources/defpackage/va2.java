package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class va2 implements zk7 {
    public final /* synthetic */ kx6 a;
    public final /* synthetic */ x45 b;
    public final /* synthetic */ uid c;
    public final /* synthetic */ yqa d;
    public final /* synthetic */ m73 e;
    public final /* synthetic */ int f;

    public va2(kx6 kx6Var, x45 x45Var, uid uidVar, yqa yqaVar, m73 m73Var, int i) {
        this.a = kx6Var;
        this.b = x45Var;
        this.c = uidVar;
        this.d = yqaVar;
        this.e = m73Var;
        this.f = i;
    }

    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
        kx6 kx6Var = this.a;
        kx6Var.a.e(y66Var.getLayoutDirection());
        iq1 iq1Var = (iq1) kx6Var.a.g;
        if (iq1Var != null) {
            return jq7.g(iq1Var.q());
        }
        ygf.f("layoutIntrinsics must be called first");
        return 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01f5  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01ff  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x020a  */
    /* JADX WARN: Type inference failed for: r14v11 */
    /* JADX WARN: Type inference failed for: r14v2 */
    /* JADX WARN: Type inference failed for: r14v3, types: [hp6] */
    @Override // defpackage.zk7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.al7 b(defpackage.bl7 r29, java.util.List r30, long r31) {
        /*
            Method dump skipped, instruction units count: 611
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.va2.b(bl7, java.util.List, long):al7");
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int c(y66 y66Var, List list, int i) {
        return ev6.g(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int d(y66 y66Var, List list, int i) {
        return ev6.a(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int e(y66 y66Var, List list, int i) {
        return ev6.e(this, y66Var, list, i);
    }
}
