package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n31 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ qy8 b;
    public final /* synthetic */ ku3 c;

    public /* synthetic */ n31(qy8 qy8Var, ku3 ku3Var, int i) {
        this.a = i;
        this.b = qy8Var;
        this.c = ku3Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ku3 ku3Var = this.c;
        qy8 qy8Var = this.b;
        int iIntValue = ((Integer) obj).intValue();
        int iIntValue2 = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                qy8Var.c(ku3Var, iIntValue, iIntValue2);
                break;
            default:
                qy8Var.c(ku3Var, iIntValue, iIntValue2);
                break;
        }
        return c1eVar;
    }
}
