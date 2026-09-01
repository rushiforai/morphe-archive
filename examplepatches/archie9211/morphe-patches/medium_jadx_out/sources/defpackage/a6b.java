package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class a6b implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ j6b b;
    public final /* synthetic */ e6b c;

    public /* synthetic */ a6b(int i, e6b e6bVar, j6b j6bVar) {
        this.b = j6bVar;
        this.c = e6bVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        e6b e6bVar = this.c;
        j6b j6bVar = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                num.getClass();
                er7.f(j6bVar, e6bVar, x12Var, tr7.y(1));
                break;
            default:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    er7.f(j6bVar, e6bVar, p65Var, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ a6b(j6b j6bVar, e6b e6bVar) {
        this.b = j6bVar;
        this.c = e6bVar;
    }
}
