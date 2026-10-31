package z2;

import java.util.Map;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class x implements t0, t {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t f98172a;

    /* renamed from: b, reason: collision with root package name */
    public final y3.n f98173b;

    public x(t tVar, y3.n nVar) {
        this.f98172a = tVar;
        this.f98173b = nVar;
    }

    @Override // z2.t0
    public final s0 K(int i5, int i11, Map map, Function1 function1, Function1 function12) {
        if (i5 < 0) {
            i5 = 0;
        }
        if (i11 < 0) {
            i11 = 0;
        }
        if ((i5 & (-16777216)) != 0 || ((-16777216) & i11) != 0) {
            y2.a.b("Size(" + i5 + " x " + i11 + ") is out of range. Each dimension must be between 0 and 16777215.");
        }
        return new w(i5, i11, map, function1);
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f98172a.getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f98172a.getFontScale();
    }

    @Override // z2.t
    public final y3.n getLayoutDirection() {
        return this.f98173b;
    }

    @Override // z2.t
    public final boolean l() {
        return this.f98172a.l();
    }

    @Override // y3.c
    /* renamed from: roundToPx--R2X_6o */
    public final int mo95roundToPxR2X_6o(long j11) {
        return this.f98172a.mo95roundToPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: roundToPx-0680j_4 */
    public final int mo96roundToPx0680j_4(float f11) {
        return this.f98172a.mo96roundToPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-GaN1DYA */
    public final float mo97toDpGaN1DYA(long j11) {
        return this.f98172a.mo97toDpGaN1DYA(j11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public final float mo98toDpu2uoSUM(float f11) {
        return this.f98172a.mo98toDpu2uoSUM(f11);
    }

    @Override // y3.c
    /* renamed from: toDpSize-k-rfVVM */
    public final long mo100toDpSizekrfVVM(long j11) {
        return this.f98172a.mo100toDpSizekrfVVM(j11);
    }

    @Override // y3.c
    /* renamed from: toPx--R2X_6o */
    public final float mo101toPxR2X_6o(long j11) {
        return this.f98172a.mo101toPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: toPx-0680j_4 */
    public final float mo102toPx0680j_4(float f11) {
        return this.f98172a.mo102toPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toSize-XkaWNTQ */
    public final long mo103toSizeXkaWNTQ(long j11) {
        return this.f98172a.mo103toSizeXkaWNTQ(j11);
    }

    @Override // y3.c
    /* renamed from: toSp-0xMU5do */
    public final long mo104toSp0xMU5do(float f11) {
        return this.f98172a.mo104toSp0xMU5do(f11);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public final long mo105toSpkPz2Gy4(float f11) {
        return this.f98172a.mo105toSpkPz2Gy4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public final float mo99toDpu2uoSUM(int i5) {
        return this.f98172a.mo99toDpu2uoSUM(i5);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public final long mo106toSpkPz2Gy4(int i5) {
        return this.f98172a.mo106toSpkPz2Gy4(i5);
    }
}
