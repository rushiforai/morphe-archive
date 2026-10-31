package vx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f93266a;

    /* renamed from: b, reason: collision with root package name */
    public final int f93267b;

    public a(String str, int i5) {
        this.f93266a = str;
        this.f93267b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f93266a, aVar.f93266a) && this.f93267b == aVar.f93267b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f93267b) + (this.f93266a.hashCode() * 31);
    }

    public final String toString() {
        return "Candidate(packageName=" + this.f93266a + ", usageScore=" + this.f93267b + ")";
    }
}
