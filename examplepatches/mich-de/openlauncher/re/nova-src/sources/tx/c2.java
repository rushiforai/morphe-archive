package tx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f89680a;

    public c2(String str) {
        this.f89680a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c2) && Intrinsics.b(this.f89680a, ((c2) obj).f89680a);
    }

    public final int hashCode() {
        String str = this.f89680a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return b.c0.l("Pending(deletesAt=", this.f89680a, ")");
    }
}
