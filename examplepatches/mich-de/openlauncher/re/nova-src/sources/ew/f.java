package ew;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final k f53046a;

    public f(k kVar) {
        this.f53046a = kVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Intrinsics.b(this.f53046a, ((f) obj).f53046a);
    }

    public final int hashCode() {
        return this.f53046a.hashCode();
    }

    public final String toString() {
        return "FetchPlaceResponse(place=" + this.f53046a + ")";
    }
}
