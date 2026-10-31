package fe;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class e1 extends q1 {

    /* renamed from: b, reason: collision with root package name */
    public final float f54752b;

    public e1() {
        this.f54752b = -1.0f;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof e1) {
            return this.f54752b == ((e1) obj).f54752b;
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Float.valueOf(this.f54752b)});
    }

    public e1(float f11) {
        wf.a.d("percent must be in the range of [0, 100]", f11 >= 0.0f && f11 <= 100.0f);
        this.f54752b = f11;
    }
}
