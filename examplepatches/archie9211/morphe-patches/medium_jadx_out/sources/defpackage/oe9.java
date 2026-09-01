package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class oe9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ pe9 b;
    public final /* synthetic */ cv9 c;

    public /* synthetic */ oe9(pe9 pe9Var, cv9 cv9Var, int i, int i2) {
        this.a = i2;
        this.b = pe9Var;
        this.c = cv9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        cv9 cv9Var = this.c;
        pe9 pe9Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                ek7.l(pe9Var, cv9Var, x12Var, tr7.y(1));
                break;
            default:
                ek7.a(pe9Var, cv9Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
