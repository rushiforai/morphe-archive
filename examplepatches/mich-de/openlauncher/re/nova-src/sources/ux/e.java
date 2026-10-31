package ux;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f91608a;

    /* renamed from: b, reason: collision with root package name */
    public final String f91609b;

    public e(String str, String str2) {
        this.f91608a = str;
        this.f91609b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f91608a, eVar.f91608a) && Intrinsics.b(this.f91609b, eVar.f91609b);
    }

    public final int hashCode() {
        int iHashCode = this.f91608a.hashCode() * 31;
        String str = this.f91609b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return c0.n("ContactInfo(displayName=", this.f91608a, ", photoUri=", this.f91609b, ")");
    }
}
