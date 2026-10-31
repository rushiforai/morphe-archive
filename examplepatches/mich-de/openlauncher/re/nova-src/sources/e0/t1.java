package e0;

/* loaded from: classes2.dex */
public final class t1 extends r1 {
    @Override // e0.r1, e0.p1
    public final void a(float f11, long j11, long j12) {
        if (!Float.isNaN(f11)) {
            this.f50115a.setZoom(f11);
        }
        if ((9223372034707292159L & j12) != 9205357640488583168L) {
            this.f50115a.show(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)), Float.intBitsToFloat((int) (j12 >> 32)), Float.intBitsToFloat((int) (j12 & 4294967295L)));
        } else {
            this.f50115a.show(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)));
        }
    }
}
