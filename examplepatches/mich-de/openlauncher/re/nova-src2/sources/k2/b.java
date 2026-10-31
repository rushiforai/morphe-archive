package k2;

import aa.m0;
import android.graphics.Paint;
import android.graphics.Shader;
import androidx.compose.ui.graphics.Canvas;
import i2.c0;
import i2.l0;
import i2.n0;
import i2.o0;
import i2.p;
import i2.r0;
import i2.s;
import i2.t;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;
import y3.n;

/* loaded from: classes.dex */
public final class b implements f {

    /* renamed from: a, reason: collision with root package name */
    public final a f70865a;

    /* renamed from: b, reason: collision with root package name */
    public final i50.c f70866b;

    /* renamed from: c, reason: collision with root package name */
    public m0 f70867c;

    /* renamed from: d, reason: collision with root package name */
    public m0 f70868d;

    public b() {
        n nVar = n.f96612a;
        a aVar = new a();
        aVar.f70861a = e.f70869a;
        aVar.f70862b = nVar;
        aVar.f70863c = i.f70870a;
        aVar.f70864d = 0L;
        this.f70865a = aVar;
        this.f70866b = new i50.c(this);
    }

    public static l0 a(b bVar, long j11, g gVar, float f11, t tVar, int i5) {
        l0 l0VarG = bVar.g(gVar);
        if (f11 != 1.0f) {
            j11 = s.b(s.c(j11) * f11, j11);
        }
        m0 m0Var = (m0) l0VarG;
        long jD = m0Var.d();
        int i11 = s.n;
        if (!ULong.a(jD, j11)) {
            m0Var.o(j11);
        }
        if (((Shader) m0Var.f620c) != null) {
            m0Var.s(null);
        }
        if (!Intrinsics.b((t) m0Var.f621d, tVar)) {
            m0Var.p(tVar);
        }
        if (m0Var.f618a != i5) {
            m0Var.n(i5);
        }
        if (((Paint) m0Var.f619b).isFilterBitmap()) {
            return l0VarG;
        }
        m0Var.q(1);
        return l0VarG;
    }

    public static l0 f(b bVar, long j11, float f11, int i5, o0 o0Var) {
        m0 m0VarE = bVar.f70868d;
        if (m0VarE == null) {
            m0VarE = r0.e();
            m0VarE.x(1);
            bVar.f70868d = m0VarE;
        }
        Paint paint = (Paint) m0VarE.f619b;
        long jD = m0VarE.d();
        int i11 = s.n;
        if (!ULong.a(jD, j11)) {
            m0VarE.o(j11);
        }
        if (((Shader) m0VarE.f620c) != null) {
            m0VarE.s(null);
        }
        if (!Intrinsics.b((t) m0VarE.f621d, null)) {
            m0VarE.p(null);
        }
        if (m0VarE.f618a != 3) {
            m0VarE.n(3);
        }
        if (paint.getStrokeWidth() != f11) {
            m0VarE.w(f11);
        }
        if (paint.getStrokeMiter() != 4.0f) {
            m0VarE.v(4.0f);
        }
        if (m0VarE.e() != i5) {
            m0VarE.t(i5);
        }
        if (m0VarE.f() != 0) {
            m0VarE.u(0);
        }
        if (!Intrinsics.b((o0) m0VarE.f622e, o0Var)) {
            m0VarE.r(o0Var);
        }
        if (paint.isFilterBitmap()) {
            return m0VarE;
        }
        m0VarE.q(1);
        return m0VarE;
    }

    public final l0 b(p pVar, g gVar, float f11, t tVar, int i5, int i11) {
        l0 l0VarG = g(gVar);
        if (pVar != null) {
            pVar.a(mo94getSizeNHjbRc(), f11, l0VarG);
        } else {
            m0 m0Var = (m0) l0VarG;
            if (((Shader) m0Var.f620c) != null) {
                m0Var.s(null);
            }
            long jD = m0Var.d();
            long j11 = s.f61136b;
            if (!ULong.a(jD, j11)) {
                m0Var.o(j11);
            }
            if (((Paint) m0Var.f619b).getAlpha() / 255.0f != f11) {
                m0Var.m(f11);
            }
        }
        m0 m0Var2 = (m0) l0VarG;
        if (!Intrinsics.b((t) m0Var2.f621d, tVar)) {
            m0Var2.p(tVar);
        }
        if (m0Var2.f618a != i5) {
            m0Var2.n(i5);
        }
        if (((Paint) m0Var2.f619b).isFilterBitmap() == i11) {
            return l0VarG;
        }
        m0Var2.q(i11);
        return l0VarG;
    }

    @Override // k2.f
    /* renamed from: drawArc-yD3GUKo */
    public final void mo80drawArcyD3GUKo(long j11, float f11, float f12, boolean z11, long j12, long j13, float f13, g gVar, t tVar, int i5) {
        int i11 = (int) (j12 >> 32);
        int i12 = (int) (j12 & 4294967295L);
        this.f70865a.f70863c.drawArc(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j13 & 4294967295L)) + Float.intBitsToFloat(i12), f11, f12, false, a(this, j11, gVar, f13, null, 3));
    }

    @Override // k2.f
    /* renamed from: drawCircle-VaOC9Bg */
    public final void mo81drawCircleVaOC9Bg(long j11, float f11, long j12, float f12, g gVar, t tVar, int i5) {
        this.f70865a.f70863c.mo16drawCircle9KIMszo(j12, f11, a(this, j11, gVar, 1.0f, null, 3));
    }

    @Override // k2.f
    /* renamed from: drawImage-AZ2fEMs */
    public final void mo82drawImageAZ2fEMs(c0 c0Var, long j11, long j12, long j13, long j14, float f11, g gVar, t tVar, int i5, int i11) {
        this.f70865a.f70863c.mo18drawImageRectHPBpro0(c0Var, j11, j12, 0L, j14, b(null, j.f70871a, f11, tVar, 3, i11));
    }

    @Override // k2.f
    /* renamed from: drawImage-gbVJVH8 */
    public final void mo83drawImagegbVJVH8(c0 c0Var, long j11, float f11, g gVar, t tVar, int i5) {
        this.f70865a.f70863c.mo17drawImaged4ec7I(c0Var, j11, b(null, j.f70871a, 1.0f, tVar, 3, 1));
    }

    @Override // k2.f
    /* renamed from: drawLine-1RTmtNc */
    public final void mo84drawLine1RTmtNc(p pVar, long j11, long j12, float f11, int i5, o0 o0Var, float f12, t tVar, int i11) {
        Canvas canvas = this.f70865a.f70863c;
        m0 m0VarE = this.f70868d;
        if (m0VarE == null) {
            m0VarE = r0.e();
            m0VarE.x(1);
            this.f70868d = m0VarE;
        }
        pVar.a(mo94getSizeNHjbRc(), f12, m0VarE);
        Paint paint = (Paint) m0VarE.f619b;
        if (!Intrinsics.b((t) m0VarE.f621d, null)) {
            m0VarE.p(null);
        }
        if (m0VarE.f618a != 3) {
            m0VarE.n(3);
        }
        if (paint.getStrokeWidth() != f11) {
            m0VarE.w(f11);
        }
        if (paint.getStrokeMiter() != 4.0f) {
            m0VarE.v(4.0f);
        }
        if (m0VarE.e() != 0) {
            m0VarE.t(0);
        }
        if (m0VarE.f() != 0) {
            m0VarE.u(0);
        }
        if (!Intrinsics.b((o0) m0VarE.f622e, null)) {
            m0VarE.r(null);
        }
        if (!paint.isFilterBitmap()) {
            m0VarE.q(1);
        }
        canvas.mo19drawLineWko1d7g(j11, j12, m0VarE);
    }

    @Override // k2.f
    /* renamed from: drawLine-NGM6Ib0 */
    public final void mo85drawLineNGM6Ib0(long j11, long j12, long j13, float f11, int i5, o0 o0Var, float f12, t tVar, int i11) {
        this.f70865a.f70863c.mo19drawLineWko1d7g(j12, j13, f(this, j11, f11, i5, o0Var));
    }

    @Override // k2.f
    /* renamed from: drawPath-GBMwjPU */
    public final void mo86drawPathGBMwjPU(n0 n0Var, p pVar, float f11, g gVar, t tVar, int i5) {
        this.f70865a.f70863c.drawPath(n0Var, b(pVar, gVar, f11, null, i5, 1));
    }

    @Override // k2.f
    /* renamed from: drawPath-LG529CI */
    public final void mo87drawPathLG529CI(n0 n0Var, long j11, float f11, g gVar, t tVar, int i5) {
        this.f70865a.f70863c.drawPath(n0Var, a(this, j11, gVar, f11, null, 3));
    }

    @Override // k2.f
    /* renamed from: drawPoints-F8ZwMP8 */
    public final void mo88drawPointsF8ZwMP8(List list, int i5, long j11, float f11, int i11, o0 o0Var, float f12, t tVar, int i12) {
        this.f70865a.f70863c.mo20drawPointsO7TthRY(0, list, f(this, j11, f11, 1, null));
    }

    @Override // k2.f
    /* renamed from: drawRect-AsUm42w */
    public final void mo89drawRectAsUm42w(p pVar, long j11, long j12, float f11, g gVar, t tVar, int i5) {
        int i11 = (int) (j11 >> 32);
        int i12 = (int) (j11 & 4294967295L);
        this.f70865a.f70863c.drawRect(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j12 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (4294967295L & j12)) + Float.intBitsToFloat(i12), b(pVar, gVar, f11, null, i5, 1));
    }

    @Override // k2.f
    /* renamed from: drawRect-n-J9OG0 */
    public final void mo90drawRectnJ9OG0(long j11, long j12, long j13, float f11, g gVar, t tVar, int i5) {
        int i11 = (int) (j12 >> 32);
        int i12 = (int) (j12 & 4294967295L);
        this.f70865a.f70863c.drawRect(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j13 & 4294967295L)) + Float.intBitsToFloat(i12), a(this, j11, j.f70871a, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawRoundRect-ZuiqVtQ */
    public final void mo91drawRoundRectZuiqVtQ(p pVar, long j11, long j12, long j13, float f11, g gVar, t tVar, int i5) {
        int i11 = (int) (j11 >> 32);
        int i12 = (int) (j11 & 4294967295L);
        this.f70865a.f70863c.drawRoundRect(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j12 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j12 & 4294967295L)) + Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)), Float.intBitsToFloat((int) (j13 & 4294967295L)), b(pVar, gVar, f11, null, 3, 1));
    }

    @Override // k2.f
    /* renamed from: drawRoundRect-u-Aw5IA */
    public final void mo92drawRoundRectuAw5IA(long j11, long j12, long j13, long j14, g gVar, float f11, t tVar, int i5) {
        int i11 = (int) (j12 >> 32);
        int i12 = (int) (j12 & 4294967295L);
        this.f70865a.f70863c.drawRoundRect(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j13 & 4294967295L)) + Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j14 >> 32)), Float.intBitsToFloat((int) (j14 & 4294967295L)), a(this, j11, gVar, 1.0f, null, 3));
    }

    public final l0 g(g gVar) {
        if (Intrinsics.b(gVar, j.f70871a)) {
            m0 m0Var = this.f70867c;
            if (m0Var != null) {
                return m0Var;
            }
            m0 m0VarE = r0.e();
            m0VarE.x(0);
            this.f70867c = m0VarE;
            return m0VarE;
        }
        if (!(gVar instanceof k)) {
            throw new NoWhenBranchMatchedException();
        }
        m0 m0VarE2 = this.f70868d;
        if (m0VarE2 == null) {
            m0VarE2 = r0.e();
            m0VarE2.x(1);
            this.f70868d = m0VarE2;
        }
        Paint paint = (Paint) m0VarE2.f619b;
        k kVar = (k) gVar;
        if (paint.getStrokeWidth() != kVar.d()) {
            m0VarE2.w(kVar.d());
        }
        if (m0VarE2.e() != kVar.a()) {
            m0VarE2.t(kVar.a());
        }
        if (paint.getStrokeMiter() != kVar.c()) {
            m0VarE2.v(kVar.c());
        }
        if (m0VarE2.f() != kVar.b()) {
            m0VarE2.u(kVar.b());
        }
        if (!Intrinsics.b((o0) m0VarE2.f622e, null)) {
            m0VarE2.r(null);
        }
        return m0VarE2;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f70865a.f70861a.getDensity();
    }

    @Override // k2.f
    public final d getDrawContext() {
        return this.f70866b;
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f70865a.f70861a.getFontScale();
    }

    @Override // k2.f
    public final n getLayoutDirection() {
        return this.f70865a.f70862b;
    }
}
