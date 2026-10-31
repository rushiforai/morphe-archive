package com.amplitude.core.diagnostics;

import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import fq.c;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0080\b\u0018\u00002\u00020\u0001BW\u0012\u0014\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u0012\u0014\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0003\u0012\u0014\u0010\u0007\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b\u0018\u00010\u0003\u0012\u000e\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\n¢\u0006\u0002\u0010\fJ\u0017\u0010\u0013\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003HÆ\u0003J\u0017\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0003HÆ\u0003J\u0017\u0010\u0015\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b\u0018\u00010\u0003HÆ\u0003J\u0011\u0010\u0016\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\nHÆ\u0003Jc\u0010\u0017\u001a\u00020\u00002\u0016\b\u0002\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00032\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00032\u0016\b\u0002\u0010\u0007\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b\u0018\u00010\u00032\u0010\b\u0002\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\nHÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\u0006\u0010\u001d\u001a\u00020\u001eJ\u0006\u0010\u001f\u001a\u00020\u0004J\t\u0010 \u001a\u00020\u0004HÖ\u0001R\u001f\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0019\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u001f\u0010\u0007\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000eR\u001f\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000e¨\u0006!"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsPayload;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tags", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "counters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "histograms", "Lcom/amplitude/core/diagnostics/HistogramResult;", DatabaseConstants.EVENT_TABLE_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/amplitude/core/diagnostics/DiagnosticsEvent;", "(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)V", "getCounters", "()Ljava/util/Map;", "getEvents", "()Ljava/util/List;", "getHistograms", "getTags", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toJSONObject", "Lorg/json/JSONObject;", "toJsonString", "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final /* data */ class DiagnosticsPayload {

    @Nullable
    private final Map<String, Long> counters;

    @Nullable
    private final List<DiagnosticsEvent> events;

    @Nullable
    private final Map<String, HistogramResult> histograms;

    @Nullable
    private final Map<String, String> tags;

    public DiagnosticsPayload(@Nullable Map<String, String> map, @Nullable Map<String, Long> map2, @Nullable Map<String, HistogramResult> map3, @Nullable List<DiagnosticsEvent> list) {
        this.tags = map;
        this.counters = map2;
        this.histograms = map3;
        this.events = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ DiagnosticsPayload copy$default(DiagnosticsPayload diagnosticsPayload, Map map, Map map2, Map map3, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            map = diagnosticsPayload.tags;
        }
        if ((i5 & 2) != 0) {
            map2 = diagnosticsPayload.counters;
        }
        if ((i5 & 4) != 0) {
            map3 = diagnosticsPayload.histograms;
        }
        if ((i5 & 8) != 0) {
            list = diagnosticsPayload.events;
        }
        return diagnosticsPayload.copy(map, map2, map3, list);
    }

    @Nullable
    public final Map<String, String> component1() {
        return this.tags;
    }

    @Nullable
    public final Map<String, Long> component2() {
        return this.counters;
    }

    @Nullable
    public final Map<String, HistogramResult> component3() {
        return this.histograms;
    }

    @Nullable
    public final List<DiagnosticsEvent> component4() {
        return this.events;
    }

    @NotNull
    public final DiagnosticsPayload copy(@Nullable Map<String, String> tags, @Nullable Map<String, Long> counters, @Nullable Map<String, HistogramResult> histograms, @Nullable List<DiagnosticsEvent> events) {
        return new DiagnosticsPayload(tags, counters, histograms, events);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DiagnosticsPayload)) {
            return false;
        }
        DiagnosticsPayload diagnosticsPayload = (DiagnosticsPayload) other;
        return Intrinsics.b(this.tags, diagnosticsPayload.tags) && Intrinsics.b(this.counters, diagnosticsPayload.counters) && Intrinsics.b(this.histograms, diagnosticsPayload.histograms) && Intrinsics.b(this.events, diagnosticsPayload.events);
    }

    @Nullable
    public final Map<String, Long> getCounters() {
        return this.counters;
    }

    @Nullable
    public final List<DiagnosticsEvent> getEvents() {
        return this.events;
    }

    @Nullable
    public final Map<String, HistogramResult> getHistograms() {
        return this.histograms;
    }

    @Nullable
    public final Map<String, String> getTags() {
        return this.tags;
    }

    public int hashCode() {
        Map<String, String> map = this.tags;
        int iHashCode = (map == null ? 0 : map.hashCode()) * 31;
        Map<String, Long> map2 = this.counters;
        int iHashCode2 = (iHashCode + (map2 == null ? 0 : map2.hashCode())) * 31;
        Map<String, HistogramResult> map3 = this.histograms;
        int iHashCode3 = (iHashCode2 + (map3 == null ? 0 : map3.hashCode())) * 31;
        List<DiagnosticsEvent> list = this.events;
        return iHashCode3 + (list != null ? list.hashCode() : 0);
    }

    @NotNull
    public final JSONObject toJSONObject() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        Map<String, String> map = this.tags;
        if (map != null) {
            JSONObject jSONObject2 = new JSONObject();
            for (Map.Entry<String, String> entry : map.entrySet()) {
                jSONObject2.put(entry.getKey(), entry.getValue());
            }
            Unit unit = Unit.f71706a;
            jSONObject.put("tags", jSONObject2);
        }
        Map<String, Long> map2 = this.counters;
        if (map2 != null) {
            JSONObject jSONObject3 = new JSONObject();
            for (Map.Entry<String, Long> entry2 : map2.entrySet()) {
                jSONObject3.put(entry2.getKey(), entry2.getValue().longValue());
            }
            Unit unit2 = Unit.f71706a;
            jSONObject.put("counters", jSONObject3);
        }
        Map<String, HistogramResult> map3 = this.histograms;
        if (map3 != null) {
            JSONObject jSONObject4 = new JSONObject();
            for (Map.Entry<String, HistogramResult> entry3 : map3.entrySet()) {
                jSONObject4.put(entry3.getKey(), entry3.getValue().toJSONObject());
            }
            Unit unit3 = Unit.f71706a;
            jSONObject.put("histogram", jSONObject4);
        }
        List<DiagnosticsEvent> list = this.events;
        if (list != null) {
            JSONArray jSONArray = new JSONArray();
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                jSONArray.put(((DiagnosticsEvent) it.next()).toJSONObject());
            }
            Unit unit4 = Unit.f71706a;
            jSONObject.put(DatabaseConstants.EVENT_TABLE_NAME, jSONArray);
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
        StringBuilder sb2 = new StringBuilder("DiagnosticsPayload(tags=");
        sb2.append(this.tags);
        sb2.append(", counters=");
        sb2.append(this.counters);
        sb2.append(", histograms=");
        sb2.append(this.histograms);
        sb2.append(", events=");
        return c.e(sb2, this.events, ')');
    }
}
