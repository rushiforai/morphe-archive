package qx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b extends e {

    /* renamed from: a, reason: collision with root package name */
    public final String f84436a;

    public b(String str) {
        this.f84436a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b) && Intrinsics.b(this.f84436a, ((b) obj).f84436a);
    }

    public final int hashCode() {
        return this.f84436a.hashCode();
    }

    public final String toString() {
        return b.c0.l("NetworkError(message=", this.f84436a, ")");
    }
}
