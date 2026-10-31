package com.amplitude.android.signals;

import com.amplitude.core.platform.Signal;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Date;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lcom/amplitude/android/signals/UiChangeSignal;", "Lcom/amplitude/core/platform/Signal;", "timestamp", "Ljava/util/Date;", "(Ljava/util/Date;)V", "getTimestamp", "()Ljava/util/Date;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class UiChangeSignal implements Signal {

    @NotNull
    private final Date timestamp;

    public UiChangeSignal(@NotNull Date timestamp) {
        Intrinsics.g(timestamp, "timestamp");
        this.timestamp = timestamp;
    }

    public static /* synthetic */ UiChangeSignal copy$default(UiChangeSignal uiChangeSignal, Date date, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            date = uiChangeSignal.timestamp;
        }
        return uiChangeSignal.copy(date);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final Date getTimestamp() {
        return this.timestamp;
    }

    @NotNull
    public final UiChangeSignal copy(@NotNull Date timestamp) {
        Intrinsics.g(timestamp, "timestamp");
        return new UiChangeSignal(timestamp);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UiChangeSignal) && Intrinsics.b(this.timestamp, ((UiChangeSignal) other).timestamp);
    }

    @NotNull
    public final Date getTimestamp() {
        return this.timestamp;
    }

    public int hashCode() {
        return this.timestamp.hashCode();
    }

    @NotNull
    public String toString() {
        return "UiChangeSignal(timestamp=" + this.timestamp + ')';
    }
}
