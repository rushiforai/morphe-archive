package f2;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.LayoutNode;
import b0.f0;
import b3.e0;
import b3.q;
import i2.t;
import z2.i1;
import z2.l;
import z2.q0;
import z2.r1;
import z2.s;
import z2.s0;
import z2.t0;

/* loaded from: classes.dex */
public final class h extends Modifier$Node implements e0, q {

    /* renamed from: a, reason: collision with root package name */
    public n2.c f54237a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f54238b;

    /* renamed from: c, reason: collision with root package name */
    public b2.f f54239c;

    /* renamed from: d, reason: collision with root package name */
    public l f54240d;

    /* renamed from: e, reason: collision with root package name */
    public float f54241e;

    /* renamed from: f, reason: collision with root package name */
    public t f54242f;

    public static boolean D(long j11) {
        return !h2.e.a(j11, 9205357640488583168L) && (Float.floatToRawIntBits(Float.intBitsToFloat((int) (j11 & 4294967295L))) & LayoutNode.NotPlacedPlaceOrder) < 2139095040;
    }

    public static boolean E(long j11) {
        return !h2.e.a(j11, 9205357640488583168L) && (Float.floatToRawIntBits(Float.intBitsToFloat((int) (j11 >> 32))) & LayoutNode.NotPlacedPlaceOrder) < 2139095040;
    }

    public final boolean B() {
        return this.f54238b && this.f54237a.f() != 9205357640488583168L;
    }

    public final long F(long j11) {
        boolean z11 = false;
        boolean z12 = y3.a.d(j11) && y3.a.c(j11);
        if (y3.a.f(j11) && y3.a.e(j11)) {
            z11 = true;
        }
        if ((!B() && z12) || z11) {
            return y3.a.a(j11, y3.a.h(j11), 0, y3.a.g(j11), 0, 10);
        }
        long jF = this.f54237a.f();
        int iRound = E(jF) ? Math.round(Float.intBitsToFloat((int) (jF >> 32))) : y3.a.j(j11);
        int iRound2 = D(jF) ? Math.round(Float.intBitsToFloat((int) (jF & 4294967295L))) : y3.a.i(j11);
        int iG = y3.b.g(iRound, j11);
        long jFloatToRawIntBits = (Float.floatToRawIntBits(y3.b.f(iRound2, j11)) & 4294967295L) | (Float.floatToRawIntBits(iG) << 32);
        if (B()) {
            long jFloatToRawIntBits2 = (Float.floatToRawIntBits(!E(this.f54237a.f()) ? Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)) : Float.intBitsToFloat((int) (this.f54237a.f() >> 32))) << 32) | (Float.floatToRawIntBits(!D(this.f54237a.f()) ? Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)) : Float.intBitsToFloat((int) (this.f54237a.f() & 4294967295L))) & 4294967295L);
            jFloatToRawIntBits = (Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)) == 0.0f || Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)) == 0.0f) ? 0L : r1.i(jFloatToRawIntBits2, this.f54240d.a(jFloatToRawIntBits2, jFloatToRawIntBits));
        }
        return y3.a.a(j11, y3.b.g(Math.round(Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32))), j11), 0, y3.b.f(Math.round(Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L))), j11), 0, 10);
    }

    @Override // b3.q
    public final void draw(k2.c cVar) {
        long jF = this.f54237a.f();
        float fIntBitsToFloat = E(jF) ? Float.intBitsToFloat((int) (jF >> 32)) : Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() >> 32));
        float fIntBitsToFloat2 = D(jF) ? Float.intBitsToFloat((int) (jF & 4294967295L)) : Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() & 4294967295L));
        long jFloatToRawIntBits = (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
        long jI = (Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() >> 32)) == 0.0f || Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() & 4294967295L)) == 0.0f) ? 0L : r1.i(jFloatToRawIntBits, this.f54240d.a(jFloatToRawIntBits, cVar.mo94getSizeNHjbRc()));
        long jA = this.f54239c.a((Math.round(Float.intBitsToFloat((int) (jI >> 32))) << 32) | (Math.round(Float.intBitsToFloat((int) (jI & 4294967295L))) & 4294967295L), (Math.round(Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() >> 32))) << 32) | (Math.round(Float.intBitsToFloat((int) (cVar.mo94getSizeNHjbRc() & 4294967295L))) & 4294967295L), cVar.getLayoutDirection());
        float f11 = (int) (jA >> 32);
        float f12 = (int) (jA & 4294967295L);
        cVar.getDrawContext().getTransform().translate(f11, f12);
        try {
            this.f54237a.e(cVar, jI, this.f54241e, this.f54242f);
            cVar.getDrawContext().getTransform().translate(-f11, -f12);
            cVar.drawContent();
        } catch (Throwable th2) {
            cVar.getDrawContext().getTransform().translate(-f11, -f12);
            throw th2;
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.e0
    public final int maxIntrinsicHeight(z2.t tVar, s sVar, int i5) {
        if (!B()) {
            return sVar.b(i5);
        }
        long jF = F(y3.b.b(i5, 0, 13));
        return Math.max(y3.a.i(jF), sVar.b(i5));
    }

    @Override // b3.e0
    public final int maxIntrinsicWidth(z2.t tVar, s sVar, int i5) {
        if (!B()) {
            return sVar.F(i5);
        }
        long jF = F(y3.b.b(0, i5, 7));
        return Math.max(y3.a.j(jF), sVar.F(i5));
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final s0 mo25measure3p2s80s(t0 t0Var, q0 q0Var, long j11) {
        i1 i1VarH = q0Var.H(F(j11));
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new f0(i1VarH, 1));
    }

    @Override // b3.e0
    public final int minIntrinsicHeight(z2.t tVar, s sVar, int i5) {
        if (!B()) {
            return sVar.t(i5);
        }
        long jF = F(y3.b.b(i5, 0, 13));
        return Math.max(y3.a.i(jF), sVar.t(i5));
    }

    @Override // b3.e0
    public final int minIntrinsicWidth(z2.t tVar, s sVar, int i5) {
        if (!B()) {
            return sVar.E(i5);
        }
        long jF = F(y3.b.b(0, i5, 7));
        return Math.max(y3.a.j(jF), sVar.E(i5));
    }

    public final String toString() {
        return "PainterModifier(painter=" + this.f54237a + ", sizeToIntrinsics=" + this.f54238b + ", alignment=" + this.f54239c + ", alpha=" + this.f54241e + ", colorFilter=" + this.f54242f + ')';
    }
}
