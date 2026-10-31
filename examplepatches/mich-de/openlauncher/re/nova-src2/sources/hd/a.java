package hd;

import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.OnFyberMarketplaceInitializedListener;

/* loaded from: classes.dex */
public abstract /* synthetic */ class a {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f59612a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int[] f59613b;

    static {
        int[] iArr = new int[OnFyberMarketplaceInitializedListener.FyberInitStatus.values().length];
        try {
            iArr[OnFyberMarketplaceInitializedListener.FyberInitStatus.SUCCESSFULLY.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[OnFyberMarketplaceInitializedListener.FyberInitStatus.FAILED_NO_KITS_DETECTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[OnFyberMarketplaceInitializedListener.FyberInitStatus.FAILED.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[OnFyberMarketplaceInitializedListener.FyberInitStatus.INVALID_APP_ID.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        f59612a = iArr;
        int[] iArr2 = new int[InneractiveErrorCode.values().length];
        try {
            iArr2[InneractiveErrorCode.CONNECTION_ERROR.ordinal()] = 1;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[InneractiveErrorCode.CONNECTION_TIMEOUT.ordinal()] = 2;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[InneractiveErrorCode.NO_FILL.ordinal()] = 3;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[InneractiveErrorCode.SERVER_INVALID_RESPONSE.ordinal()] = 4;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr2[InneractiveErrorCode.SERVER_INTERNAL_ERROR.ordinal()] = 5;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr2[InneractiveErrorCode.SDK_INTERNAL_ERROR.ordinal()] = 6;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr2[InneractiveErrorCode.UNSPECIFIED.ordinal()] = 7;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr2[InneractiveErrorCode.LOAD_TIMEOUT.ordinal()] = 8;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr2[InneractiveErrorCode.INVALID_INPUT.ordinal()] = 9;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            iArr2[InneractiveErrorCode.SPOT_DISABLED.ordinal()] = 10;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr2[InneractiveErrorCode.UNSUPPORTED_SPOT.ordinal()] = 11;
        } catch (NoSuchFieldError unused15) {
        }
        try {
            iArr2[InneractiveErrorCode.IN_FLIGHT_TIMEOUT.ordinal()] = 12;
        } catch (NoSuchFieldError unused16) {
        }
        try {
            iArr2[InneractiveErrorCode.SDK_NOT_INITIALIZED.ordinal()] = 13;
        } catch (NoSuchFieldError unused17) {
        }
        try {
            iArr2[InneractiveErrorCode.NON_SECURE_CONTENT_DETECTED.ordinal()] = 14;
        } catch (NoSuchFieldError unused18) {
        }
        try {
            iArr2[InneractiveErrorCode.ERROR_CONFIGURATION_MISMATCH.ordinal()] = 15;
        } catch (NoSuchFieldError unused19) {
        }
        try {
            iArr2[InneractiveErrorCode.NATIVE_ADS_NOT_SUPPORTED_FOR_OS.ordinal()] = 16;
        } catch (NoSuchFieldError unused20) {
        }
        try {
            iArr2[InneractiveErrorCode.ERROR_CONFIGURATION_NO_SUCH_SPOT.ordinal()] = 17;
        } catch (NoSuchFieldError unused21) {
        }
        try {
            iArr2[InneractiveErrorCode.SDK_NOT_INITIALIZED_OR_CONFIG_ERROR.ordinal()] = 18;
        } catch (NoSuchFieldError unused22) {
        }
        try {
            iArr2[InneractiveErrorCode.ERROR_CODE_NATIVE_VIDEO_NOT_SUPPORTED.ordinal()] = 19;
        } catch (NoSuchFieldError unused23) {
        }
        f59613b = iArr2;
    }
}
