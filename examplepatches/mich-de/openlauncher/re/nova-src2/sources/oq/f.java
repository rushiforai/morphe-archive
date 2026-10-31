package oq;

import a80.m;
import b.c9;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f80605a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f80606b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f80607c;

    public f(boolean z11, boolean z12, boolean z13) {
        this.f80605a = z11;
        this.f80606b = z12;
        this.f80607c = z13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f80605a == fVar.f80605a && this.f80606b == fVar.f80606b && this.f80607c == fVar.f80607c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f80607c) + c9.f(Boolean.hashCode(this.f80605a) * 31, 31, this.f80606b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ProvidedDefaultValues(email=");
        sb2.append(this.f80605a);
        sb2.append(", name=");
        sb2.append(this.f80606b);
        sb2.append(", phone=");
        return m.k(sb2, this.f80607c, ")");
    }
}
