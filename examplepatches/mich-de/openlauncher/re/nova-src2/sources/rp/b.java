package rp;

import b50.d;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class b extends JSONObject {

    /* renamed from: a, reason: collision with root package name */
    public final String[] f86131a = {"ad_platform", "ad_currency", "ad_revenue"};

    static {
        new d(b.class.getSimpleName());
    }

    public b(String str, double d5) throws JSONException {
        try {
            put("ad_platform", MolocoMediationAdapter.MEDIATION_PLATFORM_NAME);
            put("ad_currency", str);
            put("ad_revenue", d5);
            put("r", d5);
            put("pcc", str);
            put("is_admon_revenue", true);
            put("is_revenue_event", true);
            put("ad_mediation_platform", MolocoMediationAdapter.MEDIATION_PLATFORM_NAME);
        } catch (JSONException unused) {
        }
    }
}
