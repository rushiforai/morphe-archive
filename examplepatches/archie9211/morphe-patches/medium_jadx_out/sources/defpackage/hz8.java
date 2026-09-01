package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hz8 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    public /* synthetic */ hz8(int i, m45 m45Var) {
        this.a = 0;
        this.b = i;
        this.c = m45Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                return new d13(i2, 0.0f, (m45) obj);
            case 1:
                return Integer.valueOf(((qjd) ((ym0) obj).e).b.d(i2));
            default:
                ((b6d) obj).a(i2);
                return c1e.a;
        }
    }

    public /* synthetic */ hz8(int i, int i2, Object obj) {
        this.a = i2;
        this.c = obj;
        this.b = i;
    }
}
