package n0;

import java.util.List;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import z2.w1;

/* loaded from: classes.dex */
public final class f0 implements z2.t0 {

    /* renamed from: a, reason: collision with root package name */
    public final b0 f77414a;

    /* renamed from: b, reason: collision with root package name */
    public final w1 f77415b;

    /* renamed from: c, reason: collision with root package name */
    public final d0 f77416c;

    /* renamed from: d, reason: collision with root package name */
    public final z.c0 f77417d;

    public f0(b0 b0Var, w1 w1Var) {
        this.f77414a = b0Var;
        this.f77415b = w1Var;
        this.f77416c = (d0) b0Var.f77396b.invoke();
        z.n.a();
        this.f77417d = new z.c0();
    }

    @Override // z2.t0
    public final z2.s0 K(int i5, int i11, Map map, Function1 function1, Function1 function12) {
        return this.f77415b.K(i5, i11, map, function1, function12);
    }

    public final List a(int i5) {
        z.c0 c0Var = this.f77417d;
        List list = (List) c0Var.b(i5);
        if (list != null) {
            return list;
        }
        d0 d0Var = this.f77416c;
        Object objD = d0Var.d(i5);
        List listC = this.f77415b.c(objD, this.f77414a.a(i5, objD, d0Var.b(i5)));
        c0Var.h(i5, listC);
        return listC;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f77415b.getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f77415b.getFontScale();
    }

    @Override // z2.t
    public final y3.n getLayoutDirection() {
        return this.f77415b.getLayoutDirection();
    }

    @Override // z2.t
    public final boolean l() {
        return this.f77415b.l();
    }

    @Override // y3.c
    /* renamed from: roundToPx--R2X_6o */
    public final int mo95roundToPxR2X_6o(long j11) {
        return this.f77415b.mo95roundToPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: roundToPx-0680j_4 */
    public final int mo96roundToPx0680j_4(float f11) {
        return this.f77415b.mo96roundToPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-GaN1DYA */
    public final float mo97toDpGaN1DYA(long j11) {
        return this.f77415b.mo97toDpGaN1DYA(j11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public final float mo99toDpu2uoSUM(int i5) {
        return this.f77415b.mo99toDpu2uoSUM(i5);
    }

    @Override // y3.c
    /* renamed from: toDpSize-k-rfVVM */
    public final long mo100toDpSizekrfVVM(long j11) {
        return this.f77415b.mo100toDpSizekrfVVM(j11);
    }

    @Override // y3.c
    /* renamed from: toPx--R2X_6o */
    public final float mo101toPxR2X_6o(long j11) {
        return this.f77415b.mo101toPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: toPx-0680j_4 */
    public final float mo102toPx0680j_4(float f11) {
        return this.f77415b.mo102toPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toSize-XkaWNTQ */
    public final long mo103toSizeXkaWNTQ(long j11) {
        return this.f77415b.mo103toSizeXkaWNTQ(j11);
    }

    @Override // y3.c
    /* renamed from: toSp-0xMU5do */
    public final long mo104toSp0xMU5do(float f11) {
        return this.f77415b.mo104toSp0xMU5do(f11);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public final long mo105toSpkPz2Gy4(float f11) {
        return this.f77415b.mo105toSpkPz2Gy4(f11);
    }

    @Override // z2.t0
    public final z2.s0 y(int i5, int i11, Map map, Function1 function1) {
        return this.f77415b.y(i5, i11, map, function1);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public final float mo98toDpu2uoSUM(float f11) {
        return this.f77415b.mo98toDpu2uoSUM(f11);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public final long mo106toSpkPz2Gy4(int i5) {
        return this.f77415b.mo106toSpkPz2Gy4(i5);
    }
}
