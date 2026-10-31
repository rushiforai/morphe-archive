package cs;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t implements u {

    /* renamed from: a, reason: collision with root package name */
    public final String f47853a;

    public t(String token) {
        Intrinsics.g(token, "token");
        this.f47853a = token;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t) && Intrinsics.b(this.f47853a, ((t) obj).f47853a);
    }

    public final int hashCode() {
        return this.f47853a.hashCode();
    }

    public final String toString() {
        return c0.l("Success(token=", this.f47853a, ")");
    }
}
