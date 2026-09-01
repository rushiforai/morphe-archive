package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vy0 implements xy0 {
    public final /* synthetic */ int b;

    public /* synthetic */ vy0(int i) {
        this.b = i;
    }

    @Override // defpackage.xy0
    public final float a(float f, float f2, float f3) {
        switch (this.b) {
            case 0:
                xy0.a.getClass();
                float f4 = f2 + f;
                if ((f >= 0.0f && f4 <= f3) || (f < 0.0f && f4 > f3)) {
                    return 0.0f;
                }
                float f5 = f4 - f3;
                return Math.abs(f) < Math.abs(f5) ? f : f5;
            default:
                float fAbs = Math.abs((f2 + f) - f);
                float f6 = (0.3f * f3) - (0.0f * fAbs);
                float f7 = f3 - f6;
                if ((fAbs <= f3) && f7 < fAbs) {
                    f6 = f3 - fAbs;
                }
                return f - f6;
        }
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:3:0x0002. Please report as an issue. */
    @Override // defpackage.xy0
    public final wlc b() {
        switch (this.b) {
        }
        xy0.a.getClass();
        return wy0.b;
    }
}
