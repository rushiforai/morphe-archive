package defpackage;

import android.os.Bundle;
import com.squareup.wire.sjIw.ezwlgQm;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Currency;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class wk0 {
    public static final md5 a = new md5(f94.a());

    public static final synchronized Bundle a(ArrayList arrayList) {
        vk0 vk0Var;
        vk0Var = (vk0) arrayList.get(0);
        return tz5.c(d46.Q(new dz5("fb_mobile_purchase", vk0Var.a.doubleValue(), vk0Var.b)), System.currentTimeMillis(), true, d46.Q(new f09(vk0Var.c, vk0Var.d)));
    }

    public static vk0 b(String str, Bundle bundle, ov8 ov8Var, JSONObject jSONObject, JSONObject jSONObject2) {
        if (str.equals(wz5.SUBS.getType())) {
            Map map = ov8.b;
            pv8 pv8Var = pv8.IAPParameters;
            String string = Boolean.toString(jSONObject.optBoolean("autoRenewing", false));
            string.getClass();
            aq7.h(pv8Var, "fb_iap_subs_auto_renewing", string, bundle, ov8Var);
            String strOptString = jSONObject2.optString("subscriptionPeriod");
            strOptString.getClass();
            aq7.h(pv8Var, "fb_iap_subs_period", strOptString, bundle, ov8Var);
            String strOptString2 = jSONObject2.optString("freeTrialPeriod");
            strOptString2.getClass();
            aq7.h(pv8Var, "fb_free_trial_period", strOptString2, bundle, ov8Var);
            String strOptString3 = jSONObject2.optString("introductoryPriceCycles");
            strOptString3.getClass();
            if (strOptString3.length() > 0) {
                aq7.h(pv8Var, "fb_intro_price_cycles", strOptString3, bundle, ov8Var);
            }
            String strOptString4 = jSONObject2.optString("introductoryPricePeriod");
            strOptString4.getClass();
            if (strOptString4.length() > 0) {
                aq7.h(pv8Var, "fb_intro_period", strOptString4, bundle, ov8Var);
            }
            String strOptString5 = jSONObject2.optString("introductoryPriceAmountMicros");
            strOptString5.getClass();
            if (strOptString5.length() > 0) {
                aq7.h(pv8Var, "fb_intro_price_amount_micros", strOptString5, bundle, ov8Var);
            }
        }
        BigDecimal bigDecimal = new BigDecimal(jSONObject2.getLong("price_amount_micros") / 1000000.0d);
        Currency currency = Currency.getInstance(jSONObject2.getString("price_currency_code"));
        currency.getClass();
        return new vk0(bigDecimal, currency, bundle, ov8Var);
    }

    public static final boolean d() {
        xe4 xe4VarB = af4.b(f94.b());
        return xe4VarB != null && mme.c() && xe4VarB.f;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x00d1 A[Catch: Exception -> 0x003c, JSONException -> 0x0040, TryCatch #8 {JSONException -> 0x0040, Exception -> 0x003c, blocks: (B:6:0x001a, B:8:0x0030, B:13:0x0044, B:21:0x00d1, B:22:0x00da, B:23:0x00e2, B:25:0x00e8, B:26:0x0102, B:28:0x010a, B:29:0x0117, B:31:0x011f, B:33:0x0127, B:19:0x00cb, B:16:0x00c7), top: B:117:0x001a, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00e8 A[Catch: Exception -> 0x003c, JSONException -> 0x0040, LOOP:0: B:23:0x00e2->B:25:0x00e8, LOOP_END, TryCatch #8 {JSONException -> 0x0040, Exception -> 0x003c, blocks: (B:6:0x001a, B:8:0x0030, B:13:0x0044, B:21:0x00d1, B:22:0x00da, B:23:0x00e2, B:25:0x00e8, B:26:0x0102, B:28:0x010a, B:29:0x0117, B:31:0x011f, B:33:0x0127, B:19:0x00cb, B:16:0x00c7), top: B:117:0x001a, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x010a A[Catch: Exception -> 0x003c, JSONException -> 0x0040, TryCatch #8 {JSONException -> 0x0040, Exception -> 0x003c, blocks: (B:6:0x001a, B:8:0x0030, B:13:0x0044, B:21:0x00d1, B:22:0x00da, B:23:0x00e2, B:25:0x00e8, B:26:0x0102, B:28:0x010a, B:29:0x0117, B:31:0x011f, B:33:0x0127, B:19:0x00cb, B:16:0x00c7), top: B:117:0x001a, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0117 A[Catch: Exception -> 0x003c, JSONException -> 0x0040, TryCatch #8 {JSONException -> 0x0040, Exception -> 0x003c, blocks: (B:6:0x001a, B:8:0x0030, B:13:0x0044, B:21:0x00d1, B:22:0x00da, B:23:0x00e2, B:25:0x00e8, B:26:0x0102, B:28:0x010a, B:29:0x0117, B:31:0x011f, B:33:0x0127, B:19:0x00cb, B:16:0x00c7), top: B:117:0x001a, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x017f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(java.lang.String r13, java.lang.String r14, boolean r15, defpackage.vz5 r16, boolean r17) {
        /*
            Method dump skipped, instruction units count: 702
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wk0.e(java.lang.String, java.lang.String, boolean, vz5, boolean):void");
    }

    public static ArrayList c(String str, Bundle bundle, ov8 ov8Var, JSONObject jSONObject) throws JSONException {
        int i = 0;
        if (!str.equals(wz5.SUBS.getType())) {
            JSONObject jSONObject2 = jSONObject.getJSONObject(ezwlgQm.jQkN);
            if (jSONObject2 == null) {
                return null;
            }
            BigDecimal bigDecimal = new BigDecimal(jSONObject2.getLong("priceAmountMicros") / 1000000.0d);
            Currency currency = Currency.getInstance(jSONObject2.getString("priceCurrencyCode"));
            currency.getClass();
            return d46.T(new vk0(bigDecimal, currency, bundle, ov8Var));
        }
        ArrayList arrayList = new ArrayList();
        String str2 = "subscriptionOfferDetails";
        JSONArray jSONArray = jSONObject.getJSONArray("subscriptionOfferDetails");
        if (jSONArray == null) {
            return null;
        }
        int length = jSONArray.length();
        while (i < length) {
            JSONObject jSONObject3 = jSONObject.getJSONArray(str2).getJSONObject(i);
            if (jSONObject3 == null) {
                return null;
            }
            Bundle bundle2 = new Bundle(bundle);
            ov8 ov8Var2 = new ov8();
            LinkedHashMap linkedHashMap = ov8Var.a;
            for (pv8 pv8Var : linkedHashMap.keySet()) {
                Map map = (Map) linkedHashMap.get(pv8Var);
                if (map != null) {
                    for (String str3 : map.keySet()) {
                        int i2 = i;
                        Object obj = map.get(str3);
                        if (obj != null) {
                            ov8Var2.a(pv8Var, str3, obj);
                        }
                        i = i2;
                    }
                }
            }
            int i3 = i;
            String string = jSONObject3.getString("basePlanId");
            Map map2 = ov8.b;
            pv8 pv8Var2 = pv8.IAPParameters;
            string.getClass();
            aq7.h(pv8Var2, "fb_iap_base_plan", string, bundle2, ov8Var2);
            JSONObject jSONObject4 = jSONObject3.getJSONArray("pricingPhases").getJSONObject(r4.length() - 1);
            if (jSONObject4 == null) {
                return null;
            }
            String strOptString = jSONObject4.optString("billingPeriod");
            strOptString.getClass();
            aq7.h(pv8Var2, "fb_iap_subs_period", strOptString, bundle2, ov8Var2);
            if (!jSONObject4.has("recurrenceMode") || jSONObject4.getInt("recurrenceMode") == 3) {
                aq7.h(pv8Var2, "fb_iap_subs_auto_renewing", "false", bundle2, ov8Var2);
            } else {
                aq7.h(pv8Var2, "fb_iap_subs_auto_renewing", "true", bundle2, ov8Var2);
            }
            BigDecimal bigDecimal2 = new BigDecimal(jSONObject4.getLong("priceAmountMicros") / 1000000.0d);
            Currency currency2 = Currency.getInstance(jSONObject4.getString("priceCurrencyCode"));
            currency2.getClass();
            arrayList.add(new vk0(bigDecimal2, currency2, bundle2, ov8Var2));
            i = i3 + 1;
            str2 = str2;
        }
        return arrayList;
    }
}
