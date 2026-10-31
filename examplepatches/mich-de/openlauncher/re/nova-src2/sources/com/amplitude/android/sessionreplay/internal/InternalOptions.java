package com.amplitude.android.sessionreplay.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\b\b\u0016\u0018\u00002\u00020\u0001B-\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bR\u0014\u0010\u0004\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\nR\u0014\u0010\u0005\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u000f"}, d2 = {"Lcom/amplitude/android/sessionreplay/internal/InternalOptions;", b.f42142b, "pack", b.f42142b, "logPayloads", "transform", "maxStorageBytes", b.f42142b, "(ZZZJ)V", "getLogPayloads", "()Z", "getMaxStorageBytes", "()J", "getPack", "getTransform", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class InternalOptions {
    private final boolean logPayloads;
    private final long maxStorageBytes;
    private final boolean pack;
    private final boolean transform;

    public InternalOptions() {
        this(false, false, false, 0L, 15, null);
    }

    public boolean getLogPayloads() {
        return this.logPayloads;
    }

    public long getMaxStorageBytes() {
        return this.maxStorageBytes;
    }

    public boolean getPack() {
        return this.pack;
    }

    public boolean getTransform() {
        return this.transform;
    }

    public InternalOptions(boolean z11, boolean z12, boolean z13, long j11) {
        this.pack = z11;
        this.logPayloads = z12;
        this.transform = z13;
        this.maxStorageBytes = j11;
    }

    public /* synthetic */ InternalOptions(boolean z11, boolean z12, boolean z13, long j11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? true : z11, (i5 & 2) != 0 ? false : z12, (i5 & 4) != 0 ? true : z13, (i5 & 8) != 0 ? 10485760L : j11);
    }
}
