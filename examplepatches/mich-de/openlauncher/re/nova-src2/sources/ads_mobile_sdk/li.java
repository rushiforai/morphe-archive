package ads_mobile_sdk;

import b.u1;
import com.google.android.gms.appset.AppSetIdInfo;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class li implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final AppSetIdInfo f6240a;

    public li(AppSetIdInfo appSetIdInfo) {
        this.f6240a = appSetIdInfo;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        AppSetIdInfo appSetIdInfo = this.f6240a;
        if (appSetIdInfo != null) {
            ti.l lVar = signals.personallyIdentifiableInformation;
            lVar.appSetId = appSetIdInfo.getId();
            lVar.appSetIdScope = Integer.valueOf(appSetIdInfo.f31693b);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof li) && Intrinsics.b(this.f6240a, ((li) obj).f6240a);
    }

    public final int hashCode() {
        AppSetIdInfo appSetIdInfo = this.f6240a;
        if (appSetIdInfo == null) {
            return 0;
        }
        return appSetIdInfo.hashCode();
    }

    public final String toString() {
        return "AppSetIdInfoSignal(appSetIdInfo=" + this.f6240a + ")";
    }
}
