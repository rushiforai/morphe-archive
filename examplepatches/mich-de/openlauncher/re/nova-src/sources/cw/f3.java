package cw;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f3 {

    /* renamed from: a, reason: collision with root package name */
    public final String f48142a;

    /* renamed from: b, reason: collision with root package name */
    public final int f48143b;

    /* renamed from: c, reason: collision with root package name */
    public final int f48144c;

    public f3(String url, int i5, int i11) {
        Intrinsics.g(url, "url");
        this.f48142a = url;
        this.f48143b = i5;
        this.f48144c = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f3)) {
            return false;
        }
        f3 f3Var = (f3) obj;
        return Intrinsics.b(this.f48142a, f3Var.f48142a) && this.f48143b == f3Var.f48143b && this.f48144c == f3Var.f48144c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f48144c) + u4.a(this.f48143b, this.f48142a.hashCode() * 31, 31);
    }

    public final String toString() {
        return b.c0.o(b.c0.v("LinkAnnotation(url=", this.f48143b, this.f48142a, ", start=", ", end="), this.f48144c, ")");
    }
}
