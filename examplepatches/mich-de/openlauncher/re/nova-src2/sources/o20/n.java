package o20;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final String f79445a;

    /* renamed from: b, reason: collision with root package name */
    public final String f79446b;

    /* renamed from: c, reason: collision with root package name */
    public final String f79447c;

    /* renamed from: d, reason: collision with root package name */
    public final String f79448d;

    public n(String str, String str2, String str3, String str4) {
        this.f79445a = str;
        this.f79446b = str2;
        this.f79447c = str3;
        this.f79448d = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return Intrinsics.b(this.f79445a, nVar.f79445a) && Intrinsics.b(this.f79446b, nVar.f79446b) && Intrinsics.b(this.f79447c, nVar.f79447c) && Intrinsics.b(this.f79448d, nVar.f79448d);
    }

    public final int hashCode() {
        return this.f79448d.hashCode() + c0.e(c0.e(this.f79445a.hashCode() * 31, 31, this.f79446b), 31, this.f79447c);
    }

    public final String toString() {
        return c0.s(c0.w("SlackColleagueInfo(name=", this.f79445a, ", title=", this.f79446b, ", handle="), this.f79447c, ", uri=", this.f79448d, ")");
    }
}
