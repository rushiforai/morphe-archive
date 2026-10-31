package com.moloco.sdk.internal.client_metrics_data;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.publisher.AdFormatType;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final C0144a f36250c = new C0144a(null);

    /* renamed from: d, reason: collision with root package name */
    public static final int f36251d = 8;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final String f36252e = "AcmClickDeduper";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f36253a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public AtomicBoolean f36254b;

    /* renamed from: com.moloco.sdk.internal.client_metrics_data.a$a, reason: collision with other inner class name */
    public static final class C0144a {
        public /* synthetic */ C0144a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public C0144a() {
        }
    }

    public a(@NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f36253a = metricsRecorder;
        this.f36254b = new AtomicBoolean(false);
    }

    public final void a() {
        this.f36254b.set(false);
    }

    public final void a(@NotNull AdFormatType adType) {
        Intrinsics.g(adType, "adType");
        if (this.f36254b.compareAndSet(false, true)) {
            MolocoLogger.info$default(MolocoLogger.INSTANCE, f36252e, "Deduped click logged", null, false, 12, null);
            MetricsRecorder metricsRecorder = this.f36253a;
            CountEvent countEvent = new CountEvent(b.E.c());
            String strC = d.f36295c.c();
            String lowerCase = adType.name().toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            metricsRecorder.recordCountEvent(countEvent.withTag(strC, lowerCase));
        }
        this.f36254b.set(true);
    }
}
