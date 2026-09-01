package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class xx8 extends bw2 implements wx8 {
    public final y05 f;
    public final String g;

    /* JADX WARN: Illegal instructions before constructor call */
    public xx8(b38 b38Var, y05 y05Var) {
        b38Var.getClass();
        y05Var.getClass();
        ky kyVar = cd7.e;
        z05 z05Var = y05Var.a;
        super(b38Var, kyVar, z05Var.c() ? z05.e : z05Var.g(), jkc.g0);
        this.f = y05Var;
        this.g = "package " + y05Var + " of " + b38Var;
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.X(this, obj);
    }

    @Override // defpackage.bw2, defpackage.aw2
    public jkc d() {
        return jkc.g0;
    }

    @Override // defpackage.zv2, defpackage.b2
    public String toString() {
        return this.g;
    }

    @Override // defpackage.bw2, defpackage.yv2
    /* JADX INFO: renamed from: y0, reason: merged with bridge method [inline-methods] */
    public final b38 h() {
        yv2 yv2VarH = super.h();
        yv2VarH.getClass();
        return (b38) yv2VarH;
    }
}
