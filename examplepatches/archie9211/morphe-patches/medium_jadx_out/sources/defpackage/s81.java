package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s81 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ s81(y81 y81Var, boolean z, r28 r28Var, int i) {
        this.d = y81Var;
        this.b = z;
        this.e = r28Var;
        this.c = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.c;
        Object obj3 = this.e;
        Object obj4 = this.d;
        boolean z = this.b;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                r40.p((y81) obj4, z, (r28) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                gr7.a(z, (mcb) obj4, (lid) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ s81(boolean z, mcb mcbVar, lid lidVar, int i) {
        this.b = z;
        this.d = mcbVar;
        this.e = lidVar;
        this.c = i;
    }
}
