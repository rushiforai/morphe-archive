package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dia implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ hia b;
    public final /* synthetic */ cv9 c;
    public final /* synthetic */ int d;

    public /* synthetic */ dia(hia hiaVar, cv9 cv9Var, int i, int i2) {
        this.a = i2;
        this.b = hiaVar;
        this.c = cv9Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        cv9 cv9Var = this.c;
        hia hiaVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                ur7.d(hiaVar, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
            case 1:
                ur7.o(hiaVar, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
            case 2:
                ur7.k(hiaVar, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
            case 3:
                ur7.e(hiaVar, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                ur7.v(hiaVar, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
