package qx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends e {

    /* renamed from: a, reason: collision with root package name */
    public final String f84451a;

    public c(String str) {
        this.f84451a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f84451a, ((c) obj).f84451a);
    }

    public final int hashCode() {
        return this.f84451a.hashCode();
    }

    public final String toString() {
        return b.c0.l("NoFill(message=", this.f84451a, ")");
    }
}
