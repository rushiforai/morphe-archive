package com.fyber.inneractive.sdk.response;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.CreativeType;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.ImpressionData;
import com.fyber.inneractive.sdk.ignite.m;
import com.fyber.inneractive.sdk.network.n;
import com.fyber.inneractive.sdk.network.o;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes3.dex */
public final class k implements j {

    /* renamed from: a, reason: collision with root package name */
    public final o f31068a;

    public k(o oVar) {
        this.f31068a = oVar;
    }

    @Override // com.fyber.inneractive.sdk.response.j
    public final void a(b bVar) throws NumberFormatException {
        float f11;
        double d5;
        Long lValueOf;
        bVar.f31031a.A = false;
        IAConfigManager.Q.f27764x.f27775f = false;
        ImpressionData impressionData = new ImpressionData();
        Map mapB = this.f31068a.b();
        String strA = a(mapB, n.RETURNED_AD_TYPE);
        a(mapB, n.ERROR_CODE);
        String strA2 = a(mapB, n.SESSION_ID);
        String strA3 = a(mapB, n.CONTENT_ID);
        a(mapB, n.PUBLISHER_ID);
        String strA4 = a(mapB, n.WIDTH);
        String strA5 = a(mapB, n.HEIGHT);
        String strA6 = a(mapB, n.SDK_IMPRESSION_URL);
        String strA7 = a(mapB, n.SDK_CLICK_URL);
        String strA8 = a(mapB, n.AD_TIMEOUT);
        String strA9 = a(mapB, n.AD_COMPLETION_URL);
        bVar.f31032b = a(mapB, n.AD_UNIT_ID);
        a(mapB, n.AD_UNIT_TYPE);
        String strA10 = a(mapB, n.AD_UNIT_DISPLAY_TYPE);
        String strA11 = a(mapB, n.AD_NETWORK);
        String strA12 = a(mapB, n.AD_NETWORK_ID);
        String strA13 = a(mapB, n.CREATIVE_ID);
        String strA14 = a(mapB, n.AD_DOMAIN);
        String strA15 = a(mapB, n.APP_BUNDLE);
        String strA16 = a(mapB, n.CAMPAIGN_ID);
        String strA17 = a(mapB, n.CPM_VALUE);
        String strA18 = a(mapB, n.CPM_CURRENCY);
        impressionData.setCpmValue(strA17);
        impressionData.setCurrency(strA18);
        String strA19 = a(mapB, n.BANNER_MRC_PERCENT);
        String strA20 = a(mapB, n.BANNER_MRC_DURATION);
        String strA21 = a(mapB, n.BANNER_MRC_IMPRESSION_URL);
        String strA22 = a(mapB, n.INTERSTITIAL_SKIP_MODE);
        String strA23 = a(mapB, n.IGNITE_INSTALL_URL);
        String strA24 = a(mapB, n.IGNITE_MODE);
        String strA25 = a(mapB, n.APP_BUNDLE_LAUNCHER);
        String strA26 = a(mapB, n.BRAND_BIDDER_SHOW_ENDCARD);
        String strA27 = a(mapB, n.BRAND_BIDDER_CTA_TEXT);
        String strA28 = a(mapB, n.MRAID_VIDEO_SIGNAL);
        String strA29 = a(mapB, n.CREATIVE_TYPE);
        String strA30 = a(mapB, n.SKIP_DELAY);
        String strA31 = a(mapB, n.SKIP_ENDCARD_DELAY);
        if (bVar.b()) {
            bVar.f31031a.f31055p = mapB;
        }
        bVar.f31031a.a(strA8);
        impressionData.setImpressionId(strA2);
        impressionData.setDemandSource(strA11);
        e eVar = bVar.f31031a;
        eVar.f31045d = strA3;
        eVar.f31063x = strA15;
        if (!TextUtils.isEmpty(strA12)) {
            if (TextUtils.isEmpty(strA12)) {
                lValueOf = null;
                impressionData.setDemandId(lValueOf);
            } else {
                try {
                    lValueOf = Long.valueOf(strA12);
                } catch (NumberFormatException unused) {
                }
                impressionData.setDemandId(lValueOf);
            }
        }
        if (!TextUtils.isEmpty(strA)) {
            bVar.f31031a.f31048g = Integer.valueOf(strA).intValue();
        }
        if (!TextUtils.isEmpty(strA4)) {
            bVar.f31031a.f31046e = Integer.valueOf(strA4).intValue();
        }
        if (!TextUtils.isEmpty(strA5)) {
            bVar.f31031a.f31047f = Integer.valueOf(strA5).intValue();
        }
        e eVar2 = bVar.f31031a;
        eVar2.f31052k = strA6;
        eVar2.f31053l = strA7;
        eVar2.o = strA9;
        eVar2.f31054m = bVar.f31032b;
        try {
            eVar2.n = UnitDisplayType.fromValue(strA10);
        } catch (IllegalArgumentException unused2) {
            bVar.f31031a.n = UnitDisplayType.INTERSTITIAL;
        }
        if (!TextUtils.isEmpty(strA13)) {
            impressionData.setCreativeId(strA13);
        }
        if (!TextUtils.isEmpty(strA14)) {
            impressionData.setAdvertiserDomain(strA14);
        }
        if (!TextUtils.isEmpty(strA16)) {
            impressionData.setCampaignId(strA16);
        }
        impressionData.setCountry(com.fyber.inneractive.sdk.util.k.f());
        e eVar3 = bVar.f31031a;
        eVar3.f31057r = impressionData;
        eVar3.f31058s = v.a(strA19, 0);
        e eVar4 = bVar.f31031a;
        if (TextUtils.isEmpty(strA20)) {
            f11 = -1.0f;
        } else {
            try {
                f11 = Float.parseFloat(strA20);
            } catch (NumberFormatException unused3) {
            }
        }
        eVar4.f31059t = f11;
        e eVar5 = bVar.f31031a;
        eVar5.f31060u = strA21;
        eVar5.f31061v = v.a(strA22, -1);
        if (!TextUtils.isEmpty(strA23)) {
            bVar.f31031a.D = strA23;
        }
        if (!TextUtils.isEmpty(strA24)) {
            e eVar6 = bVar.f31031a;
            m mVarA = m.a(strA24);
            if (mVarA == null) {
                eVar6.getClass();
                mVarA = m.NONE;
            }
            eVar6.E = mVarA;
        }
        if (!TextUtils.isEmpty(strA25)) {
            bVar.f31031a.F = strA25;
        }
        if (!TextUtils.isEmpty(strA26)) {
            bVar.f31031a.B = strA26;
        }
        if (!TextUtils.isEmpty(strA27)) {
            bVar.f31031a.C = strA27;
        }
        bVar.f31031a.G = "1".equals(strA28) || Boolean.parseBoolean(strA28);
        bVar.f31031a.J = CreativeType.fromValue(strA29);
        e eVar7 = bVar.f31031a;
        double d11 = -1.0d;
        if (TextUtils.isEmpty(strA30)) {
            d5 = -1.0d;
        } else {
            try {
                d5 = Double.parseDouble(strA30);
            } catch (NumberFormatException unused4) {
            }
        }
        eVar7.getClass();
        eVar7.L = (int) Math.round(d5);
        e eVar8 = bVar.f31031a;
        if (!TextUtils.isEmpty(strA31)) {
            try {
                d11 = Double.parseDouble(strA31);
            } catch (NumberFormatException unused5) {
            }
        }
        eVar8.getClass();
        eVar8.K = (int) Math.round(d11);
    }

    @Override // com.fyber.inneractive.sdk.response.j
    public final String a() {
        return this.f31068a.a().toString();
    }

    public final String a(Map map, n nVar) {
        String lowerCase = nVar.a().toLowerCase(Locale.US);
        String str = (String) map.get(lowerCase);
        IAlog.e("%s%s extracted from response header: %s", IAlog.a(this), lowerCase, str);
        IAlog.d("%s %s : %s", "RESPONSE_HEADER", lowerCase, str);
        return str;
    }
}
