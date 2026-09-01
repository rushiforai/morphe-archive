package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jz2 implements zs5 {
    public final long a;
    public final /* synthetic */ h21 b;

    public jz2(h21 h21Var) {
        this.b = h21Var;
        this.a = h21Var.e();
    }

    @Override // defpackage.zs5
    public final void a(xz0 xz0Var) {
        xz0Var.C0(this.b);
    }

    @Override // defpackage.zs5
    public final String b() {
        return "application/json";
    }

    @Override // defpackage.zs5
    public final long c() {
        return this.a;
    }
}
