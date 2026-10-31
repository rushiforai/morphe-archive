package n3;

import b.u4;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final int f77745a;

    /* renamed from: b, reason: collision with root package name */
    public final int f77746b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f77747c;

    public e(int i5, int i11, boolean z11) {
        this.f77745a = i5;
        this.f77746b = i11;
        this.f77747c = z11;
    }

    public final int a() {
        return this.f77746b;
    }

    public final int b() {
        return this.f77745a;
    }

    public final boolean c() {
        return this.f77747c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f77745a == eVar.f77745a && this.f77746b == eVar.f77746b && this.f77747c == eVar.f77747c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f77747c) + u4.a(this.f77746b, Integer.hashCode(this.f77745a) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BidiRun(start=");
        sb2.append(this.f77745a);
        sb2.append(", end=");
        sb2.append(this.f77746b);
        sb2.append(", isRtl=");
        return a2.c.p(sb2, this.f77747c, ')');
    }
}
