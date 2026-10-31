package com.amplitude.android.plugins.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\b\u0018\u00002\u00020\u0001B-\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bR\u0014\u0010\u0004\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\nR\u0014\u0010\u0005\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u000f"}, d2 = {"Lcom/amplitude/android/plugins/internal/InternalOptions;", "Lcom/amplitude/android/sessionreplay/internal/InternalOptions;", "pack", b.f42142b, "logPayloads", "transform", "maxStorageBytes", b.f42142b, "(ZZZJ)V", "getLogPayloads", "()Z", "getMaxStorageBytes", "()J", "getPack", "getTransform", "plugin-session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class InternalOptions extends com.amplitude.android.sessionreplay.internal.InternalOptions {
    private final boolean logPayloads;
    private final long maxStorageBytes;
    private final boolean pack;
    private final boolean transform;

    public InternalOptions() {
        this(false, false, false, 0L, 15, null);
    }

    @Override // com.amplitude.android.sessionreplay.internal.InternalOptions
    public boolean getLogPayloads() {
        return this.logPayloads;
    }

    @Override // com.amplitude.android.sessionreplay.internal.InternalOptions
    public long getMaxStorageBytes() {
        return this.maxStorageBytes;
    }

    @Override // com.amplitude.android.sessionreplay.internal.InternalOptions
    public boolean getPack() {
        return this.pack;
    }

    @Override // com.amplitude.android.sessionreplay.internal.InternalOptions
    public boolean getTransform() {
        return this.transform;
    }

    public /* synthetic */ InternalOptions(boolean z11, boolean z12, boolean z13, long j11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? true : z11, (i5 & 2) != 0 ? false : z12, (i5 & 4) != 0 ? true : z13, (i5 & 8) != 0 ? 10485760L : j11);
    }

    public InternalOptions(boolean z11, boolean z12, boolean z13, long j11) {
        super(z11, z12, z13, j11);
        this.pack = z11;
        this.logPayloads = z12;
        this.transform = z13;
        this.maxStorageBytes = j11;
    }
}
