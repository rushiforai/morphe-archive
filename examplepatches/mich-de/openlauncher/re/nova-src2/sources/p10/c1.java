package p10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c1 implements d1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f81723a;

    public c1(String str) {
        this.f81723a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c1) && Intrinsics.b(this.f81723a, ((c1) obj).f81723a);
    }

    public final int hashCode() {
        return this.f81723a.hashCode();
    }

    public final String toString() {
        return b.c0.l("NotEarned(reason=", this.f81723a, ")");
    }
}
