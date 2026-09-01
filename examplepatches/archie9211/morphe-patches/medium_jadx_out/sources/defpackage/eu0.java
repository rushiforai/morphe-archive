package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class eu0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ pu0 b;
    public final /* synthetic */ String c;
    public final /* synthetic */ String d;

    public /* synthetic */ eu0(pu0 pu0Var, String str, String str2, int i) {
        this.a = i;
        this.b = pu0Var;
        this.c = str;
        this.d = str2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        String str = this.d;
        String str2 = this.c;
        pu0 pu0Var = this.b;
        switch (i) {
            case 0:
                pu0Var.l(str2, str);
                break;
            case 1:
                pu0Var.j(str2, str);
                break;
            default:
                pu0Var.k(str2, str);
                break;
        }
        return c1eVar;
    }
}
