package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class jba implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ nba b;
    public final /* synthetic */ l78 c;

    public /* synthetic */ jba(nba nbaVar, l78 l78Var, int i) {
        this.a = i;
        this.b = nbaVar;
        this.c = l78Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.c;
        nba nbaVar = this.b;
        switch (i) {
            case 0:
                l78Var.setValue(Boolean.FALSE);
                nbaVar.a(null);
                break;
            default:
                l78Var.setValue(Boolean.FALSE);
                nbaVar.b(null);
                break;
        }
        return c1eVar;
    }
}
