package cy;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f48431a;

    /* renamed from: b, reason: collision with root package name */
    public final String f48432b;

    public c(String str, String str2) {
        this.f48431a = str;
        this.f48432b = str2;
    }

    public final String a() {
        return this.f48432b;
    }

    public final String b() {
        return this.f48431a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f48431a, cVar.f48431a) && Intrinsics.b(this.f48432b, cVar.f48432b);
    }

    public final int hashCode() {
        String str = this.f48431a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f48432b;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return b.c0.n("BackendVerificationIdentity(personId=", this.f48431a, ", googleIdentity=", this.f48432b, ")");
    }
}
