package com.amplitude.core.utilities.http;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u0000 \u00072\u00020\u0001:\u0001\u0007B\u000f\b\u0004\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006\u0082\u0001\u0006\b\t\n\u000b\f\r¨\u0006\u000e"}, d2 = {"Lcom/amplitude/core/utilities/http/AnalyticsResponse;", b.f42142b, "status", "Lcom/amplitude/core/utilities/http/HttpStatus;", "(Lcom/amplitude/core/utilities/http/HttpStatus;)V", "getStatus", "()Lcom/amplitude/core/utilities/http/HttpStatus;", k.O, "Lcom/amplitude/core/utilities/http/BadRequestResponse;", "Lcom/amplitude/core/utilities/http/FailedResponse;", "Lcom/amplitude/core/utilities/http/PayloadTooLargeResponse;", "Lcom/amplitude/core/utilities/http/SuccessResponse;", "Lcom/amplitude/core/utilities/http/TimeoutResponse;", "Lcom/amplitude/core/utilities/http/TooManyRequestsResponse;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public abstract class AnalyticsResponse {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final HttpStatus status;

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bJ\u0012\u0010\t\u001a\u00020\n2\b\u0010\u0007\u001a\u0004\u0018\u00010\bH\u0002¨\u0006\u000b"}, d2 = {"Lcom/amplitude/core/utilities/http/AnalyticsResponse$Companion;", b.f42142b, "()V", "create", "Lcom/amplitude/core/utilities/http/AnalyticsResponse;", "responseCode", b.f42142b, "responseBody", b.f42142b, "parseResponseBodyOrGetDefault", "Lorg/json/JSONObject;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private final JSONObject parseResponseBodyOrGetDefault(String responseBody) throws JSONException {
            JSONObject jSONObject = new JSONObject();
            if (responseBody != null && responseBody.length() != 0) {
                try {
                    return new JSONObject(responseBody);
                } catch (Exception unused) {
                    jSONObject.put("error", responseBody);
                }
            }
            return jSONObject;
        }

        @NotNull
        public final AnalyticsResponse create(int responseCode, @Nullable String responseBody) {
            IntRange range = HttpStatus.SUCCESS.getRange();
            int i5 = range.f71906a;
            if (responseCode <= range.f71907b && i5 <= responseCode) {
                return new SuccessResponse();
            }
            IntRange range2 = HttpStatus.BAD_REQUEST.getRange();
            int i11 = range2.f71906a;
            if (responseCode <= range2.f71907b && i11 <= responseCode) {
                return new BadRequestResponse(new JSONObject(responseBody));
            }
            IntRange range3 = HttpStatus.PAYLOAD_TOO_LARGE.getRange();
            int i12 = range3.f71906a;
            if (responseCode <= range3.f71907b && i12 <= responseCode) {
                return new PayloadTooLargeResponse(new JSONObject(responseBody));
            }
            IntRange range4 = HttpStatus.TOO_MANY_REQUESTS.getRange();
            int i13 = range4.f71906a;
            if (responseCode <= range4.f71907b && i13 <= responseCode) {
                return new TooManyRequestsResponse(new JSONObject(responseBody));
            }
            IntRange range5 = HttpStatus.TIMEOUT.getRange();
            return (responseCode > range5.f71907b || range5.f71906a > responseCode) ? new FailedResponse(parseResponseBodyOrGetDefault(responseBody)) : new TimeoutResponse();
        }

        private Companion() {
        }
    }

    public /* synthetic */ AnalyticsResponse(HttpStatus httpStatus, DefaultConstructorMarker defaultConstructorMarker) {
        this(httpStatus);
    }

    @NotNull
    public final HttpStatus getStatus() {
        return this.status;
    }

    private AnalyticsResponse(HttpStatus httpStatus) {
        this.status = httpStatus;
    }
}
