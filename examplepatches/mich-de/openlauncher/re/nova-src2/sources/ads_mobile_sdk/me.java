package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class me implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f7150a;

    /* renamed from: b, reason: collision with root package name */
    public final Boolean f7151b;

    public me(String str, Boolean bool) {
        this.f7150a = str;
        this.f7151b = bool;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        String str = this.f7150a;
        if (str != null) {
            ti.l lVar = signals.personallyIdentifiableInformation;
            lVar.amazonFireAdId = str;
            lVar.isAmazonFireAdIdLimitAdTracking = this.f7151b;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof me)) {
            return false;
        }
        me meVar = (me) obj;
        return Intrinsics.b(this.f7150a, meVar.f7150a) && Intrinsics.b(this.f7151b, meVar.f7151b);
    }

    public final int hashCode() {
        String str = this.f7150a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Boolean bool = this.f7151b;
        return iHashCode + (bool != null ? bool.hashCode() : 0);
    }

    public final String toString() {
        return "AmazonFireAdIdSignal(advertisingId=" + this.f7150a + ", limitAdTracking=" + this.f7151b + ")";
    }
}
