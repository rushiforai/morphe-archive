package ads_mobile_sdk;

import com.google.android.gms.appset.AppSetIdInfo;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class uq {

    /* renamed from: a, reason: collision with root package name */
    public final AppSetIdInfo f10452a;

    /* renamed from: b, reason: collision with root package name */
    public final long f10453b;

    public uq(AppSetIdInfo appSetIdInfo, long j11) {
        this.f10452a = appSetIdInfo;
        this.f10453b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uq)) {
            return false;
        }
        uq uqVar = (uq) obj;
        return Intrinsics.b(this.f10452a, uqVar.f10452a) && Duration.d(this.f10453b, uqVar.f10453b);
    }

    public final int hashCode() {
        AppSetIdInfo appSetIdInfo = this.f10452a;
        int iHashCode = appSetIdInfo == null ? 0 : appSetIdInfo.hashCode();
        Duration.Companion companion = Duration.f72038b;
        return Long.hashCode(this.f10453b) + (iHashCode * 31);
    }

    public final String toString() {
        return "CachedAppSetIdInfo(appSetIdInfo=" + this.f10452a + ", timestamp=" + Duration.r(this.f10453b) + ")";
    }
}
