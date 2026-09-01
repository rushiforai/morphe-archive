package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class wo0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x45 b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ l78 d;

    public /* synthetic */ wo0(x45 x45Var, l78 l78Var, l78 l78Var2, int i) {
        this.a = i;
        this.b = x45Var;
        this.c = l78Var;
        this.d = l78Var2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.d;
        l78 l78Var2 = this.c;
        x45 x45Var = this.b;
        uid uidVar = (uid) obj;
        switch (i) {
            case 0:
                l78Var2.setValue(uidVar);
                boolean zL = g76.L((String) l78Var.getValue(), uidVar.a.b);
                mx mxVar = uidVar.a;
                l78Var.setValue(mxVar.b);
                if (!zL) {
                    x45Var.invoke(mxVar.b);
                }
                break;
            case 1:
                uidVar.getClass();
                l78Var2.setValue(uidVar);
                String str = (String) l78Var.getValue();
                mx mxVar2 = uidVar.a;
                boolean zL2 = g76.L(str, mxVar2.b);
                String str2 = mxVar2.b;
                l78Var.setValue(str2);
                if (!zL2) {
                    x45Var.invoke(str2);
                }
                break;
            default:
                uidVar.getClass();
                l78Var2.setValue(uidVar);
                String str3 = (String) l78Var.getValue();
                mx mxVar3 = uidVar.a;
                boolean zL3 = g76.L(str3, mxVar3.b);
                String str4 = mxVar3.b;
                l78Var.setValue(str4);
                if (!zL3) {
                    x45Var.invoke(str4);
                }
                break;
        }
        return c1eVar;
    }
}
