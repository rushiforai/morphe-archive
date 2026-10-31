package com.amplitude.core.utilities.http;

import com.amplitude.core.utilities.JSONUtilKt;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/amplitude/core/utilities/http/FailedResponse;", "Lcom/amplitude/core/utilities/http/AnalyticsResponse;", "response", "Lorg/json/JSONObject;", "(Lorg/json/JSONObject;)V", "error", b.f42142b, "getError", "()Ljava/lang/String;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class FailedResponse extends AnalyticsResponse {

    @NotNull
    private final String error;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FailedResponse(@NotNull JSONObject response) {
        super(HttpStatus.FAILED, null);
        Intrinsics.g(response, "response");
        this.error = JSONUtilKt.getStringWithDefault(response, "error", b.f42142b);
    }

    @NotNull
    public final String getError() {
        return this.error;
    }
}
