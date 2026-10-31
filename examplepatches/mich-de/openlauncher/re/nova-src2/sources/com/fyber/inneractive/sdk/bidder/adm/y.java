package com.fyber.inneractive.sdk.bidder.adm;

import android.text.TextUtils;
import android.util.Base64;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.CreativeType;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.ImpressionData;
import com.fyber.inneractive.sdk.flow.c0;
import com.fyber.inneractive.sdk.network.f1;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class y implements com.fyber.inneractive.sdk.response.j {

    /* renamed from: a, reason: collision with root package name */
    public AdmParametersOuterClass$AdmParameters f27616a;

    /* renamed from: b, reason: collision with root package name */
    public final String f27617b;

    /* renamed from: c, reason: collision with root package name */
    public String f27618c;

    /* renamed from: d, reason: collision with root package name */
    public final String f27619d;

    public y(String str, String str2) {
        this.f27617b = str;
        this.f27619d = str2;
    }

    public final void a(c0 c0Var, com.fyber.inneractive.sdk.config.global.r rVar) {
        try {
            AdmParametersOuterClass$AdmParameters from = AdmParametersOuterClass$AdmParameters.parseFrom(Base64.decode(this.f27617b, 0));
            this.f27616a = from;
            if (from != null) {
                c0Var.a();
            }
            b(c0Var, rVar);
        } catch (Exception e3) {
            IAlog.f("failed to parse ad markup payload %s", e3.getMessage());
            com.fyber.inneractive.sdk.util.r.f31216b.post(new u(c0Var, e3));
        }
    }

    public final void b(c0 c0Var, com.fyber.inneractive.sdk.config.global.r rVar) {
        AdmParametersOuterClass$AdmParameters admParametersOuterClass$AdmParameters = this.f27616a;
        com.fyber.inneractive.sdk.response.e eVar = null;
        String markupUrl = (admParametersOuterClass$AdmParameters == null || !admParametersOuterClass$AdmParameters.hasMarkupUrl()) ? null : this.f27616a.getMarkupUrl();
        if (TextUtils.isEmpty(markupUrl)) {
            com.fyber.inneractive.sdk.util.r.f31216b.post(new x(c0Var));
            return;
        }
        try {
            AdmParametersOuterClass$AdmParameters admParametersOuterClass$AdmParameters2 = this.f27616a;
            int iA = admParametersOuterClass$AdmParameters2 != null ? admParametersOuterClass$AdmParameters2.getAdType().a() : c.OTHER.a();
            com.fyber.inneractive.sdk.response.a aVarA = com.fyber.inneractive.sdk.response.a.a(iA);
            if (aVarA == null) {
                aVarA = com.fyber.inneractive.sdk.response.a.RETURNED_ADTYPE_MRAID;
            }
            com.fyber.inneractive.sdk.factories.e eVar2 = (com.fyber.inneractive.sdk.factories.e) com.fyber.inneractive.sdk.factories.d.f28022a.f28023a.get(aVarA);
            com.fyber.inneractive.sdk.response.b bVarB = eVar2 != null ? eVar2.b() : null;
            if (bVarB != null) {
                bVarB.f31031a = bVarB.a();
                a(bVarB);
                eVar = bVarB.f31031a;
            } else {
                IAlog.a("failed parse adm network request with no input stream - received ad type %s does not have an appropriate parser", Integer.valueOf(iA));
            }
        } catch (Exception e3) {
            IAlog.a("failed parse adm network request with no input stream", e3, new Object[0]);
        }
        com.fyber.inneractive.sdk.response.e eVar3 = eVar;
        f1 f1Var = new f1(new v(this, c0Var, eVar3), markupUrl, this, rVar, eVar3);
        f1Var.f28780d = new w(this);
        IAConfigManager.Q.f27759s.a(f1Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:169:0x0329  */
    @Override // com.fyber.inneractive.sdk.response.j
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(com.fyber.inneractive.sdk.response.b bVar) throws NumberFormatException {
        String str;
        String str2;
        String str3;
        int i5;
        com.fyber.inneractive.sdk.ignite.m mVar;
        bVar.f31031a.A = true;
        IAConfigManager.Q.f27764x.f27775f = true;
        ImpressionData impressionData = new ImpressionData();
        AdmParametersOuterClass$AdmParameters admParametersOuterClass$AdmParameters = this.f27616a;
        if (admParametersOuterClass$AdmParameters == null) {
            return;
        }
        int iA = admParametersOuterClass$AdmParameters.getAdType().a();
        if (this.f27616a.hasErrorMessage()) {
            this.f27616a.getErrorMessage();
        }
        String sessionId = this.f27616a.hasSessionId() ? this.f27616a.getSessionId() : null;
        Long lValueOf = this.f27616a.hasContentId() ? Long.valueOf(this.f27616a.getContentId()) : null;
        if (this.f27616a.hasPublisherId()) {
            this.f27616a.getPublisherId();
        }
        Integer numValueOf = this.f27616a.hasAdWidth() ? Integer.valueOf(this.f27616a.getAdWidth()) : null;
        Integer numValueOf2 = this.f27616a.hasAdHeight() ? Integer.valueOf(this.f27616a.getAdHeight()) : null;
        String sdkImpressionUrl = this.f27616a.hasSdkImpressionUrl() ? this.f27616a.getSdkImpressionUrl() : null;
        String sdkClickUrl = this.f27616a.hasSdkClickUrl() ? this.f27616a.getSdkClickUrl() : null;
        Integer numValueOf3 = this.f27616a.hasAdExpirationInterval() ? Integer.valueOf(this.f27616a.getAdExpirationInterval()) : null;
        String adCompletionUrl = this.f27616a.hasAdCompletionUrl() ? this.f27616a.getAdCompletionUrl() : null;
        bVar.f31032b = this.f27616a.hasAdUnitId() ? this.f27616a.getAdUnitId() : null;
        String strName = this.f27616a.getAdUnitType().name();
        Locale locale = Locale.US;
        strName.getClass();
        String lowerCase = this.f27616a.hasAdUnitId() ? this.f27616a.getAdUnitDisplayType().name().toLowerCase(locale) : null;
        String adNetworkName = this.f27616a.hasAdNetworkName() ? this.f27616a.getAdNetworkName() : null;
        Long lValueOf2 = this.f27616a.hasAdNetworkId() ? Long.valueOf(this.f27616a.getAdNetworkId()) : null;
        String creativeId = this.f27616a.hasCreativeId() ? this.f27616a.getCreativeId() : null;
        Long l9 = lValueOf;
        String adDomain = this.f27616a.hasAdDomain() ? this.f27616a.getAdDomain() : null;
        Integer num = numValueOf;
        String appBundleId = this.f27616a.hasAppBundleId() ? this.f27616a.getAppBundleId() : null;
        Integer num2 = numValueOf2;
        String campaignId = this.f27616a.hasCampaignId() ? this.f27616a.getCampaignId() : null;
        Integer num3 = numValueOf3;
        String string = this.f27616a.hasPricingValue() ? Double.toString(this.f27616a.getPricingValue()) : null;
        String str4 = lowerCase;
        String strValueOf = this.f27616a.hasSpotId() ? String.valueOf(this.f27616a.getSpotId()) : null;
        impressionData.setCpmValue(string);
        impressionData.setCurrency("USD");
        if (this.f27616a.hasMrcData()) {
            int pixelPercent = this.f27616a.getMrcData().hasPixelPercent() ? this.f27616a.getMrcData().getPixelPercent() : 0;
            str3 = campaignId;
            int pixelDuration = this.f27616a.getMrcData().hasPixelDuration() ? this.f27616a.getMrcData().getPixelDuration() : -1;
            str2 = adDomain;
            String pixelImpressionUrl = this.f27616a.getMrcData().hasPixelImpressionUrl() ? this.f27616a.getMrcData().getPixelImpressionUrl() : null;
            str = creativeId;
            com.fyber.inneractive.sdk.response.e eVar = bVar.f31031a;
            eVar.f31058s = pixelPercent;
            eVar.f31059t = pixelDuration;
            eVar.f31060u = pixelImpressionUrl;
        } else {
            str = creativeId;
            str2 = adDomain;
            str3 = campaignId;
        }
        Boolean boolValueOf = this.f27616a.hasSkipMode() ? Boolean.valueOf(this.f27616a.getSkipMode()) : null;
        if (bVar.b()) {
            bVar.f31031a.f31056q = this.f27616a.toString();
        }
        com.fyber.inneractive.sdk.response.e eVar2 = bVar.f31031a;
        String string2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        eVar2.a(num3 != null ? num3.toString() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        impressionData.setImpressionId(sessionId);
        impressionData.setDemandSource(adNetworkName);
        com.fyber.inneractive.sdk.response.e eVar3 = bVar.f31031a;
        if (l9 != null) {
            string2 = l9.toString();
        }
        eVar3.f31045d = string2;
        bVar.f31031a.getClass();
        bVar.f31031a.getClass();
        com.fyber.inneractive.sdk.response.e eVar4 = bVar.f31031a;
        eVar4.f31063x = appBundleId;
        eVar4.f31064y = this.f27619d;
        eVar4.f31065z = strValueOf;
        if (lValueOf2 != null) {
            impressionData.setDemandId(lValueOf2);
        }
        com.fyber.inneractive.sdk.response.e eVar5 = bVar.f31031a;
        eVar5.f31048g = iA;
        if (num != null) {
            eVar5.f31046e = num.intValue();
        }
        if (num2 != null) {
            bVar.f31031a.f31047f = num2.intValue();
        }
        com.fyber.inneractive.sdk.response.e eVar6 = bVar.f31031a;
        eVar6.f31052k = sdkImpressionUrl;
        eVar6.f31053l = sdkClickUrl;
        eVar6.o = adCompletionUrl;
        eVar6.f31054m = bVar.f31032b;
        try {
            eVar6.n = UnitDisplayType.fromValue(str4);
        } catch (IllegalArgumentException unused) {
            bVar.f31031a.n = UnitDisplayType.INTERSTITIAL;
        }
        if (!TextUtils.isEmpty(str)) {
            impressionData.setCreativeId(str);
        }
        if (!TextUtils.isEmpty(str2)) {
            impressionData.setAdvertiserDomain(str2);
        }
        if (!TextUtils.isEmpty(str3)) {
            impressionData.setCampaignId(str3);
        }
        impressionData.setCountry(com.fyber.inneractive.sdk.util.k.f());
        bVar.f31031a.f31057r = impressionData;
        if (boolValueOf == null) {
            i5 = -1;
        } else {
            i5 = boolValueOf.booleanValue() ? 1 : 0;
        }
        bVar.f31031a.f31061v = i5;
        String igniteInstallUrl = this.f27616a.hasIgniteInstallUrl() ? this.f27616a.getIgniteInstallUrl() : null;
        if (!TextUtils.isEmpty(igniteInstallUrl)) {
            bVar.f31031a.D = igniteInstallUrl;
        }
        com.fyber.inneractive.sdk.response.e eVar7 = bVar.f31031a;
        com.fyber.inneractive.sdk.ignite.m mVar2 = com.fyber.inneractive.sdk.ignite.m.NONE;
        AdmParametersOuterClass$AdmParameters admParametersOuterClass$AdmParameters2 = this.f27616a;
        if (admParametersOuterClass$AdmParameters2 == null) {
            mVar = mVar2;
        } else {
            n igniteMode = admParametersOuterClass$AdmParameters2.hasIgniteMode() ? this.f27616a.getIgniteMode() : null;
            if (igniteMode != null && !igniteMode.equals(n.NONE)) {
                mVar = igniteMode.equals(n.SINGLETAP) ? com.fyber.inneractive.sdk.ignite.m.SINGLE_TAP : com.fyber.inneractive.sdk.ignite.m.TRUE_SINGLE_TAP;
            }
        }
        if (mVar != null) {
            mVar2 = mVar;
        } else {
            eVar7.getClass();
        }
        eVar7.E = mVar2;
        String igniteLauncherActivity = this.f27616a.hasIgniteLauncherActivity() ? this.f27616a.getIgniteLauncherActivity() : null;
        if (!TextUtils.isEmpty(igniteLauncherActivity)) {
            bVar.f31031a.F = igniteLauncherActivity;
        }
        Boolean boolValueOf2 = this.f27616a.hasBrandBidderDontShowEndcard() ? Boolean.valueOf(this.f27616a.getBrandBidderDontShowEndcard()) : null;
        if (boolValueOf2 != null) {
            bVar.f31031a.B = boolValueOf2.booleanValue() ? "1" : "0";
        }
        String brandBidderCtaText = this.f27616a.getBrandBidderCtaText();
        if (!TextUtils.isEmpty(brandBidderCtaText)) {
            bVar.f31031a.C = brandBidderCtaText;
        }
        Boolean boolValueOf3 = this.f27616a.hasMraidVideoOMSignal() ? Boolean.valueOf(this.f27616a.getMraidVideoOMSignal()) : null;
        if (boolValueOf3 != null) {
            bVar.f31031a.G = boolValueOf3.booleanValue();
        }
        bVar.f31031a.J = CreativeType.fromValue(this.f27616a.getCreativeType());
        if (this.f27616a.hasSkipDelay()) {
            com.fyber.inneractive.sdk.response.e eVar8 = bVar.f31031a;
            double skipDelay = this.f27616a.getSkipDelay();
            eVar8.getClass();
            eVar8.L = (int) Math.round(skipDelay);
        }
        if (this.f27616a.hasSkipEndcardDelay()) {
            com.fyber.inneractive.sdk.response.e eVar9 = bVar.f31031a;
            double skipEndcardDelay = this.f27616a.getSkipEndcardDelay();
            eVar9.getClass();
            eVar9.K = (int) Math.round(skipEndcardDelay);
        }
    }

    @Override // com.fyber.inneractive.sdk.response.j
    public final String a() {
        return this.f27618c;
    }
}
