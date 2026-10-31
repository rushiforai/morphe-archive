package io.branch.search.internal;

import com.amplitude.core.events.Plan;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class P {
    public static final void a(@NotNull H h5, @NotNull String sessionId, long j11, long j12, boolean z11, @NotNull String source, @NotNull String requestId, @NotNull String api, @Nullable String str) throws JSONException {
        Intrinsics.g(h5, "<this>");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(source, "source");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(api, "api");
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("round_trip_time", j12 - j11);
            jSONObject.put("channel", api);
            jSONObject.put(Plan.AMP_PLAN_SOURCE, source);
            jSONObject.put("request_id", requestId);
            jSONObject.put("success", z11);
            if (str != null) {
                jSONObject.put("exception", str);
            }
        } catch (JSONException e3) {
            h5.a(sessionId, "AnalyticalBufferRepository.trackLocalCall", e3, a80.m.n("request_id", requestId));
        }
        h5.a(sessionId, "local_api_calls", jSONObject, false);
    }
}
