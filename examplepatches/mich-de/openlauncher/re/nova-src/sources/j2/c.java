package j2;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f68655a;

    /* renamed from: b, reason: collision with root package name */
    public final long f68656b;

    /* renamed from: c, reason: collision with root package name */
    public final int f68657c;

    public c(String str, long j11, int i5) {
        this.f68655a = str;
        this.f68656b = j11;
        this.f68657c = i5;
        if (str.length() == 0) {
            throw new IllegalArgumentException("The name of a color space cannot be null and must contain at least 1 character");
        }
        if (i5 < -1 || i5 > 63) {
            throw new IllegalArgumentException("The id must be between -1 and 63");
        }
    }

    public abstract float a(int i5);

    public abstract float b(int i5);

    public boolean c() {
        return false;
    }

    public abstract long d(float f11, float f12, float f13);

    public abstract float e(float f11, float f12, float f13);

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        c cVar = (c) obj;
        if (this.f68657c == cVar.f68657c && Intrinsics.b(this.f68655a, cVar.f68655a)) {
            return b.a(this.f68656b, cVar.f68656b);
        }
        return false;
    }

    public abstract long f(float f11, float f12, float f13, float f14, c cVar);

    public int hashCode() {
        int iHashCode = this.f68655a.hashCode() * 31;
        int i5 = b.f68654e;
        return c0.d(iHashCode, 31, this.f68656b) + this.f68657c;
    }

    public final String toString() {
        return this.f68655a + " (id=" + this.f68657c + ", model=" + ((Object) b.b(this.f68656b)) + ')';
    }
}
