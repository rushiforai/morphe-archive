package hv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final m f60359a;

    public k(m billingDetailsFormState) {
        Intrinsics.g(billingDetailsFormState, "billingDetailsFormState");
        this.f60359a = billingDetailsFormState;
    }

    public static boolean a(String str, pw.a aVar) {
        if (aVar == null) {
            return false;
        }
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str3 = aVar.f83105a;
        if (str3 != null) {
            str2 = str3;
        }
        return !str.equals(str2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k) && Intrinsics.b(this.f60359a, ((k) obj).f60359a);
    }

    public final int hashCode() {
        return this.f60359a.hashCode();
    }

    public final String toString() {
        return "BillingDetailsEntry(billingDetailsFormState=" + this.f60359a + ")";
    }
}
