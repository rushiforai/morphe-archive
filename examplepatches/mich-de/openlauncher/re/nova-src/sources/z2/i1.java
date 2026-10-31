package z2;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class i1 {

    /* renamed from: a, reason: collision with root package name */
    public int f98081a;

    /* renamed from: b, reason: collision with root package name */
    public int f98082b;

    /* renamed from: c, reason: collision with root package name */
    public long f98083c;

    /* renamed from: d, reason: collision with root package name */
    public long f98084d = k1.f98100a;

    /* renamed from: e, reason: collision with root package name */
    public long f98085e = 0;

    public i1() {
        long j11 = 0;
        this.f98083c = (j11 & 4294967295L) | (j11 << 32);
    }

    public abstract int O(n nVar);

    public int P() {
        return (int) (this.f98083c & 4294967295L);
    }

    public int Q() {
        return (int) (this.f98083c >> 32);
    }

    public final void R() {
        this.f98081a = kotlin.ranges.a.e0((int) (this.f98083c >> 32), y3.a.j(this.f98084d), y3.a.h(this.f98084d));
        this.f98082b = kotlin.ranges.a.e0((int) (this.f98083c & 4294967295L), y3.a.i(this.f98084d), y3.a.g(this.f98084d));
        int i5 = this.f98081a;
        long j11 = this.f98083c;
        this.f98085e = (((i5 - ((int) (j11 >> 32))) / 2) << 32) | (4294967295L & ((r0 - ((int) (j11 & 4294967295L))) / 2));
    }

    public abstract void S(float f11, long j11, Function1 function1);

    public void T(long j11, float f11, l2.b bVar) {
        S(f11, j11, null);
    }

    public final void U(long j11) {
        if (y3.m.a(this.f98083c, j11)) {
            return;
        }
        this.f98083c = j11;
        R();
    }

    public final void V(long j11) {
        if (y3.a.b(this.f98084d, j11)) {
            return;
        }
        this.f98084d = j11;
        R();
    }

    public Object k() {
        return null;
    }
}
