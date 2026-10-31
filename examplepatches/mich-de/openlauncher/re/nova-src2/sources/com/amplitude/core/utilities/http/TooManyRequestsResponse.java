package com.amplitude.core.utilities.http;

import b70.g;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.utilities.JSONUtilKt;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptySet;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\"\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u000e\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0014\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00060\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00060\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00060\nX\u0082\u000e¢\u0006\u0002\n\u0000R \u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\nX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00060\nX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Lcom/amplitude/core/utilities/http/TooManyRequestsResponse;", "Lcom/amplitude/core/utilities/http/AnalyticsResponse;", "response", "Lorg/json/JSONObject;", "(Lorg/json/JSONObject;)V", "error", b.f42142b, "getError", "()Ljava/lang/String;", "exceededDailyQuotaDevices", b.f42142b, "exceededDailyQuotaUsers", "throttledDevices", "throttledEvents", b.f42142b, "getThrottledEvents", "()Ljava/util/Set;", "setThrottledEvents", "(Ljava/util/Set;)V", "throttledUsers", "isEventExceedDailyQuota", b.f42142b, DatabaseConstants.EVENT_FIELD, "Lcom/amplitude/core/events/BaseEvent;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class TooManyRequestsResponse extends AnalyticsResponse {

    @NotNull
    private final String error;

    @NotNull
    private Set<String> exceededDailyQuotaDevices;

    @NotNull
    private Set<String> exceededDailyQuotaUsers;

    @NotNull
    private Set<String> throttledDevices;

    @NotNull
    private Set<Integer> throttledEvents;

    @NotNull
    private Set<String> throttledUsers;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TooManyRequestsResponse(@NotNull JSONObject response) throws JSONException {
        super(HttpStatus.TOO_MANY_REQUESTS, null);
        Intrinsics.g(response, "response");
        EmptySet emptySet = EmptySet.f71734a;
        this.exceededDailyQuotaUsers = emptySet;
        this.exceededDailyQuotaDevices = emptySet;
        this.throttledDevices = emptySet;
        this.throttledUsers = emptySet;
        this.error = JSONUtilKt.getStringWithDefault(response, "error", b.f42142b);
        this.throttledEvents = emptySet;
        if (response.has("exceeded_daily_quota_users")) {
            Set<String> setKeySet = response.getJSONObject("exceeded_daily_quota_users").keySet();
            Intrinsics.f(setKeySet, "keySet(...)");
            this.exceededDailyQuotaUsers = setKeySet;
        }
        if (response.has("exceeded_daily_quota_devices")) {
            Set<String> setKeySet2 = response.getJSONObject("exceeded_daily_quota_devices").keySet();
            Intrinsics.f(setKeySet2, "keySet(...)");
            this.exceededDailyQuotaDevices = setKeySet2;
        }
        if (response.has("throttled_events")) {
            JSONArray jSONArray = response.getJSONArray("throttled_events");
            Intrinsics.f(jSONArray, "getJSONArray(...)");
            this.throttledEvents = c.e1(JSONUtilKt.toIntArray(jSONArray));
        }
        if (response.has("throttled_users")) {
            Set<String> setKeySet3 = response.getJSONObject("throttled_users").keySet();
            Intrinsics.f(setKeySet3, "keySet(...)");
            this.throttledUsers = setKeySet3;
        }
        if (response.has("throttled_devices")) {
            Set<String> setKeySet4 = response.getJSONObject("throttled_devices").keySet();
            Intrinsics.f(setKeySet4, "keySet(...)");
            this.throttledDevices = setKeySet4;
        }
    }

    @NotNull
    public final String getError() {
        return this.error;
    }

    @NotNull
    public final Set<Integer> getThrottledEvents() {
        return this.throttledEvents;
    }

    public final boolean isEventExceedDailyQuota(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        if (event.getUserId() == null || !g.O0(this.exceededDailyQuotaUsers, event.getUserId())) {
            return event.getDeviceId() != null && g.O0(this.exceededDailyQuotaDevices, event.getDeviceId());
        }
        return true;
    }

    public final void setThrottledEvents(@NotNull Set<Integer> set) {
        Intrinsics.g(set, "<set-?>");
        this.throttledEvents = set;
    }
}
