package com.tiktok.appevents;

import android.text.TextUtils;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.JSON;
import com.tiktok.util.TTConst;
import java.math.BigDecimal;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
class TTInAppPurchaseManager {
    private static JSONArray getContents(TTPurchaseInfo tTPurchaseInfo) {
        JSONArray jSONArrayBuildArr = JSON.buildArr();
        try {
            JSONObject jSONObjectBuild = JSON.build();
            JSON.putObject(jSONObjectBuild, TTContentsEventConstants.Params.EVENT_PROPERTY_CONTENT_ID, JSON.getString(tTPurchaseInfo.getPurchase(), "productId"));
            JSON.putObject(jSONObjectBuild, TTContentsEventConstants.Params.EVENT_PROPERTY_CONTENT_TYPE, tTPurchaseInfo.isSubs() ? "SUB" : "SKU");
            JSON.putInt(jSONObjectBuild, "quantity", JSON.getInt(tTPurchaseInfo.getPurchase(), "quantity"));
            JSON.putDouble(jSONObjectBuild, "price", getPrice(tTPurchaseInfo.getSkuDetails()));
            JSON.putObject(jSONObjectBuild, "title", JSON.getString(tTPurchaseInfo.getSkuDetails(), "title"));
            JSON.putObject(jSONObjectBuild, TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, JSON.getString(tTPurchaseInfo.getSkuDetails(), TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION));
            JSON.putObject(jSONObjectBuild, "subscription_period", JSON.getString(tTPurchaseInfo.getSkuDetails(), "subscriptionPeriod"));
            JSON.putInt(jSONObjectBuild, "subscription_period_number", JSON.getInt(tTPurchaseInfo.getSkuDetails(), "subscriptionPeriodNumber"));
            JSON.putObject(jSONObjectBuild, "free_trial_period", JSON.getString(tTPurchaseInfo.getSkuDetails(), "freeTrialPeriod"));
            JSONArray jSONArrayBuildArr2 = JSON.buildArr();
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, "offer_id", JSON.getString(tTPurchaseInfo.getSkuDetails(), "offer_id"));
            JSON.putObject(jSONObjectBuild2, TTConst.TRACK_TYPE, JSON.getString(tTPurchaseInfo.getSkuDetails(), "offer_type"));
            JSON.putObject(jSONObjectBuild2, "price", JSON.getString(tTPurchaseInfo.getSkuDetails(), "price"));
            if (!TextUtils.isEmpty(JSON.getString(tTPurchaseInfo.getSkuDetails(), "freeTrialPeriod"))) {
                JSON.putObject(jSONObjectBuild2, "payment_mode", "pay_as_you_go");
            }
            JSON.putArr(jSONArrayBuildArr2, jSONObjectBuild2);
            JSON.putObject(jSONObjectBuild, "offers", jSONArrayBuildArr2);
            JSON.putArr(jSONArrayBuildArr, jSONObjectBuild);
        } catch (Throwable unused) {
        }
        return jSONArrayBuildArr;
    }

    private static JSONObject getOrder(TTPurchaseInfo tTPurchaseInfo) {
        JSONObject jSONObjectBuild = JSON.build();
        try {
            JSON.putObject(jSONObjectBuild, TTContentsEventConstants.Params.EVENT_PROPERTY_ORDER_ID, JSON.getString(tTPurchaseInfo.getPurchase(), "orderId"));
            JSON.putLong(jSONObjectBuild, "order_time", JSON.getLong(tTPurchaseInfo.getPurchase(), "purchaseTime"));
            JSON.putObject(jSONObjectBuild, "order_token", JSON.getString(tTPurchaseInfo.getPurchase(), "token", JSON.getString(tTPurchaseInfo.getPurchase(), "purchaseToken")));
            JSON.putObject(jSONObjectBuild, "is_auto_renewing", Boolean.valueOf(JSON.getBoolean(tTPurchaseInfo.getPurchase(), "autoRenewing", false)));
        } catch (Throwable unused) {
        }
        return jSONObjectBuild;
    }

    private static double getPrice(JSONObject jSONObject) {
        try {
            return BigDecimal.valueOf(JSON.getLong(jSONObject, "price_amount_micros", 0L) / 1000000.0d).doubleValue();
        } catch (Throwable unused) {
            return 0.0d;
        }
    }

    public static JSONObject getPurchaseProps(TTPurchaseInfo tTPurchaseInfo) {
        try {
            JSONObject jSONObjectBuild = JSON.build();
            if (tTPurchaseInfo.isAutoTrack()) {
                JSON.putObject(jSONObjectBuild, TTConst.TRACK_TYPE, TTConst.TRACK_TYPE_AUTO);
            }
            JSON.putObject(jSONObjectBuild, TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, JSON.getString(tTPurchaseInfo.getSkuDetails(), "price_currency_code"));
            JSON.putDouble(jSONObjectBuild, "value", getPrice(tTPurchaseInfo.getSkuDetails()));
            JSON.putDouble(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, JSON.getInt(tTPurchaseInfo.getPurchase(), "purchaseState", 1));
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, "purchase", tTPurchaseInfo.getPurchase());
            JSON.putObject(jSONObjectBuild2, "sku", tTPurchaseInfo.getSkuDetails());
            JSON.putObject(jSONObjectBuild, "original_json", jSONObjectBuild2);
            JSON.putObject(jSONObjectBuild, TTContentsEventConstants.Params.EVENT_PROPERTY_CONTENTS, getContents(tTPurchaseInfo));
            JSON.putObject(jSONObjectBuild, "order", getOrder(tTPurchaseInfo));
            return jSONObjectBuild;
        } catch (Throwable unused) {
            return null;
        }
    }
}
