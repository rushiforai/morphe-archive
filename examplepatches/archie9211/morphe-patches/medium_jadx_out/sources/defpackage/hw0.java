package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hw0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ v7c b;

    public /* synthetic */ hw0(v7c v7cVar, int i) {
        this.a = i;
        this.b = v7cVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        v7c v7cVar = this.b;
        tjb tjbVar = (tjb) obj;
        switch (i) {
            case 0:
                float fG = ((g49) v7cVar.e.k).g();
                float fC = v7cVar.e.g().c();
                float f = fG < fC ? fC - fG : 0.0f;
                tjbVar.l(f > 0.0f ? 1.0f / ((Float.intBitsToFloat((int) (tjbVar.r & 4294967295L)) + f) / Float.intBitsToFloat((int) (4294967295L & tjbVar.r))) : 1.0f);
                tjbVar.s(mq7.r(0.5f, 0.0f));
                break;
            default:
                float fG2 = ((g49) v7cVar.e.k).g();
                float fC2 = v7cVar.e.g().c();
                float f2 = fG2 < fC2 ? fC2 - fG2 : 0.0f;
                tjbVar.l(f2 > 0.0f ? (Float.intBitsToFloat((int) (tjbVar.r & 4294967295L)) + f2) / Float.intBitsToFloat((int) (4294967295L & tjbVar.r)) : 1.0f);
                tjbVar.s(mq7.r(0.5f, 0.0f));
                break;
        }
        return c1eVar;
    }
}
