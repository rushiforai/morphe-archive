package e10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f51521a;

    public final boolean equals(Object obj) {
        if (obj instanceof f1) {
            return Intrinsics.b(this.f51521a, ((f1) obj).f51521a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f51521a.hashCode();
    }

    public final String toString() {
        return b.c0.l("NovaSettingsNav(route=", this.f51521a, ")");
    }
}
