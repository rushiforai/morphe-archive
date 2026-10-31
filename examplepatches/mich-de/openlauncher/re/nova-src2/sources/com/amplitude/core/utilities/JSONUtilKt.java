package com.amplitude.core.utilities;

import b70.g;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.IngestionMetadata;
import com.amplitude.core.events.Plan;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntProgressionIterator;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000B\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\"\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0015\n\u0002\b\u0002\u001a\u001e\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0000\u001a\u0012\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b*\u00020\u0002H\u0000\u001a\u001c\u0010\n\u001a\u00020\u0004*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u0004H\u0000\u001a\u001e\u0010\f\u001a\u0004\u0018\u00010\u0002*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\b\u0010\u000b\u001a\u0004\u0018\u00010\u0002\u001a\u001e\u0010\r\u001a\u0004\u0018\u00010\u0004*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\b\u0010\u000b\u001a\u0004\u0018\u00010\u0004\u001a$\u0010\u000e\u001a\u001a\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00020\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00020\u00100\u000f*\u00020\u0011H\u0000\u001a\n\u0010\u0012\u001a\u00020\u0013*\u00020\u0002\u001a\u0010\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00130\u0010*\u00020\u0011\u001a\f\u0010\u0015\u001a\u00020\u0016*\u00020\u0011H\u0000\u001a\u0012\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0010*\u00020\u0011H\u0000¨\u0006\u0018"}, d2 = {"addValue", b.f42142b, "Lorg/json/JSONObject;", DatabaseConstants.KEY_FIELD, b.f42142b, "value", b.f42142b, "collectIndices", b.f42142b, b.f42142b, "getStringWithDefault", "defaultValue", "optionalJSONObject", "optionalString", "split", "Lkotlin/Pair;", b.f42142b, "Lorg/json/JSONArray;", "toBaseEvent", "Lcom/amplitude/core/events/BaseEvent;", "toEvents", "toIntArray", b.f42142b, "toJSONObjectList", "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class JSONUtilKt {
    public static final void addValue(@NotNull JSONObject jSONObject, @NotNull String key, @Nullable Object obj) throws JSONException {
        Intrinsics.g(jSONObject, "<this>");
        Intrinsics.g(key, "key");
        if (obj != null) {
            jSONObject.put(key, obj);
        }
    }

    @NotNull
    public static final Set<Integer> collectIndices(@NotNull JSONObject jSONObject) throws JSONException {
        Intrinsics.g(jSONObject, "<this>");
        ArrayList arrayList = new ArrayList();
        Iterator<String> itKeys = jSONObject.keys();
        Intrinsics.f(itKeys, "keys(...)");
        while (itKeys.hasNext()) {
            JSONArray jSONArray = jSONObject.getJSONArray(itKeys.next());
            Intrinsics.f(jSONArray, "getJSONArray(...)");
            for (int i5 : toIntArray(jSONArray)) {
                arrayList.add(Integer.valueOf(i5));
            }
        }
        return g.N1(arrayList);
    }

    @NotNull
    public static final String getStringWithDefault(@NotNull JSONObject jSONObject, @NotNull String key, @NotNull String defaultValue) throws JSONException {
        Intrinsics.g(jSONObject, "<this>");
        Intrinsics.g(key, "key");
        Intrinsics.g(defaultValue, "defaultValue");
        if (!jSONObject.has(key)) {
            return defaultValue;
        }
        String string = jSONObject.getString(key);
        Intrinsics.f(string, "getString(...)");
        return string;
    }

    @Nullable
    public static final JSONObject optionalJSONObject(@NotNull JSONObject jSONObject, @NotNull String key, @Nullable JSONObject jSONObject2) {
        Intrinsics.g(jSONObject, "<this>");
        Intrinsics.g(key, "key");
        return jSONObject.has(key) ? jSONObject.getJSONObject(key) : jSONObject2;
    }

    @Nullable
    public static final String optionalString(@NotNull JSONObject jSONObject, @NotNull String key, @Nullable String str) {
        Intrinsics.g(jSONObject, "<this>");
        Intrinsics.g(key, "key");
        return jSONObject.has(key) ? jSONObject.getString(key) : str;
    }

    @NotNull
    public static final Pair<List<JSONObject>, List<JSONObject>> split(@NotNull JSONArray jSONArray) {
        Intrinsics.g(jSONArray, "<this>");
        int length = jSONArray.length() / 2;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        IntProgressionIterator it = kotlin.ranges.a.m0(0, jSONArray.length()).iterator();
        while (it.f71911c) {
            int iNextInt = it.nextInt();
            if (iNextInt < length) {
                JSONObject jSONObject = jSONArray.getJSONObject(iNextInt);
                Intrinsics.f(jSONObject, "getJSONObject(...)");
                arrayList.add(jSONObject);
            } else {
                JSONObject jSONObject2 = jSONArray.getJSONObject(iNextInt);
                Intrinsics.f(jSONObject2, "getJSONObject(...)");
                arrayList2.add(jSONObject2);
            }
        }
        return new Pair<>(arrayList, arrayList2);
    }

    @NotNull
    public static final BaseEvent toBaseEvent(@NotNull JSONObject jSONObject) throws JSONException {
        Plan planFromJSONObject;
        Map<String, Object> mapObj;
        Map<String, Object> mapObj2;
        Map<String, Object> mapObj3;
        Map<String, Object> mapObj4;
        Intrinsics.g(jSONObject, "<this>");
        BaseEvent baseEvent = new BaseEvent();
        String string = jSONObject.getString("event_type");
        Intrinsics.f(string, "getString(...)");
        baseEvent.setEventType(string);
        IngestionMetadata ingestionMetadataFromJSONObject$core = null;
        baseEvent.setUserId(optionalString(jSONObject, "user_id", null));
        baseEvent.setDeviceId(optionalString(jSONObject, "device_id", null));
        baseEvent.setTimestamp(jSONObject.has("time") ? Long.valueOf(jSONObject.getLong("time")) : null);
        JSONObject jSONObjectOptionalJSONObject = optionalJSONObject(jSONObject, "event_properties", null);
        baseEvent.setEventProperties((jSONObjectOptionalJSONObject == null || (mapObj4 = JSONKt.toMapObj(jSONObjectOptionalJSONObject)) == null) ? null : MapsKt.u0(mapObj4));
        JSONObject jSONObjectOptionalJSONObject2 = optionalJSONObject(jSONObject, "user_properties", null);
        baseEvent.setUserProperties((jSONObjectOptionalJSONObject2 == null || (mapObj3 = JSONKt.toMapObj(jSONObjectOptionalJSONObject2)) == null) ? null : MapsKt.u0(mapObj3));
        JSONObject jSONObjectOptionalJSONObject3 = optionalJSONObject(jSONObject, "groups", null);
        baseEvent.setGroups((jSONObjectOptionalJSONObject3 == null || (mapObj2 = JSONKt.toMapObj(jSONObjectOptionalJSONObject3)) == null) ? null : MapsKt.u0(mapObj2));
        JSONObject jSONObjectOptionalJSONObject4 = optionalJSONObject(jSONObject, "group_properties", null);
        baseEvent.setGroupProperties((jSONObjectOptionalJSONObject4 == null || (mapObj = JSONKt.toMapObj(jSONObjectOptionalJSONObject4)) == null) ? null : MapsKt.u0(mapObj));
        baseEvent.setAppVersion(optionalString(jSONObject, "app_version", null));
        baseEvent.setPlatform(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, null));
        baseEvent.setOsName(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_OS_NAME, null));
        baseEvent.setOsVersion(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, null));
        baseEvent.setDeviceBrand(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_DEVICE_BRAND, null));
        baseEvent.setDeviceManufacturer(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MANUFACTURER, null));
        baseEvent.setDeviceModel(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL, null));
        baseEvent.setCarrier(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_CARRIER, null));
        baseEvent.setCountry(optionalString(jSONObject, "country", null));
        baseEvent.setRegion(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_REGION, null));
        baseEvent.setCity(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_CITY, null));
        baseEvent.setDma(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_DMA, null));
        baseEvent.setLanguage(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, null));
        baseEvent.setPrice(jSONObject.has("price") ? Double.valueOf(jSONObject.getDouble("price")) : null);
        baseEvent.setQuantity(jSONObject.has("quantity") ? Integer.valueOf(jSONObject.getInt("quantity")) : null);
        baseEvent.setRevenue(jSONObject.has("revenue") ? Double.valueOf(jSONObject.getDouble("revenue")) : null);
        baseEvent.setProductId(optionalString(jSONObject, "productId", null));
        baseEvent.setRevenueType(optionalString(jSONObject, "revenueType", null));
        baseEvent.setLocationLat(jSONObject.has("location_lat") ? Double.valueOf(jSONObject.getDouble("location_lat")) : null);
        baseEvent.setLocationLng(jSONObject.has("location_lng") ? Double.valueOf(jSONObject.getDouble("location_lng")) : null);
        baseEvent.setIp(optionalString(jSONObject, "ip", null));
        baseEvent.setIdfa(optionalString(jSONObject, "idfa", null));
        baseEvent.setIdfv(optionalString(jSONObject, "idfv", null));
        baseEvent.setAdid(optionalString(jSONObject, TrackingOptions.AMP_TRACKING_OPTION_ADID, null));
        baseEvent.setAndroidId(optionalString(jSONObject, "android_id", null));
        baseEvent.setAppSetId(jSONObject.optString("android_app_set_id", null));
        baseEvent.setEventId(jSONObject.has("event_id") ? Long.valueOf(jSONObject.getLong("event_id")) : null);
        baseEvent.setSessionId(jSONObject.has(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID) ? Long.valueOf(jSONObject.getLong(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID)) : null);
        baseEvent.setInsertId(optionalString(jSONObject, "insert_id", null));
        baseEvent.setLibrary(jSONObject.has(PlaceTypes.LIBRARY) ? jSONObject.getString(PlaceTypes.LIBRARY) : null);
        baseEvent.setPartnerId(optionalString(jSONObject, "partner_id", null));
        if (jSONObject.has("plan")) {
            Plan.Companion companion = Plan.INSTANCE;
            JSONObject jSONObject2 = jSONObject.getJSONObject("plan");
            Intrinsics.f(jSONObject2, "getJSONObject(...)");
            planFromJSONObject = companion.fromJSONObject(jSONObject2);
        } else {
            planFromJSONObject = null;
        }
        baseEvent.setPlan(planFromJSONObject);
        if (jSONObject.has("ingestion_metadata")) {
            IngestionMetadata.Companion companion2 = IngestionMetadata.INSTANCE;
            JSONObject jSONObject3 = jSONObject.getJSONObject("ingestion_metadata");
            Intrinsics.f(jSONObject3, "getJSONObject(...)");
            ingestionMetadataFromJSONObject$core = companion2.fromJSONObject$core(jSONObject3);
        }
        baseEvent.setIngestionMetadata(ingestionMetadataFromJSONObject$core);
        return baseEvent;
    }

    @NotNull
    public static final List<BaseEvent> toEvents(@NotNull JSONArray jSONArray) throws JSONException {
        Intrinsics.g(jSONArray, "<this>");
        ArrayList arrayList = new ArrayList();
        IntProgressionIterator it = kotlin.ranges.a.m0(0, jSONArray.length()).iterator();
        while (it.f71911c) {
            JSONObject jSONObject = jSONArray.getJSONObject(it.nextInt());
            Intrinsics.f(jSONObject, "getJSONObject(...)");
            arrayList.add(toBaseEvent(jSONObject));
        }
        return arrayList;
    }

    @NotNull
    public static final int[] toIntArray(@NotNull JSONArray jSONArray) {
        Intrinsics.g(jSONArray, "<this>");
        int length = jSONArray.length();
        int[] iArr = new int[length];
        for (int i5 = 0; i5 < length; i5++) {
            iArr[i5] = jSONArray.optInt(i5);
        }
        return iArr;
    }

    @NotNull
    public static final List<JSONObject> toJSONObjectList(@NotNull JSONArray jSONArray) throws JSONException {
        Intrinsics.g(jSONArray, "<this>");
        ArrayList arrayList = new ArrayList();
        IntProgressionIterator it = kotlin.ranges.a.m0(0, jSONArray.length()).iterator();
        while (it.f71911c) {
            JSONObject jSONObject = jSONArray.getJSONObject(it.nextInt());
            Intrinsics.f(jSONObject, "getJSONObject(...)");
            arrayList.add(jSONObject);
        }
        return arrayList;
    }
}
