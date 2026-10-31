package x3;

import kotlin.ULong;

/* loaded from: classes.dex */
public final class c implements o {

    /* renamed from: a, reason: collision with root package name */
    public final long f95004a;

    public c(long j11) {
        this.f95004a = j11;
        if (j11 != 16) {
            return;
        }
        s3.a.a("ColorStyle value must be specified, use TextForegroundStyle.Unspecified instead.");
    }

    @Override // x3.o
    public final float a() {
        return i2.s.c(this.f95004a);
    }

    @Override // x3.o
    public final long b() {
        return this.f95004a;
    }

    @Override // x3.o
    public final i2.p c() {
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        long j11 = ((c) obj).f95004a;
        int i5 = i2.s.n;
        return ULong.a(this.f95004a, j11);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f95004a);
    }

    public final String toString() {
        return "ColorStyle(value=" + ((Object) i2.s.h(this.f95004a)) + ')';
    }
}
