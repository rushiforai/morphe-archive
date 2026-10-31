package es;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h0 implements k0 {

    /* renamed from: a, reason: collision with root package name */
    public final z f52954a;

    public h0(z initialDestination) {
        Intrinsics.g(initialDestination, "initialDestination");
        this.f52954a = initialDestination;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h0) && Intrinsics.b(this.f52954a, ((h0) obj).f52954a);
    }

    public final int hashCode() {
        return this.f52954a.hashCode();
    }

    public final String toString() {
        return "FullScreen(initialDestination=" + this.f52954a + ")";
    }
}
