package m3;

import b.c9;
import b.u4;
import e10.z2;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final a f75962a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75963b;

    /* renamed from: c, reason: collision with root package name */
    public final int f75964c;

    /* renamed from: d, reason: collision with root package name */
    public final int f75965d;

    /* renamed from: e, reason: collision with root package name */
    public final int f75966e;

    /* renamed from: f, reason: collision with root package name */
    public final float f75967f;

    /* renamed from: g, reason: collision with root package name */
    public final float f75968g;

    public r(a aVar, int i5, int i11, int i12, int i13, float f11, float f12) {
        this.f75962a = aVar;
        this.f75963b = i5;
        this.f75964c = i11;
        this.f75965d = i12;
        this.f75966e = i13;
        this.f75967f = f11;
        this.f75968g = f12;
    }

    public final h2.c a(h2.c cVar) {
        return cVar.j((Float.floatToRawIntBits(0.0f) << 32) | (Float.floatToRawIntBits(this.f75967f) & 4294967295L));
    }

    public final long b(long j11, boolean z11) {
        if (z11) {
            long j12 = o0.f75944b;
            if (o0.b(j11, j12)) {
                return j12;
            }
        }
        int i5 = o0.f75945c;
        int i11 = (int) (j11 >> 32);
        int i12 = this.f75963b;
        return z2.u(i11 + i12, ((int) (j11 & 4294967295L)) + i12);
    }

    public final h2.c c(h2.c cVar) {
        float f11 = -this.f75967f;
        return cVar.j((Float.floatToRawIntBits(0.0f) << 32) | (Float.floatToRawIntBits(f11) & 4294967295L));
    }

    public final int d(int i5) {
        int i11 = this.f75964c;
        int i12 = this.f75963b;
        return kotlin.ranges.a.e0(i5, i12, i11) - i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return this.f75962a.equals(rVar.f75962a) && this.f75963b == rVar.f75963b && this.f75964c == rVar.f75964c && this.f75965d == rVar.f75965d && this.f75966e == rVar.f75966e && Float.compare(this.f75967f, rVar.f75967f) == 0 && Float.compare(this.f75968g, rVar.f75968g) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f75968g) + a80.m.d(this.f75967f, u4.a(this.f75966e, u4.a(this.f75965d, u4.a(this.f75964c, u4.a(this.f75963b, this.f75962a.hashCode() * 31, 31), 31), 31), 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ParagraphInfo(paragraph=");
        sb2.append(this.f75962a);
        sb2.append(", startIndex=");
        sb2.append(this.f75963b);
        sb2.append(", endIndex=");
        sb2.append(this.f75964c);
        sb2.append(", startLineIndex=");
        sb2.append(this.f75965d);
        sb2.append(", endLineIndex=");
        sb2.append(this.f75966e);
        sb2.append(", top=");
        sb2.append(this.f75967f);
        sb2.append(", bottom=");
        return c9.k(sb2, this.f75968g, ')');
    }
}
