package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.publisher.s;
import com.moloco.sdk.publisher.AdFormatType;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.internal.publisher.a, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2939a implements s {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final C0157a f36924d = new C0157a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f36925e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f36926f = "AdCreateLoadTimeoutManager";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final AdFormatType f36927a;

    /* renamed from: b, reason: collision with root package name */
    public final long f36928b;

    /* renamed from: c, reason: collision with root package name */
    public long f36929c;

    /* renamed from: com.moloco.sdk.internal.publisher.a$a, reason: collision with other inner class name */
    public static final class C0157a {
        public /* synthetic */ C0157a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public C0157a() {
        }
    }

    public /* synthetic */ C2939a(AdFormatType adFormatType, long j11, DefaultConstructorMarker defaultConstructorMarker) {
        this(adFormatType, j11);
    }

    @Override // com.moloco.sdk.internal.publisher.s
    public void a(long j11, long j12) {
        s.a.a(this, j11, j12);
    }

    @Override // com.moloco.sdk.internal.publisher.s
    /* renamed from: getCreateAdObjectDuration-UwyO8pc */
    public long mo266getCreateAdObjectDurationUwyO8pc() {
        return this.f36929c;
    }

    @Override // com.moloco.sdk.internal.publisher.s
    /* renamed from: setCreateAdObjectDuration-LRDsOJo */
    public void mo267setCreateAdObjectDurationLRDsOJo(long j11) {
        this.f36929c = j11;
    }

    public C2939a(AdFormatType adFormatType, long j11) {
        Intrinsics.g(adFormatType, "adFormatType");
        this.f36927a = adFormatType;
        this.f36928b = j11;
        Duration.f72038b.getClass();
        this.f36929c = 0L;
    }

    public final long a() {
        long jL = Duration.l(this.f36928b, mo266getCreateAdObjectDurationUwyO8pc());
        MolocoLogger.debug$default(MolocoLogger.INSTANCE, f36926f, this.f36927a + " timeout: " + ((Object) Duration.r(this.f36928b)) + ", create ad duration: " + ((Object) Duration.r(mo266getCreateAdObjectDurationUwyO8pc())) + ". Return value: " + ((Object) Duration.r(jL)), false, 4, null);
        return jL;
    }
}
