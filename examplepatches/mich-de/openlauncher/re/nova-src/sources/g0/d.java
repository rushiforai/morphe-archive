package g0;

/* loaded from: classes2.dex */
public final class d implements c {
    @Override // g0.c
    public final float a(float f11, float f12, float f13) {
        float fAbs = Math.abs((f12 + f11) - f11);
        float f14 = (0.3f * f13) - (0.0f * fAbs);
        float f15 = f13 - f14;
        if ((fAbs <= f13) && f15 < fAbs) {
            f14 = f13 - fAbs;
        }
        return f11 - f14;
    }
}
