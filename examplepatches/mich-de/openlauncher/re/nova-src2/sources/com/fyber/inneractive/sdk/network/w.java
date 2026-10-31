package com.fyber.inneractive.sdk.network;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.Track;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.ImpressionData;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.util.IAlog;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class w {

    /* renamed from: h, reason: collision with root package name */
    public static final SimpleDateFormat f28817h = new SimpleDateFormat("yyyy-MM-dd", Locale.US);

    /* renamed from: a, reason: collision with root package name */
    public InneractiveAdRequest f28818a;

    /* renamed from: b, reason: collision with root package name */
    public t f28819b;

    /* renamed from: c, reason: collision with root package name */
    public u f28820c;

    /* renamed from: d, reason: collision with root package name */
    public JSONArray f28821d;

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.response.e f28822e;

    /* renamed from: f, reason: collision with root package name */
    public final JSONArray f28823f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f28824g;

    public w(t tVar) {
        this((com.fyber.inneractive.sdk.response.e) null);
        this.f28819b = tVar;
        this.f28818a = null;
        this.f28821d = null;
    }

    public final w a(Object... objArr) {
        if (objArr.length > 0) {
            JSONObject jSONObject = new JSONObject();
            for (int i5 = 0; i5 < objArr.length - 1; i5 += 2) {
                String string = objArr[i5].toString();
                Object obj = objArr[i5 + 1];
                try {
                    jSONObject.put(string, obj);
                } catch (Exception unused) {
                    IAlog.f("Got exception adding param to json object: %s, %s", string, obj);
                }
            }
            this.f28823f.put(jSONObject);
        }
        return this;
    }

    public w(t tVar, InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar) {
        this(eVar);
        this.f28819b = tVar;
        this.f28818a = inneractiveAdRequest;
        this.f28821d = null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:68:0x00e9, code lost:
    
        if (r6 != false) goto L69;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(String str) {
        String str2;
        String str3;
        Long l9;
        String str4;
        String str5;
        String campaignId;
        String spotId;
        InneractiveAdRequest inneractiveAdRequest;
        com.fyber.inneractive.sdk.response.e eVar;
        boolean zIsDeprecated;
        UnitDisplayType unitDisplayType;
        UnitDisplayType unitDisplayType2;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        if (iAConfigManager.K.get() || iAConfigManager.f27748f != null) {
            if (!u.INVALID_GDPR_APPLIES_FLAG.equals(this.f28820c) && IAConfigManager.c() && !u.IA_IAB_GDPR_TCF_PURPOSE_1_DISABLED.equals(this.f28820c)) {
                String strA = IAlog.a(this);
                Object obj = this.f28820c;
                if (obj == null) {
                    obj = this.f28819b;
                }
                IAlog.a("%sSdk event dispatcher, Purpose 1 disabled - aborting dispatch: %s", strA, obj);
                return false;
            }
            com.fyber.inneractive.sdk.response.e eVar2 = this.f28822e;
            if (eVar2 != null) {
                ImpressionData impressionData = eVar2.f31057r;
                String impressionId = impressionData != null ? impressionData.getImpressionId() : null;
                ImpressionData impressionData2 = this.f28822e.f31057r;
                String demandSource = impressionData2 != null ? impressionData2.getDemandSource() : null;
                ImpressionData impressionData3 = this.f28822e.f31057r;
                Long demandId = impressionData3 != null ? impressionData3.getDemandId() : null;
                ImpressionData impressionData4 = this.f28822e.f31057r;
                String creativeId = impressionData4 != null ? impressionData4.getCreativeId() : null;
                ImpressionData impressionData5 = this.f28822e.f31057r;
                String advertiserDomain = impressionData5 != null ? impressionData5.getAdvertiserDomain() : null;
                ImpressionData impressionData6 = this.f28822e.f31057r;
                if (impressionData6 != null) {
                    str2 = impressionId;
                    str3 = demandSource;
                    l9 = demandId;
                    str4 = creativeId;
                    str5 = advertiserDomain;
                    campaignId = impressionData6.getCampaignId();
                } else {
                    str2 = impressionId;
                    campaignId = null;
                    str3 = demandSource;
                    l9 = demandId;
                    str4 = creativeId;
                    str5 = advertiserDomain;
                }
            } else {
                str2 = null;
                str3 = null;
                l9 = null;
                str4 = null;
                str5 = null;
                campaignId = null;
            }
            y yVar = new y(iAConfigManager.f27745c, str2, str3, l9, str4, str5, campaignId, str);
            InneractiveAdRequest inneractiveAdRequest2 = this.f28818a;
            com.fyber.inneractive.sdk.config.x0 selectedUnitConfig = inneractiveAdRequest2 == null ? null : inneractiveAdRequest2.getSelectedUnitConfig();
            if (selectedUnitConfig != null) {
                com.fyber.inneractive.sdk.config.w0 w0Var = (com.fyber.inneractive.sdk.config.w0) selectedUnitConfig;
                com.fyber.inneractive.sdk.config.t0 t0Var = w0Var.f27946d;
                Track track = Track.ERRORS;
                Set set = t0Var.f27934a;
                if (set == null ? false : set.contains(track)) {
                    com.fyber.inneractive.sdk.config.q0 q0Var = w0Var.f27945c;
                    if (q0Var != null && (unitDisplayType2 = q0Var.f27882b) != null) {
                        zIsDeprecated = unitDisplayType2.isDeprecated();
                    } else {
                        com.fyber.inneractive.sdk.config.y0 y0Var = w0Var.f27948f;
                        zIsDeprecated = (y0Var == null || (unitDisplayType = y0Var.f27963j) == null) ? false : unitDisplayType.isDeprecated();
                    }
                }
                return false;
            }
            if (selectedUnitConfig == null && (eVar = this.f28822e) != null) {
                com.fyber.inneractive.sdk.config.a.a(eVar.f31054m);
            }
            com.fyber.inneractive.sdk.response.e eVar3 = this.f28822e;
            String str6 = eVar3 == null ? null : eVar3.f31045d;
            String str7 = TextUtils.isEmpty(iAConfigManager.f27760t) ? null : iAConfigManager.f27760t;
            if (this.f28819b == null && this.f28820c == null) {
                IAlog.a("Sdk event dispatcher - error id or event id must be provided", new Object[0]);
                return false;
            }
            InneractiveAdRequest inneractiveAdRequest3 = this.f28818a;
            if (inneractiveAdRequest3 != null) {
                spotId = inneractiveAdRequest3.getSpotId();
            } else {
                com.fyber.inneractive.sdk.response.e eVar4 = this.f28822e;
                spotId = eVar4 != null ? eVar4.f31065z : null;
            }
            StringBuilder sb2 = new StringBuilder();
            if (!TextUtils.isEmpty(iAConfigManager.f27755m)) {
                sb2.append(iAConfigManager.f27755m);
                sb2.append("_");
            }
            com.fyber.inneractive.sdk.response.e eVar5 = this.f28822e;
            UnitDisplayType unitDisplayTypeA = eVar5 == null ? null : eVar5.n;
            if (unitDisplayTypeA == null && (inneractiveAdRequest = this.f28818a) != null && inneractiveAdRequest.getSpotId() != null) {
                unitDisplayTypeA = com.fyber.inneractive.sdk.serverapi.b.a(this.f28818a.getSpotId());
            }
            sb2.append(unitDisplayTypeA != null ? unitDisplayTypeA.name().toLowerCase(Locale.US) : "unknown");
            String string = sb2.toString();
            com.fyber.inneractive.sdk.response.e eVar6 = this.f28822e;
            Integer numValueOf = eVar6 != null ? Integer.valueOf(eVar6.f31048g) : null;
            com.fyber.inneractive.sdk.response.e eVar7 = this.f28822e;
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new v(this, yVar, str6, str7, string, spotId, numValueOf, eVar7 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : eVar7.f31049h));
            return true;
        }
        String strA2 = IAlog.a(this);
        Object obj2 = this.f28820c;
        if (obj2 == null) {
            obj2 = this.f28819b;
        }
        IAlog.a("%sSdk event dispatcher, GDPR header missing - aborting dispatch: %s", strA2, obj2);
        return false;
    }

    public w(u uVar) {
        this((com.fyber.inneractive.sdk.response.e) null);
        this.f28820c = uVar;
        this.f28818a = null;
        this.f28821d = null;
    }

    public w(u uVar, InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar) {
        this(eVar);
        this.f28820c = uVar;
        this.f28818a = inneractiveAdRequest;
        this.f28821d = null;
    }

    public w(com.fyber.inneractive.sdk.response.e eVar) {
        this.f28824g = false;
        this.f28822e = eVar;
        this.f28823f = new JSONArray();
    }
}
