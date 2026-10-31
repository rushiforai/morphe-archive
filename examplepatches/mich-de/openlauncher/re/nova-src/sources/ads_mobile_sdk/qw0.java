package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class qw0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f8852a;

    /* renamed from: b, reason: collision with root package name */
    public final String f8853b;

    public qw0(String str, String str2) {
        this.f8852a = str;
        this.f8853b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qw0)) {
            return false;
        }
        qw0 qw0Var = (qw0) obj;
        return Intrinsics.b(this.f8852a, qw0Var.f8852a) && Intrinsics.b(this.f8853b, qw0Var.f8853b);
    }

    public final int hashCode() {
        String str = this.f8852a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f8853b;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return c0.n("SystemDefaultLocale(language=", this.f8852a, ", country=", this.f8853b, ")");
    }
}
