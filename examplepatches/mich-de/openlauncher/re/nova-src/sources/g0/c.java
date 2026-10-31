package g0;

/* loaded from: classes2.dex */
public interface c {

    /* renamed from: a, reason: collision with root package name */
    public static final b f56471a = b.f56462a;

    static c0.l1 b() {
        f56471a.getClass();
        return b.f56463b;
    }

    default float a(float f11, float f12, float f13) {
        f56471a.getClass();
        float f14 = f12 + f11;
        if ((f11 >= 0.0f && f14 <= f13) || (f11 < 0.0f && f14 > f13)) {
            return 0.0f;
        }
        float f15 = f14 - f13;
        return Math.abs(f11) < Math.abs(f15) ? f11 : f15;
    }
}
