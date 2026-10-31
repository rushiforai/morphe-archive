package fe;

import java.util.Locale;

/* loaded from: classes3.dex */
public final class g1 implements e {

    /* renamed from: d, reason: collision with root package name */
    public static final g1 f54796d = new g1(1.0f, 1.0f);

    /* renamed from: a, reason: collision with root package name */
    public final float f54797a;

    /* renamed from: b, reason: collision with root package name */
    public final float f54798b;

    /* renamed from: c, reason: collision with root package name */
    public final int f54799c;

    public g1(float f11, float f12) {
        wf.a.e(f11 > 0.0f);
        wf.a.e(f12 > 0.0f);
        this.f54797a = f11;
        this.f54798b = f12;
        this.f54799c = Math.round(f11 * 1000.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && g1.class == obj.getClass()) {
            g1 g1Var = (g1) obj;
            if (this.f54797a == g1Var.f54797a && this.f54798b == g1Var.f54798b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Float.floatToRawIntBits(this.f54798b) + ((Float.floatToRawIntBits(this.f54797a) + 527) * 31);
    }

    public final String toString() {
        Object[] objArr = {Float.valueOf(this.f54797a), Float.valueOf(this.f54798b)};
        int i5 = wf.v.f94376a;
        return String.format(Locale.US, "PlaybackParameters(speed=%.2f, pitch=%.2f)", objArr);
    }
}
