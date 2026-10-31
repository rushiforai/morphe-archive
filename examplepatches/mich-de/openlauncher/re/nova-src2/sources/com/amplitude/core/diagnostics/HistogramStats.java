package com.amplitude.core.diagnostics;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u000e\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0006J\u0006\u0010\f\u001a\u00020\rR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lcom/amplitude/core/diagnostics/HistogramStats;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "count", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.MAX, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "min", "sum", "record", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "toSnapshot", "Lcom/amplitude/core/diagnostics/HistogramSnapshot;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class HistogramStats {
    private long count;
    private double sum;
    private double min = Double.POSITIVE_INFINITY;
    private double max = Double.NEGATIVE_INFINITY;

    public final void record(double value) {
        this.count++;
        this.min = Math.min(this.min, value);
        this.max = Math.max(this.max, value);
        this.sum += value;
    }

    @NotNull
    public final HistogramSnapshot toSnapshot() {
        return new HistogramSnapshot(this.count, this.min, this.max, this.sum);
    }
}
