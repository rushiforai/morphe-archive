package io.branch.search.internal;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class J2 extends JSONObject {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final b f62698a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62699b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Throwable f62700c;

    public static final class a {
        public static final String a(a aVar, b bVar) {
            aVar.getClass();
            return bVar == b.BRANCH_NO_CONNECTIVITY_ERR ? "Poor network connectivity. Please try again later. Please make sure app has internet access permission" : bVar == b.NO_INTERNET_PERMISSION_ERR ? "Please add 'android.permission.INTERNET' in your applications manifest file." : bVar == b.INTERNAL_SERVER_ERR ? "Unable to process your request now. An internal error happened. Please try later." : bVar == b.REQUEST_TIMED_OUT_ERR ? "Request to Branch server timed out. Please check your connection or try again later." : bVar == b.REQUEST_CANCELED ? "Request was canceled due to new requests being scheduled before it could be completed." : bVar == b.ROUTING_ERR_UNABLE_TO_OPEN_APP ? "Unable to open the destination application or its fallback url." : bVar == b.ROUTING_ERR_UNABLE_TO_OPEN_WEB_URL ? "Unable to open the web url associated with the app." : bVar == b.ROUTING_ERR_UNABLE_TO_OPEN_PS ? "Unable to open the Google Play Store for the app." : bVar == b.ROUTING_ERR_UNABLE_TO_COMPLETE_ACTION ? "An unknown error happened. Unable to open the app." : bVar == b.POST_PROCESSING_ERR ? "On device post-processing error." : bVar == b.ILLEGAL_ARGS_ERR ? "Missing or illegal arguments." : bVar == b.CLIENT_NOT_INITIALIZED ? "BranchNavigatorClient is not initialized." : "An unknown error occurred.";
        }
    }

    public enum b {
        INTERNAL_ERR,
        BAD_REQUEST_ERR,
        ILLEGAL_ARGS_ERR,
        UNAUTHORIZED_ERR,
        NOT_SUPPORTED_ERROR,
        NO_INTERNET_PERMISSION_ERR,
        BRANCH_NO_CONNECTIVITY_ERR,
        INTERNAL_SERVER_ERR,
        REQUEST_TIMED_OUT_ERR,
        REQUEST_CANCELED,
        POST_PROCESSING_ERR,
        ROUTING_ERR_UNABLE_TO_OPEN_APP,
        ROUTING_ERR_UNABLE_TO_OPEN_WEB_URL,
        ROUTING_ERR_UNABLE_TO_OPEN_PS,
        ROUTING_ERR_UNABLE_TO_COMPLETE_ACTION,
        OPTED_OUT_OF_TRACKING,
        CLIENT_NOT_INITIALIZED;


        @NotNull
        public static final a Companion = new a();

        public static final class a {
            @NotNull
            public static b a(int i5) {
                return i5 != 400 ? i5 != 401 ? i5 != 404 ? b.INTERNAL_ERR : b.NOT_SUPPORTED_ERROR : b.UNAUTHORIZED_ERR : b.BAD_REQUEST_ERR;
            }
        }
    }

    public J2(@NotNull b errorCode, @NotNull String errorMsg, @Nullable Throwable th2) throws JSONException {
        Intrinsics.g(errorCode, "errorCode");
        Intrinsics.g(errorMsg, "errorMsg");
        this.f62698a = errorCode;
        this.f62699b = errorMsg;
        this.f62700c = th2;
        putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, errorCode);
        putOpt(PglCryptUtils.KEY_MESSAGE, errorMsg);
    }
}
