package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dd1 extends p4d implements f55 {
    public /* synthetic */ Object b;
    public /* synthetic */ Object c;
    public /* synthetic */ Object d;
    public /* synthetic */ f09 e;
    public /* synthetic */ boolean f;
    public final /* synthetic */ id1 g;
    public final /* synthetic */ String h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dd1(id1 id1Var, n92 n92Var, String str) {
        super(6, n92Var);
        this.g = id1Var;
        this.h = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x025a  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x025e  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x034f  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0365  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x03f9  */
    /* JADX WARN: Removed duplicated region for block: B:181:0x0368 A[SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r90) {
        /*
            Method dump skipped, instruction units count: 1137
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dd1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.f55
    public final Object p(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        Object obj7 = ((bjb) obj).a;
        Object obj8 = ((bjb) obj2).a;
        Object obj9 = ((bjb) obj3).a;
        boolean zBooleanValue = ((Boolean) obj5).booleanValue();
        dd1 dd1Var = new dd1(this.g, (n92) obj6, this.h);
        dd1Var.b = obj7;
        dd1Var.c = obj8;
        dd1Var.d = obj9;
        dd1Var.e = (f09) obj4;
        dd1Var.f = zBooleanValue;
        return dd1Var.invokeSuspend(c1e.a);
    }
}
