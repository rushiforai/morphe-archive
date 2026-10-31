package qx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a extends e {

    /* renamed from: a, reason: collision with root package name */
    public final String f84425a;

    public a(String str) {
        this.f84425a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && Intrinsics.b(this.f84425a, ((a) obj).f84425a);
    }

    public final int hashCode() {
        return this.f84425a.hashCode();
    }

    public final String toString() {
        return b.c0.l("AppIdMissing(message=", this.f84425a, ")");
    }
}
