package iq;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements e {

    /* renamed from: a, reason: collision with root package name */
    public final String f67964a;

    public d(String str) {
        this.f67964a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f67964a, ((d) obj).f67964a);
    }

    public final int hashCode() {
        return this.f67964a.hashCode();
    }

    public final String toString() {
        return c0.l("Success(clientSecret=", this.f67964a, ")");
    }
}
