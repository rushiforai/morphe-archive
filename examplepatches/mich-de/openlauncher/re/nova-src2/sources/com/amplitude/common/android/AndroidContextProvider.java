package com.amplitude.common.android;

import android.annotation.SuppressLint;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.os.LocaleList;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import com.amplitude.android.TrackingOptions;
import com.amplitude.common.ContextProvider;
import com.amplitude.common.android.AndroidContextProvider;
import com.amplitude.common.android.AndroidContextProvider.CachedInfo;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.appset.AppSet;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import o4.a;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import pg.d;

@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\r\u0018\u0000 22\u00020\u0001:\u000212B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005¢\u0006\u0002\u0010\bJ\u0006\u0010/\u001a\u00020\u0005J\u0006\u00100\u001a\u00020\u0005R\u0013\u0010\t\u001a\u0004\u0018\u00010\n8F¢\u0006\u0006\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\r\u001a\u0004\u0018\u00010\n8F¢\u0006\u0006\u001a\u0004\b\u000e\u0010\fR\u0011\u0010\u000f\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\fR\u001f\u0010\u0011\u001a\u00060\u0012R\u00020\u00008BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0013\u0010\u0014R\u0013\u0010\u0017\u001a\u0004\u0018\u00010\n8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010\fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0013\u0010\u0019\u001a\u0004\u0018\u00010\n8F¢\u0006\u0006\u001a\u0004\b\u001a\u0010\fR\u0014\u0010\u001b\u001a\u00020\u001c8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u001eR\u0011\u0010\u001f\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b \u0010\fR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010!\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b\"\u0010\fR\u0011\u0010#\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b$\u0010\fR\u0013\u0010%\u001a\u0004\u0018\u00010&8G¢\u0006\u0006\u001a\u0004\b'\u0010(R\u0011\u0010)\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b*\u0010\fR\u0011\u0010+\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b,\u0010\fR\u000e\u0010\u0006\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0013\u0010-\u001a\u0004\u0018\u00010\n8F¢\u0006\u0006\u001a\u0004\b.\u0010\f¨\u00063"}, d2 = {"Lcom/amplitude/common/android/AndroidContextProvider;", "Lcom/amplitude/common/ContextProvider;", "context", "Landroid/content/Context;", "locationListening", b.f42142b, "shouldTrackAdid", "shouldTrackAppSetId", "(Landroid/content/Context;ZZZ)V", "advertisingId", b.f42142b, "getAdvertisingId", "()Ljava/lang/String;", "appSetId", "getAppSetId", "brand", "getBrand", "cachedInfo", "Lcom/amplitude/common/android/AndroidContextProvider$CachedInfo;", "getCachedInfo", "()Lcom/amplitude/common/android/AndroidContextProvider$CachedInfo;", "cachedInfo$delegate", "Lkotlin/Lazy;", TrackingOptions.AMP_TRACKING_OPTION_CARRIER, "getCarrier", "country", "getCountry", "geocoder", "Landroid/location/Geocoder;", "getGeocoder", "()Landroid/location/Geocoder;", TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, "getLanguage", "manufacturer", "getManufacturer", "model", "getModel", "mostRecentLocation", "Landroid/location/Location;", "getMostRecentLocation", "()Landroid/location/Location;", "osName", "getOsName", "osVersion", "getOsVersion", "versionName", "getVersionName", "isGooglePlayServicesEnabled", "isLimitAdTrackingEnabled", "CachedInfo", k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AndroidContextProvider implements ContextProvider {

    @NotNull
    public static final String OS_NAME = "android";

    @NotNull
    public static final String SETTING_ADVERTISING_ID = "advertising_id";

    @NotNull
    public static final String SETTING_LIMIT_AD_TRACKING = "limit_ad_tracking";

    /* renamed from: cachedInfo$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy cachedInfo;

    @NotNull
    private final Context context;
    private final boolean locationListening;
    private final boolean shouldTrackAdid;
    private final boolean shouldTrackAppSetId;

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0015\b\u0086\u0004\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\b\u0010-\u001a\u00020\u0016H\u0002J\n\u0010.\u001a\u0004\u0018\u00010\u0004H\u0002J\n\u0010/\u001a\u0004\u0018\u00010\u0004H\u0002J\n\u00100\u001a\u0004\u0018\u00010\u0004H\u0002J\n\u00101\u001a\u0004\u0018\u00010\u0004H\u0002J\n\u00102\u001a\u0004\u0018\u00010\u0004H\u0002J\b\u00103\u001a\u00020\u0004H\u0002J\n\u00104\u001a\u0004\u0018\u00010\u0004H\u0002R\u0013\u0010\u0003\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0006R\u0011\u0010\t\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u0006R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u0006R\u0013\u0010\r\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u0006R\u0014\u0010\u000f\u001a\u00020\u00048BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0006R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00048BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0006R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00048BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0014\u0010\u0006R\u0011\u0010\u0015\u001a\u00020\u0016¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0011\u0010\u0019\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0006R\u001a\u0010\u001b\u001a\u00020\u0016X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001c\u0010\u0018\"\u0004\b\u001d\u0010\u001eR\u0014\u0010\u001f\u001a\u00020 8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b!\u0010\"R\u0011\u0010#\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b$\u0010\u0006R\u0011\u0010%\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b&\u0010\u0006R\u0011\u0010'\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b(\u0010\u0006R\u0011\u0010)\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b*\u0010\u0006R\u0013\u0010+\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b,\u0010\u0006¨\u00065"}, d2 = {"Lcom/amplitude/common/android/AndroidContextProvider$CachedInfo;", b.f42142b, "(Lcom/amplitude/common/android/AndroidContextProvider;)V", "advertisingId", b.f42142b, "getAdvertisingId", "()Ljava/lang/String;", "appSetId", "getAppSetId", "brand", "getBrand", TrackingOptions.AMP_TRACKING_OPTION_CARRIER, "getCarrier", "country", "getCountry", "countryFromLocale", "getCountryFromLocale", "countryFromLocation", "getCountryFromLocation", "countryFromNetwork", "getCountryFromNetwork", "gpsEnabled", b.f42142b, "getGpsEnabled", "()Z", TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, "getLanguage", "limitAdTrackingEnabled", "getLimitAdTrackingEnabled", "setLimitAdTrackingEnabled", "(Z)V", "locale", "Ljava/util/Locale;", "getLocale", "()Ljava/util/Locale;", "manufacturer", "getManufacturer", "model", "getModel", "osName", "getOsName", "osVersion", "getOsVersion", "versionName", "getVersionName", "checkGPSEnabled", "fetchAdvertisingId", "fetchAndCacheAmazonAdvertisingId", "fetchAndCacheGoogleAdvertisingId", "fetchAppSetId", "fetchCarrier", "fetchCountry", "fetchVersionName", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public final class CachedInfo {

        @Nullable
        private final String advertisingId;

        @Nullable
        private final String appSetId;

        @NotNull
        private final String brand;

        @Nullable
        private final String carrier;

        @Nullable
        private final String country;
        private final boolean gpsEnabled;

        @NotNull
        private final String language;

        @NotNull
        private final String manufacturer;

        @NotNull
        private final String model;

        @NotNull
        private final String osVersion;

        @Nullable
        private final String versionName;
        private boolean limitAdTrackingEnabled = true;

        @NotNull
        private final String osName = "android";

        public CachedInfo() {
            String RELEASE = Build.VERSION.RELEASE;
            Intrinsics.f(RELEASE, "RELEASE");
            this.osVersion = RELEASE;
            String BRAND = Build.BRAND;
            Intrinsics.f(BRAND, "BRAND");
            this.brand = BRAND;
            String MANUFACTURER = Build.MANUFACTURER;
            Intrinsics.f(MANUFACTURER, "MANUFACTURER");
            this.manufacturer = MANUFACTURER;
            String MODEL = Build.MODEL;
            Intrinsics.f(MODEL, "MODEL");
            this.model = MODEL;
            String language = getLocale().getLanguage();
            Intrinsics.f(language, "getLanguage(...)");
            this.language = language;
            this.advertisingId = AndroidContextProvider.this.shouldTrackAdid ? fetchAdvertisingId() : null;
            this.versionName = fetchVersionName();
            this.carrier = fetchCarrier();
            this.country = fetchCountry();
            this.gpsEnabled = checkGPSEnabled();
            this.appSetId = AndroidContextProvider.this.shouldTrackAppSetId ? fetchAppSetId() : null;
        }

        private final boolean checkGPSEnabled() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
            try {
                int i5 = d.f82563e;
                Object objInvoke = d.class.getMethod("isGooglePlayServicesAvailable", Context.class).invoke(null, AndroidContextProvider.this.context);
                Integer num = objInvoke instanceof Integer ? (Integer) objInvoke : null;
                if (num != null) {
                    if (num.intValue() == 0) {
                        return true;
                    }
                }
                return false;
            } catch (ClassNotFoundException unused) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services Util not found!");
                return false;
            } catch (IllegalAccessException unused2) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services not available");
                return false;
            } catch (NoClassDefFoundError unused3) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services Util not found!");
                return false;
            } catch (NoSuchMethodException unused4) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services not available");
                return false;
            } catch (InvocationTargetException unused5) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services not available");
                return false;
            } catch (Exception e3) {
                LogcatLogger.INSTANCE.getLogger().warn("Error when checking for Google Play Services: " + e3);
                return false;
            }
        }

        private final String fetchAdvertisingId() {
            return "Amazon".equals(this.manufacturer) ? fetchAndCacheAmazonAdvertisingId() : fetchAndCacheGoogleAdvertisingId();
        }

        private final String fetchAndCacheAmazonAdvertisingId() {
            ContentResolver contentResolver = AndroidContextProvider.this.context.getContentResolver();
            this.limitAdTrackingEnabled = Settings.Secure.getInt(contentResolver, AndroidContextProvider.SETTING_LIMIT_AD_TRACKING, 0) == 1;
            return Settings.Secure.getString(contentResolver, AndroidContextProvider.SETTING_ADVERTISING_ID);
        }

        private final String fetchAndCacheGoogleAdvertisingId() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
            try {
                Object objInvoke = AdvertisingIdClient.class.getMethod("getAdvertisingIdInfo", Context.class).invoke(null, AndroidContextProvider.this.context);
                Object objInvoke2 = objInvoke.getClass().getMethod("isLimitAdTrackingEnabled", null).invoke(objInvoke, null);
                Boolean bool = objInvoke2 instanceof Boolean ? (Boolean) objInvoke2 : null;
                this.limitAdTrackingEnabled = bool != null && bool.booleanValue();
                Object objInvoke3 = objInvoke.getClass().getMethod("getId", null).invoke(objInvoke, null);
                Intrinsics.e(objInvoke3, "null cannot be cast to non-null type kotlin.String");
                return (String) objInvoke3;
            } catch (ClassNotFoundException unused) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services SDK not found for advertising id!");
                return null;
            } catch (InvocationTargetException unused2) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services not available for advertising id");
                return null;
            } catch (Exception unused3) {
                LogcatLogger.INSTANCE.getLogger().error("Encountered an error connecting to Google Play Services for advertising id");
                return null;
            }
        }

        private final String fetchAppSetId() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
            try {
                Object objInvoke = AppSet.class.getMethod("getClient", Context.class).invoke(null, AndroidContextProvider.this.context);
                Object objInvoke2 = Tasks.class.getMethod("await", Task.class).invoke(null, objInvoke.getClass().getMethod("getAppSetIdInfo", null).invoke(objInvoke, null));
                Object objInvoke3 = objInvoke2.getClass().getMethod("getId", null).invoke(objInvoke2, null);
                Intrinsics.e(objInvoke3, "null cannot be cast to non-null type kotlin.String");
                return (String) objInvoke3;
            } catch (ClassNotFoundException unused) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services SDK not found for app set id!");
                return null;
            } catch (InvocationTargetException unused2) {
                LogcatLogger.INSTANCE.getLogger().warn("Google Play Services not available for app set id");
                return null;
            } catch (Exception unused3) {
                LogcatLogger.INSTANCE.getLogger().error("Encountered an error connecting to Google Play Services for app set id");
                return null;
            }
        }

        private final String fetchCarrier() {
            try {
                Object systemService = AndroidContextProvider.this.context.getSystemService("phone");
                Intrinsics.e(systemService, "null cannot be cast to non-null type android.telephony.TelephonyManager");
                return ((TelephonyManager) systemService).getNetworkOperatorName();
            } catch (Exception unused) {
                return null;
            }
        }

        private final String fetchCountry() {
            String countryFromLocation = getCountryFromLocation();
            if (countryFromLocation != null && countryFromLocation.length() != 0) {
                return countryFromLocation;
            }
            String countryFromNetwork = getCountryFromNetwork();
            return (countryFromNetwork == null || countryFromNetwork.length() == 0) ? getCountryFromLocale() : countryFromNetwork;
        }

        private final String fetchVersionName() throws PackageManager.NameNotFoundException {
            try {
                PackageInfo packageInfo = AndroidContextProvider.this.context.getPackageManager().getPackageInfo(AndroidContextProvider.this.context.getPackageName(), 0);
                Intrinsics.f(packageInfo, "getPackageInfo(...)");
                return packageInfo.versionName;
            } catch (PackageManager.NameNotFoundException | Exception unused) {
                return null;
            }
        }

        private final String getCountryFromLocale() {
            String country = getLocale().getCountry();
            Intrinsics.f(country, "getCountry(...)");
            return country;
        }

        private final String getCountryFromLocation() {
            Location mostRecentLocation;
            List<Address> fromLocation;
            if (AndroidContextProvider.this.locationListening && (mostRecentLocation = AndroidContextProvider.this.getMostRecentLocation()) != null) {
                try {
                    if (Geocoder.isPresent() && (fromLocation = AndroidContextProvider.this.getGeocoder().getFromLocation(mostRecentLocation.getLatitude(), mostRecentLocation.getLongitude(), 1)) != null) {
                        for (Address address : fromLocation) {
                            if (address != null) {
                                return address.getCountryCode();
                            }
                        }
                    }
                } catch (IOException | IllegalArgumentException | IllegalStateException | NoSuchMethodError | NullPointerException | SecurityException unused) {
                }
            }
            return null;
        }

        private final String getCountryFromNetwork() {
            String networkCountryIso;
            try {
                Object systemService = AndroidContextProvider.this.context.getSystemService("phone");
                Intrinsics.e(systemService, "null cannot be cast to non-null type android.telephony.TelephonyManager");
                TelephonyManager telephonyManager = (TelephonyManager) systemService;
                if (telephonyManager.getPhoneType() == 2 || (networkCountryIso = telephonyManager.getNetworkCountryIso()) == null) {
                    return null;
                }
                Locale US = Locale.US;
                Intrinsics.f(US, "US");
                String upperCase = networkCountryIso.toUpperCase(US);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                return upperCase;
            } catch (Exception unused) {
                return null;
            }
        }

        private final Locale getLocale() {
            LocaleList locales = Resources.getSystem().getConfiguration().getLocales();
            Intrinsics.f(locales, "getLocales(...)");
            Locale locale = locales.isEmpty() ? Locale.getDefault() : locales.get(0);
            Intrinsics.d(locale);
            return locale;
        }

        @Nullable
        public final String getAdvertisingId() {
            return this.advertisingId;
        }

        @Nullable
        public final String getAppSetId() {
            return this.appSetId;
        }

        @NotNull
        public final String getBrand() {
            return this.brand;
        }

        @Nullable
        public final String getCarrier() {
            return this.carrier;
        }

        @Nullable
        public final String getCountry() {
            return this.country;
        }

        public final boolean getGpsEnabled() {
            return this.gpsEnabled;
        }

        @NotNull
        public final String getLanguage() {
            return this.language;
        }

        public final boolean getLimitAdTrackingEnabled() {
            return this.limitAdTrackingEnabled;
        }

        @NotNull
        public final String getManufacturer() {
            return this.manufacturer;
        }

        @NotNull
        public final String getModel() {
            return this.model;
        }

        @NotNull
        public final String getOsName() {
            return this.osName;
        }

        @NotNull
        public final String getOsVersion() {
            return this.osVersion;
        }

        @Nullable
        public final String getVersionName() {
            return this.versionName;
        }

        public final void setLimitAdTrackingEnabled(boolean z11) {
            this.limitAdTrackingEnabled = z11;
        }
    }

    public AndroidContextProvider(@NotNull Context context, boolean z11, boolean z12, boolean z13) {
        Intrinsics.g(context, "context");
        this.context = context;
        this.locationListening = z11;
        this.shouldTrackAdid = z12;
        this.shouldTrackAppSetId = z13;
        this.cachedInfo = LazyKt.a(new Function0<CachedInfo>() { // from class: com.amplitude.common.android.AndroidContextProvider$cachedInfo$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final AndroidContextProvider.CachedInfo invoke() {
                return this.this$0.new CachedInfo();
            }
        });
    }

    private final CachedInfo getCachedInfo() {
        return (CachedInfo) this.cachedInfo.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Geocoder getGeocoder() {
        return new Geocoder(this.context, Locale.ENGLISH);
    }

    @Nullable
    public final String getAdvertisingId() {
        return getCachedInfo().getAdvertisingId();
    }

    @Nullable
    public final String getAppSetId() {
        return getCachedInfo().getAppSetId();
    }

    @NotNull
    public final String getBrand() {
        return getCachedInfo().getBrand();
    }

    @Nullable
    public final String getCarrier() {
        return getCachedInfo().getCarrier();
    }

    @Nullable
    public final String getCountry() {
        return getCachedInfo().getCountry();
    }

    @NotNull
    public final String getLanguage() {
        return getCachedInfo().getLanguage();
    }

    @NotNull
    public final String getManufacturer() {
        return getCachedInfo().getManufacturer();
    }

    @NotNull
    public final String getModel() {
        return getCachedInfo().getModel();
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x006d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0043 A[SYNTHETIC] */
    @SuppressLint({"MissingPermission"})
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Location getMostRecentLocation() {
        List<String> providers;
        Location lastKnownLocation;
        Location location = null;
        if (!this.locationListening) {
            return null;
        }
        if (a.a(this.context, "android.permission.ACCESS_COARSE_LOCATION") != 0 && a.a(this.context, "android.permission.ACCESS_FINE_LOCATION") != 0) {
            return null;
        }
        Object systemService = this.context.getSystemService("location");
        LocationManager locationManager = systemService instanceof LocationManager ? (LocationManager) systemService : null;
        if (locationManager == null) {
            return null;
        }
        try {
            providers = locationManager.getProviders(true);
        } catch (SecurityException | Exception unused) {
            providers = null;
        }
        if (providers == null) {
            return null;
        }
        ArrayList<Location> arrayList = new ArrayList();
        for (String str : providers) {
            try {
                Intrinsics.d(str);
                lastKnownLocation = locationManager.getLastKnownLocation(str);
            } catch (SecurityException unused2) {
                LogcatLogger.INSTANCE.getLogger().warn("Failed to get most recent location");
                lastKnownLocation = null;
                if (lastKnownLocation != null) {
                }
            } catch (Exception unused3) {
                LogcatLogger.INSTANCE.getLogger().warn("Failed to get most recent location");
                lastKnownLocation = null;
                if (lastKnownLocation != null) {
                }
            }
            if (lastKnownLocation != null) {
                arrayList.add(lastKnownLocation);
            }
        }
        long time = -1;
        for (Location location2 : arrayList) {
            if (location2.getTime() > time) {
                time = location2.getTime();
                location = location2;
            }
        }
        return location;
    }

    @NotNull
    public final String getOsName() {
        return getCachedInfo().getOsName();
    }

    @NotNull
    public final String getOsVersion() {
        return getCachedInfo().getOsVersion();
    }

    @Nullable
    public final String getVersionName() {
        return getCachedInfo().getVersionName();
    }

    public final boolean isGooglePlayServicesEnabled() {
        return getCachedInfo().getGpsEnabled();
    }

    public final boolean isLimitAdTrackingEnabled() {
        return getCachedInfo().getLimitAdTrackingEnabled();
    }
}
