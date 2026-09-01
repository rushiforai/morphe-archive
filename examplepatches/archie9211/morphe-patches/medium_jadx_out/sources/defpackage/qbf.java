package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class qbf implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ d2f b;
    public final /* synthetic */ xbf c;

    public /* synthetic */ qbf(int i, d2f d2fVar, xbf xbfVar) {
        this.a = i;
        this.b = d2fVar;
        this.c = xbfVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        xbf xbfVar = this.c;
        d2f d2fVar = this.b;
        switch (i) {
            case 0:
                d2fVar.Z(((ubf) xbfVar).k);
                break;
            default:
                d2fVar.o0(((ubf) xbfVar).k);
                break;
        }
        return c1eVar;
    }
}
