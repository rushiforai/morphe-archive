package com.amplitude;

import android.graphics.Paint;
import android.graphics.Shader;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ULong;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.amplitude.c, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public final class C0391c implements k2.f, k2.c {

    /* renamed from: a, reason: collision with root package name */
    public final C0360a f20501a;

    /* renamed from: b, reason: collision with root package name */
    public final C0385b f20502b;

    /* renamed from: c, reason: collision with root package name */
    public i2.l0 f20503c;

    /* renamed from: d, reason: collision with root package name */
    public i2.l0 f20504d;

    /* renamed from: e, reason: collision with root package name */
    public float f20505e;

    public C0391c(C0360a drawParams) {
        Intrinsics.g(drawParams, "drawParams");
        this.f20501a = drawParams;
        this.f20502b = new C0385b(this);
        this.f20505e = 1.0f;
    }

    public final i2.l0 a(k2.g gVar) {
        if (Intrinsics.b(gVar, k2.j.f70871a)) {
            i2.l0 l0Var = this.f20503c;
            if (l0Var != null) {
                return l0Var;
            }
            aa.m0 m0VarE = i2.r0.e();
            m0VarE.x(0);
            this.f20503c = m0VarE;
            m0VarE.m(this.f20505e);
            return m0VarE;
        }
        if (!(gVar instanceof k2.k)) {
            throw new NoWhenBranchMatchedException();
        }
        i2.l0 l0Var2 = this.f20504d;
        i2.l0 l0Var3 = l0Var2;
        if (l0Var2 == null) {
            aa.m0 m0VarE2 = i2.r0.e();
            m0VarE2.x(1);
            this.f20504d = m0VarE2;
            m0VarE2.m(this.f20505e);
            l0Var3 = m0VarE2;
        }
        aa.m0 m0Var = (aa.m0) l0Var3;
        Paint paint = (Paint) m0Var.f619b;
        k2.k kVar = (k2.k) gVar;
        if (paint.getStrokeWidth() != kVar.d()) {
            m0Var.w(kVar.d());
        }
        if (m0Var.e() != kVar.a()) {
            m0Var.t(kVar.a());
        }
        if (paint.getStrokeMiter() != kVar.c()) {
            m0Var.v(kVar.c());
        }
        if (m0Var.f() != kVar.b()) {
            m0Var.u(kVar.b());
        }
        if (!Intrinsics.b((i2.o0) m0Var.f622e, null)) {
            m0Var.r(null);
        }
        return l0Var3;
    }

    /* renamed from: drawArc-illE91I, reason: not valid java name */
    public final void m113drawArcillE91I(i2.p brush, float f11, float f12, boolean z11, long j11, long j12, float f13, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(brush, "brush");
        Intrinsics.g(style, "style");
        int i11 = (int) (j11 >> 32);
        int i12 = (int) (j11 & 4294967295L);
        this.f20501a.f20461c.drawArc(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j12 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j12 & 4294967295L)) + Float.intBitsToFloat(i12), f11, f12, z11, a(this, brush, style, f13, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawArc-yD3GUKo */
    public final void mo80drawArcyD3GUKo(long j11, float f11, float f12, boolean z11, long j12, long j13, float f13, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(style, "style");
        int i11 = (int) (j12 >> 32);
        int i12 = (int) (j12 & 4294967295L);
        this.f20501a.f20461c.drawArc(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j13 & 4294967295L)) + Float.intBitsToFloat(i12), f11, f12, z11, a(this, j11, style, f13, tVar, i5));
    }

    /* renamed from: drawCircle-V9BoPsw, reason: not valid java name */
    public final void m114drawCircleV9BoPsw(i2.p brush, float f11, long j11, float f12, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(brush, "brush");
        Intrinsics.g(style, "style");
        this.f20501a.f20461c.mo16drawCircle9KIMszo(j11, f11, a(this, brush, style, f12, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawCircle-VaOC9Bg */
    public final void mo81drawCircleVaOC9Bg(long j11, float f11, long j12, float f12, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(style, "style");
        this.f20501a.f20461c.mo16drawCircle9KIMszo(j12, f11, a(this, j11, style, f12, tVar, i5));
    }

    @Override // k2.c
    public final void drawContent() {
    }

    /* renamed from: drawImage-9jGpkUE, reason: not valid java name */
    public final void m115drawImage9jGpkUE(i2.c0 image, long j11, long j12, long j13, long j14, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(image, "image");
        Intrinsics.g(style, "style");
        this.f20501a.f20461c.mo18drawImageRectHPBpro0(image, j11, j12, j13, j14, a(this, (i2.p) null, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawImage-AZ2fEMs */
    public final void mo82drawImageAZ2fEMs(i2.c0 image, long j11, long j12, long j13, long j14, float f11, k2.g style, i2.t tVar, int i5, int i11) {
        Intrinsics.g(image, "image");
        Intrinsics.g(style, "style");
        this.f20501a.f20461c.mo18drawImageRectHPBpro0(image, j11, j12, j13, j14, a((i2.p) null, style, f11, tVar, i5, i11));
    }

    @Override // k2.f
    /* renamed from: drawImage-gbVJVH8 */
    public final void mo83drawImagegbVJVH8(i2.c0 image, long j11, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(image, "image");
        Intrinsics.g(style, "style");
        this.f20501a.f20461c.mo17drawImaged4ec7I(image, j11, a(this, (i2.p) null, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawLine-1RTmtNc */
    public final void mo84drawLine1RTmtNc(i2.p brush, long j11, long j12, float f11, int i5, i2.o0 o0Var, float f12, i2.t tVar, int i11) {
        Intrinsics.g(brush, "brush");
        this.f20501a.f20461c.mo19drawLineWko1d7g(j11, j12, a(this, brush, f11, i5, 0, o0Var, f12, tVar, i11));
    }

    @Override // k2.f
    /* renamed from: drawLine-NGM6Ib0 */
    public final void mo85drawLineNGM6Ib0(long j11, long j12, long j13, float f11, int i5, i2.o0 o0Var, float f12, i2.t tVar, int i11) {
        this.f20501a.f20461c.mo19drawLineWko1d7g(j12, j13, a(this, j11, f11, i5, 0, o0Var, f12, tVar, i11));
    }

    /* renamed from: drawOval-AsUm42w, reason: not valid java name */
    public final void m116drawOvalAsUm42w(i2.p brush, long j11, long j12, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(brush, "brush");
        Intrinsics.g(style, "style");
        int i11 = (int) (j11 >> 32);
        int i12 = (int) (j11 & 4294967295L);
        this.f20501a.f20461c.drawOval(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j12 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (4294967295L & j12)) + Float.intBitsToFloat(i12), a(this, brush, style, f11, tVar, i5));
    }

    /* renamed from: drawOval-n-J9OG0, reason: not valid java name */
    public final void m117drawOvalnJ9OG0(long j11, long j12, long j13, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(style, "style");
        int i11 = (int) (j12 >> 32);
        int i12 = (int) (j12 & 4294967295L);
        this.f20501a.f20461c.drawOval(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j13 & 4294967295L)) + Float.intBitsToFloat(i12), a(this, j11, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawPath-GBMwjPU */
    public final void mo86drawPathGBMwjPU(i2.n0 path, i2.p brush, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(path, "path");
        Intrinsics.g(brush, "brush");
        Intrinsics.g(style, "style");
        this.f20501a.f20461c.drawPath(path, a(this, brush, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawPath-LG529CI */
    public final void mo87drawPathLG529CI(i2.n0 path, long j11, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(path, "path");
        Intrinsics.g(style, "style");
        this.f20501a.f20461c.drawPath(path, a(this, j11, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawPoints-F8ZwMP8 */
    public final void mo88drawPointsF8ZwMP8(List points, int i5, long j11, float f11, int i11, i2.o0 o0Var, float f12, i2.t tVar, int i12) {
        Intrinsics.g(points, "points");
        this.f20501a.f20461c.mo20drawPointsO7TthRY(i5, points, a(this, j11, f11, i11, 0, o0Var, f12, tVar, i12));
    }

    /* renamed from: drawPoints-Gsft0Ws, reason: not valid java name */
    public final void m118drawPointsGsft0Ws(List points, int i5, i2.p brush, float f11, int i11, i2.o0 o0Var, float f12, i2.t tVar, int i12) {
        Intrinsics.g(points, "points");
        Intrinsics.g(brush, "brush");
        this.f20501a.f20461c.mo20drawPointsO7TthRY(i5, points, a(this, brush, f11, i11, 0, o0Var, f12, tVar, i12));
    }

    @Override // k2.f
    /* renamed from: drawRect-AsUm42w */
    public final void mo89drawRectAsUm42w(i2.p brush, long j11, long j12, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(brush, "brush");
        Intrinsics.g(style, "style");
        int i11 = (int) (j11 >> 32);
        int i12 = (int) (j11 & 4294967295L);
        this.f20501a.f20461c.drawRect(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j12 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (4294967295L & j12)) + Float.intBitsToFloat(i12), a(this, brush, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawRect-n-J9OG0 */
    public final void mo90drawRectnJ9OG0(long j11, long j12, long j13, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(style, "style");
        int i11 = (int) (j12 >> 32);
        int i12 = (int) (j12 & 4294967295L);
        this.f20501a.f20461c.drawRect(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j13 & 4294967295L)) + Float.intBitsToFloat(i12), a(this, j11, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawRoundRect-ZuiqVtQ */
    public final void mo91drawRoundRectZuiqVtQ(i2.p brush, long j11, long j12, long j13, float f11, k2.g style, i2.t tVar, int i5) {
        Intrinsics.g(brush, "brush");
        Intrinsics.g(style, "style");
        int i11 = (int) (j11 >> 32);
        int i12 = (int) (j11 & 4294967295L);
        this.f20501a.f20461c.drawRoundRect(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j12 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j12 & 4294967295L)) + Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)), Float.intBitsToFloat((int) (j13 & 4294967295L)), a(this, brush, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: drawRoundRect-u-Aw5IA */
    public final void mo92drawRoundRectuAw5IA(long j11, long j12, long j13, long j14, k2.g style, float f11, i2.t tVar, int i5) {
        Intrinsics.g(style, "style");
        int i11 = (int) (j12 >> 32);
        int i12 = (int) (j12 & 4294967295L);
        this.f20501a.f20461c.drawRoundRect(Float.intBitsToFloat(i11), Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j13 >> 32)) + Float.intBitsToFloat(i11), Float.intBitsToFloat((int) (j13 & 4294967295L)) + Float.intBitsToFloat(i12), Float.intBitsToFloat((int) (j14 >> 32)), Float.intBitsToFloat((int) (j14 & 4294967295L)), a(this, j11, style, f11, tVar, i5));
    }

    @Override // k2.f
    /* renamed from: getCenter-F1C5BW0 */
    public /* bridge */ /* synthetic */ long mo93getCenterF1C5BW0() {
        return super.mo93getCenterF1C5BW0();
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f20501a.f20459a.getDensity();
    }

    @Override // k2.f
    public final k2.d getDrawContext() {
        return this.f20502b;
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f20501a.f20459a.getFontScale();
    }

    @Override // k2.f
    public final y3.n getLayoutDirection() {
        return this.f20501a.f20460b;
    }

    @Override // k2.f
    /* renamed from: getSize-NH-jbRc */
    public /* bridge */ /* synthetic */ long mo94getSizeNHjbRc() {
        return super.mo94getSizeNHjbRc();
    }

    /* renamed from: record-JVtK1S4, reason: not valid java name */
    public void m119recordJVtK1S4(@NotNull l2.b bVar, long j11, @NotNull Function1 function1) {
        bVar.e(this, getLayoutDirection(), j11, new b0.e(7, this, function1));
    }

    @Override // y3.c
    /* renamed from: roundToPx--R2X_6o */
    public /* bridge */ /* synthetic */ int mo95roundToPxR2X_6o(long j11) {
        return super.mo95roundToPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: roundToPx-0680j_4 */
    public /* bridge */ /* synthetic */ int mo96roundToPx0680j_4(float f11) {
        return super.mo96roundToPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-GaN1DYA */
    public /* bridge */ /* synthetic */ float mo97toDpGaN1DYA(long j11) {
        return super.mo97toDpGaN1DYA(j11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public /* bridge */ /* synthetic */ float mo99toDpu2uoSUM(int i5) {
        return super.mo99toDpu2uoSUM(i5);
    }

    @Override // y3.c
    /* renamed from: toDpSize-k-rfVVM */
    public /* bridge */ /* synthetic */ long mo100toDpSizekrfVVM(long j11) {
        return super.mo100toDpSizekrfVVM(j11);
    }

    @Override // y3.c
    /* renamed from: toPx--R2X_6o */
    public /* bridge */ /* synthetic */ float mo101toPxR2X_6o(long j11) {
        return super.mo101toPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: toPx-0680j_4 */
    public float mo102toPx0680j_4(float f11) {
        return getDensity() * f11;
    }

    @NotNull
    public h2.c toRect(@NotNull y3.h hVar) {
        throw null;
    }

    @Override // y3.c
    /* renamed from: toSize-XkaWNTQ */
    public /* bridge */ /* synthetic */ long mo103toSizeXkaWNTQ(long j11) {
        return super.mo103toSizeXkaWNTQ(j11);
    }

    @Override // y3.c
    /* renamed from: toSp-0xMU5do */
    public /* bridge */ /* synthetic */ long mo104toSp0xMU5do(float f11) {
        return super.mo104toSp0xMU5do(f11);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public /* bridge */ /* synthetic */ long mo105toSpkPz2Gy4(float f11) {
        return super.mo105toSpkPz2Gy4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public float mo98toDpu2uoSUM(float f11) {
        return f11 / getDensity();
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public /* bridge */ /* synthetic */ long mo106toSpkPz2Gy4(int i5) {
        return super.mo106toSpkPz2Gy4(i5);
    }

    public static /* synthetic */ i2.l0 a(C0391c c0391c, i2.p pVar, k2.g gVar, float f11, i2.t tVar, int i5) {
        return c0391c.a(pVar, gVar, f11, tVar, i5, 1);
    }

    public final i2.l0 a(i2.p pVar, k2.g gVar, float f11, i2.t tVar, int i5, int i11) {
        i2.l0 l0VarA = a(gVar);
        if (pVar != null) {
            pVar.a(mo94getSizeNHjbRc(), f11 * this.f20505e, l0VarA);
        } else {
            if (((Shader) ((aa.m0) l0VarA).f620c) != null) {
                ((aa.m0) l0VarA).s(null);
            }
            aa.m0 m0Var = (aa.m0) l0VarA;
            long jD = m0Var.d();
            int i12 = i2.s.n;
            long j11 = i2.s.f61136b;
            if (!ULong.a(jD, j11)) {
                m0Var.o(j11);
            }
            m0Var.m(f11 * this.f20505e);
        }
        if (!Intrinsics.b((i2.t) ((aa.m0) l0VarA).f621d, tVar)) {
            ((aa.m0) l0VarA).p(tVar);
        }
        aa.m0 m0Var2 = (aa.m0) l0VarA;
        if (m0Var2.f618a != i5) {
            m0Var2.n(i5);
        }
        if (((Paint) m0Var2.f619b).isFilterBitmap() == i11) {
            return l0VarA;
        }
        m0Var2.q(i11);
        return l0VarA;
    }

    public static i2.l0 a(C0391c c0391c, long j11, k2.g gVar, float f11, i2.t tVar, int i5) {
        i2.l0 l0VarA = c0391c.a(gVar);
        float f12 = f11 * c0391c.f20505e;
        if (f12 != 1.0f) {
            j11 = i2.s.b(i2.s.c(j11) * f12, j11);
        }
        aa.m0 m0Var = (aa.m0) l0VarA;
        long jD = m0Var.d();
        int i11 = i2.s.n;
        if (!ULong.a(jD, j11)) {
            m0Var.o(j11);
        }
        if (((Shader) m0Var.f620c) != null) {
            m0Var.s(null);
        }
        if (!Intrinsics.b((i2.t) m0Var.f621d, tVar)) {
            m0Var.p(tVar);
        }
        if (m0Var.f618a != i5) {
            m0Var.n(i5);
        }
        if (((Paint) m0Var.f619b).isFilterBitmap()) {
            return m0Var;
        }
        m0Var.q(1);
        return m0Var;
    }

    public static i2.l0 a(C0391c c0391c, long j11, float f11, int i5, int i11, i2.o0 o0Var, float f12, i2.t tVar, int i12) {
        i2.l0 l0Var = c0391c.f20504d;
        i2.l0 l0Var2 = l0Var;
        if (l0Var == null) {
            aa.m0 m0VarE = i2.r0.e();
            m0VarE.x(1);
            c0391c.f20504d = m0VarE;
            m0VarE.m(c0391c.f20505e);
            l0Var2 = m0VarE;
        }
        float f13 = f12 * c0391c.f20505e;
        if (f13 != 1.0f) {
            j11 = i2.s.b(i2.s.c(j11) * f13, j11);
        }
        aa.m0 m0Var = (aa.m0) l0Var2;
        Paint paint = (Paint) m0Var.f619b;
        long jD = m0Var.d();
        int i13 = i2.s.n;
        if (!ULong.a(jD, j11)) {
            m0Var.o(j11);
        }
        if (((Shader) m0Var.f620c) != null) {
            m0Var.s(null);
        }
        if (!Intrinsics.b((i2.t) m0Var.f621d, tVar)) {
            m0Var.p(tVar);
        }
        if (m0Var.f618a != i12) {
            m0Var.n(i12);
        }
        if (paint.getStrokeWidth() != f11) {
            m0Var.w(f11);
        }
        if (paint.getStrokeMiter() != 4.0f) {
            m0Var.v(4.0f);
        }
        if (m0Var.e() != i5) {
            m0Var.t(i5);
        }
        if (m0Var.f() != i11) {
            m0Var.u(i11);
        }
        if (!Intrinsics.b((i2.o0) m0Var.f622e, o0Var)) {
            m0Var.r(o0Var);
        }
        if (paint.isFilterBitmap()) {
            return l0Var2;
        }
        m0Var.q(1);
        return l0Var2;
    }

    public static i2.l0 a(C0391c c0391c, i2.p pVar, float f11, int i5, int i11, i2.o0 o0Var, float f12, i2.t tVar, int i12) {
        i2.l0 l0Var = c0391c.f20504d;
        i2.l0 l0Var2 = l0Var;
        if (l0Var == null) {
            aa.m0 m0VarE = i2.r0.e();
            m0VarE.x(1);
            c0391c.f20504d = m0VarE;
            m0VarE.m(c0391c.f20505e);
            l0Var2 = m0VarE;
        }
        if (pVar != null) {
            pVar.a(c0391c.mo94getSizeNHjbRc(), f12 * c0391c.f20505e, l0Var2);
        } else {
            ((aa.m0) l0Var2).m(f12 * c0391c.f20505e);
        }
        aa.m0 m0Var = (aa.m0) l0Var2;
        Paint paint = (Paint) m0Var.f619b;
        if (!Intrinsics.b((i2.t) m0Var.f621d, tVar)) {
            m0Var.p(tVar);
        }
        if (m0Var.f618a != i12) {
            m0Var.n(i12);
        }
        if (paint.getStrokeWidth() != f11) {
            m0Var.w(f11);
        }
        if (paint.getStrokeMiter() != 4.0f) {
            m0Var.v(4.0f);
        }
        if (m0Var.e() != i5) {
            m0Var.t(i5);
        }
        if (m0Var.f() != i11) {
            m0Var.u(i11);
        }
        if (!Intrinsics.b((i2.o0) m0Var.f622e, o0Var)) {
            m0Var.r(o0Var);
        }
        if (paint.isFilterBitmap()) {
            return l0Var2;
        }
        m0Var.q(1);
        return l0Var2;
    }
}
