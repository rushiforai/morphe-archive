package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class x23 {

    /* renamed from: a, reason: collision with root package name */
    public final String f11556a;

    /* renamed from: b, reason: collision with root package name */
    public final com.google.gson.r f11557b;

    public x23(com.google.gson.r rVar, String str) {
        this.f11556a = str;
        this.f11557b = rVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x23)) {
            return false;
        }
        x23 x23Var = (x23) obj;
        return Intrinsics.b(this.f11556a, x23Var.f11556a) && Intrinsics.b(this.f11557b, x23Var.f11557b);
    }

    public final int hashCode() {
        int iHashCode = this.f11556a.hashCode() * 31;
        com.google.gson.r rVar = this.f11557b;
        return iHashCode + (rVar == null ? 0 : rVar.f34795a.hashCode());
    }

    public final String toString() {
        return "Action(name=" + this.f11556a + ", info=" + this.f11557b + ")";
    }
}
