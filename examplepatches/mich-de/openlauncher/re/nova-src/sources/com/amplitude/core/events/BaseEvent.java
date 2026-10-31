package com.amplitude.core.events;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0016\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\b\u0010\u0019\u001a\u00020\u001aH\u0016J\u000e\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u0001R*\u0010\u0003\u001a\u0012\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\nR\u001a\u0010\u000b\u001a\u00020\u0005X\u0096.¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000fR*\u0010\u0010\u001a\u0012\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0011\u0010\b\"\u0004\b\u0012\u0010\nR*\u0010\u0013\u001a\u0012\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\b\"\u0004\b\u0015\u0010\nR*\u0010\u0016\u001a\u0012\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0017\u0010\b\"\u0004\b\u0018\u0010\n¨\u0006\u001e"}, d2 = {"Lcom/amplitude/core/events/BaseEvent;", "Lcom/amplitude/core/events/EventOptions;", "()V", "eventProperties", b.f42142b, b.f42142b, b.f42142b, "getEventProperties", "()Ljava/util/Map;", "setEventProperties", "(Ljava/util/Map;)V", "eventType", "getEventType", "()Ljava/lang/String;", "setEventType", "(Ljava/lang/String;)V", "groupProperties", "getGroupProperties", "setGroupProperties", "groups", "getGroups", "setGroups", "userProperties", "getUserProperties", "setUserProperties", "isValid", b.f42142b, "mergeEventOptions", b.f42142b, "options", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class BaseEvent extends EventOptions {

    @Nullable
    private Map<String, Object> eventProperties;
    public String eventType;

    @Nullable
    private Map<String, Object> groupProperties;

    @Nullable
    private Map<String, Object> groups;

    @Nullable
    private Map<String, Object> userProperties;

    @Nullable
    public final Map<String, Object> getEventProperties() {
        return this.eventProperties;
    }

    @NotNull
    public String getEventType() {
        String str = this.eventType;
        if (str != null) {
            return str;
        }
        Intrinsics.m("eventType");
        throw null;
    }

    @Nullable
    public final Map<String, Object> getGroupProperties() {
        return this.groupProperties;
    }

    @Nullable
    public final Map<String, Object> getGroups() {
        return this.groups;
    }

    @Nullable
    public final Map<String, Object> getUserProperties() {
        return this.userProperties;
    }

    public boolean isValid() {
        return (getUserId() == null && getDeviceId() == null) ? false : true;
    }

    public final void mergeEventOptions(@NotNull EventOptions options) {
        Intrinsics.g(options, "options");
        String userId = options.getUserId();
        if (userId != null) {
            setUserId(userId);
        }
        String deviceId = options.getDeviceId();
        if (deviceId != null) {
            setDeviceId(deviceId);
        }
        Long timestamp = options.getTimestamp();
        if (timestamp != null) {
            setTimestamp(Long.valueOf(timestamp.longValue()));
        }
        Long eventId = options.getEventId();
        if (eventId != null) {
            setEventId(Long.valueOf(eventId.longValue()));
        }
        String insertId = options.getInsertId();
        if (insertId != null) {
            setInsertId(insertId);
        }
        Double locationLat = options.getLocationLat();
        if (locationLat != null) {
            setLocationLat(Double.valueOf(locationLat.doubleValue()));
        }
        Double locationLng = options.getLocationLng();
        if (locationLng != null) {
            setLocationLng(Double.valueOf(locationLng.doubleValue()));
        }
        String appVersion = options.getAppVersion();
        if (appVersion != null) {
            setAppVersion(appVersion);
        }
        String versionName = options.getVersionName();
        if (versionName != null) {
            setVersionName(versionName);
        }
        String platform = options.getPlatform();
        if (platform != null) {
            setPlatform(platform);
        }
        String osName = options.getOsName();
        if (osName != null) {
            setOsName(osName);
        }
        String osVersion = options.getOsVersion();
        if (osVersion != null) {
            setOsVersion(osVersion);
        }
        String deviceBrand = options.getDeviceBrand();
        if (deviceBrand != null) {
            setDeviceBrand(deviceBrand);
        }
        String deviceManufacturer = options.getDeviceManufacturer();
        if (deviceManufacturer != null) {
            setDeviceManufacturer(deviceManufacturer);
        }
        String deviceModel = options.getDeviceModel();
        if (deviceModel != null) {
            setDeviceModel(deviceModel);
        }
        String carrier = options.getCarrier();
        if (carrier != null) {
            setCarrier(carrier);
        }
        String country = options.getCountry();
        if (country != null) {
            setCountry(country);
        }
        String region = options.getRegion();
        if (region != null) {
            setRegion(region);
        }
        String city = options.getCity();
        if (city != null) {
            setCity(city);
        }
        String dma = options.getDma();
        if (dma != null) {
            setDma(dma);
        }
        String idfa = options.getIdfa();
        if (idfa != null) {
            setIdfa(idfa);
        }
        String idfv = options.getIdfv();
        if (idfv != null) {
            setIdfv(idfv);
        }
        String adid = options.getAdid();
        if (adid != null) {
            setAdid(adid);
        }
        String appSetId = options.getAppSetId();
        if (appSetId != null) {
            setAppSetId(appSetId);
        }
        String androidId = options.getAndroidId();
        if (androidId != null) {
            setAndroidId(androidId);
        }
        String language = options.getLanguage();
        if (language != null) {
            setLanguage(language);
        }
        String library = options.getLibrary();
        if (library != null) {
            setLibrary(library);
        }
        String ip2 = options.getIp();
        if (ip2 != null) {
            setIp(ip2);
        }
        Plan plan = options.getPlan();
        if (plan != null) {
            setPlan(plan);
        }
        IngestionMetadata ingestionMetadata = options.getIngestionMetadata();
        if (ingestionMetadata != null) {
            setIngestionMetadata(ingestionMetadata);
        }
        Double revenue = options.getRevenue();
        if (revenue != null) {
            setRevenue(Double.valueOf(revenue.doubleValue()));
        }
        Double price = options.getPrice();
        if (price != null) {
            setPrice(Double.valueOf(price.doubleValue()));
        }
        Integer quantity = options.getQuantity();
        if (quantity != null) {
            setQuantity(Integer.valueOf(quantity.intValue()));
        }
        String productId = options.getProductId();
        if (productId != null) {
            setProductId(productId);
        }
        String revenueType = options.getRevenueType();
        if (revenueType != null) {
            setRevenueType(revenueType);
        }
        String currency = options.getCurrency();
        if (currency != null) {
            setCurrency(currency);
        }
        Map<String, Object> extra = options.getExtra();
        if (extra != null) {
            setExtra(extra);
        }
        Function3<BaseEvent, Integer, String, Unit> callback = options.getCallback();
        if (callback != null) {
            setCallback(callback);
        }
        String partnerId = options.getPartnerId();
        if (partnerId != null) {
            setPartnerId(partnerId);
        }
        Long sessionId = options.getSessionId();
        if (sessionId != null) {
            setSessionId(Long.valueOf(sessionId.longValue()));
        }
    }

    public final void setEventProperties(@Nullable Map<String, Object> map) {
        this.eventProperties = map;
    }

    public void setEventType(@NotNull String str) {
        Intrinsics.g(str, "<set-?>");
        this.eventType = str;
    }

    public final void setGroupProperties(@Nullable Map<String, Object> map) {
        this.groupProperties = map;
    }

    public final void setGroups(@Nullable Map<String, Object> map) {
        this.groups = map;
    }

    public final void setUserProperties(@Nullable Map<String, Object> map) {
        this.userProperties = map;
    }
}
