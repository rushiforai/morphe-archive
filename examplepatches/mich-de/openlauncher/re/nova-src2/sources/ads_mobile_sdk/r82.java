package ads_mobile_sdk;

import b.c0;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r82 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f8979a;

    /* renamed from: b, reason: collision with root package name */
    public final String f8980b;

    /* renamed from: c, reason: collision with root package name */
    public final String f8981c;

    public r82(String str, String str2, String str3) {
        this.f8979a = str;
        this.f8980b = str2;
        this.f8981c = str3;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.omidVersion = this.f8979a;
        signals.clientOmidVersion = this.f8980b;
        signals.omidPartnerName = this.f8981c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r82)) {
            return false;
        }
        r82 r82Var = (r82) obj;
        return Intrinsics.b(this.f8979a, r82Var.f8979a) && Intrinsics.b(this.f8980b, r82Var.f8980b) && Intrinsics.b(this.f8981c, r82Var.f8981c);
    }

    public final int hashCode() {
        String str = this.f8979a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f8980b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f8981c;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        return c0.q(c0.w("OmidSignal(omidVersion=", this.f8979a, ", clientOmidVersion=", this.f8980b, ", omidPartnerName="), this.f8981c, ")");
    }
}
