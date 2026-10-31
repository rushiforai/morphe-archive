package ads_mobile_sdk;

import android.content.Context;
import android.os.Bundle;
import b.c0;
import b.ed;
import b0.b0;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import eg.h;
import java.security.NoSuchAlgorithmException;
import kotlin.jvm.internal.Intrinsics;
import ni.d0;
import ni.e0;
import ni.f0;

/* loaded from: classes2.dex */
public final class e52 implements b.kb {

    /* renamed from: a, reason: collision with root package name */
    public final h f2744a;

    public e52(h hVar) {
        this.f2744a = hVar;
    }

    public final void a(Context context, mi.a aVar, ni.q baseRequest, f0 requestConfiguration, com.google.gson.r serverParameterData, io.sentry.e3 e3Var, kh0 delegatingThirdPartyEventEmitter) throws NoSuchAlgorithmException {
        Intrinsics.g(context, "context");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestConfiguration, "requestConfiguration");
        Intrinsics.g(serverParameterData, "serverParameterData");
        Intrinsics.g(delegatingThirdPartyEventEmitter, "delegatingThirdPartyEventEmitter");
        h hVar = this.f2744a;
        if (!(hVar instanceof MediationBannerAdapter)) {
            String canonicalName = hVar.getClass().getCanonicalName();
            String canonicalName2 = MediationBannerAdapter.class.getCanonicalName();
            e3Var.a(new bg.a(0, c0.s(c0.w("Failed to cast ", canonicalName, " to ", canonicalName2, ". Does "), hVar.getClass().getCanonicalName(), " implement ", MediationBannerAdapter.class.getCanonicalName(), "?"), "com.google.android.libraries.ads.mobile.sdk"));
            return;
        }
        requestConfiguration.a(context);
        d0 d0Var = d0.f78259a;
        e0 e0Var = e0.f78267a;
        ed.h(serverParameterData, requestConfiguration);
        d62 d62Var = new d62();
        d62 d62Var2 = new d62();
        Bundle bundleC = ed.c(serverParameterData);
        int i5 = aVar.f76404a;
        int i11 = aVar.f76405b;
        String formatString = aVar.f76409f;
        boolean z11 = aVar.f76406c;
        boolean z12 = aVar.f76407d;
        Intrinsics.g(formatString, "formatString");
        ((MediationBannerAdapter) hVar).requestBannerAd(context, d62Var2, bundleC, new bg.c(i5, i11, formatString, z11, z12, i11), d62Var, ed.d(baseRequest, hVar));
    }

    public final void a(Context context, ni.q baseRequest, f0 requestConfiguration, com.google.gson.r serverParameterData, io.sentry.e3 e3Var, kh0 delegatingThirdPartyEventEmitter) throws NoSuchAlgorithmException {
        Intrinsics.g(context, "context");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestConfiguration, "requestConfiguration");
        Intrinsics.g(serverParameterData, "serverParameterData");
        Intrinsics.g(delegatingThirdPartyEventEmitter, "delegatingThirdPartyEventEmitter");
        h hVar = this.f2744a;
        if (!(hVar instanceof MediationInterstitialAdapter)) {
            String canonicalName = hVar.getClass().getCanonicalName();
            String canonicalName2 = MediationInterstitialAdapter.class.getCanonicalName();
            e3Var.a(new bg.a(0, c0.s(c0.w("Failed to cast ", canonicalName, " to ", canonicalName2, ". Does "), hVar.getClass().getCanonicalName(), " implement ", MediationInterstitialAdapter.class.getCanonicalName(), "?"), "com.google.android.libraries.ads.mobile.sdk"));
            return;
        }
        requestConfiguration.a(context);
        d0 d0Var = d0.f78259a;
        e0 e0Var = e0.f78267a;
        ed.h(serverParameterData, requestConfiguration);
        ((MediationInterstitialAdapter) hVar).requestInterstitialAd(context, new d62(), ed.c(serverParameterData), new d62(), ed.d(baseRequest, hVar));
    }

    @Override // b.kb
    public final Object a(Context context, oa oaVar, b0 b0Var) {
        return new tu0("Old mediation adapters do not implement initialize method.", wd1.f11213a);
    }
}
