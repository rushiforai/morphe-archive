package defpackage;

import android.view.animation.Interpolator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class e4f {
    public final int a;
    public float b;
    public final Interpolator c;
    public final long d;

    public e4f(int i, Interpolator interpolator, long j) {
        this.a = i;
        this.c = interpolator;
        this.d = j;
    }

    public float a() {
        return 1.0f;
    }

    public long b() {
        return this.d;
    }

    public float c() {
        float f = this.b;
        Interpolator interpolator = this.c;
        return interpolator != null ? interpolator.getInterpolation(f) : f;
    }

    public int d() {
        return this.a;
    }

    public void e(float f) {
        this.b = f;
    }
}
