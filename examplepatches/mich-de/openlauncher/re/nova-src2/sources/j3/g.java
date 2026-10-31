package j3;

import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes2.dex */
public final class g {

    /* renamed from: d, reason: collision with root package name */
    public static final g f68781d = new g(0.0f, new p70.a(0.0f, 0.0f), 0);

    /* renamed from: a, reason: collision with root package name */
    public final float f68782a;

    /* renamed from: b, reason: collision with root package name */
    public final ClosedFloatingPointRange f68783b;

    /* renamed from: c, reason: collision with root package name */
    public final int f68784c;

    public g(float f11, ClosedFloatingPointRange closedFloatingPointRange, int i5) {
        this.f68782a = f11;
        this.f68783b = closedFloatingPointRange;
        this.f68784c = i5;
        if (Float.isNaN(f11)) {
            throw new IllegalArgumentException("current must not be NaN");
        }
    }

    public final float a() {
        return this.f68782a;
    }

    public final ClosedFloatingPointRange b() {
        return this.f68783b;
    }

    public final int c() {
        return this.f68784c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f68782a == gVar.f68782a && Intrinsics.b(this.f68783b, gVar.f68783b) && this.f68784c == gVar.f68784c;
    }

    public final int hashCode() {
        return ((this.f68783b.hashCode() + (Float.hashCode(this.f68782a) * 31)) * 31) + this.f68784c;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ProgressBarRangeInfo(current=");
        sb2.append(this.f68782a);
        sb2.append(", range=");
        sb2.append(this.f68783b);
        sb2.append(", steps=");
        return a2.c.m(sb2, this.f68784c, ')');
    }
}
