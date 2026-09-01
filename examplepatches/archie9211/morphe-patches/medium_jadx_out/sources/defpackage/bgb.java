package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class bgb implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ nib b;

    public /* synthetic */ bgb(nib nibVar, int i) {
        this.a = i;
        this.b = nibVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 2;
        int i3 = 3;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        c1e c1eVar = c1e.a;
        nib nibVar = this.b;
        switch (i) {
            case 0:
                nibVar.j();
                return c1eVar;
            case 1:
                nibVar.j();
                return c1eVar;
            case 2:
                nibVar.j();
                return c1eVar;
            case 3:
                nibVar.j();
                return c1eVar;
            case 4:
                nibVar.j();
                return c1eVar;
            case 5:
                vx0.c0(f76.F(nibVar), null, null, new gib(nibVar, objArr == true ? 1 : 0, i2), 3);
                return c1eVar;
            case 6:
                vx0.c0(f76.F(nibVar), null, null, new gib(nibVar, objArr2 == true ? 1 : 0, i3), 3);
                return c1eVar;
            case 7:
                nibVar.j();
                return c1eVar;
            default:
                pu7 pu7Var = nibVar.y;
                String str = nibVar.F;
                pu7Var.getClass();
                str.getClass();
                String strO = g76.L(p2.o(pu7Var, ek6.RESPONSE_DRAFT_ID, null, 2, null), str) ? p2.o(pu7Var, ek6.RESPONSE_DRAFT_TEXT, null, 2, null) : null;
                if (strO == null) {
                    strO = "";
                }
                int length = strO.length();
                return qo7.u(new uid(strO, 4, lk7.q(length, length)));
        }
    }
}
