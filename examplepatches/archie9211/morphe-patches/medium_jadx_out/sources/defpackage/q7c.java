package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q7c implements zc8 {
    public final /* synthetic */ v7c a;
    public final /* synthetic */ x45 b;
    public final /* synthetic */ hw8 c;

    public q7c(v7c v7cVar, x45 x45Var, hw8 hw8Var) {
        this.a = v7cVar;
        this.b = x45Var;
        this.c = hw8Var;
    }

    @Override // defpackage.zc8
    public final Object A(long j, long j2, n92 n92Var) {
        this.b.invoke(new Float(this.c == hw8.Horizontal ? qre.b(j2) : qre.c(j2)));
        return new qre(j2);
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (this.c == hw8.Horizontal ? j >> 32 : j & 4294967295L));
        if (fIntBitsToFloat >= 0.0f || i != 1) {
            return 0L;
        }
        tl tlVar = this.a.e;
        float fI = tlVar.i(fIntBitsToFloat);
        g49 g49Var = (g49) tlVar.k;
        float fG = Float.isNaN(g49Var.g()) ? 0.0f : g49Var.g();
        g49Var.h(fI);
        return a(fI - fG);
    }

    public final long a(float f) {
        hw8 hw8Var = hw8.Horizontal;
        hw8 hw8Var2 = this.c;
        float f2 = hw8Var2 == hw8Var ? f : 0.0f;
        if (hw8Var2 != hw8.Vertical) {
            f = 0.0f;
        }
        return (((long) Float.floatToRawIntBits(f)) & 4294967295L) | (((long) Float.floatToRawIntBits(f2)) << 32);
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        float fB = this.c == hw8.Horizontal ? qre.b(j) : qre.c(j);
        v7c v7cVar = this.a;
        float fJ = v7cVar.e.j();
        float fC = v7cVar.e.g().c();
        if (fB >= 0.0f || fJ <= fC) {
            j = 0;
        } else {
            this.b.invoke(new Float(fB));
        }
        return new qre(j);
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        if (i != 1) {
            return 0L;
        }
        tl tlVar = this.a.e;
        float fI = tlVar.i(Float.intBitsToFloat(this.c == hw8.Horizontal ? (int) (j2 >> 32) : (int) (j2 & 4294967295L)));
        g49 g49Var = (g49) tlVar.k;
        float fG = Float.isNaN(g49Var.g()) ? 0.0f : g49Var.g();
        g49Var.h(fI);
        return a(fI - fG);
    }
}
