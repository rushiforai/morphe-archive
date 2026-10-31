package a5;

import android.view.animation.Interpolator;

/* loaded from: classes.dex */
public abstract class s1 {

    /* renamed from: a, reason: collision with root package name */
    public final int f362a;

    /* renamed from: b, reason: collision with root package name */
    public float f363b;

    /* renamed from: c, reason: collision with root package name */
    public final Interpolator f364c;

    /* renamed from: d, reason: collision with root package name */
    public final long f365d;

    public s1(int i5, Interpolator interpolator, long j11) {
        this.f362a = i5;
        this.f364c = interpolator;
        this.f365d = j11;
    }

    public long a() {
        return this.f365d;
    }

    public float b() {
        Interpolator interpolator = this.f364c;
        return interpolator != null ? interpolator.getInterpolation(this.f363b) : this.f363b;
    }

    public int c() {
        return this.f362a;
    }

    public void d(float f11) {
        this.f363b = f11;
    }
}
