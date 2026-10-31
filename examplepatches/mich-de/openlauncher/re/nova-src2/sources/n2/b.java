package n2;

import i2.s;
import i2.t;
import k2.f;
import kotlin.ULong;

/* loaded from: classes2.dex */
public final class b extends c {

    /* renamed from: e, reason: collision with root package name */
    public final long f77705e;

    /* renamed from: g, reason: collision with root package name */
    public t f77707g;

    /* renamed from: f, reason: collision with root package name */
    public float f77706f = 1.0f;

    /* renamed from: h, reason: collision with root package name */
    public final long f77708h = 9205357640488583168L;

    public b(long j11) {
        this.f77705e = j11;
    }

    @Override // n2.c
    public final void b(float f11) {
        this.f77706f = f11;
    }

    @Override // n2.c
    public final void c(t tVar) {
        this.f77707g = tVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        long j11 = ((b) obj).f77705e;
        int i5 = s.n;
        return ULong.a(this.f77705e, j11);
    }

    @Override // n2.c
    public final long f() {
        return this.f77708h;
    }

    @Override // n2.c
    public final void h(f fVar) {
        f.s(fVar, this.f77705e, 0L, 0L, this.f77706f, this.f77707g, 86);
    }

    public final int hashCode() {
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f77705e);
    }

    public final String toString() {
        return "ColorPainter(color=" + ((Object) s.h(this.f77705e)) + ')';
    }
}
