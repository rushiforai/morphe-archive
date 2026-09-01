package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class us7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Integer b;
    public final /* synthetic */ x45 c;

    public /* synthetic */ us7(Integer num, x45 x45Var, int i) {
        this.a = i;
        this.b = num;
        this.c = x45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.c;
        Integer num = this.b;
        switch (i) {
            case 0:
                uid uidVarB = (uid) obj;
                uidVarB.getClass();
                if (num != null) {
                    uidVarB = uid.b(uidVarB, muc.x0(num.intValue(), uidVarB.a.b), 0L, 6);
                }
                x45Var.invoke(uidVarB);
                break;
            default:
                uid uidVarB2 = (uid) obj;
                uidVarB2.getClass();
                if (num != null) {
                    uidVarB2 = uid.b(uidVarB2, muc.x0(num.intValue(), uidVarB2.a.b), 0L, 6);
                }
                x45Var.invoke(uidVarB2);
                break;
        }
        return c1eVar;
    }
}
