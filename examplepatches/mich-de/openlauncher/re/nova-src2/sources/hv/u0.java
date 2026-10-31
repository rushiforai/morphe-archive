package hv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u0 implements w0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f60610a;

    public u0(String text) {
        Intrinsics.g(text, "text");
        this.f60610a = text;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u0) && Intrinsics.b(this.f60610a, ((u0) obj).f60610a);
    }

    public final int hashCode() {
        return this.f60610a.hashCode();
    }

    public final String toString() {
        return b.c0.l("DateChanged(text=", this.f60610a, ")");
    }
}
