package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ij2 extends co6 implements b55 {
    public final /* synthetic */ Boolean a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ tj4 c;
    public final /* synthetic */ String d;
    public final /* synthetic */ mz1 e;
    public final /* synthetic */ int f;
    public final /* synthetic */ int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ij2(Boolean bool, r28 r28Var, tj4 tj4Var, String str, mz1 mz1Var, int i, int i2) {
        super(2);
        this.a = bool;
        this.b = r28Var;
        this.c = tj4Var;
        this.d = str;
        this.e = mz1Var;
        this.f = i;
        this.g = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        k40.f(this.a, this.b, this.c, this.d, this.e, (x12) obj, tr7.y(this.f | 1), this.g);
        return c1e.a;
    }
}
