package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hw extends co6 implements b55 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ zz3 c;
    public final /* synthetic */ k54 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ mz1 f;
    public final /* synthetic */ int g;
    public final /* synthetic */ int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hw(boolean z, r28 r28Var, zz3 zz3Var, k54 k54Var, String str, mz1 mz1Var, int i, int i2) {
        super(2);
        this.a = z;
        this.b = r28Var;
        this.c = zz3Var;
        this.d = k54Var;
        this.e = str;
        this.f = mz1Var;
        this.g = i;
        this.h = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        vv2.c(this.a, this.b, this.c, this.d, this.e, this.f, (x12) obj, tr7.y(this.g | 1), this.h);
        return c1e.a;
    }
}
