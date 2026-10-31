package com.instabridge.ai.client;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/instabridge/ai/client/StateSnapshotRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "snapshot", "Lcom/instabridge/ai/client/SnapshotData;", "<init>", "(Ljava/lang/String;Lcom/instabridge/ai/client/SnapshotData;)V", "getType", "()Ljava/lang/String;", "getSnapshot", "()Lcom/instabridge/ai/client/SnapshotData;", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class StateSnapshotRaw {

    @Nullable
    private final SnapshotData snapshot;

    @NotNull
    private final String type;

    public StateSnapshotRaw(@NotNull String type, @Nullable SnapshotData snapshotData) {
        Intrinsics.g(type, "type");
        this.type = type;
        this.snapshot = snapshotData;
    }

    public static /* synthetic */ StateSnapshotRaw copy$default(StateSnapshotRaw stateSnapshotRaw, String str, SnapshotData snapshotData, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = stateSnapshotRaw.type;
        }
        if ((i5 & 2) != 0) {
            snapshotData = stateSnapshotRaw.snapshot;
        }
        return stateSnapshotRaw.copy(str, snapshotData);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final SnapshotData getSnapshot() {
        return this.snapshot;
    }

    @NotNull
    public final StateSnapshotRaw copy(@NotNull String type, @Nullable SnapshotData snapshot) {
        Intrinsics.g(type, "type");
        return new StateSnapshotRaw(type, snapshot);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof StateSnapshotRaw)) {
            return false;
        }
        StateSnapshotRaw stateSnapshotRaw = (StateSnapshotRaw) other;
        return Intrinsics.b(this.type, stateSnapshotRaw.type) && Intrinsics.b(this.snapshot, stateSnapshotRaw.snapshot);
    }

    @Nullable
    public final SnapshotData getSnapshot() {
        return this.snapshot;
    }

    @NotNull
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        int iHashCode = this.type.hashCode() * 31;
        SnapshotData snapshotData = this.snapshot;
        return iHashCode + (snapshotData == null ? 0 : snapshotData.hashCode());
    }

    @NotNull
    public String toString() {
        return "StateSnapshotRaw(type=" + this.type + ", snapshot=" + this.snapshot + ')';
    }
}
