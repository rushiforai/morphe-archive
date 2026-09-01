package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class a33 implements mn4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ a33(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.mn4
    public final float invoke() {
        vod vodVarD;
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                uod uodVar = ((gud) obj).o;
                if (uodVar == null || (vodVarD = uodVar.d()) == null) {
                    return 0.0f;
                }
                return vodVarD.c.g();
            default:
                return ((Number) ((npa) obj).a.d()).floatValue();
        }
    }
}
