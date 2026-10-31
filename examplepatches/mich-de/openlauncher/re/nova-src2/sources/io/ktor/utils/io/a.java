package io.ktor.utils.io;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements g {

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f66547b;

    public a(Throwable th2) {
        this.f66547b = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && Intrinsics.b(this.f66547b, ((a) obj).f66547b);
    }

    public final int hashCode() {
        Throwable th2 = this.f66547b;
        if (th2 == null) {
            return 0;
        }
        return th2.hashCode();
    }

    public final String toString() {
        return "Closed(cause=" + this.f66547b + ')';
    }
}
