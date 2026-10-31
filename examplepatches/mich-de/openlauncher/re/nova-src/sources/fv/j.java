package fv;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final String f56126a;

    /* renamed from: b, reason: collision with root package name */
    public final String f56127b;

    /* renamed from: c, reason: collision with root package name */
    public final String f56128c;

    public j(String id2, String ephemeralKeySecret, String str) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(ephemeralKeySecret, "ephemeralKeySecret");
        this.f56126a = id2;
        this.f56127b = ephemeralKeySecret;
        this.f56128c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f56126a, jVar.f56126a) && Intrinsics.b(this.f56127b, jVar.f56127b) && Intrinsics.b(this.f56128c, jVar.f56128c);
    }

    public final int hashCode() {
        int iE = c0.e(this.f56126a.hashCode() * 31, 31, this.f56127b);
        String str = this.f56128c;
        return iE + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return c0.q(c0.w("CustomerInfo(id=", this.f56126a, ", ephemeralKeySecret=", this.f56127b, ", customerSessionClientSecret="), this.f56128c, ")");
    }
}
