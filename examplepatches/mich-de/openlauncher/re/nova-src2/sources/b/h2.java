package b;

import ads_mobile_sdk.fq;
import ads_mobile_sdk.pu0;
import ads_mobile_sdk.tu0;
import ads_mobile_sdk.wd1;
import ads_mobile_sdk.xu0;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class h2 {
    public static a1 a(a1 jsResult) {
        String strO;
        String strO2;
        Intrinsics.g(jsResult, "jsResult");
        if (!(jsResult instanceof xu0)) {
            if (jsResult instanceof pu0) {
                return jsResult;
            }
            throw new NoWhenBranchMatchedException();
        }
        com.google.gson.r rVar = (com.google.gson.r) ((xu0) jsResult).f11834b;
        com.google.gson.p pVarV = rVar.v("errors");
        String strO3 = pVarV != null ? pVarV.o() : null;
        com.google.gson.p pVarV2 = rVar.v("valid");
        if (pVarV2 != null) {
            boolean z11 = true;
            if (pVarV2.g() == 1) {
                com.google.gson.p pVarV3 = rVar.v(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                String strO4 = pVarV3 != null ? pVarV3.o() : null;
                if (strO4 == null) {
                    return new tu0("BuildAdUrlResult url is null");
                }
                com.google.gson.p pVarV4 = rVar.v("base_uri");
                String strO5 = pVarV4 != null ? pVarV4.o() : null;
                com.google.gson.p pVarV5 = rVar.v("post_parameters");
                String strO6 = pVarV5 != null ? pVarV5.o() : null;
                com.google.gson.p pVarV6 = rVar.v("cookies_include");
                if (pVarV6 != null && (strO2 = pVarV6.o()) != null && !strO2.equals("1") && !strO2.equals(InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) {
                    z11 = false;
                }
                boolean z12 = z11;
                com.google.gson.p pVarV7 = rVar.v("csrb_errors");
                return new xu0(new fq(strO3 != null ? r70.k.i1(strO3, new String[]{","}, 6) : null, strO5, strO6, z12, strO4, null, (pVarV7 == null || (strO = pVarV7.o()) == null) ? null : r70.k.i1(strO, new String[]{","}, 6)));
            }
        }
        return new tu0(c0.k("Error building request URL: ", strO3), wd1.f11214b);
    }
}
