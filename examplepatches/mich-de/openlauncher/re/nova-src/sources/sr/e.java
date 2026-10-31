package sr;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends f {

    /* renamed from: a, reason: collision with root package name */
    public final String f87703a;

    public e(String str) {
        this.f87703a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && Intrinsics.b(this.f87703a, ((e) obj).f87703a);
    }

    public final int hashCode() {
        return this.f87703a.hashCode();
    }

    public final String toString() {
        return c0.l("OpenCustomTab(url=", this.f87703a, ")");
    }
}
