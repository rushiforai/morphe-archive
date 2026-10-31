package m3;

import b.u4;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final u3.e f75970a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75971b;

    /* renamed from: c, reason: collision with root package name */
    public final int f75972c;

    public s(u3.e eVar, int i5, int i11) {
        this.f75970a = eVar;
        this.f75971b = i5;
        this.f75972c = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return this.f75970a.equals(sVar.f75970a) && this.f75971b == sVar.f75971b && this.f75972c == sVar.f75972c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f75972c) + u4.a(this.f75971b, this.f75970a.hashCode() * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ParagraphIntrinsicInfo(intrinsics=");
        sb2.append(this.f75970a);
        sb2.append(", startIndex=");
        sb2.append(this.f75971b);
        sb2.append(", endIndex=");
        return a2.c.m(sb2, this.f75972c, ')');
    }
}
