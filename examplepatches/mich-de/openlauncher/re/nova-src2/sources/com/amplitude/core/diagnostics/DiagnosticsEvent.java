package com.amplitude.core.diagnostics;

import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.builders.ListBuilder;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010$\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0080\b\u0018\u0000 \u001c2\u00020\u0001:\u0001\u001cB/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0018\b\u0002\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007¢\u0006\u0002\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J\u0019\u0010\u0011\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007HÆ\u0003J7\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\u0018\b\u0002\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\u0006\u0010\u0018\u001a\u00020\u0019J\u0006\u0010\u001a\u001a\u00020\u0003J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR!\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u001d"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsEvent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "eventName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "time", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "eventProperties", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;DLjava/util/Map;)V", "getEventName", "()Ljava/lang/String;", "getEventProperties", "()Ljava/util/Map;", "getTime", "()D", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toJSONObject", "Lorg/json/JSONObject;", "toJsonString", "toString", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class DiagnosticsEvent {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final String eventName;

    @Nullable
    private final Map<String, Object> eventProperties;
    private final double time;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006J\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u00042\u0006\u0010\b\u001a\u00020\tJ\u0014\u0010\n\u001a\u0004\u0018\u00010\u00012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001H\u0002J\u0014\u0010\f\u001a\u0004\u0018\u00010\u00012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001H\u0002¨\u0006\r"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsEvent$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "fromJSONObject", "Lcom/amplitude/core/diagnostics/DiagnosticsEvent;", "json", "Lorg/json/JSONObject;", "fromJsonString", "jsonString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "fromJsonValue", "value", "toJsonValue", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private final Object fromJsonValue(Object value) {
            if (Intrinsics.b(value, JSONObject.NULL)) {
                return null;
            }
            if (value instanceof JSONObject) {
                MapBuilder mapBuilder = new MapBuilder();
                JSONObject jSONObject = (JSONObject) value;
                Iterator<String> itKeys = jSONObject.keys();
                Intrinsics.f(itKeys, "keys(...)");
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    mapBuilder.put(next, DiagnosticsEvent.INSTANCE.fromJsonValue(jSONObject.get(next)));
                }
                return mapBuilder.b();
            }
            if (!(value instanceof JSONArray)) {
                return value;
            }
            ListBuilder listBuilderW = ul.b.w();
            JSONArray jSONArray = (JSONArray) value;
            int length = jSONArray.length();
            for (int i5 = 0; i5 < length; i5++) {
                listBuilderW.add(DiagnosticsEvent.INSTANCE.fromJsonValue(jSONArray.get(i5)));
            }
            return ul.b.m(listBuilderW);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final Object toJsonValue(Object value) throws JSONException {
            if (!(value instanceof Map)) {
                if (!(value instanceof List)) {
                    return value;
                }
                JSONArray jSONArray = new JSONArray();
                Iterator it = ((List) value).iterator();
                while (it.hasNext()) {
                    jSONArray.put(toJsonValue(it.next()));
                }
                return jSONArray;
            }
            JSONObject jSONObject = new JSONObject();
            for (Map.Entry entry : ((Map) value).entrySet()) {
                Object key = entry.getKey();
                Object value2 = entry.getValue();
                if (key instanceof String) {
                    jSONObject.put((String) key, toJsonValue(value2));
                }
            }
            return jSONObject;
        }

        @Nullable
        public final DiagnosticsEvent fromJSONObject(@NotNull JSONObject json) {
            Intrinsics.g(json, "json");
            String strOptString = json.optString("event_name", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            Intrinsics.d(strOptString);
            MapBuilder mapBuilderB = null;
            if (!r70.k.U0(strOptString)) {
                double dOptDouble = json.optDouble("time", Double.NaN);
                if (!Double.isNaN(dOptDouble)) {
                    JSONObject jSONObjectOptJSONObject = json.optJSONObject("event_properties");
                    if (jSONObjectOptJSONObject != null) {
                        MapBuilder mapBuilder = new MapBuilder();
                        Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                        Intrinsics.f(itKeys, "keys(...)");
                        while (itKeys.hasNext()) {
                            String next = itKeys.next();
                            mapBuilder.put(next, DiagnosticsEvent.INSTANCE.fromJsonValue(jSONObjectOptJSONObject.opt(next)));
                        }
                        mapBuilderB = mapBuilder.b();
                    }
                    return new DiagnosticsEvent(strOptString, dOptDouble, mapBuilderB);
                }
            }
            return null;
        }

        @Nullable
        public final DiagnosticsEvent fromJsonString(@NotNull String jsonString) {
            Intrinsics.g(jsonString, "jsonString");
            try {
                return fromJSONObject(new JSONObject(jsonString));
            } catch (Exception unused) {
                return null;
            }
        }

        private Companion() {
        }
    }

    public DiagnosticsEvent(@NotNull String eventName, double d5, @Nullable Map<String, ? extends Object> map) {
        Intrinsics.g(eventName, "eventName");
        this.eventName = eventName;
        this.time = d5;
        this.eventProperties = map;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ DiagnosticsEvent copy$default(DiagnosticsEvent diagnosticsEvent, String str, double d5, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = diagnosticsEvent.eventName;
        }
        if ((i5 & 2) != 0) {
            d5 = diagnosticsEvent.time;
        }
        if ((i5 & 4) != 0) {
            map = diagnosticsEvent.eventProperties;
        }
        return diagnosticsEvent.copy(str, d5, map);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getEventName() {
        return this.eventName;
    }

    /* renamed from: component2, reason: from getter */
    public final double getTime() {
        return this.time;
    }

    @Nullable
    public final Map<String, Object> component3() {
        return this.eventProperties;
    }

    @NotNull
    public final DiagnosticsEvent copy(@NotNull String eventName, double time, @Nullable Map<String, ? extends Object> eventProperties) {
        Intrinsics.g(eventName, "eventName");
        return new DiagnosticsEvent(eventName, time, eventProperties);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DiagnosticsEvent)) {
            return false;
        }
        DiagnosticsEvent diagnosticsEvent = (DiagnosticsEvent) other;
        return Intrinsics.b(this.eventName, diagnosticsEvent.eventName) && Double.compare(this.time, diagnosticsEvent.time) == 0 && Intrinsics.b(this.eventProperties, diagnosticsEvent.eventProperties);
    }

    @NotNull
    public final String getEventName() {
        return this.eventName;
    }

    @Nullable
    public final Map<String, Object> getEventProperties() {
        return this.eventProperties;
    }

    public final double getTime() {
        return this.time;
    }

    public int hashCode() {
        int iC = c9.c(this.time, this.eventName.hashCode() * 31, 31);
        Map<String, Object> map = this.eventProperties;
        return iC + (map == null ? 0 : map.hashCode());
    }

    @NotNull
    public final JSONObject toJSONObject() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("event_name", this.eventName);
        jSONObject.put("time", this.time);
        Map<String, Object> map = this.eventProperties;
        if (map != null) {
            JSONObject jSONObject2 = new JSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                jSONObject2.put(entry.getKey(), INSTANCE.toJsonValue(entry.getValue()));
            }
            jSONObject.put("event_properties", jSONObject2);
        }
        return jSONObject;
    }

    @NotNull
    public final String toJsonString() {
        String string = toJSONObject().toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DiagnosticsEvent(eventName=");
        sb2.append(this.eventName);
        sb2.append(", time=");
        sb2.append(this.time);
        sb2.append(", eventProperties=");
        return c9.l(sb2, this.eventProperties, ')');
    }

    public /* synthetic */ DiagnosticsEvent(String str, double d5, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, d5, (i5 & 4) != 0 ? null : map);
    }
}
