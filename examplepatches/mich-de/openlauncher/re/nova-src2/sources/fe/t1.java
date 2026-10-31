package fe;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class t1 extends q1 {

    /* renamed from: b, reason: collision with root package name */
    public final int f54988b;

    /* renamed from: c, reason: collision with root package name */
    public final float f54989c;

    public t1(int i5) {
        wf.a.d("maxStars must be a positive integer", i5 > 0);
        this.f54988b = i5;
        this.f54989c = -1.0f;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof t1)) {
            return false;
        }
        t1 t1Var = (t1) obj;
        return this.f54988b == t1Var.f54988b && this.f54989c == t1Var.f54989c;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f54988b), Float.valueOf(this.f54989c)});
    }

    public t1(int i5, float f11) {
        boolean z11 = false;
        wf.a.d("maxStars must be a positive integer", i5 > 0);
        if (f11 >= 0.0f && f11 <= i5) {
            z11 = true;
        }
        wf.a.d("starRating is out of range [0, maxStars]", z11);
        this.f54988b = i5;
        this.f54989c = f11;
    }
}
