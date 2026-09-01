package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class heb implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ veb b;
    public final /* synthetic */ sfb c;

    public /* synthetic */ heb(veb vebVar, sfb sfbVar, int i) {
        this.a = i;
        this.b = vebVar;
        this.c = sfbVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        sfb sfbVar = this.c;
        veb vebVar = this.b;
        switch (i) {
            case 0:
                vebVar.I(sfbVar.e.a, sfbVar.m);
                break;
            case 1:
                vebVar.I(sfbVar.e.a, sfbVar.m);
                break;
            case 2:
                vebVar.h(sfbVar.a, sfbVar.m);
                break;
            case 3:
                vebVar.m(sfbVar.a, sfbVar.m);
                break;
            case 4:
                vebVar.q(sfbVar.a, sfbVar.m, sfbVar.p);
                break;
            default:
                vebVar.t(sfbVar.a, sfbVar.m);
                break;
        }
        return c1eVar;
    }
}
