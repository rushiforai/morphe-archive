package sr;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d extends f {

    /* renamed from: a, reason: collision with root package name */
    public final String f87702a;

    public d(String str) {
        this.f87702a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f87702a, ((d) obj).f87702a);
    }

    public final int hashCode() {
        return this.f87702a.hashCode();
    }

    public final String toString() {
        return c0.l("OpenAuthFlowWithUrl(url=", this.f87702a, ")");
    }
}
