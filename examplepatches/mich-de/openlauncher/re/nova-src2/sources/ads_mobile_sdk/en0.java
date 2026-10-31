package ads_mobile_sdk;

import b.c0;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class en0 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f2926a;

    /* renamed from: b, reason: collision with root package name */
    public final String f2927b;

    /* renamed from: c, reason: collision with root package name */
    public final String f2928c;

    /* renamed from: d, reason: collision with root package name */
    public final String f2929d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f2930e;

    public en0(String str, String str2, String str3, String str4, boolean z11) {
        this.f2926a = str;
        this.f2927b = str2;
        this.f2928c = str3;
        this.f2929d = str4;
        this.f2930e = z11;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        if (this.f2930e) {
            String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            String str2 = this.f2926a;
            if (str2 == null) {
                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            signals.gmpAppId = str2;
            String str3 = this.f2927b;
            if (str3 == null) {
                str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            signals.appInstanceId = str3;
            String str4 = this.f2928c;
            if (str4 != null) {
                str = str4;
            }
            signals.adEventId = str;
            signals.appIdOrigin = this.f2929d;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof en0)) {
            return false;
        }
        en0 en0Var = (en0) obj;
        return Intrinsics.b(this.f2926a, en0Var.f2926a) && Intrinsics.b(this.f2927b, en0Var.f2927b) && Intrinsics.b(this.f2928c, en0Var.f2928c) && Intrinsics.b(this.f2929d, en0Var.f2929d) && this.f2930e == en0Var.f2930e;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        String str = this.f2926a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f2927b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f2928c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f2929d;
        int iHashCode4 = (iHashCode3 + (str4 != null ? str4.hashCode() : 0)) * 31;
        boolean z11 = this.f2930e;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode4 + i5;
    }

    public final String toString() {
        StringBuilder sbW = c0.w("FirebaseAnalyticsSignal(firebaseAppId=", this.f2926a, ", firebaseAppInstanceId=", this.f2927b, ", firebaseAdEventId=");
        c0.D(sbW, this.f2928c, ", firebaseAppIdOrigin=", this.f2929d, ", isFirebaseIntegrationEnabled=");
        return a80.m.k(sbW, this.f2930e, ")");
    }
}
