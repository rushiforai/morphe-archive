package b;

import ads_mobile_sdk.b03;
import ads_mobile_sdk.e52;
import ads_mobile_sdk.ko1;
import ads_mobile_sdk.qw2;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationNativeAdapter;
import com.google.android.gms.ads.mediation.rtb.RtbAdapter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a6 {
    public static kb a(a6 a6Var, String adapterClassName, boolean z11, qw2 requestType, int i5) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        boolean z12 = (i5 & 4) == 0;
        if ((i5 & 8) != 0) {
            requestType = qw2.f8859d;
        }
        a6Var.getClass();
        Intrinsics.g(adapterClassName, "adapterClassName");
        Intrinsics.g(requestType, "requestType");
        try {
            Object objNewInstance = Class.forName(adapterClassName).getDeclaredConstructor(null).newInstance(null);
            if (!z11) {
                if (objNewInstance instanceof eg.h) {
                    eg.h hVar = (eg.h) objNewInstance;
                    if (((requestType == qw2.f8861f && (hVar instanceof MediationBannerAdapter)) || ((requestType == qw2.f8863h && (hVar instanceof MediationInterstitialAdapter)) || (requestType == qw2.f8864i && (hVar instanceof MediationNativeAdapter)))) && !z12) {
                        return new e52((eg.h) objNewInstance);
                    }
                }
                if (objNewInstance instanceof eg.b) {
                    return new ko1((eg.b) objNewInstance);
                }
            } else if (objNewInstance instanceof RtbAdapter) {
                return new b03((RtbAdapter) objNewInstance);
            }
        } catch (Exception unused) {
        }
        return null;
    }
}
