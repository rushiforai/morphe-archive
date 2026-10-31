package com.fyber.inneractive.sdk.external;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'NO_FILL' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes.dex */
public final class InneractiveErrorCode {
    private static final /* synthetic */ InneractiveErrorCode[] $VALUES;
    public static final InneractiveErrorCode CANCELLED;
    public static final InneractiveErrorCode CONNECTION_ERROR;
    public static final InneractiveErrorCode CONNECTION_TIMEOUT;
    public static final InneractiveErrorCode ERROR_CODE_NATIVE_VIDEO_NOT_SUPPORTED;
    public static final InneractiveErrorCode ERROR_CONFIGURATION_MISMATCH;
    public static final InneractiveErrorCode ERROR_CONFIGURATION_NO_SUCH_SPOT;
    public static final InneractiveErrorCode IAB_TCF_PURPOSE_1_DISABLED;
    public static final InneractiveErrorCode INVALID_INPUT;
    public static final InneractiveErrorCode IN_FLIGHT_TIMEOUT;
    public static final InneractiveErrorCode LOAD_TIMEOUT;
    public static final InneractiveErrorCode NATIVE_ADS_NOT_SUPPORTED_FOR_OS;
    public static final InneractiveErrorCode NATIVE_AD_FAILED_TO_LOAD;
    public static final InneractiveErrorCode NON_SECURE_CONTENT_DETECTED;
    public static final InneractiveErrorCode NO_FILL;
    public static final InneractiveErrorCode SDK_INTERNAL_ERROR;
    public static final InneractiveErrorCode SDK_NOT_INITIALIZED;
    public static final InneractiveErrorCode SDK_NOT_INITIALIZED_OR_CONFIG_ERROR;
    public static final InneractiveErrorCode SERVER_INTERNAL_ERROR;
    public static final InneractiveErrorCode SERVER_INVALID_RESPONSE;
    public static final InneractiveErrorCode SPOT_DISABLED;
    public static final InneractiveErrorCode UNKNOWN_APP_ID;
    public static final InneractiveErrorCode UNSPECIFIED;
    public static final InneractiveErrorCode UNSUPPORTED_SPOT;
    private final String message;
    private final Metricable metricable;
    private final Metricable timeMetricable;

    public enum Metricable {
        INCLUDED_IN_FAILED_METRICS,
        EXCLUDED_IN_FAILED_METRICS
    }

    static {
        Metricable metricable = Metricable.EXCLUDED_IN_FAILED_METRICS;
        InneractiveErrorCode inneractiveErrorCode = new InneractiveErrorCode("NO_FILL", 0, "No Ad Found", metricable, metricable);
        NO_FILL = inneractiveErrorCode;
        Metricable metricable2 = Metricable.INCLUDED_IN_FAILED_METRICS;
        InneractiveErrorCode inneractiveErrorCode2 = new InneractiveErrorCode("SERVER_INTERNAL_ERROR", 1, "Server Internal Error", metricable, metricable2);
        SERVER_INTERNAL_ERROR = inneractiveErrorCode2;
        InneractiveErrorCode inneractiveErrorCode3 = new InneractiveErrorCode("SERVER_INVALID_RESPONSE", 2, "Failed Due To Invalid Server Response", metricable2, metricable2);
        SERVER_INVALID_RESPONSE = inneractiveErrorCode3;
        InneractiveErrorCode inneractiveErrorCode4 = new InneractiveErrorCode("SDK_INTERNAL_ERROR", 3, "SDK Internal Error", metricable2, metricable2);
        SDK_INTERNAL_ERROR = inneractiveErrorCode4;
        InneractiveErrorCode inneractiveErrorCode5 = new InneractiveErrorCode("CANCELLED", 4, "Ad Request Was Cancelled", metricable2, metricable2);
        CANCELLED = inneractiveErrorCode5;
        InneractiveErrorCode inneractiveErrorCode6 = new InneractiveErrorCode("CONNECTION_TIMEOUT", 5, "Connection Timed Out", metricable2, metricable);
        CONNECTION_TIMEOUT = inneractiveErrorCode6;
        InneractiveErrorCode inneractiveErrorCode7 = new InneractiveErrorCode("CONNECTION_ERROR", 6, "Network Connection Error", metricable2, metricable2);
        CONNECTION_ERROR = inneractiveErrorCode7;
        InneractiveErrorCode inneractiveErrorCode8 = new InneractiveErrorCode("LOAD_TIMEOUT", 7, "Failed Due To load timeout", metricable2, metricable);
        LOAD_TIMEOUT = inneractiveErrorCode8;
        InneractiveErrorCode inneractiveErrorCode9 = new InneractiveErrorCode("IN_FLIGHT_TIMEOUT", 8, "Failed Due To in flight timeout", metricable2, metricable);
        IN_FLIGHT_TIMEOUT = inneractiveErrorCode9;
        InneractiveErrorCode inneractiveErrorCode10 = new InneractiveErrorCode("UNKNOWN_APP_ID", 9, "Unknown App ID", metricable2, metricable2);
        UNKNOWN_APP_ID = inneractiveErrorCode10;
        InneractiveErrorCode inneractiveErrorCode11 = new InneractiveErrorCode("INVALID_INPUT", 10, "User Entered Invalid Input", metricable, metricable2);
        INVALID_INPUT = inneractiveErrorCode11;
        InneractiveErrorCode inneractiveErrorCode12 = new InneractiveErrorCode("ERROR_CODE_NATIVE_VIDEO_NOT_SUPPORTED", 11, "Native Video Not Supported", metricable2, metricable2);
        ERROR_CODE_NATIVE_VIDEO_NOT_SUPPORTED = inneractiveErrorCode12;
        InneractiveErrorCode inneractiveErrorCode13 = new InneractiveErrorCode("NATIVE_ADS_NOT_SUPPORTED_FOR_OS", 12, "Native ads not supported for this Android version", metricable2, metricable2);
        NATIVE_ADS_NOT_SUPPORTED_FOR_OS = inneractiveErrorCode13;
        InneractiveErrorCode inneractiveErrorCode14 = new InneractiveErrorCode("ERROR_CONFIGURATION_MISMATCH", 13, "Internal Configuration Error", metricable2, metricable2);
        ERROR_CONFIGURATION_MISMATCH = inneractiveErrorCode14;
        InneractiveErrorCode inneractiveErrorCode15 = new InneractiveErrorCode("ERROR_CONFIGURATION_NO_SUCH_SPOT", 14, "Invalid spot supplied", metricable, metricable);
        ERROR_CONFIGURATION_NO_SUCH_SPOT = inneractiveErrorCode15;
        InneractiveErrorCode inneractiveErrorCode16 = new InneractiveErrorCode("SPOT_DISABLED", 15, "Selected spot is not active", metricable2, metricable2);
        SPOT_DISABLED = inneractiveErrorCode16;
        InneractiveErrorCode inneractiveErrorCode17 = new InneractiveErrorCode("UNSUPPORTED_SPOT", 16, "Unsupported Spot", metricable2, metricable2);
        UNSUPPORTED_SPOT = inneractiveErrorCode17;
        InneractiveErrorCode inneractiveErrorCode18 = new InneractiveErrorCode("NON_SECURE_CONTENT_DETECTED", 17, "Non secure content detected", metricable2, metricable2);
        NON_SECURE_CONTENT_DETECTED = inneractiveErrorCode18;
        InneractiveErrorCode inneractiveErrorCode19 = new InneractiveErrorCode("UNSPECIFIED", 18, "Unspecified Error.", metricable2, metricable2);
        UNSPECIFIED = inneractiveErrorCode19;
        InneractiveErrorCode inneractiveErrorCode20 = new InneractiveErrorCode("SDK_NOT_INITIALIZED", 19, "SDK was not initialized. Did you forget to call InneractiveAdManager.init(...)?", metricable2, metricable2);
        SDK_NOT_INITIALIZED = inneractiveErrorCode20;
        InneractiveErrorCode inneractiveErrorCode21 = new InneractiveErrorCode("SDK_NOT_INITIALIZED_OR_CONFIG_ERROR", 20, "Invalid App Id", metricable, metricable);
        SDK_NOT_INITIALIZED_OR_CONFIG_ERROR = inneractiveErrorCode21;
        InneractiveErrorCode inneractiveErrorCode22 = new InneractiveErrorCode("IAB_TCF_PURPOSE_1_DISABLED", 21, "IAB TCF Purpose no.1 is disabled", metricable, metricable);
        IAB_TCF_PURPOSE_1_DISABLED = inneractiveErrorCode22;
        InneractiveErrorCode inneractiveErrorCode23 = new InneractiveErrorCode("NATIVE_AD_FAILED_TO_LOAD", 22, "Native ad failed to load", metricable, metricable);
        NATIVE_AD_FAILED_TO_LOAD = inneractiveErrorCode23;
        $VALUES = new InneractiveErrorCode[]{inneractiveErrorCode, inneractiveErrorCode2, inneractiveErrorCode3, inneractiveErrorCode4, inneractiveErrorCode5, inneractiveErrorCode6, inneractiveErrorCode7, inneractiveErrorCode8, inneractiveErrorCode9, inneractiveErrorCode10, inneractiveErrorCode11, inneractiveErrorCode12, inneractiveErrorCode13, inneractiveErrorCode14, inneractiveErrorCode15, inneractiveErrorCode16, inneractiveErrorCode17, inneractiveErrorCode18, inneractiveErrorCode19, inneractiveErrorCode20, inneractiveErrorCode21, inneractiveErrorCode22, inneractiveErrorCode23};
    }

    public InneractiveErrorCode(String str, int i5, String str2, Metricable metricable, Metricable metricable2) {
        this.message = str2;
        this.metricable = metricable;
        this.timeMetricable = metricable2;
    }

    public static InneractiveErrorCode valueOf(String str) {
        return (InneractiveErrorCode) Enum.valueOf(InneractiveErrorCode.class, str);
    }

    public static InneractiveErrorCode[] values() {
        return (InneractiveErrorCode[]) $VALUES.clone();
    }

    public Metricable getMetricable() {
        return this.metricable;
    }

    public boolean shouldSendTimeMetric() {
        return this.timeMetricable == Metricable.INCLUDED_IN_FAILED_METRICS;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.message;
    }
}
