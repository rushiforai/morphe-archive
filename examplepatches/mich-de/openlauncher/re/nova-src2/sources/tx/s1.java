package tx;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s1 extends a2 {

    /* renamed from: b, reason: collision with root package name */
    public final String f89990b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f89991c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f89992d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f89993e;

    public s1(String str, boolean z11, boolean z12, boolean z13) {
        super("logged_in");
        this.f89990b = str;
        this.f89991c = z11;
        this.f89992d = z12;
        this.f89993e = z13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s1)) {
            return false;
        }
        s1 s1Var = (s1) obj;
        return Intrinsics.b(this.f89990b, s1Var.f89990b) && this.f89991c == s1Var.f89991c && this.f89992d == s1Var.f89992d && this.f89993e == s1Var.f89993e;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f89993e) + c9.f(c9.f(this.f89990b.hashCode() * 31, 31, this.f89991c), 31, this.f89992d);
    }

    public final String toString() {
        return "LoggedIn(personId=" + this.f89990b + ", created=" + this.f89991c + ", firstLogin=" + this.f89992d + ", identityChanged=" + this.f89993e + ")";
    }
}
