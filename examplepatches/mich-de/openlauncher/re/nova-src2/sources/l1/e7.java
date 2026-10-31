package l1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e7 {

    /* renamed from: a, reason: collision with root package name */
    public final String f73258a;

    /* renamed from: b, reason: collision with root package name */
    public final String f73259b;

    public e7(String str, String str2) {
        this.f73258a = str;
        this.f73259b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || e7.class != obj.getClass()) {
            return false;
        }
        e7 e7Var = (e7) obj;
        return Intrinsics.b(this.f73258a, e7Var.f73258a) && Intrinsics.b(this.f73259b, e7Var.f73259b);
    }

    public final int hashCode() {
        int iHashCode = this.f73258a.hashCode() * 31;
        String str = this.f73259b;
        return b.c0.F(2) + b.c9.f((iHashCode + (str != null ? str.hashCode() : 0)) * 31, 31, true);
    }
}
