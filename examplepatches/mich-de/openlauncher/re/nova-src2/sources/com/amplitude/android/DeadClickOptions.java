package com.amplitude.android;

import a2.c;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\u00032\b\u0010\n\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000b\u001a\u00020\fHÖ\u0001J\t\u0010\r\u001a\u00020\u000eHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u000f"}, d2 = {"Lcom/amplitude/android/DeadClickOptions;", b.f42142b, "enabled", b.f42142b, "(Z)V", "getEnabled", "()Z", "component1", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class DeadClickOptions {
    private final boolean enabled;

    public DeadClickOptions() {
        this(false, 1, null);
    }

    public static /* synthetic */ DeadClickOptions copy$default(DeadClickOptions deadClickOptions, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = deadClickOptions.enabled;
        }
        return deadClickOptions.copy(z11);
    }

    /* renamed from: component1, reason: from getter */
    public final boolean getEnabled() {
        return this.enabled;
    }

    @NotNull
    public final DeadClickOptions copy(boolean enabled) {
        return new DeadClickOptions(enabled);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof DeadClickOptions) && this.enabled == ((DeadClickOptions) other).enabled;
    }

    public final boolean getEnabled() {
        return this.enabled;
    }

    public int hashCode() {
        return Boolean.hashCode(this.enabled);
    }

    @NotNull
    public String toString() {
        return c.p(new StringBuilder("DeadClickOptions(enabled="), this.enabled, ')');
    }

    public DeadClickOptions(boolean z11) {
        this.enabled = z11;
    }

    public /* synthetic */ DeadClickOptions(boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? true : z11);
    }
}
