package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class w8d implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ e9d b;
    public final /* synthetic */ ybd c;

    public /* synthetic */ w8d(e9d e9dVar, ybd ybdVar, int i) {
        this.a = i;
        this.b = e9dVar;
        this.c = ybdVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ybd ybdVar = this.c;
        e9d e9dVar = this.b;
        switch (i) {
            case 0:
                e9dVar.p(ybdVar.a, ybdVar.f);
                break;
            case 1:
                e9dVar.B(ybdVar.f, ybdVar.a, true);
                break;
            default:
                e9dVar.B(ybdVar.f, ybdVar.a, false);
                break;
        }
        return c1eVar;
    }
}
