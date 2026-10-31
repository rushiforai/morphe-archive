package ads_mobile_sdk;

import b.u1;
import com.amplitude.android.TrackingOptions;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a3 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final AdvertisingIdClient.Info f820a;

    public a3(AdvertisingIdClient.Info info) {
        this.f820a = info;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        AdvertisingIdClient.Info info = this.f820a;
        if (info != null) {
            ti.l lVar = signals.personallyIdentifiableInformation;
            lVar.adId = info.getId();
            lVar.isLimitedAdTracking = Boolean.valueOf(info.isLimitAdTrackingEnabled());
            lVar.idTypeParameter = TrackingOptions.AMP_TRACKING_OPTION_ADID;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a3) && Intrinsics.b(this.f820a, ((a3) obj).f820a);
    }

    public final int hashCode() {
        AdvertisingIdClient.Info info = this.f820a;
        if (info == null) {
            return 0;
        }
        return info.hashCode();
    }

    public final String toString() {
        return "AdIdInfoSignal(adIdInfo=" + this.f820a + ")";
    }
}
