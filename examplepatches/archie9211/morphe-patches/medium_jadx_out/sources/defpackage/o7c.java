package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class o7c implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ float c;

    public /* synthetic */ o7c(float f, upc upcVar) {
        this.a = 2;
        this.c = f;
        this.b = upcVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        float fZ;
        int i = this.a;
        Object obj = this.b;
        float f = this.c;
        switch (i) {
            case 0:
                fZ = ((m73) obj).Z(f);
                break;
            case 1:
                fZ = ((m73) obj).Z(f);
                break;
            default:
                return Boolean.valueOf(((float) ((Number) ((upc) obj).getValue()).intValue()) < f);
        }
        return Float.valueOf(fZ);
    }

    public /* synthetic */ o7c(m73 m73Var, float f, int i) {
        this.a = i;
        this.b = m73Var;
        this.c = f;
    }
}
