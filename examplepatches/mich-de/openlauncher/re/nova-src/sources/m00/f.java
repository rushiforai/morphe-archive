package m00;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f extends m {

    /* renamed from: a, reason: collision with root package name */
    public final String f75541a;

    public f(String str) {
        this.f75541a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Intrinsics.b(this.f75541a, ((f) obj).f75541a);
    }

    public final int hashCode() {
        return this.f75541a.hashCode();
    }

    public final String toString() {
        return b.c0.l("Header(label=", this.f75541a, ")");
    }
}
