package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class j38 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ long c;
    public final /* synthetic */ boolean d;

    public /* synthetic */ j38(r28 r28Var, long j, boolean z, int i) {
        this.b = r28Var;
        this.c = j;
        this.d = z;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                pr7.c(tr7.y(7), this.c, (x12) obj, this.b, this.d);
                break;
            default:
                ((Integer) obj2).getClass();
                kk7.p(tr7.y(385), this.c, (x12) obj, this.b, this.d);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ j38(boolean z, r28 r28Var, long j, int i) {
        this.d = z;
        this.b = r28Var;
        this.c = j;
    }
}
