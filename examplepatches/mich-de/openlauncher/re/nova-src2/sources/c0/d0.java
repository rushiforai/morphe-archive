package c0;

/* loaded from: classes.dex */
public interface d0 extends m {
    @Override // c0.m
    default j2 a(i2 i2Var) {
        return new x7.n(this);
    }

    default float b(float f11, float f12, float f13) {
        return d(e(f11, f12, f13), f11, f12, f13);
    }

    float c(long j11, float f11, float f12, float f13);

    float d(long j11, float f11, float f12, float f13);

    long e(float f11, float f12, float f13);
}
