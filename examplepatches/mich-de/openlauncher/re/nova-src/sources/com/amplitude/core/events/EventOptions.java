package com.amplitude.core.events;

import com.amplitude.android.TrackingOptions;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b \n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010$\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u0006\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b)\b\u0016\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002R\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u001c\u0010\t\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u0006\"\u0004\b\u000b\u0010\bR\u001c\u0010\f\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u0006\"\u0004\b\u000e\u0010\bR\u001c\u0010\u000f\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0006\"\u0004\b\u0011\u0010\bR\u001a\u0010\u0012\u001a\u00020\u0013X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017RX\u0010\u0018\u001a@\u0012\u0004\u0012\u00020\u001a\u0012\u0013\u0012\u00110\u0013¢\u0006\f\b\u001b\u0012\b\b\u001c\u0012\u0004\b\b(\u001d\u0012\u0013\u0012\u00110\u0004¢\u0006\f\b\u001b\u0012\b\b\u001c\u0012\u0004\b\b(\u001e\u0012\u0004\u0012\u00020\u001f\u0018\u00010\u0019j\u0004\u0018\u0001` X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\"\"\u0004\b#\u0010$R\u001c\u0010%\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b&\u0010\u0006\"\u0004\b'\u0010\bR\u001c\u0010(\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b)\u0010\u0006\"\u0004\b*\u0010\bR\u001c\u0010+\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b,\u0010\u0006\"\u0004\b-\u0010\bR\u001c\u0010.\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b/\u0010\u0006\"\u0004\b0\u0010\bR\u001c\u00101\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b2\u0010\u0006\"\u0004\b3\u0010\bR\u001c\u00104\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b5\u0010\u0006\"\u0004\b6\u0010\bR\u001c\u00107\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b8\u0010\u0006\"\u0004\b9\u0010\bR\u001c\u0010:\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b;\u0010\u0006\"\u0004\b<\u0010\bR\u001c\u0010=\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b>\u0010\u0006\"\u0004\b?\u0010\bR\u001e\u0010@\u001a\u0004\u0018\u00010AX\u0086\u000e¢\u0006\u0010\n\u0002\u0010F\u001a\u0004\bB\u0010C\"\u0004\bD\u0010ER(\u0010G\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0001\u0018\u00010HX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bI\u0010J\"\u0004\bK\u0010LR\u001c\u0010M\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bN\u0010\u0006\"\u0004\bO\u0010\bR\u001c\u0010P\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bQ\u0010\u0006\"\u0004\bR\u0010\bR\u001c\u0010S\u001a\u0004\u0018\u00010TX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bU\u0010V\"\u0004\bW\u0010XR\u001c\u0010Y\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bZ\u0010\u0006\"\u0004\b[\u0010\bR\u001c\u0010\\\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b]\u0010\u0006\"\u0004\b^\u0010\bR\u001c\u0010_\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b`\u0010\u0006\"\u0004\ba\u0010\bR\u001c\u0010b\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bc\u0010\u0006\"\u0004\bd\u0010\bR\u001e\u0010e\u001a\u0004\u0018\u00010fX\u0086\u000e¢\u0006\u0010\n\u0002\u0010k\u001a\u0004\bg\u0010h\"\u0004\bi\u0010jR\u001e\u0010l\u001a\u0004\u0018\u00010fX\u0086\u000e¢\u0006\u0010\n\u0002\u0010k\u001a\u0004\bm\u0010h\"\u0004\bn\u0010jR\u001c\u0010o\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bp\u0010\u0006\"\u0004\bq\u0010\bR\u001c\u0010r\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bs\u0010\u0006\"\u0004\bt\u0010\bR\u001c\u0010u\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bv\u0010\u0006\"\u0004\bw\u0010\bR\u001c\u0010x\u001a\u0004\u0018\u00010yX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bz\u0010{\"\u0004\b|\u0010}R\u001d\u0010~\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000f\n\u0000\u001a\u0004\b\u007f\u0010\u0006\"\u0005\b\u0080\u0001\u0010\bR!\u0010\u0081\u0001\u001a\u0004\u0018\u00010fX\u0086\u000e¢\u0006\u0012\n\u0002\u0010k\u001a\u0005\b\u0082\u0001\u0010h\"\u0005\b\u0083\u0001\u0010jR\u001f\u0010\u0084\u0001\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u0085\u0001\u0010\u0006\"\u0005\b\u0086\u0001\u0010\bR$\u0010\u0087\u0001\u001a\u0004\u0018\u00010\u0013X\u0086\u000e¢\u0006\u0015\n\u0003\u0010\u008c\u0001\u001a\u0006\b\u0088\u0001\u0010\u0089\u0001\"\u0006\b\u008a\u0001\u0010\u008b\u0001R\u001f\u0010\u008d\u0001\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u008e\u0001\u0010\u0006\"\u0005\b\u008f\u0001\u0010\bR!\u0010\u0090\u0001\u001a\u0004\u0018\u00010fX\u0086\u000e¢\u0006\u0012\n\u0002\u0010k\u001a\u0005\b\u0091\u0001\u0010h\"\u0005\b\u0092\u0001\u0010jR\u001f\u0010\u0093\u0001\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u0094\u0001\u0010\u0006\"\u0005\b\u0095\u0001\u0010\bR!\u0010\u0096\u0001\u001a\u0004\u0018\u00010AX\u0086\u000e¢\u0006\u0012\n\u0002\u0010F\u001a\u0005\b\u0097\u0001\u0010C\"\u0005\b\u0098\u0001\u0010ER!\u0010\u0099\u0001\u001a\u0004\u0018\u00010AX\u0086\u000e¢\u0006\u0012\n\u0002\u0010F\u001a\u0005\b\u009a\u0001\u0010C\"\u0005\b\u009b\u0001\u0010ER\u001f\u0010\u009c\u0001\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u009d\u0001\u0010\u0006\"\u0005\b\u009e\u0001\u0010\bR\u001f\u0010\u009f\u0001\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b \u0001\u0010\u0006\"\u0005\b¡\u0001\u0010\b¨\u0006¢\u0001"}, d2 = {"Lcom/amplitude/core/events/EventOptions;", b.f42142b, "()V", TrackingOptions.AMP_TRACKING_OPTION_ADID, b.f42142b, "getAdid", "()Ljava/lang/String;", "setAdid", "(Ljava/lang/String;)V", "androidId", "getAndroidId", "setAndroidId", "appSetId", "getAppSetId", "setAppSetId", "appVersion", "getAppVersion", "setAppVersion", "attempts", b.f42142b, "getAttempts$core", "()I", "setAttempts$core", "(I)V", "callback", "Lkotlin/Function3;", "Lcom/amplitude/core/events/BaseEvent;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "status", PglCryptUtils.KEY_MESSAGE, b.f42142b, "Lcom/amplitude/core/EventCallBack;", "getCallback", "()Lkotlin/jvm/functions/Function3;", "setCallback", "(Lkotlin/jvm/functions/Function3;)V", TrackingOptions.AMP_TRACKING_OPTION_CARRIER, "getCarrier", "setCarrier", TrackingOptions.AMP_TRACKING_OPTION_CITY, "getCity", "setCity", "country", "getCountry", "setCountry", TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, "getCurrency", "setCurrency", "deviceBrand", "getDeviceBrand", "setDeviceBrand", "deviceId", "getDeviceId", "setDeviceId", "deviceManufacturer", "getDeviceManufacturer", "setDeviceManufacturer", "deviceModel", "getDeviceModel", "setDeviceModel", TrackingOptions.AMP_TRACKING_OPTION_DMA, "getDma", "setDma", "eventId", b.f42142b, "getEventId", "()Ljava/lang/Long;", "setEventId", "(Ljava/lang/Long;)V", "Ljava/lang/Long;", "extra", b.f42142b, "getExtra", "()Ljava/util/Map;", "setExtra", "(Ljava/util/Map;)V", "idfa", "getIdfa", "setIdfa", "idfv", "getIdfv", "setIdfv", "ingestionMetadata", "Lcom/amplitude/core/events/IngestionMetadata;", "getIngestionMetadata", "()Lcom/amplitude/core/events/IngestionMetadata;", "setIngestionMetadata", "(Lcom/amplitude/core/events/IngestionMetadata;)V", "insertId", "getInsertId", "setInsertId", "ip", "getIp", "setIp", TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, "getLanguage", "setLanguage", PlaceTypes.LIBRARY, "getLibrary", "setLibrary", "locationLat", b.f42142b, "getLocationLat", "()Ljava/lang/Double;", "setLocationLat", "(Ljava/lang/Double;)V", "Ljava/lang/Double;", "locationLng", "getLocationLng", "setLocationLng", "osName", "getOsName", "setOsName", "osVersion", "getOsVersion", "setOsVersion", "partnerId", "getPartnerId", "setPartnerId", "plan", "Lcom/amplitude/core/events/Plan;", "getPlan", "()Lcom/amplitude/core/events/Plan;", "setPlan", "(Lcom/amplitude/core/events/Plan;)V", TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "getPlatform", "setPlatform", "price", "getPrice", "setPrice", "productId", "getProductId", "setProductId", "quantity", "getQuantity", "()Ljava/lang/Integer;", "setQuantity", "(Ljava/lang/Integer;)V", "Ljava/lang/Integer;", TrackingOptions.AMP_TRACKING_OPTION_REGION, "getRegion", "setRegion", "revenue", "getRevenue", "setRevenue", "revenueType", "getRevenueType", "setRevenueType", "sessionId", "getSessionId", "setSessionId", "timestamp", "getTimestamp", "setTimestamp", "userId", "getUserId", "setUserId", "versionName", "getVersionName", "setVersionName", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class EventOptions {

    @Nullable
    private String adid;

    @Nullable
    private String androidId;

    @Nullable
    private String appSetId;

    @Nullable
    private String appVersion;
    private int attempts;

    @Nullable
    private Function3<? super BaseEvent, ? super Integer, ? super String, Unit> callback;

    @Nullable
    private String carrier;

    @Nullable
    private String city;

    @Nullable
    private String country;

    @Nullable
    private String currency;

    @Nullable
    private String deviceBrand;

    @Nullable
    private String deviceId;

    @Nullable
    private String deviceManufacturer;

    @Nullable
    private String deviceModel;

    @Nullable
    private String dma;

    @Nullable
    private Long eventId;

    @Nullable
    private Map<String, ? extends Object> extra;

    @Nullable
    private String idfa;

    @Nullable
    private String idfv;

    @Nullable
    private IngestionMetadata ingestionMetadata;

    @Nullable
    private String insertId;

    @Nullable
    private String ip;

    @Nullable
    private String language;

    @Nullable
    private String library;

    @Nullable
    private Double locationLat;

    @Nullable
    private Double locationLng;

    @Nullable
    private String osName;

    @Nullable
    private String osVersion;

    @Nullable
    private String partnerId;

    @Nullable
    private Plan plan;

    @Nullable
    private String platform;

    @Nullable
    private Double price;

    @Nullable
    private String productId;

    @Nullable
    private Integer quantity;

    @Nullable
    private String region;

    @Nullable
    private Double revenue;

    @Nullable
    private String revenueType;

    @Nullable
    private Long sessionId;

    @Nullable
    private Long timestamp;

    @Nullable
    private String userId;

    @Nullable
    private String versionName;

    @Nullable
    public final String getAdid() {
        return this.adid;
    }

    @Nullable
    public final String getAndroidId() {
        return this.androidId;
    }

    @Nullable
    public final String getAppSetId() {
        return this.appSetId;
    }

    @Nullable
    public final String getAppVersion() {
        return this.appVersion;
    }

    /* renamed from: getAttempts$core, reason: from getter */
    public final int getAttempts() {
        return this.attempts;
    }

    @Nullable
    public final Function3<BaseEvent, Integer, String, Unit> getCallback() {
        return this.callback;
    }

    @Nullable
    public final String getCarrier() {
        return this.carrier;
    }

    @Nullable
    public final String getCity() {
        return this.city;
    }

    @Nullable
    public final String getCountry() {
        return this.country;
    }

    @Nullable
    public final String getCurrency() {
        return this.currency;
    }

    @Nullable
    public final String getDeviceBrand() {
        return this.deviceBrand;
    }

    @Nullable
    public final String getDeviceId() {
        return this.deviceId;
    }

    @Nullable
    public final String getDeviceManufacturer() {
        return this.deviceManufacturer;
    }

    @Nullable
    public final String getDeviceModel() {
        return this.deviceModel;
    }

    @Nullable
    public final String getDma() {
        return this.dma;
    }

    @Nullable
    public final Long getEventId() {
        return this.eventId;
    }

    @Nullable
    public final Map<String, Object> getExtra() {
        return this.extra;
    }

    @Nullable
    public final String getIdfa() {
        return this.idfa;
    }

    @Nullable
    public final String getIdfv() {
        return this.idfv;
    }

    @Nullable
    public final IngestionMetadata getIngestionMetadata() {
        return this.ingestionMetadata;
    }

    @Nullable
    public final String getInsertId() {
        return this.insertId;
    }

    @Nullable
    public final String getIp() {
        return this.ip;
    }

    @Nullable
    public final String getLanguage() {
        return this.language;
    }

    @Nullable
    public final String getLibrary() {
        return this.library;
    }

    @Nullable
    public final Double getLocationLat() {
        return this.locationLat;
    }

    @Nullable
    public final Double getLocationLng() {
        return this.locationLng;
    }

    @Nullable
    public final String getOsName() {
        return this.osName;
    }

    @Nullable
    public final String getOsVersion() {
        return this.osVersion;
    }

    @Nullable
    public final String getPartnerId() {
        return this.partnerId;
    }

    @Nullable
    public final Plan getPlan() {
        return this.plan;
    }

    @Nullable
    public final String getPlatform() {
        return this.platform;
    }

    @Nullable
    public final Double getPrice() {
        return this.price;
    }

    @Nullable
    public final String getProductId() {
        return this.productId;
    }

    @Nullable
    public final Integer getQuantity() {
        return this.quantity;
    }

    @Nullable
    public final String getRegion() {
        return this.region;
    }

    @Nullable
    public final Double getRevenue() {
        return this.revenue;
    }

    @Nullable
    public final String getRevenueType() {
        return this.revenueType;
    }

    @Nullable
    public final Long getSessionId() {
        return this.sessionId;
    }

    @Nullable
    public final Long getTimestamp() {
        return this.timestamp;
    }

    @Nullable
    public final String getUserId() {
        return this.userId;
    }

    @Nullable
    public final String getVersionName() {
        return this.versionName;
    }

    public final void setAdid(@Nullable String str) {
        this.adid = str;
    }

    public final void setAndroidId(@Nullable String str) {
        this.androidId = str;
    }

    public final void setAppSetId(@Nullable String str) {
        this.appSetId = str;
    }

    public final void setAppVersion(@Nullable String str) {
        this.appVersion = str;
    }

    public final void setAttempts$core(int i5) {
        this.attempts = i5;
    }

    public final void setCallback(@Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3) {
        this.callback = function3;
    }

    public final void setCarrier(@Nullable String str) {
        this.carrier = str;
    }

    public final void setCity(@Nullable String str) {
        this.city = str;
    }

    public final void setCountry(@Nullable String str) {
        this.country = str;
    }

    public final void setCurrency(@Nullable String str) {
        this.currency = str;
    }

    public final void setDeviceBrand(@Nullable String str) {
        this.deviceBrand = str;
    }

    public final void setDeviceId(@Nullable String str) {
        this.deviceId = str;
    }

    public final void setDeviceManufacturer(@Nullable String str) {
        this.deviceManufacturer = str;
    }

    public final void setDeviceModel(@Nullable String str) {
        this.deviceModel = str;
    }

    public final void setDma(@Nullable String str) {
        this.dma = str;
    }

    public final void setEventId(@Nullable Long l9) {
        this.eventId = l9;
    }

    public final void setExtra(@Nullable Map<String, ? extends Object> map) {
        this.extra = map;
    }

    public final void setIdfa(@Nullable String str) {
        this.idfa = str;
    }

    public final void setIdfv(@Nullable String str) {
        this.idfv = str;
    }

    public final void setIngestionMetadata(@Nullable IngestionMetadata ingestionMetadata) {
        this.ingestionMetadata = ingestionMetadata;
    }

    public final void setInsertId(@Nullable String str) {
        this.insertId = str;
    }

    public final void setIp(@Nullable String str) {
        this.ip = str;
    }

    public final void setLanguage(@Nullable String str) {
        this.language = str;
    }

    public final void setLibrary(@Nullable String str) {
        this.library = str;
    }

    public final void setLocationLat(@Nullable Double d5) {
        this.locationLat = d5;
    }

    public final void setLocationLng(@Nullable Double d5) {
        this.locationLng = d5;
    }

    public final void setOsName(@Nullable String str) {
        this.osName = str;
    }

    public final void setOsVersion(@Nullable String str) {
        this.osVersion = str;
    }

    public final void setPartnerId(@Nullable String str) {
        this.partnerId = str;
    }

    public final void setPlan(@Nullable Plan plan) {
        this.plan = plan;
    }

    public final void setPlatform(@Nullable String str) {
        this.platform = str;
    }

    public final void setPrice(@Nullable Double d5) {
        this.price = d5;
    }

    public final void setProductId(@Nullable String str) {
        this.productId = str;
    }

    public final void setQuantity(@Nullable Integer num) {
        this.quantity = num;
    }

    public final void setRegion(@Nullable String str) {
        this.region = str;
    }

    public final void setRevenue(@Nullable Double d5) {
        this.revenue = d5;
    }

    public final void setRevenueType(@Nullable String str) {
        this.revenueType = str;
    }

    public final void setSessionId(@Nullable Long l9) {
        this.sessionId = l9;
    }

    public final void setTimestamp(@Nullable Long l9) {
        this.timestamp = l9;
    }

    public final void setUserId(@Nullable String str) {
        this.userId = str;
    }

    public final void setVersionName(@Nullable String str) {
        this.versionName = str;
    }
}
