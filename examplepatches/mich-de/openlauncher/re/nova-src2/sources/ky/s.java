package ky;

import i2.j0;
import i2.k0;
import i2.r0;
import i2.v0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s implements v0 {

    /* renamed from: a, reason: collision with root package name */
    public final float f72850a;

    /* renamed from: b, reason: collision with root package name */
    public final s0.e f72851b;

    /* renamed from: c, reason: collision with root package name */
    public final s0.e f72852c;

    /* renamed from: d, reason: collision with root package name */
    public final s0.e f72853d;

    /* renamed from: e, reason: collision with root package name */
    public final s0.e f72854e;

    public s(float f11, s0.e eVar, s0.e eVar2, s0.e eVar3, s0.e eVar4) {
        this.f72850a = f11;
        this.f72851b = eVar;
        this.f72852c = eVar2;
        this.f72853d = eVar3;
        this.f72854e = eVar4;
    }

    @Override // i2.v0
    public final r0 a(long j11, y3.n nVar, y3.c cVar) {
        float fMo102toPx0680j_4 = cVar.mo102toPx0680j_4(this.f72851b.f86509a);
        float fMo102toPx0680j_42 = cVar.mo102toPx0680j_4(this.f72852c.f86509a);
        float fMo102toPx0680j_43 = cVar.mo102toPx0680j_4(this.f72853d.f86509a);
        float fMo102toPx0680j_44 = cVar.mo102toPx0680j_4(this.f72854e.f86509a);
        float fC = h2.e.c(j11);
        float f11 = fMo102toPx0680j_4 + fMo102toPx0680j_44;
        if (f11 > fC) {
            float f12 = fC / f11;
            fMo102toPx0680j_4 *= f12;
            fMo102toPx0680j_44 *= f12;
        }
        float f13 = fMo102toPx0680j_42 + fMo102toPx0680j_43;
        if (f13 > fC) {
            float f14 = fC / f13;
            fMo102toPx0680j_42 *= f14;
            fMo102toPx0680j_43 *= f14;
        }
        if (fMo102toPx0680j_4 < 0.0f || fMo102toPx0680j_42 < 0.0f || fMo102toPx0680j_43 < 0.0f || fMo102toPx0680j_44 < 0.0f) {
            throw new IllegalArgumentException(("Corner size in Px can't be negative(topStart = " + fMo102toPx0680j_4 + ", topEnd = " + fMo102toPx0680j_42 + ", bottomEnd = " + fMo102toPx0680j_43 + ", bottomStart = " + fMo102toPx0680j_44 + ")!").toString());
        }
        float fMo102toPx0680j_45 = cVar.mo102toPx0680j_4(this.f72850a);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32)) - fMo102toPx0680j_45;
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L)) - fMo102toPx0680j_45;
        h2.c cVar2 = new h2.c(fMo102toPx0680j_45, fMo102toPx0680j_45, fIntBitsToFloat, fIntBitsToFloat2);
        if (fMo102toPx0680j_4 + fMo102toPx0680j_42 + fMo102toPx0680j_43 + fMo102toPx0680j_44 == 0.0f) {
            return new j0(cVar2);
        }
        y3.n nVar2 = y3.n.f96612a;
        float f15 = nVar == nVar2 ? fMo102toPx0680j_4 : fMo102toPx0680j_42;
        long jFloatToRawIntBits = (Float.floatToRawIntBits(f15) & 4294967295L) | (Float.floatToRawIntBits(f15) << 32);
        if (nVar == nVar2) {
            fMo102toPx0680j_4 = fMo102toPx0680j_42;
        }
        long jFloatToRawIntBits2 = (Float.floatToRawIntBits(fMo102toPx0680j_4) & 4294967295L) | (Float.floatToRawIntBits(fMo102toPx0680j_4) << 32);
        float f16 = nVar == nVar2 ? fMo102toPx0680j_43 : fMo102toPx0680j_44;
        long jFloatToRawIntBits3 = (Float.floatToRawIntBits(f16) << 32) | (Float.floatToRawIntBits(f16) & 4294967295L);
        if (nVar != nVar2) {
            fMo102toPx0680j_44 = fMo102toPx0680j_43;
        }
        return new k0(new h2.d(fMo102toPx0680j_45, fMo102toPx0680j_45, fIntBitsToFloat, fIntBitsToFloat2, jFloatToRawIntBits, jFloatToRawIntBits2, jFloatToRawIntBits3, (Float.floatToRawIntBits(fMo102toPx0680j_44) << 32) | (Float.floatToRawIntBits(fMo102toPx0680j_44) & 4294967295L)));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!s.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type com.teslacoilsw.launcher.composeui.fancypref.InsetRoundedCornerShape");
        s sVar = (s) obj;
        return y3.f.a(this.f72850a, sVar.f72850a) && this.f72851b.equals(sVar.f72851b) && this.f72852c.equals(sVar.f72852c) && this.f72853d.equals(sVar.f72853d) && this.f72854e.equals(sVar.f72854e);
    }

    public final int hashCode() {
        return Float.hashCode(this.f72854e.f86509a) + a80.m.d(this.f72853d.f86509a, a80.m.d(this.f72852c.f86509a, a80.m.d(this.f72851b.f86509a, Float.hashCode(this.f72850a) * 31, 31), 31), 31);
    }
}
