package com.amplitude.android.sessionreplay.config;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003¢\u0006\u0002\u0010\u0005J\t\u0010\t\u001a\u00020\u0003HÆ\u0003J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\u000b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/RecordLogOptions;", b.f42142b, "logCountThreshold", b.f42142b, "maxMessageLength", "(II)V", "getLogCountThreshold", "()I", "getMaxMessageLength", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class RecordLogOptions {
    private final int logCountThreshold;
    private final int maxMessageLength;

    /* JADX WARN: Illegal instructions before constructor call */
    public RecordLogOptions() {
        int i5 = 0;
        this(i5, i5, 3, null);
    }

    public static /* synthetic */ RecordLogOptions copy$default(RecordLogOptions recordLogOptions, int i5, int i11, int i12, Object obj) {
        if ((i12 & 1) != 0) {
            i5 = recordLogOptions.logCountThreshold;
        }
        if ((i12 & 2) != 0) {
            i11 = recordLogOptions.maxMessageLength;
        }
        return recordLogOptions.copy(i5, i11);
    }

    /* renamed from: component1, reason: from getter */
    public final int getLogCountThreshold() {
        return this.logCountThreshold;
    }

    /* renamed from: component2, reason: from getter */
    public final int getMaxMessageLength() {
        return this.maxMessageLength;
    }

    public final RecordLogOptions copy(int logCountThreshold, int maxMessageLength) {
        return new RecordLogOptions(logCountThreshold, maxMessageLength);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RecordLogOptions)) {
            return false;
        }
        RecordLogOptions recordLogOptions = (RecordLogOptions) other;
        return this.logCountThreshold == recordLogOptions.logCountThreshold && this.maxMessageLength == recordLogOptions.maxMessageLength;
    }

    public final int getLogCountThreshold() {
        return this.logCountThreshold;
    }

    public final int getMaxMessageLength() {
        return this.maxMessageLength;
    }

    public int hashCode() {
        return Integer.hashCode(this.maxMessageLength) + (Integer.hashCode(this.logCountThreshold) * 31);
    }

    public String toString() {
        return c1.n(this.logCountThreshold, "RecordLogOptions(logCountThreshold=", ", maxMessageLength=", this.maxMessageLength, ")");
    }

    public RecordLogOptions(int i5, int i11) {
        this.logCountThreshold = i5;
        this.maxMessageLength = i11;
    }

    public /* synthetic */ RecordLogOptions(int i5, int i11, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this((i12 & 1) != 0 ? 1000 : i5, (i12 & 2) != 0 ? 2000 : i11);
    }
}
