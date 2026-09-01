package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class os implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ts b;
    public final /* synthetic */ ygd c;

    public /* synthetic */ os(ts tsVar, ygd ygdVar, int i) {
        this.a = i;
        this.b = tsVar;
        this.c = ygdVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 5;
        ygd ygdVar = this.c;
        ts tsVar = this.b;
        switch (i) {
            case 0:
                ns nsVar = tsVar.f;
                l8 l8Var = new l8(9, ygdVar);
                rya ryaVar = new rya();
                tsVar.e.d("dataBuilder", nsVar, new n(ryaVar, i2, l8Var));
                Object obj = ryaVar.a;
                if (obj != null) {
                    return (xgd) obj;
                }
                g76.g0("result");
                throw null;
            case 1:
                ns nsVar2 = tsVar.g;
                os osVar = new os(tsVar, ygdVar, 2);
                rya ryaVar2 = new rya();
                tsVar.e.d("positioner", nsVar2, new n(ryaVar2, i2, osVar));
                Object obj2 = ryaVar2.a;
                if (obj2 != null) {
                    return (zwa) obj2;
                }
                g76.g0("result");
                throw null;
            default:
                Object objInvoke = tsVar.c.invoke();
                hp6 hp6Var = (hp6) (((hp6) objInvoke).m() ? objInvoke : null);
                return hp6Var == null ? zwa.e : ygdVar.k(hp6Var).i(hp6Var.I(0L));
        }
    }
}
