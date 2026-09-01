package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class voc implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;

    public /* synthetic */ voc(int i, r28 r28Var, int i2, int i3) {
        this.c = i;
        this.d = i2;
        this.b = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        int i3 = this.c;
        r28 r28Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                rr7.q(i3, i2, r28Var, x12Var, tr7.y(1));
                break;
            default:
                no7.i(tr7.y(i3 | 1), i2, x12Var, r28Var);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ voc(r28 r28Var, int i, int i2) {
        this.b = r28Var;
        this.c = i;
        this.d = i2;
    }
}
