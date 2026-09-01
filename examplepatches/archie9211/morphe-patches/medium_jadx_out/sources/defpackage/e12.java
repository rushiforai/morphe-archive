package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e12 extends q62 {
    public final d12 f;
    public final mz1 g;

    public e12(d12 d12Var, String str, mz1 mz1Var) {
        super(d12Var, str);
        this.f = d12Var;
        this.g = mz1Var;
    }

    @Override // defpackage.q62
    public final va8 a() {
        return (c12) super.a();
    }

    @Override // defpackage.q62
    public final va8 b() {
        return new c12(this.f, this.g);
    }
}
