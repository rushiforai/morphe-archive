package com.amplitude.core.utilities;

import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.IngestionMetadata;
import com.amplitude.core.events.Plan;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006J\u000e\u0010\u0007\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\u0006J\u0014\u0010\t\u001a\u00020\b2\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00060\u000bJ\u0010\u0010\f\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\bH\u0002J\u0010\u0010\f\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eJ\u0012\u0010\f\u001a\u00020\u00042\b\u0010\u0010\u001a\u0004\u0018\u00010\u0004H\u0002¨\u0006\u0011"}, d2 = {"Lcom/amplitude/core/utilities/JSONUtil;", b.f42142b, "()V", "eventToJsonObject", "Lorg/json/JSONObject;", DatabaseConstants.EVENT_FIELD, "Lcom/amplitude/core/events/BaseEvent;", "eventToString", b.f42142b, "eventsToString", DatabaseConstants.EVENT_TABLE_NAME, b.f42142b, "truncate", "value", "Lorg/json/JSONArray;", "array", "obj", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class JSONUtil {

    @NotNull
    public static final JSONUtil INSTANCE = new JSONUtil();

    private JSONUtil() {
    }

    private final JSONObject truncate(JSONObject obj) throws JSONException {
        if (obj == null) {
            return new JSONObject();
        }
        if (obj.length() > 1024) {
            throw new IllegalArgumentException("Too many properties (more than 1024) in JSON");
        }
        Iterator<String> itKeys = obj.keys();
        Intrinsics.f(itKeys, "keys(...)");
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            Intrinsics.e(next, "null cannot be cast to non-null type kotlin.String");
            String str = next;
            try {
                Object obj2 = obj.get(str);
                if (obj2.getClass().equals(String.class)) {
                    obj.put(str, truncate((String) obj2));
                } else if (obj2.getClass().equals(JSONObject.class)) {
                    obj.put(str, truncate((JSONObject) obj2));
                } else if (obj2.getClass().equals(JSONArray.class)) {
                    obj.put(str, truncate((JSONArray) obj2));
                }
            } catch (JSONException unused) {
                throw new IllegalArgumentException("JSON parsing error. Too long (> 1024 chars) or invalid JSON");
            }
        }
        return obj;
    }

    @NotNull
    public final JSONObject eventToJsonObject(@NotNull BaseEvent event) throws JSONException {
        Intrinsics.g(event, "event");
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("event_type", event.getEventType());
        JSONUtilKt.addValue(jSONObject, "user_id", event.getUserId());
        JSONUtilKt.addValue(jSONObject, "device_id", event.getDeviceId());
        JSONUtilKt.addValue(jSONObject, "time", event.getTimestamp());
        JSONUtilKt.addValue(jSONObject, "event_properties", truncate(JSONKt.toJSONObject(event.getEventProperties())));
        JSONUtilKt.addValue(jSONObject, "user_properties", truncate(JSONKt.toJSONObject(event.getUserProperties())));
        JSONUtilKt.addValue(jSONObject, "groups", truncate(JSONKt.toJSONObject(event.getGroups())));
        JSONUtilKt.addValue(jSONObject, "group_properties", truncate(JSONKt.toJSONObject(event.getGroupProperties())));
        JSONUtilKt.addValue(jSONObject, "app_version", event.getAppVersion());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, event.getPlatform());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_OS_NAME, event.getOsName());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, event.getOsVersion());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_DEVICE_BRAND, event.getDeviceBrand());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MANUFACTURER, event.getDeviceManufacturer());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL, event.getDeviceModel());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_CARRIER, event.getCarrier());
        JSONUtilKt.addValue(jSONObject, "country", event.getCountry());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_REGION, event.getRegion());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_CITY, event.getCity());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_DMA, event.getDma());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, event.getLanguage());
        JSONUtilKt.addValue(jSONObject, "price", event.getPrice());
        JSONUtilKt.addValue(jSONObject, "quantity", event.getQuantity());
        JSONUtilKt.addValue(jSONObject, "revenue", event.getRevenue());
        JSONUtilKt.addValue(jSONObject, "productId", event.getProductId());
        JSONUtilKt.addValue(jSONObject, "revenueType", event.getRevenueType());
        JSONUtilKt.addValue(jSONObject, TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, event.getCurrency());
        JSONUtilKt.addValue(jSONObject, "location_lat", event.getLocationLat());
        JSONUtilKt.addValue(jSONObject, "location_lng", event.getLocationLng());
        JSONUtilKt.addValue(jSONObject, "ip", event.getIp());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_VERSION_NAME, event.getVersionName());
        JSONUtilKt.addValue(jSONObject, "idfa", event.getIdfa());
        JSONUtilKt.addValue(jSONObject, "idfv", event.getIdfv());
        JSONUtilKt.addValue(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_ADID, event.getAdid());
        JSONUtilKt.addValue(jSONObject, "android_id", event.getAndroidId());
        JSONUtilKt.addValue(jSONObject, "event_id", event.getEventId());
        JSONUtilKt.addValue(jSONObject, SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, event.getSessionId());
        JSONUtilKt.addValue(jSONObject, "insert_id", event.getInsertId());
        JSONUtilKt.addValue(jSONObject, PlaceTypes.LIBRARY, event.getLibrary());
        JSONUtilKt.addValue(jSONObject, "partner_id", event.getPartnerId());
        JSONUtilKt.addValue(jSONObject, "android_app_set_id", event.getAppSetId());
        Plan plan = event.getPlan();
        if (plan != null) {
            jSONObject.put("plan", plan.toJSONObject$core());
        }
        IngestionMetadata ingestionMetadata = event.getIngestionMetadata();
        if (ingestionMetadata != null) {
            jSONObject.put("ingestion_metadata", ingestionMetadata.toJSONObject$core());
        }
        return jSONObject;
    }

    @NotNull
    public final String eventToString(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        String string = eventToJsonObject(event).toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @NotNull
    public final String eventsToString(@NotNull List<? extends BaseEvent> events) {
        Intrinsics.g(events, "events");
        if (events.isEmpty()) {
            return b.f42142b;
        }
        JSONArray jSONArray = new JSONArray();
        Iterator<? extends BaseEvent> it = events.iterator();
        while (it.hasNext()) {
            jSONArray.put(eventToJsonObject(it.next()));
        }
        String string = jSONArray.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @NotNull
    public final JSONArray truncate(@Nullable JSONArray array) throws JSONException {
        if (array == null) {
            return new JSONArray();
        }
        int length = array.length();
        for (int i5 = 0; i5 < length; i5++) {
            Object obj = array.get(i5);
            if (obj.getClass().equals(String.class)) {
                array.put(i5, truncate((String) obj));
            } else if (obj.getClass().equals(JSONObject.class)) {
                array.put(i5, truncate((JSONObject) obj));
            } else if (obj.getClass().equals(JSONArray.class)) {
                array.put(i5, truncate((JSONArray) obj));
            }
        }
        return array;
    }

    private final String truncate(String value) {
        if (value.length() <= 1024) {
            return value;
        }
        String strSubstring = value.substring(0, 1024);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }
}
