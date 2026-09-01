package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class n8b implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ p8b b;
    public final /* synthetic */ q8b c;

    public /* synthetic */ n8b(p8b p8bVar, q8b q8bVar, int i) {
        this.a = i;
        this.b = p8bVar;
        this.c = q8bVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        q8b q8bVar = this.c;
        p8b p8bVar = this.b;
        switch (i) {
            case 0:
                p8bVar.d(q8bVar.a, q8bVar.b);
                break;
            case 1:
                p8bVar.b(q8bVar.a, q8bVar.b);
                break;
            case 2:
                p8bVar.e(q8bVar.a, q8bVar.b.d, q8bVar.d != null);
                break;
            case 3:
                p8bVar.f(q8bVar.a, q8bVar.b);
                break;
            case 4:
                String str = q8bVar.a;
                String str2 = q8bVar.d;
                if (str2 == null) {
                    str2 = "";
                }
                p8bVar.c(str, str2, q8bVar.b);
                break;
            default:
                p8bVar.g(q8bVar.a, q8bVar.b);
                break;
        }
        return c1eVar;
    }
}
