package com.amplitude.android;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0015"}, d2 = {"Lcom/amplitude/android/InteractionsOptions;", b.f42142b, "rageClick", "Lcom/amplitude/android/RageClickOptions;", "deadClick", "Lcom/amplitude/android/DeadClickOptions;", "(Lcom/amplitude/android/RageClickOptions;Lcom/amplitude/android/DeadClickOptions;)V", "getDeadClick", "()Lcom/amplitude/android/DeadClickOptions;", "getRageClick", "()Lcom/amplitude/android/RageClickOptions;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class InteractionsOptions {

    @NotNull
    private final DeadClickOptions deadClick;

    @NotNull
    private final RageClickOptions rageClick;

    /* JADX WARN: Multi-variable type inference failed */
    public InteractionsOptions() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    public static /* synthetic */ InteractionsOptions copy$default(InteractionsOptions interactionsOptions, RageClickOptions rageClickOptions, DeadClickOptions deadClickOptions, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            rageClickOptions = interactionsOptions.rageClick;
        }
        if ((i5 & 2) != 0) {
            deadClickOptions = interactionsOptions.deadClick;
        }
        return interactionsOptions.copy(rageClickOptions, deadClickOptions);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final RageClickOptions getRageClick() {
        return this.rageClick;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final DeadClickOptions getDeadClick() {
        return this.deadClick;
    }

    @NotNull
    public final InteractionsOptions copy(@NotNull RageClickOptions rageClick, @NotNull DeadClickOptions deadClick) {
        Intrinsics.g(rageClick, "rageClick");
        Intrinsics.g(deadClick, "deadClick");
        return new InteractionsOptions(rageClick, deadClick);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof InteractionsOptions)) {
            return false;
        }
        InteractionsOptions interactionsOptions = (InteractionsOptions) other;
        return Intrinsics.b(this.rageClick, interactionsOptions.rageClick) && Intrinsics.b(this.deadClick, interactionsOptions.deadClick);
    }

    @NotNull
    public final DeadClickOptions getDeadClick() {
        return this.deadClick;
    }

    @NotNull
    public final RageClickOptions getRageClick() {
        return this.rageClick;
    }

    public int hashCode() {
        return this.deadClick.hashCode() + (this.rageClick.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        return "InteractionsOptions(rageClick=" + this.rageClick + ", deadClick=" + this.deadClick + ')';
    }

    public InteractionsOptions(@NotNull RageClickOptions rageClick, @NotNull DeadClickOptions deadClick) {
        Intrinsics.g(rageClick, "rageClick");
        Intrinsics.g(deadClick, "deadClick");
        this.rageClick = rageClick;
        this.deadClick = deadClick;
    }

    public /* synthetic */ InteractionsOptions(RageClickOptions rageClickOptions, DeadClickOptions deadClickOptions, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? new RageClickOptions(false, 1, null) : rageClickOptions, (i5 & 2) != 0 ? new DeadClickOptions(false, 1, null) : deadClickOptions);
    }
}
