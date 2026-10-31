package bm;

import ab.e0;
import b.c0;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final r f18089a;

    /* renamed from: b, reason: collision with root package name */
    public final int f18090b;

    /* renamed from: c, reason: collision with root package name */
    public final int f18091c;

    public k(int i5, int i11, Class cls) {
        this(r.a(cls), i5, i11);
    }

    public static k a(r rVar) {
        return new k(rVar, 1, 0);
    }

    public static k b(Class cls) {
        return new k(1, 0, cls);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return this.f18089a.equals(kVar.f18089a) && this.f18090b == kVar.f18090b && this.f18091c == kVar.f18091c;
    }

    public final int hashCode() {
        return ((((this.f18089a.hashCode() ^ 1000003) * 1000003) ^ this.f18090b) * 1000003) ^ this.f18091c;
    }

    public final String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder("Dependency{anInterface=");
        sb2.append(this.f18089a);
        sb2.append(", type=");
        int i5 = this.f18090b;
        sb2.append(i5 == 1 ? "required" : i5 == 0 ? "optional" : "set");
        sb2.append(", injection=");
        int i11 = this.f18091c;
        if (i11 == 0) {
            str = "direct";
        } else if (i11 == 1) {
            str = "provider";
        } else {
            if (i11 != 2) {
                throw new AssertionError(c0.h(i11, "Unsupported injection: "));
            }
            str = "deferred";
        }
        return c0.q(sb2, str, "}");
    }

    public k(r rVar, int i5, int i11) {
        e0.q(rVar, "Null dependency anInterface.");
        this.f18089a = rVar;
        this.f18090b = i5;
        this.f18091c = i11;
    }
}
