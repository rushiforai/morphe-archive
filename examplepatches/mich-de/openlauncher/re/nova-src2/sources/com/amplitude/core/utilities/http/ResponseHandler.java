package com.amplitude.core.utilities.http;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J'\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\bH\u0016¢\u0006\u0002\u0010\tJ \u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u0011\u001a\u00020\u000e2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u0014\u001a\u00020\u000e2\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u0017\u001a\u00020\u000e2\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\bH&J \u0010\u001a\u001a\u00020\u000e2\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\bH&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u001dÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/core/utilities/http/ResponseHandler;", b.f42142b, "handle", b.f42142b, "response", "Lcom/amplitude/core/utilities/http/AnalyticsResponse;", DatabaseConstants.EVENT_TABLE_NAME, "eventsString", b.f42142b, "(Lcom/amplitude/core/utilities/http/AnalyticsResponse;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Boolean;", "handleBadRequestResponse", "badRequestResponse", "Lcom/amplitude/core/utilities/http/BadRequestResponse;", "handleFailedResponse", b.f42142b, "failedResponse", "Lcom/amplitude/core/utilities/http/FailedResponse;", "handlePayloadTooLargeResponse", "payloadTooLargeResponse", "Lcom/amplitude/core/utilities/http/PayloadTooLargeResponse;", "handleSuccessResponse", "successResponse", "Lcom/amplitude/core/utilities/http/SuccessResponse;", "handleTimeoutResponse", "timeoutResponse", "Lcom/amplitude/core/utilities/http/TimeoutResponse;", "handleTooManyRequestsResponse", "tooManyRequestsResponse", "Lcom/amplitude/core/utilities/http/TooManyRequestsResponse;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface ResponseHandler {
    @Nullable
    default Boolean handle(@NotNull AnalyticsResponse response, @NotNull Object events, @NotNull String eventsString) {
        Intrinsics.g(response, "response");
        Intrinsics.g(events, "events");
        Intrinsics.g(eventsString, "eventsString");
        if (response instanceof SuccessResponse) {
            handleSuccessResponse((SuccessResponse) response, events, eventsString);
            return null;
        }
        if (response instanceof BadRequestResponse) {
            return Boolean.valueOf(handleBadRequestResponse((BadRequestResponse) response, events, eventsString));
        }
        if (response instanceof PayloadTooLargeResponse) {
            handlePayloadTooLargeResponse((PayloadTooLargeResponse) response, events, eventsString);
            return Boolean.TRUE;
        }
        if (response instanceof TooManyRequestsResponse) {
            handleTooManyRequestsResponse((TooManyRequestsResponse) response, events, eventsString);
            return Boolean.TRUE;
        }
        if (response instanceof TimeoutResponse) {
            handleTimeoutResponse((TimeoutResponse) response, events, eventsString);
            return Boolean.TRUE;
        }
        handleFailedResponse((FailedResponse) response, events, eventsString);
        return Boolean.TRUE;
    }

    boolean handleBadRequestResponse(@NotNull BadRequestResponse badRequestResponse, @NotNull Object events, @NotNull String eventsString);

    void handleFailedResponse(@NotNull FailedResponse failedResponse, @NotNull Object events, @NotNull String eventsString);

    void handlePayloadTooLargeResponse(@NotNull PayloadTooLargeResponse payloadTooLargeResponse, @NotNull Object events, @NotNull String eventsString);

    void handleSuccessResponse(@NotNull SuccessResponse successResponse, @NotNull Object events, @NotNull String eventsString);

    void handleTimeoutResponse(@NotNull TimeoutResponse timeoutResponse, @NotNull Object events, @NotNull String eventsString);

    void handleTooManyRequestsResponse(@NotNull TooManyRequestsResponse tooManyRequestsResponse, @NotNull Object events, @NotNull String eventsString);
}
