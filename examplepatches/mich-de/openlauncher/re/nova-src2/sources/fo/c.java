package fo;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f55461a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55462b;

    public c(String str, String str2) {
        this.f55461a = str;
        this.f55462b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f55461a, cVar.f55461a) && Intrinsics.b(this.f55462b, cVar.f55462b);
    }

    public final int hashCode() {
        String str = this.f55461a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f55462b;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("UserIdentity(displayName=");
        sb2.append(this.f55461a);
        sb2.append(", email=");
        return c1.t(sb2, this.f55462b, ')');
    }
}
