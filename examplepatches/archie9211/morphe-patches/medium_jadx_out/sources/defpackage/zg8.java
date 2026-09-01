package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zg8 {
    public q28 a;
    public int b;
    public o78 c;
    public o78 d;
    public boolean e;
    public final /* synthetic */ hj0 f;

    public zg8(hj0 hj0Var, q28 q28Var, int i, o78 o78Var, o78 o78Var2, boolean z) {
        this.f = hj0Var;
        this.a = q28Var;
        this.b = i;
        this.c = o78Var;
        this.d = o78Var2;
        this.e = z;
    }

    public final boolean a(int i, int i2) {
        o78 o78Var = this.c;
        int i3 = this.b;
        p28 p28Var = (p28) o78Var.a[i + i3];
        p28 p28Var2 = (p28) this.d.a[i3 + i2];
        return g76.L(p28Var, p28Var2) || p28Var.getClass() == p28Var2.getClass();
    }
}
