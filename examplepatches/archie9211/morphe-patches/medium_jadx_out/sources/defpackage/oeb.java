package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class oeb implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sfb b;
    public final /* synthetic */ veb c;
    public final /* synthetic */ l78 d;

    public /* synthetic */ oeb(sfb sfbVar, veb vebVar, l78 l78Var) {
        this.a = 1;
        this.b = sfbVar;
        this.c = vebVar;
        this.d = l78Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.d;
        sfb sfbVar = this.b;
        veb vebVar = this.c;
        switch (i) {
            case 0:
                vebVar.x(sfbVar.a, sfbVar.f.b(), sfbVar.m);
                l78Var.setValue(Boolean.FALSE);
                break;
            case 1:
                boolean z = sfbVar.l;
                String str = sfbVar.m;
                String str2 = sfbVar.a;
                if (z) {
                    vebVar.u(str2, str);
                } else {
                    vebVar.O(str2, str);
                }
                l78Var.setValue(Boolean.FALSE);
                break;
            case 2:
                vebVar.F(sfbVar.a, sfbVar.m);
                l78Var.setValue(Boolean.FALSE);
                break;
            case 3:
                vebVar.S(sfbVar.a, sfbVar.e.a, sfbVar.m);
                l78Var.setValue(Boolean.FALSE);
                break;
            default:
                vebVar.g(sfbVar.a, sfbVar.m);
                l78Var.setValue(Boolean.FALSE);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ oeb(veb vebVar, sfb sfbVar, l78 l78Var, int i) {
        this.a = i;
        this.c = vebVar;
        this.b = sfbVar;
        this.d = l78Var;
    }
}
