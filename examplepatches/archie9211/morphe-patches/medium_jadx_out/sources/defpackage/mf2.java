package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mf2 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ l78 c;

    public /* synthetic */ mf2(l78 l78Var, l78 l78Var2, int i) {
        this.a = i;
        this.b = l78Var;
        this.c = l78Var2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Float f;
        Float f2;
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.c;
        l78 l78Var2 = this.b;
        switch (i) {
            case 0:
                uid uidVar = (uid) obj;
                uidVar.getClass();
                l78Var2.setValue(uidVar);
                l78Var.setValue(gt7.DEFAULT);
                break;
            default:
                kb9 kb9Var = (kb9) obj;
                Integer numValueOf = null;
                l78Var2.setValue((kb9Var == null || (f2 = kb9Var.a) == null) ? null : Integer.valueOf((int) f2.floatValue()));
                if (kb9Var != null && (f = kb9Var.c) != null) {
                    numValueOf = Integer.valueOf((int) f.floatValue());
                }
                l78Var.setValue(numValueOf);
                break;
        }
        return c1eVar;
    }
}
