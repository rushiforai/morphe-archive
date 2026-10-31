package kw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f72701a;

    /* renamed from: b, reason: collision with root package name */
    public final String f72702b;

    /* renamed from: c, reason: collision with root package name */
    public final String f72703c;

    public /* synthetic */ v1(String str, String str2) {
        this(str, str2, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v1)) {
            return false;
        }
        v1 v1Var = (v1) obj;
        return Intrinsics.b(this.f72701a, v1Var.f72701a) && Intrinsics.b(this.f72702b, v1Var.f72702b) && Intrinsics.b(this.f72703c, v1Var.f72703c);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f72701a.hashCode() * 31, 31, this.f72702b);
        String str = this.f72703c;
        return iE + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return b.c0.q(b.c0.w("Metadata(prefix=", this.f72701a, ", regionCode=", this.f72702b, ", pattern="), this.f72703c, ")");
    }

    public v1(String str, String str2, String str3) {
        this.f72701a = str;
        this.f72702b = str2;
        this.f72703c = str3;
        if (str3 != null && str3.length() <= 0) {
            throw new IllegalArgumentException("Pattern should not be empty. Set it to null if it's missing.");
        }
    }
}
