package com.amplitude.core.diagnostics;

import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0080\b\u0018\u0000 \u001d2\u00020\u0001:\u0001\u001dB%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005¢\u0006\u0002\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÆ\u0003J1\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\u0006\u0010\u0019\u001a\u00020\u001aJ\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001R\u0011\u0010\u0007\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u001e"}, d2 = {"Lcom/amplitude/core/diagnostics/HistogramResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "count", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "min", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.MAX, "avg", "(JDDD)V", "getAvg", "()D", "getCount", "()J", "getMax", "getMin", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toJSONObject", "Lorg/json/JSONObject;", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class HistogramResult {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final double avg;
    private final long count;
    private final double max;
    private final double min;

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006¨\u0006\u0007"}, d2 = {"Lcom/amplitude/core/diagnostics/HistogramResult$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "fromJSONObject", "Lcom/amplitude/core/diagnostics/HistogramResult;", "json", "Lorg/json/JSONObject;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final HistogramResult fromJSONObject(@NotNull JSONObject json) {
            Intrinsics.g(json, "json");
            return new HistogramResult(json.getLong("count"), json.getDouble("min"), json.getDouble(InneractiveMediationNameConsts.MAX), json.getDouble("avg"));
        }

        private Companion() {
        }
    }

    public HistogramResult(long j11, double d5, double d11, double d12) {
        this.count = j11;
        this.min = d5;
        this.max = d11;
        this.avg = d12;
    }

    public static /* synthetic */ HistogramResult copy$default(HistogramResult histogramResult, long j11, double d5, double d11, double d12, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = histogramResult.count;
        }
        long j12 = j11;
        if ((i5 & 2) != 0) {
            d5 = histogramResult.min;
        }
        double d13 = d5;
        if ((i5 & 4) != 0) {
            d11 = histogramResult.max;
        }
        return histogramResult.copy(j12, d13, d11, (i5 & 8) != 0 ? histogramResult.avg : d12);
    }

    /* renamed from: component1, reason: from getter */
    public final long getCount() {
        return this.count;
    }

    /* renamed from: component2, reason: from getter */
    public final double getMin() {
        return this.min;
    }

    /* renamed from: component3, reason: from getter */
    public final double getMax() {
        return this.max;
    }

    /* renamed from: component4, reason: from getter */
    public final double getAvg() {
        return this.avg;
    }

    @NotNull
    public final HistogramResult copy(long count, double min, double max, double avg) {
        return new HistogramResult(count, min, max, avg);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof HistogramResult)) {
            return false;
        }
        HistogramResult histogramResult = (HistogramResult) other;
        return this.count == histogramResult.count && Double.compare(this.min, histogramResult.min) == 0 && Double.compare(this.max, histogramResult.max) == 0 && Double.compare(this.avg, histogramResult.avg) == 0;
    }

    public final double getAvg() {
        return this.avg;
    }

    public final long getCount() {
        return this.count;
    }

    public final double getMax() {
        return this.max;
    }

    public final double getMin() {
        return this.min;
    }

    public int hashCode() {
        return Double.hashCode(this.avg) + c9.c(this.max, c9.c(this.min, Long.hashCode(this.count) * 31, 31), 31);
    }

    @NotNull
    public final JSONObject toJSONObject() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("count", this.count);
        jSONObject.put("min", this.min);
        jSONObject.put(InneractiveMediationNameConsts.MAX, this.max);
        jSONObject.put("avg", this.avg);
        return jSONObject;
    }

    @NotNull
    public String toString() {
        return "HistogramResult(count=" + this.count + ", min=" + this.min + ", max=" + this.max + ", avg=" + this.avg + ')';
    }
}
