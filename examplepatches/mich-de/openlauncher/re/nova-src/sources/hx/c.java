package hx;

import b.u4;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final int f60836a;

    /* renamed from: b, reason: collision with root package name */
    public final float f60837b;

    /* renamed from: c, reason: collision with root package name */
    public final int f60838c;

    /* renamed from: d, reason: collision with root package name */
    public final int f60839d;

    public c(int i5, float f11, int i11, int i12) {
        this.f60836a = i5;
        this.f60837b = f11;
        this.f60838c = i11;
        this.f60839d = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f60836a == cVar.f60836a && Float.compare(this.f60837b, cVar.f60837b) == 0 && this.f60838c == cVar.f60838c && this.f60839d == cVar.f60839d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f60839d) + u4.a(this.f60838c, a80.m.d(this.f60837b, Integer.hashCode(this.f60836a) * 31, 31), 31);
    }

    public final String toString() {
        return "IconAdMetrics(iconSizePx=" + this.f60836a + ", labelTextSizePx=" + this.f60837b + ", drawablePaddingPx=" + this.f60838c + ", cellHeightPx=" + this.f60839d + ")";
    }
}
