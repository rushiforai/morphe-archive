package com.moloco.sdk.acm.recorder;

import com.moloco.sdk.acm.AndroidClientMetrics;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class a implements MetricsRecorder {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f36153a;

    /* JADX WARN: Multi-variable type inference failed */
    public a() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    @Override // com.moloco.sdk.acm.recorder.MetricsRecorder
    public void recordCountEvent(@NotNull CountEvent event) {
        Intrinsics.g(event, "event");
        String str = this.f36153a;
        if (str == null || str.length() == 0) {
            AndroidClientMetrics.INSTANCE.recordCountEvent$moloco_android_client_metrics_release(event);
        } else {
            AndroidClientMetrics.INSTANCE.recordCountEvent$moloco_android_client_metrics_release(event.withTag(b.f36154a, this.f36153a));
        }
    }

    @Override // com.moloco.sdk.acm.recorder.MetricsRecorder
    public void recordTimerEvent(@NotNull TimerEvent event) {
        Intrinsics.g(event, "event");
        String str = this.f36153a;
        if (str == null || str.length() == 0) {
            AndroidClientMetrics.INSTANCE.recordTimerEvent$moloco_android_client_metrics_release(event);
        } else {
            AndroidClientMetrics.INSTANCE.recordTimerEvent$moloco_android_client_metrics_release(event.withTag(b.f36154a, this.f36153a));
        }
    }

    @Override // com.moloco.sdk.acm.recorder.MetricsRecorder
    @NotNull
    public TimerEvent startTimerEvent(@NotNull String str) {
        return MetricsRecorder.a.a(this, str);
    }

    public a(@Nullable String str) {
        this.f36153a = str;
    }

    public /* synthetic */ a(String str, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str);
    }
}
