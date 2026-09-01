package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class e8f implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ g8f b;
    public final /* synthetic */ anb c;

    public /* synthetic */ e8f(g8f g8fVar, anb anbVar, int i) {
        this.a = i;
        this.b = g8fVar;
        this.c = anbVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        anb anbVar = this.c;
        g8f g8fVar = this.b;
        y70 y70Var = (y70) obj;
        switch (i) {
            case 0:
                y70Var.getClass();
                g8fVar.a(anbVar, y70Var);
                break;
            default:
                y70Var.getClass();
                g8fVar.b(anbVar, y70Var);
                break;
        }
        return c1eVar;
    }
}
