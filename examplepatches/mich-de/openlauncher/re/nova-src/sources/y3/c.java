package y3;

import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes.dex */
public interface c {
    float getDensity();

    float getFontScale();

    /* renamed from: roundToPx--R2X_6o */
    default int mo95roundToPxR2X_6o(long j11) {
        return Math.round(mo101toPxR2X_6o(j11));
    }

    /* renamed from: roundToPx-0680j_4 */
    default int mo96roundToPx0680j_4(float f11) {
        float fMo102toPx0680j_4 = mo102toPx0680j_4(f11);
        return Float.isInfinite(fMo102toPx0680j_4) ? LayoutNode.NotPlacedPlaceOrder : Math.round(fMo102toPx0680j_4);
    }

    /* renamed from: toDp-GaN1DYA */
    default float mo97toDpGaN1DYA(long j11) {
        float fC;
        float fontScale;
        if (!q.a(p.b(j11), 4294967296L)) {
            j.b("Only Sp can convert to Px");
        }
        float[] fArr = z3.b.f98187a;
        if (getFontScale() >= 1.03f) {
            z3.a aVarA = z3.b.a(getFontScale());
            fC = p.c(j11);
            if (aVarA != null) {
                return aVarA.b(fC);
            }
            fontScale = getFontScale();
        } else {
            fC = p.c(j11);
            fontScale = getFontScale();
        }
        return fontScale * fC;
    }

    /* renamed from: toDp-u2uoSUM */
    default float mo99toDpu2uoSUM(int i5) {
        return i5 / getDensity();
    }

    /* renamed from: toDpSize-k-rfVVM */
    default long mo100toDpSizekrfVVM(long j11) {
        if (j11 != 9205357640488583168L) {
            return vm.d.a(mo98toDpu2uoSUM(Float.intBitsToFloat((int) (j11 >> 32))), mo98toDpu2uoSUM(Float.intBitsToFloat((int) (j11 & 4294967295L))));
        }
        return 9205357640488583168L;
    }

    /* renamed from: toPx--R2X_6o */
    default float mo101toPxR2X_6o(long j11) {
        if (!q.a(p.b(j11), 4294967296L)) {
            j.b("Only Sp can convert to Px");
        }
        return mo102toPx0680j_4(mo97toDpGaN1DYA(j11));
    }

    /* renamed from: toPx-0680j_4 */
    default float mo102toPx0680j_4(float f11) {
        return getDensity() * f11;
    }

    /* renamed from: toSize-XkaWNTQ */
    default long mo103toSizeXkaWNTQ(long j11) {
        if (j11 == 9205357640488583168L) {
            return 9205357640488583168L;
        }
        float fMo102toPx0680j_4 = mo102toPx0680j_4(i.b(j11));
        float fMo102toPx0680j_42 = mo102toPx0680j_4(i.a(j11));
        return (Float.floatToRawIntBits(fMo102toPx0680j_42) & 4294967295L) | (Float.floatToRawIntBits(fMo102toPx0680j_4) << 32);
    }

    /* renamed from: toSp-0xMU5do */
    default long mo104toSp0xMU5do(float f11) {
        float[] fArr = z3.b.f98187a;
        if (getFontScale() < 1.03f) {
            return w20.h.m(f11 / getFontScale(), 4294967296L);
        }
        z3.a aVarA = z3.b.a(getFontScale());
        return w20.h.m(aVarA != null ? aVarA.a(f11) : f11 / getFontScale(), 4294967296L);
    }

    /* renamed from: toSp-kPz2Gy4 */
    default long mo106toSpkPz2Gy4(int i5) {
        return mo104toSp0xMU5do(mo99toDpu2uoSUM(i5));
    }

    /* renamed from: toDp-u2uoSUM */
    default float mo98toDpu2uoSUM(float f11) {
        return f11 / getDensity();
    }

    /* renamed from: toSp-kPz2Gy4 */
    default long mo105toSpkPz2Gy4(float f11) {
        return mo104toSp0xMU5do(mo98toDpu2uoSUM(f11));
    }
}
