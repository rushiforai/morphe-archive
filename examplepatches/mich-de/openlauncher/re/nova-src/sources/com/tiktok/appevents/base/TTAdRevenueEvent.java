package com.tiktok.appevents.base;

import com.tiktok.appevents.base.TTBaseEvent;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTAdRevenueEvent extends TTBaseEvent {
    public TTAdRevenueEvent(String str, JSONObject jSONObject, String str2) {
        super(str, jSONObject, str2);
    }

    public static TTBaseEvent.Builder newBuilder(JSONObject jSONObject) {
        TTBaseEvent.Builder builder = new TTBaseEvent.Builder(EventName.IMPRESSION_LEVEL_AD_REVENUE.toString());
        builder.addProperty("ad_revenue", jSONObject);
        return builder;
    }

    public static TTBaseEvent.Builder newBuilder(JSONObject jSONObject, String str) {
        TTBaseEvent.Builder builder = new TTBaseEvent.Builder(EventName.IMPRESSION_LEVEL_AD_REVENUE.toString(), str);
        builder.addProperty("ad_revenue", jSONObject);
        return builder;
    }
}
