package com.moloco.sdk.publisher;

import b.c0;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.internal.publisher.C2940b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import h6.c1;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001:\u0002\u001b\u001cB)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J1\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÇ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001H×\u0003J\t\u0010\u0018\u001a\u00020\u0019H×\u0001J\t\u0010\u001a\u001a\u00020\u0003H×\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/moloco/sdk/publisher/MolocoAdError;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "networkName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "adUnitId", "errorType", "Lcom/moloco/sdk/publisher/MolocoAdError$ErrorType;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/moloco/sdk/publisher/MolocoAdError$ErrorType;Ljava/lang/String;)V", "getNetworkName", "()Ljava/lang/String;", "getAdUnitId", "getErrorType", "()Lcom/moloco/sdk/publisher/MolocoAdError$ErrorType;", "getDescription", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "ErrorType", "AdCreateError", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class MolocoAdError {
    public static final int $stable = 0;

    @NotNull
    private final String adUnitId;

    @NotNull
    private final String description;

    @NotNull
    private final ErrorType errorType;

    @NotNull
    private final String networkName;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\n\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0019\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/moloco/sdk/publisher/MolocoAdError$AdCreateError;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "errorCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;ILjava/lang/String;I)V", "getDescription", "()Ljava/lang/String;", "getErrorCode", "()I", "SDK_INIT_FAILED", "SDK_INIT_WAS_NOT_COMPLETED", C2940b.f36934h, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class AdCreateError {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ AdCreateError[] $VALUES;
        public static final AdCreateError SDK_INIT_FAILED = new AdCreateError("SDK_INIT_FAILED", 0, "Failed to create `ad` object due to SDK initialization failure.", TTAdConstant.IMAGE_MODE_1011);
        public static final AdCreateError SDK_INIT_WAS_NOT_COMPLETED = new AdCreateError("SDK_INIT_WAS_NOT_COMPLETED", 1, "Failed to create `ad` object due to `Moloco.initialize()` not complete.", TTAdConstant.IMAGE_MODE_1012);
        public static final AdCreateError UNABLE_TO_CREATE_AD = new AdCreateError(C2940b.f36934h, 2, "Failed to create `ad` object due to `Moloco.initialize()` not complete in time", 1013);

        @NotNull
        private final String description;
        private final int errorCode;

        private static final /* synthetic */ AdCreateError[] $values() {
            return new AdCreateError[]{SDK_INIT_FAILED, SDK_INIT_WAS_NOT_COMPLETED, UNABLE_TO_CREATE_AD};
        }

        static {
            AdCreateError[] adCreateErrorArr$values = $values();
            $VALUES = adCreateErrorArr$values;
            $ENTRIES = EnumEntriesKt.a(adCreateErrorArr$values);
        }

        private AdCreateError(String str, int i5, String str2, int i11) {
            this.description = str2;
            this.errorCode = i11;
        }

        @NotNull
        public static EnumEntries<AdCreateError> getEntries() {
            return $ENTRIES;
        }

        public static AdCreateError valueOf(String str) {
            return (AdCreateError) Enum.valueOf(AdCreateError.class, str);
        }

        public static AdCreateError[] values() {
            return (AdCreateError[]) $VALUES.clone();
        }

        @NotNull
        public final String getDescription() {
            return this.description;
        }

        public final int getErrorCode() {
            return this.errorCode;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0016\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0019\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001a¨\u0006\u001b"}, d2 = {"Lcom/moloco/sdk/publisher/MolocoAdError$ErrorType;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "errorCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;ILjava/lang/String;I)V", "getDescription", "()Ljava/lang/String;", "getErrorCode", "()I", "UNKNOWN", "SDK_INIT_ERROR", "SDK_PERSISTENT_HTTP_REQUEST_FAILED_TO_INIT", "SDK_INVALID_CONFIGURATION", "AD_LOAD_FAILED", "AD_LOAD_FAILED_SDK_NOT_INIT", "AD_LOAD_TIMEOUT_ERROR", "AD_LOAD_LIMIT_REACHED", "AD_LOAD_BID_FAILED", "AD_LOAD_WEBVIEW_FAILED", "AD_SHOW_ERROR", "AD_SHOW_ERROR_NOT_LOADED", "AD_SHOW_ERROR_ALREADY_DISPLAYING", "AD_BID_PARSE_ERROR", "AD_SIGNAL_COLLECTION_FAILED", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class ErrorType {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ ErrorType[] $VALUES;

        @NotNull
        private final String description;
        private final int errorCode;
        public static final ErrorType UNKNOWN = new ErrorType("UNKNOWN", 0, "Generic failure error code", -1);
        public static final ErrorType SDK_INIT_ERROR = new ErrorType("SDK_INIT_ERROR", 1, "SDK initialization error", 1000);
        public static final ErrorType SDK_PERSISTENT_HTTP_REQUEST_FAILED_TO_INIT = new ErrorType("SDK_PERSISTENT_HTTP_REQUEST_FAILED_TO_INIT", 2, "WorkManager crash that prevents us from creating a persistent http request client", 1001);
        public static final ErrorType SDK_INVALID_CONFIGURATION = new ErrorType("SDK_INVALID_CONFIGURATION", 3, "Ad object cannot be created, due to invalid configuration", 1002);
        public static final ErrorType AD_LOAD_FAILED = new ErrorType("AD_LOAD_FAILED", 4, "Ad is not loaded", 2000);
        public static final ErrorType AD_LOAD_FAILED_SDK_NOT_INIT = new ErrorType("AD_LOAD_FAILED_SDK_NOT_INIT", 5, "Ad load failed because SDK was not initialized", 2001);
        public static final ErrorType AD_LOAD_TIMEOUT_ERROR = new ErrorType("AD_LOAD_TIMEOUT_ERROR", 6, "Ad failed to load because the request timed out", 2003);
        public static final ErrorType AD_LOAD_LIMIT_REACHED = new ErrorType("AD_LOAD_LIMIT_REACHED", 7, "Ad load limit reached", 2004);
        public static final ErrorType AD_LOAD_BID_FAILED = new ErrorType("AD_LOAD_BID_FAILED", 8, "Ad failed to load because bid request failed or no fill", 2005);
        public static final ErrorType AD_LOAD_WEBVIEW_FAILED = new ErrorType("AD_LOAD_WEBVIEW_FAILED", 9, "Ad failed to load because Webview was *not* available", 2006);
        public static final ErrorType AD_SHOW_ERROR = new ErrorType("AD_SHOW_ERROR", 10, "Ad show failed despite a successful ad load. Internal renderer error", 3000);
        public static final ErrorType AD_SHOW_ERROR_NOT_LOADED = new ErrorType("AD_SHOW_ERROR_NOT_LOADED", 11, "Ad show failed because ad load was not called", 3001);
        public static final ErrorType AD_SHOW_ERROR_ALREADY_DISPLAYING = new ErrorType("AD_SHOW_ERROR_ALREADY_DISPLAYING", 12, "Ad show failed because show() was invoked multiple times when ad was already rendering", 3002);
        public static final ErrorType AD_BID_PARSE_ERROR = new ErrorType("AD_BID_PARSE_ERROR", 13, "The bid response received was not parseable by the SDK", 4000);
        public static final ErrorType AD_SIGNAL_COLLECTION_FAILED = new ErrorType("AD_SIGNAL_COLLECTION_FAILED", 14, "The bid token couldn’t be retrieved.", 5000);

        private static final /* synthetic */ ErrorType[] $values() {
            return new ErrorType[]{UNKNOWN, SDK_INIT_ERROR, SDK_PERSISTENT_HTTP_REQUEST_FAILED_TO_INIT, SDK_INVALID_CONFIGURATION, AD_LOAD_FAILED, AD_LOAD_FAILED_SDK_NOT_INIT, AD_LOAD_TIMEOUT_ERROR, AD_LOAD_LIMIT_REACHED, AD_LOAD_BID_FAILED, AD_LOAD_WEBVIEW_FAILED, AD_SHOW_ERROR, AD_SHOW_ERROR_NOT_LOADED, AD_SHOW_ERROR_ALREADY_DISPLAYING, AD_BID_PARSE_ERROR, AD_SIGNAL_COLLECTION_FAILED};
        }

        static {
            ErrorType[] errorTypeArr$values = $values();
            $VALUES = errorTypeArr$values;
            $ENTRIES = EnumEntriesKt.a(errorTypeArr$values);
        }

        private ErrorType(String str, int i5, String str2, int i11) {
            this.description = str2;
            this.errorCode = i11;
        }

        @NotNull
        public static EnumEntries<ErrorType> getEntries() {
            return $ENTRIES;
        }

        public static ErrorType valueOf(String str) {
            return (ErrorType) Enum.valueOf(ErrorType.class, str);
        }

        public static ErrorType[] values() {
            return (ErrorType[]) $VALUES.clone();
        }

        @NotNull
        public final String getDescription() {
            return this.description;
        }

        public final int getErrorCode() {
            return this.errorCode;
        }
    }

    public MolocoAdError(@NotNull String networkName, @NotNull String adUnitId, @NotNull ErrorType errorType, @NotNull String description) {
        Intrinsics.g(networkName, "networkName");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(errorType, "errorType");
        Intrinsics.g(description, "description");
        this.networkName = networkName;
        this.adUnitId = adUnitId;
        this.errorType = errorType;
        this.description = description;
    }

    public static /* synthetic */ MolocoAdError copy$default(MolocoAdError molocoAdError, String str, String str2, ErrorType errorType, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = molocoAdError.networkName;
        }
        if ((i5 & 2) != 0) {
            str2 = molocoAdError.adUnitId;
        }
        if ((i5 & 4) != 0) {
            errorType = molocoAdError.errorType;
        }
        if ((i5 & 8) != 0) {
            str3 = molocoAdError.description;
        }
        return molocoAdError.copy(str, str2, errorType, str3);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getNetworkName() {
        return this.networkName;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getAdUnitId() {
        return this.adUnitId;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final ErrorType getErrorType() {
        return this.errorType;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getDescription() {
        return this.description;
    }

    @NotNull
    public final MolocoAdError copy(@NotNull String networkName, @NotNull String adUnitId, @NotNull ErrorType errorType, @NotNull String description) {
        Intrinsics.g(networkName, "networkName");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(errorType, "errorType");
        Intrinsics.g(description, "description");
        return new MolocoAdError(networkName, adUnitId, errorType, description);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MolocoAdError)) {
            return false;
        }
        MolocoAdError molocoAdError = (MolocoAdError) other;
        return Intrinsics.b(this.networkName, molocoAdError.networkName) && Intrinsics.b(this.adUnitId, molocoAdError.adUnitId) && this.errorType == molocoAdError.errorType && Intrinsics.b(this.description, molocoAdError.description);
    }

    @NotNull
    public final String getAdUnitId() {
        return this.adUnitId;
    }

    @NotNull
    public final String getDescription() {
        return this.description;
    }

    @NotNull
    public final ErrorType getErrorType() {
        return this.errorType;
    }

    @NotNull
    public final String getNetworkName() {
        return this.networkName;
    }

    public int hashCode() {
        return this.description.hashCode() + ((this.errorType.hashCode() + c0.e(this.networkName.hashCode() * 31, 31, this.adUnitId)) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("MolocoAdError(networkName=");
        sb2.append(this.networkName);
        sb2.append(", adUnitId=");
        sb2.append(this.adUnitId);
        sb2.append(", errorType=");
        sb2.append(this.errorType);
        sb2.append(", description=");
        return c1.t(sb2, this.description, ')');
    }

    public /* synthetic */ MolocoAdError(String str, String str2, ErrorType errorType, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, errorType, (i5 & 8) != 0 ? errorType.getDescription() : str3);
    }
}
