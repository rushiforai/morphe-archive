package es;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final String f53009a;

    public v(String str) {
        this.f53009a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v) && Intrinsics.b(this.f53009a, ((v) obj).f53009a);
    }

    public final int hashCode() {
        String str = this.f53009a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return b.c0.l("BillingDetailsUpdateFlow(cvc=", this.f53009a, ")");
    }
}
