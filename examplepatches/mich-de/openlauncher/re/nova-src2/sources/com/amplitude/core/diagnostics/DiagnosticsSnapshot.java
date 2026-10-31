package com.amplitude.core.diagnostics;

import b70.h;
import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import fq.c;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0080\b\u0018\u0000 !2\u00020\u0001:\u0001!BW\u0012\u0014\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u0012\u0014\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0003\u0012\u0014\u0010\u0007\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b\u0018\u00010\u0003\u0012\u000e\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\n¢\u0006\u0002\u0010\fJ\u0017\u0010\u0013\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003HÆ\u0003J\u0017\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0003HÆ\u0003J\u0017\u0010\u0015\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b\u0018\u00010\u0003HÆ\u0003J\u0011\u0010\u0016\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\nHÆ\u0003Jc\u0010\u0017\u001a\u00020\u00002\u0016\b\u0002\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00032\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00032\u0016\b\u0002\u0010\u0007\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b\u0018\u00010\u00032\u0010\b\u0002\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\nHÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\u0006\u0010\u001d\u001a\u00020\u0019J\u0006\u0010\u001e\u001a\u00020\u001fJ\t\u0010 \u001a\u00020\u0004HÖ\u0001R\u001f\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0019\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u001f\u0010\u0007\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000eR\u001f\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000e¨\u0006\""}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tags", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "counters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "histograms", "Lcom/amplitude/core/diagnostics/HistogramSnapshot;", DatabaseConstants.EVENT_TABLE_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/amplitude/core/diagnostics/DiagnosticsEvent;", "(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)V", "getCounters", "()Ljava/util/Map;", "getEvents", "()Ljava/util/List;", "getHistograms", "getTags", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isEmpty", "toPayload", "Lcom/amplitude/core/diagnostics/DiagnosticsPayload;", "toString", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final /* data */ class DiagnosticsSnapshot {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final Map<String, Long> counters;

    @Nullable
    private final List<DiagnosticsEvent> events;

    @Nullable
    private final Map<String, HistogramSnapshot> histograms;

    @Nullable
    private final Map<String, String> tags;

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0006\u0010\u0003\u001a\u00020\u0004¨\u0006\u0005"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "empty", "Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final DiagnosticsSnapshot empty() {
            h hVar = h.f17594a;
            return new DiagnosticsSnapshot(hVar, hVar, hVar, EmptyList.f71733a);
        }

        private Companion() {
        }
    }

    public DiagnosticsSnapshot(@Nullable Map<String, String> map, @Nullable Map<String, Long> map2, @Nullable Map<String, HistogramSnapshot> map3, @Nullable List<DiagnosticsEvent> list) {
        this.tags = map;
        this.counters = map2;
        this.histograms = map3;
        this.events = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ DiagnosticsSnapshot copy$default(DiagnosticsSnapshot diagnosticsSnapshot, Map map, Map map2, Map map3, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            map = diagnosticsSnapshot.tags;
        }
        if ((i5 & 2) != 0) {
            map2 = diagnosticsSnapshot.counters;
        }
        if ((i5 & 4) != 0) {
            map3 = diagnosticsSnapshot.histograms;
        }
        if ((i5 & 8) != 0) {
            list = diagnosticsSnapshot.events;
        }
        return diagnosticsSnapshot.copy(map, map2, map3, list);
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
    public final Map<String, HistogramSnapshot> component3() {
        return this.histograms;
    }

    @Nullable
    public final List<DiagnosticsEvent> component4() {
        return this.events;
    }

    @NotNull
    public final DiagnosticsSnapshot copy(@Nullable Map<String, String> tags, @Nullable Map<String, Long> counters, @Nullable Map<String, HistogramSnapshot> histograms, @Nullable List<DiagnosticsEvent> events) {
        return new DiagnosticsSnapshot(tags, counters, histograms, events);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DiagnosticsSnapshot)) {
            return false;
        }
        DiagnosticsSnapshot diagnosticsSnapshot = (DiagnosticsSnapshot) other;
        return Intrinsics.b(this.tags, diagnosticsSnapshot.tags) && Intrinsics.b(this.counters, diagnosticsSnapshot.counters) && Intrinsics.b(this.histograms, diagnosticsSnapshot.histograms) && Intrinsics.b(this.events, diagnosticsSnapshot.events);
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
    public final Map<String, HistogramSnapshot> getHistograms() {
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
        Map<String, HistogramSnapshot> map3 = this.histograms;
        int iHashCode3 = (iHashCode2 + (map3 == null ? 0 : map3.hashCode())) * 31;
        List<DiagnosticsEvent> list = this.events;
        return iHashCode3 + (list != null ? list.hashCode() : 0);
    }

    public final boolean isEmpty() {
        Map<String, Long> map = this.counters;
        if (map != null && !map.isEmpty()) {
            return false;
        }
        Map<String, HistogramSnapshot> map2 = this.histograms;
        if (map2 != null && !map2.isEmpty()) {
            return false;
        }
        List<DiagnosticsEvent> list = this.events;
        return list == null || list.isEmpty();
    }

    @NotNull
    public final DiagnosticsPayload toPayload() {
        LinkedHashMap linkedHashMap;
        Map<String, String> map = this.tags;
        Map<String, Long> map2 = this.counters;
        Map<String, HistogramSnapshot> map3 = this.histograms;
        if (map3 != null) {
            linkedHashMap = new LinkedHashMap(b70.k.d0(map3.size()));
            Iterator<T> it = map3.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                linkedHashMap.put(entry.getKey(), ((HistogramSnapshot) entry.getValue()).toResult());
            }
        } else {
            linkedHashMap = null;
        }
        return new DiagnosticsPayload(map, map2, linkedHashMap, this.events);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DiagnosticsSnapshot(tags=");
        sb2.append(this.tags);
        sb2.append(", counters=");
        sb2.append(this.counters);
        sb2.append(", histograms=");
        sb2.append(this.histograms);
        sb2.append(", events=");
        return c.e(sb2, this.events, ')');
    }
}
