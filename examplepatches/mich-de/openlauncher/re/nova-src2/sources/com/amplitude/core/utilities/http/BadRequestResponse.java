package com.amplitude.core.utilities.http;

import b70.g;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.utilities.JSONUtilKt;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptySet;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import r70.k;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\"\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010#\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0010J\u000e\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014J\u0006\u0010\u0015\u001a\u00020\u0012R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0014\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00060\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lcom/amplitude/core/utilities/http/BadRequestResponse;", "Lcom/amplitude/core/utilities/http/AnalyticsResponse;", "response", "Lorg/json/JSONObject;", "(Lorg/json/JSONObject;)V", "error", b.f42142b, "getError", "()Ljava/lang/String;", "eventsWithInvalidFields", b.f42142b, b.f42142b, "eventsWithMissingFields", "silencedDevices", "silencedEvents", "getEventIndicesToDrop", b.f42142b, "isEventSilenced", b.f42142b, DatabaseConstants.EVENT_FIELD, "Lcom/amplitude/core/events/BaseEvent;", "isInvalidApiKeyResponse", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class BadRequestResponse extends AnalyticsResponse {

    @NotNull
    private final String error;

    @NotNull
    private Set<Integer> eventsWithInvalidFields;

    @NotNull
    private Set<Integer> eventsWithMissingFields;

    @NotNull
    private Set<String> silencedDevices;

    @NotNull
    private Set<Integer> silencedEvents;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public BadRequestResponse(@NotNull JSONObject response) throws JSONException {
        super(HttpStatus.BAD_REQUEST, null);
        Intrinsics.g(response, "response");
        this.error = JSONUtilKt.getStringWithDefault(response, "error", b.f42142b);
        EmptySet emptySet = EmptySet.f71734a;
        this.eventsWithInvalidFields = emptySet;
        this.eventsWithMissingFields = emptySet;
        this.silencedEvents = emptySet;
        this.silencedDevices = emptySet;
        if (response.has("events_with_invalid_fields")) {
            JSONObject jSONObject = response.getJSONObject("events_with_invalid_fields");
            Intrinsics.f(jSONObject, "getJSONObject(...)");
            this.eventsWithInvalidFields = JSONUtilKt.collectIndices(jSONObject);
        }
        if (response.has("events_with_missing_fields")) {
            JSONObject jSONObject2 = response.getJSONObject("events_with_missing_fields");
            Intrinsics.f(jSONObject2, "getJSONObject(...)");
            this.eventsWithMissingFields = JSONUtilKt.collectIndices(jSONObject2);
        }
        if (response.has("silenced_devices")) {
            Object jSONArray = response.getJSONArray("silenced_devices");
            Intrinsics.f(jSONArray, "getJSONArray(...)");
            Set<String> setN1 = g.N1((Iterable) jSONArray);
            Intrinsics.e(setN1, "null cannot be cast to non-null type kotlin.collections.Set<kotlin.String>");
            this.silencedDevices = setN1;
        }
        if (response.has("silenced_events")) {
            JSONArray jSONArray2 = response.getJSONArray("silenced_events");
            Intrinsics.f(jSONArray2, "getJSONArray(...)");
            this.silencedEvents = c.e1(JSONUtilKt.toIntArray(jSONArray2));
        }
    }

    @NotNull
    public final String getError() {
        return this.error;
    }

    @NotNull
    public final Set<Integer> getEventIndicesToDrop() {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        linkedHashSet.addAll(this.eventsWithInvalidFields);
        linkedHashSet.addAll(this.eventsWithMissingFields);
        linkedHashSet.addAll(this.silencedEvents);
        return linkedHashSet;
    }

    public final boolean isEventSilenced(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        String deviceId = event.getDeviceId();
        if (deviceId != null) {
            return this.silencedDevices.contains(deviceId);
        }
        return false;
    }

    public final boolean isInvalidApiKeyResponse() {
        String lowerCase = this.error.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return k.K0(lowerCase, "invalid api key", false);
    }
}
