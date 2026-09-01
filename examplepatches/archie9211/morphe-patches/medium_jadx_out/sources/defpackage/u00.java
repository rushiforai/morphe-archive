package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class u00 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ vod b;

    public /* synthetic */ u00(vod vodVar, int i) {
        this.a = i;
        this.b = vodVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        vod vodVar = this.b;
        switch (i) {
            case 0:
                vodVar.a = -(((int) (((s46) obj).a & 4294967295L)) - vodVar.c.g());
                break;
            default:
                vodVar.b(((Number) ((vw) obj).e.getValue()).floatValue());
                break;
        }
        return c1eVar;
    }
}
