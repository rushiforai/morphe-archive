package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vs7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ i52 c;
    public final /* synthetic */ uid d;
    public final /* synthetic */ String e;

    public /* synthetic */ vs7(i52 i52Var, i52 i52Var2, uid uidVar, String str, int i) {
        this.a = i;
        this.b = i52Var;
        this.c = i52Var2;
        this.d = uidVar;
        this.e = str;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pwe pweVar = pwe.d;
        pwe pweVar2 = pwe.b;
        String str = this.e;
        uid uidVar = this.d;
        i52 i52Var = this.c;
        i52 i52Var2 = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                b09.G(h52Var, null, "spread");
                h52Var.a(i52Var2.e, i52Var.c, 6.0f, 6.0f, 12.0f, 12.0f, 0.0f);
                q52 q52Var = h52Var.e;
                i52 i52Var3 = h52Var.c;
                km4.o(q52Var, i52Var3.d, 8.0f, 4);
                km4.o(h52Var.g, i52Var3.f, 8.0f, 4);
                if (muc.b0(uidVar.a.b) && str != null) {
                    pweVar = pweVar2;
                }
                h52Var.e(pweVar);
                break;
            default:
                h52 h52Var2 = (h52) obj;
                b09.G(h52Var2, null, "spread");
                h52Var2.a(i52Var2.e, i52Var.c, 6.0f, 6.0f, 12.0f, 12.0f, 0.0f);
                q52 q52Var2 = h52Var2.e;
                i52 i52Var4 = h52Var2.c;
                km4.o(q52Var2, i52Var4.d, 8.0f, 4);
                km4.o(h52Var2.g, i52Var4.f, 8.0f, 4);
                if (muc.b0(uidVar.a.b) && str != null) {
                    pweVar = pweVar2;
                }
                h52Var2.e(pweVar);
                break;
        }
        return c1eVar;
    }
}
