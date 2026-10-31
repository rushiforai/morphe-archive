package hd;

import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.OnFyberMarketplaceInitializedListener;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class b {
    public static final bg.a a(InneractiveErrorCode inneractiveErrorCode) {
        int i5 = 399;
        switch (inneractiveErrorCode == null ? -1 : a.f59613b[inneractiveErrorCode.ordinal()]) {
            case 1:
                i5 = 300;
                break;
            case 2:
                i5 = 301;
                break;
            case 3:
                i5 = 302;
                break;
            case 4:
                i5 = 303;
                break;
            case 5:
                i5 = Sdk.SDKError.Reason.AD_EXPIRED_VALUE;
                break;
            case 6:
                i5 = Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE;
                break;
            case 7:
                i5 = 306;
                break;
            case 8:
                i5 = Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE;
                break;
            case 9:
                i5 = Sdk.SDKError.Reason.AD_WIN_NOTIFICATION_ERROR_VALUE;
                break;
            case 10:
                i5 = Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE;
                break;
            case 11:
                i5 = Sdk.SDKError.Reason.AD_HTML_FAILED_TO_LOAD_VALUE;
                break;
            case 12:
                i5 = Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY_VALUE;
                break;
            case 13:
                i5 = Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE;
                break;
            case 14:
                i5 = Sdk.SDKError.Reason.EVALUATE_JAVASCRIPT_FAILED_VALUE;
                break;
            case 15:
                i5 = Sdk.SDKError.Reason.LINK_COMMAND_OPEN_FAILED_VALUE;
                break;
            case 16:
                i5 = Sdk.SDKError.Reason.JSON_PARAMS_ENCODE_ERROR_VALUE;
                break;
            case 17:
                i5 = Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE;
                break;
            case 18:
                i5 = Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR_VALUE;
                break;
        }
        return new bg.a(i5, "DT Exchange failed to request ad with reason: " + inneractiveErrorCode, "com.google.ads.mediation.dtexchange");
    }

    public static final bg.a b(OnFyberMarketplaceInitializedListener.FyberInitStatus initStatus) {
        Intrinsics.g(initStatus, "initStatus");
        int i5 = a.f59612a[initStatus.ordinal()];
        return new bg.a(i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? 299 : Sdk.SDKError.Reason.AD_IS_LOADING_VALUE : Sdk.SDKError.Reason.AD_CONSUMED_VALUE : 201 : 200, "DT Exchange failed to initialize with reason: " + initStatus, "com.google.ads.mediation.dtexchange");
    }
}
