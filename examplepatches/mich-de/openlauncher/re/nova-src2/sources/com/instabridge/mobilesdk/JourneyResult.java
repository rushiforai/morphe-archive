package com.instabridge.mobilesdk;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/JourneyResult;", b.f42142b, "state", "Lcom/instabridge/mobilesdk/JourneyState;", "claimedProvider", "Lcom/instabridge/mobilesdk/ClaimedProvider;", "<init>", "(Lcom/instabridge/mobilesdk/JourneyState;Lcom/instabridge/mobilesdk/ClaimedProvider;)V", "getState", "()Lcom/instabridge/mobilesdk/JourneyState;", "getClaimedProvider", "()Lcom/instabridge/mobilesdk/ClaimedProvider;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class JourneyResult {
    public static final int $stable = 0;

    @Nullable
    private final ClaimedProvider claimedProvider;

    @NotNull
    private final JourneyState state;

    public JourneyResult(@NotNull JourneyState state, @Nullable ClaimedProvider claimedProvider) {
        Intrinsics.g(state, "state");
        this.state = state;
        this.claimedProvider = claimedProvider;
    }

    public static /* synthetic */ JourneyResult copy$default(JourneyResult journeyResult, JourneyState journeyState, ClaimedProvider claimedProvider, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            journeyState = journeyResult.state;
        }
        if ((i5 & 2) != 0) {
            claimedProvider = journeyResult.claimedProvider;
        }
        return journeyResult.copy(journeyState, claimedProvider);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final JourneyState getState() {
        return this.state;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final ClaimedProvider getClaimedProvider() {
        return this.claimedProvider;
    }

    @NotNull
    public final JourneyResult copy(@NotNull JourneyState state, @Nullable ClaimedProvider claimedProvider) {
        Intrinsics.g(state, "state");
        return new JourneyResult(state, claimedProvider);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof JourneyResult)) {
            return false;
        }
        JourneyResult journeyResult = (JourneyResult) other;
        return this.state == journeyResult.state && Intrinsics.b(this.claimedProvider, journeyResult.claimedProvider);
    }

    @Nullable
    public final ClaimedProvider getClaimedProvider() {
        return this.claimedProvider;
    }

    @NotNull
    public final JourneyState getState() {
        return this.state;
    }

    public int hashCode() {
        int iHashCode = this.state.hashCode() * 31;
        ClaimedProvider claimedProvider = this.claimedProvider;
        return iHashCode + (claimedProvider == null ? 0 : claimedProvider.hashCode());
    }

    @NotNull
    public String toString() {
        return "JourneyResult(state=" + this.state + ", claimedProvider=" + this.claimedProvider + ")";
    }

    public /* synthetic */ JourneyResult(JourneyState journeyState, ClaimedProvider claimedProvider, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(journeyState, (i5 & 2) != 0 ? null : claimedProvider);
    }
}
