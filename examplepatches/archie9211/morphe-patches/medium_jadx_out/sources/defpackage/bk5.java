package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class bk5 implements m45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ dk5 b;
    public final /* synthetic */ yk5 c;

    public /* synthetic */ bk5(dk5 dk5Var, yk5 yk5Var) {
        this.b = dk5Var;
        this.c = yk5Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        yk5 yk5Var = this.c;
        dk5 dk5Var = this.b;
        switch (i) {
            case 0:
                vk5 vk5Var = (vk5) yk5Var;
                uk5 uk5Var = vk5Var.c;
                if (uk5Var instanceof qk5) {
                    String str = ((qk5) uk5Var).a;
                    dl5 dl5Var = dk5Var.a;
                    vx0.c0(f76.F(dl5Var), null, null, new zk5(dl5Var, str, null, 1), 3);
                    return c1eVar;
                }
                if (uk5Var instanceof sk5) {
                    String str2 = vk5Var.e;
                    str2.getClass();
                    dl5 dl5Var2 = dk5Var.a;
                    vx0.c0(f76.F(dl5Var2), null, null, new zk5(dl5Var2, str2, null, 0), 3);
                    return c1eVar;
                }
                if ((uk5Var instanceof rk5) || (uk5Var instanceof tk5)) {
                    return c1eVar;
                }
                ygf.a();
                return null;
            default:
                String str3 = ((vk5) yk5Var).e;
                str3.getClass();
                dl5 dl5Var3 = dk5Var.a;
                vx0.c0(f76.F(dl5Var3), null, null, new al5(dl5Var3, str3, null), 3);
                return c1eVar;
        }
    }

    public /* synthetic */ bk5(yk5 yk5Var, dk5 dk5Var) {
        this.c = yk5Var;
        this.b = dk5Var;
    }
}
