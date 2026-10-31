package com.amplitude.android;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010#\n\u0002\u0010\u000e\n\u0002\b\u0016\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0017\u0018\u0000 62\u00020\u0001:\u00016B\u0005¢\u0006\u0002\u0010\u0002J\u0006\u0010\n\u001a\u00020\u0000J\u0006\u0010\u000b\u001a\u00020\u0000J\u0006\u0010\f\u001a\u00020\u0000J\u0006\u0010\r\u001a\u00020\u0000J\u0006\u0010\u000e\u001a\u00020\u0000J\u0006\u0010\u000f\u001a\u00020\u0000J\u0006\u0010\u0010\u001a\u00020\u0000J\u0006\u0010\u0011\u001a\u00020\u0000J\u0006\u0010\u0012\u001a\u00020\u0000J\u0006\u0010\u0013\u001a\u00020\u0000J\u0006\u0010\u0014\u001a\u00020\u0000J\u0006\u0010\u0015\u001a\u00020\u0000J\u0006\u0010\u0016\u001a\u00020\u0000J\u0006\u0010\u0017\u001a\u00020\u0000J\u0006\u0010\u0018\u001a\u00020\u0000J\u0006\u0010\u0019\u001a\u00020\u0000J\u0006\u0010\u001a\u001a\u00020\u0000J\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u0005H\u0002J\u0006\u0010\u001e\u001a\u00020\u0000J\u0013\u0010\u001f\u001a\u00020 2\b\u0010!\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u000e\u0010\"\u001a\u00020\u00002\u0006\u0010!\u001a\u00020\u0000J\u0006\u0010#\u001a\u00020 J\u0006\u0010$\u001a\u00020 J\u0006\u0010%\u001a\u00020 J\u0006\u0010&\u001a\u00020 J\u0006\u0010'\u001a\u00020 J\u0006\u0010(\u001a\u00020 J\u0006\u0010)\u001a\u00020 J\u0006\u0010*\u001a\u00020 J\u0006\u0010+\u001a\u00020 J\u0006\u0010,\u001a\u00020 J\u0010\u0010-\u001a\u00020 2\u0006\u0010\u001d\u001a\u00020\u0005H\u0002J\u0006\u0010.\u001a\u00020 J\u0006\u0010/\u001a\u00020 J\u0006\u00100\u001a\u00020 J\u0006\u00101\u001a\u00020 J\u0006\u00102\u001a\u00020 J\u0006\u00103\u001a\u00020 J\u0006\u00104\u001a\u00020 J\u0006\u00105\u001a\u00020 R \u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\t¨\u00067"}, d2 = {"Lcom/amplitude/android/TrackingOptions;", b.f42142b, "()V", "disabledFields", b.f42142b, b.f42142b, "getDisabledFields", "()Ljava/util/Set;", "setDisabledFields", "(Ljava/util/Set;)V", "disableAdid", "disableApiLevel", "disableAppSetId", "disableCarrier", "disableCity", "disableCountry", "disableDeviceBrand", "disableDeviceManufacturer", "disableDeviceModel", "disableDma", "disableIpAddress", "disableLanguage", "disableLatLng", "disableOsName", "disableOsVersion", "disablePlatform", "disableRegion", "disableTrackingField", b.f42142b, "field", "disableVersionName", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "mergeIn", "shouldTrackAdid", "shouldTrackApiLevel", "shouldTrackAppSetId", "shouldTrackCarrier", "shouldTrackCity", "shouldTrackCountry", "shouldTrackDeviceBrand", "shouldTrackDeviceManufacturer", "shouldTrackDeviceModel", "shouldTrackDma", "shouldTrackField", "shouldTrackIpAddress", "shouldTrackLanguage", "shouldTrackLatLng", "shouldTrackOsName", "shouldTrackOsVersion", "shouldTrackPlatform", "shouldTrackRegion", "shouldTrackVersionName", k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class TrackingOptions {

    @NotNull
    public static final String AMP_TRACKING_OPTION_API_LEVEL = "api_level";

    @NotNull
    public static final String AMP_TRACKING_OPTION_APP_SET_ID = "app_set_id";

    @NotNull
    public static final String AMP_TRACKING_OPTION_CARRIER = "carrier";

    @NotNull
    public static final String AMP_TRACKING_OPTION_COUNTRY = "country";

    @NotNull
    public static final String AMP_TRACKING_OPTION_DEVICE_BRAND = "device_brand";

    @NotNull
    public static final String AMP_TRACKING_OPTION_DEVICE_MANUFACTURER = "device_manufacturer";

    @NotNull
    public static final String AMP_TRACKING_OPTION_DEVICE_MODEL = "device_model";

    @NotNull
    public static final String AMP_TRACKING_OPTION_LANGUAGE = "language";

    @NotNull
    public static final String AMP_TRACKING_OPTION_OS_NAME = "os_name";

    @NotNull
    public static final String AMP_TRACKING_OPTION_OS_VERSION = "os_version";

    @NotNull
    public static final String AMP_TRACKING_OPTION_PLATFORM = "platform";

    @NotNull
    public static final String AMP_TRACKING_OPTION_VERSION_NAME = "version_name";

    @NotNull
    private Set<String> disabledFields = new HashSet();

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = TrackingOptions.class.getName();

    @NotNull
    public static final String AMP_TRACKING_OPTION_CITY = "city";

    @NotNull
    public static final String AMP_TRACKING_OPTION_DMA = "dma";

    @NotNull
    public static final String AMP_TRACKING_OPTION_IP_ADDRESS = "ip_address";

    @NotNull
    public static final String AMP_TRACKING_OPTION_LAT_LNG = "lat_lng";

    @NotNull
    public static final String AMP_TRACKING_OPTION_REGION = "region";

    @NotNull
    private static final String[] SERVER_SIDE_PROPERTIES = {AMP_TRACKING_OPTION_CITY, "country", AMP_TRACKING_OPTION_DMA, AMP_TRACKING_OPTION_IP_ADDRESS, AMP_TRACKING_OPTION_LAT_LNG, AMP_TRACKING_OPTION_REGION};

    @NotNull
    public static final String AMP_TRACKING_OPTION_ADID = "adid";

    @NotNull
    private static final String[] COPPA_CONTROL_PROPERTIES = {AMP_TRACKING_OPTION_ADID, AMP_TRACKING_OPTION_CITY, AMP_TRACKING_OPTION_IP_ADDRESS, AMP_TRACKING_OPTION_LAT_LNG};

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0012\n\u0002\u0010\u0011\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001dJ\u0006\u0010\u001f\u001a\u00020\u001dR\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u0016\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00040\u0017X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0018R\u0016\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00040\u0017X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0018R\u0016\u0010\u001a\u001a\n \u001b*\u0004\u0018\u00010\u00040\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006 "}, d2 = {"Lcom/amplitude/android/TrackingOptions$Companion;", b.f42142b, "()V", "AMP_TRACKING_OPTION_ADID", b.f42142b, "AMP_TRACKING_OPTION_API_LEVEL", "AMP_TRACKING_OPTION_APP_SET_ID", "AMP_TRACKING_OPTION_CARRIER", "AMP_TRACKING_OPTION_CITY", "AMP_TRACKING_OPTION_COUNTRY", "AMP_TRACKING_OPTION_DEVICE_BRAND", "AMP_TRACKING_OPTION_DEVICE_MANUFACTURER", "AMP_TRACKING_OPTION_DEVICE_MODEL", "AMP_TRACKING_OPTION_DMA", "AMP_TRACKING_OPTION_IP_ADDRESS", "AMP_TRACKING_OPTION_LANGUAGE", "AMP_TRACKING_OPTION_LAT_LNG", "AMP_TRACKING_OPTION_OS_NAME", "AMP_TRACKING_OPTION_OS_VERSION", "AMP_TRACKING_OPTION_PLATFORM", "AMP_TRACKING_OPTION_REGION", "AMP_TRACKING_OPTION_VERSION_NAME", "COPPA_CONTROL_PROPERTIES", b.f42142b, "[Ljava/lang/String;", "SERVER_SIDE_PROPERTIES", "TAG", "kotlin.jvm.PlatformType", "copyOf", "Lcom/amplitude/android/TrackingOptions;", InneractiveMediationNameConsts.OTHER, "forCoppaControl", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final TrackingOptions copyOf(@NotNull TrackingOptions other) {
            Intrinsics.g(other, "other");
            TrackingOptions trackingOptions = new TrackingOptions();
            Iterator<String> it = other.getDisabledFields().iterator();
            while (it.hasNext()) {
                trackingOptions.disableTrackingField(it.next());
            }
            return trackingOptions;
        }

        @NotNull
        public final TrackingOptions forCoppaControl() {
            TrackingOptions trackingOptions = new TrackingOptions();
            for (String str : TrackingOptions.COPPA_CONTROL_PROPERTIES) {
                trackingOptions.disableTrackingField(str);
            }
            return trackingOptions;
        }

        private Companion() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void disableTrackingField(String field) {
        this.disabledFields.add(field);
    }

    private final boolean shouldTrackField(String field) {
        return !this.disabledFields.contains(field);
    }

    @NotNull
    public final TrackingOptions disableAdid() {
        disableTrackingField(AMP_TRACKING_OPTION_ADID);
        return this;
    }

    @NotNull
    public final TrackingOptions disableApiLevel() {
        disableTrackingField(AMP_TRACKING_OPTION_API_LEVEL);
        return this;
    }

    @NotNull
    public final TrackingOptions disableAppSetId() {
        disableTrackingField(AMP_TRACKING_OPTION_APP_SET_ID);
        return this;
    }

    @NotNull
    public final TrackingOptions disableCarrier() {
        disableTrackingField(AMP_TRACKING_OPTION_CARRIER);
        return this;
    }

    @NotNull
    public final TrackingOptions disableCity() {
        disableTrackingField(AMP_TRACKING_OPTION_CITY);
        return this;
    }

    @NotNull
    public final TrackingOptions disableCountry() {
        disableTrackingField("country");
        return this;
    }

    @NotNull
    public final TrackingOptions disableDeviceBrand() {
        disableTrackingField(AMP_TRACKING_OPTION_DEVICE_BRAND);
        return this;
    }

    @NotNull
    public final TrackingOptions disableDeviceManufacturer() {
        disableTrackingField(AMP_TRACKING_OPTION_DEVICE_MANUFACTURER);
        return this;
    }

    @NotNull
    public final TrackingOptions disableDeviceModel() {
        disableTrackingField(AMP_TRACKING_OPTION_DEVICE_MODEL);
        return this;
    }

    @NotNull
    public final TrackingOptions disableDma() {
        disableTrackingField(AMP_TRACKING_OPTION_DMA);
        return this;
    }

    @NotNull
    public final TrackingOptions disableIpAddress() {
        disableTrackingField(AMP_TRACKING_OPTION_IP_ADDRESS);
        return this;
    }

    @NotNull
    public final TrackingOptions disableLanguage() {
        disableTrackingField(AMP_TRACKING_OPTION_LANGUAGE);
        return this;
    }

    @NotNull
    public final TrackingOptions disableLatLng() {
        disableTrackingField(AMP_TRACKING_OPTION_LAT_LNG);
        return this;
    }

    @NotNull
    public final TrackingOptions disableOsName() {
        disableTrackingField(AMP_TRACKING_OPTION_OS_NAME);
        return this;
    }

    @NotNull
    public final TrackingOptions disableOsVersion() {
        disableTrackingField(AMP_TRACKING_OPTION_OS_VERSION);
        return this;
    }

    @NotNull
    public final TrackingOptions disablePlatform() {
        disableTrackingField(AMP_TRACKING_OPTION_PLATFORM);
        return this;
    }

    @NotNull
    public final TrackingOptions disableRegion() {
        disableTrackingField(AMP_TRACKING_OPTION_REGION);
        return this;
    }

    @NotNull
    public final TrackingOptions disableVersionName() {
        disableTrackingField(AMP_TRACKING_OPTION_VERSION_NAME);
        return this;
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (other != null && TrackingOptions.class.equals(other.getClass())) {
            return Intrinsics.b(((TrackingOptions) other).disabledFields, this.disabledFields);
        }
        return false;
    }

    @NotNull
    public final Set<String> getDisabledFields() {
        return this.disabledFields;
    }

    @NotNull
    public final TrackingOptions mergeIn(@NotNull TrackingOptions other) {
        Intrinsics.g(other, "other");
        Iterator<String> it = other.disabledFields.iterator();
        while (it.hasNext()) {
            disableTrackingField(it.next());
        }
        return this;
    }

    public final void setDisabledFields(@NotNull Set<String> set) {
        Intrinsics.g(set, "<set-?>");
        this.disabledFields = set;
    }

    public final boolean shouldTrackAdid() {
        return shouldTrackField(AMP_TRACKING_OPTION_ADID);
    }

    public final boolean shouldTrackApiLevel() {
        return shouldTrackField(AMP_TRACKING_OPTION_API_LEVEL);
    }

    public final boolean shouldTrackAppSetId() {
        return shouldTrackField(AMP_TRACKING_OPTION_APP_SET_ID);
    }

    public final boolean shouldTrackCarrier() {
        return shouldTrackField(AMP_TRACKING_OPTION_CARRIER);
    }

    public final boolean shouldTrackCity() {
        return shouldTrackField(AMP_TRACKING_OPTION_CITY);
    }

    public final boolean shouldTrackCountry() {
        return shouldTrackField("country");
    }

    public final boolean shouldTrackDeviceBrand() {
        return shouldTrackField(AMP_TRACKING_OPTION_DEVICE_BRAND);
    }

    public final boolean shouldTrackDeviceManufacturer() {
        return shouldTrackField(AMP_TRACKING_OPTION_DEVICE_MANUFACTURER);
    }

    public final boolean shouldTrackDeviceModel() {
        return shouldTrackField(AMP_TRACKING_OPTION_DEVICE_MODEL);
    }

    public final boolean shouldTrackDma() {
        return shouldTrackField(AMP_TRACKING_OPTION_DMA);
    }

    public final boolean shouldTrackIpAddress() {
        return shouldTrackField(AMP_TRACKING_OPTION_IP_ADDRESS);
    }

    public final boolean shouldTrackLanguage() {
        return shouldTrackField(AMP_TRACKING_OPTION_LANGUAGE);
    }

    public final boolean shouldTrackLatLng() {
        return shouldTrackField(AMP_TRACKING_OPTION_LAT_LNG);
    }

    public final boolean shouldTrackOsName() {
        return shouldTrackField(AMP_TRACKING_OPTION_OS_NAME);
    }

    public final boolean shouldTrackOsVersion() {
        return shouldTrackField(AMP_TRACKING_OPTION_OS_VERSION);
    }

    public final boolean shouldTrackPlatform() {
        return shouldTrackField(AMP_TRACKING_OPTION_PLATFORM);
    }

    public final boolean shouldTrackRegion() {
        return shouldTrackField(AMP_TRACKING_OPTION_REGION);
    }

    public final boolean shouldTrackVersionName() {
        return shouldTrackField(AMP_TRACKING_OPTION_VERSION_NAME);
    }
}
