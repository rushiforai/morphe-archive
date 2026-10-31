package com.instabridge.ai.client;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.protocol.PendingToolCall;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001BI\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0010\u0010\u0004\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0010\b\u0001\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0005\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\u000b\u0010\fJ\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0013\u0010\u0016\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0011\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\nHÆ\u0003JS\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u0012\b\u0002\u0010\u0004\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\u0010\b\u0003\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\nHÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001e\u001a\u00020\u001fHÖ\u0001J\t\u0010 \u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u001b\u0010\u0004\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000eR\u0019\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0010R\u0013\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006!"}, d2 = {"Lcom/instabridge/ai/client/SnapshotData;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "title", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "suggestions", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "status", "pendingToolCalls", "Lcom/instabridge/ai/protocol/PendingToolCall;", "progress", "Lcom/instabridge/ai/client/ProgressRaw;", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lcom/instabridge/ai/client/ProgressRaw;)V", "getTitle", "()Ljava/lang/String;", "getSuggestions", "()Ljava/util/List;", "getStatus", "getPendingToolCalls", "getProgress", "()Lcom/instabridge/ai/client/ProgressRaw;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class SnapshotData {

    @Nullable
    private final List<PendingToolCall> pendingToolCalls;

    @Nullable
    private final ProgressRaw progress;

    @Nullable
    private final String status;

    @Nullable
    private final List<Object> suggestions;

    @Nullable
    private final String title;

    public SnapshotData(@Nullable String str, @Nullable List<? extends Object> list, @Nullable String str2, @o(name = "pending_tool_calls") @Nullable List<PendingToolCall> list2, @Nullable ProgressRaw progressRaw) {
        this.title = str;
        this.suggestions = list;
        this.status = str2;
        this.pendingToolCalls = list2;
        this.progress = progressRaw;
    }

    public static /* synthetic */ SnapshotData copy$default(SnapshotData snapshotData, String str, List list, String str2, List list2, ProgressRaw progressRaw, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = snapshotData.title;
        }
        if ((i5 & 2) != 0) {
            list = snapshotData.suggestions;
        }
        if ((i5 & 4) != 0) {
            str2 = snapshotData.status;
        }
        if ((i5 & 8) != 0) {
            list2 = snapshotData.pendingToolCalls;
        }
        if ((i5 & 16) != 0) {
            progressRaw = snapshotData.progress;
        }
        ProgressRaw progressRaw2 = progressRaw;
        String str3 = str2;
        return snapshotData.copy(str, list, str3, list2, progressRaw2);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    @Nullable
    public final List<Object> component2() {
        return this.suggestions;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getStatus() {
        return this.status;
    }

    @Nullable
    public final List<PendingToolCall> component4() {
        return this.pendingToolCalls;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final ProgressRaw getProgress() {
        return this.progress;
    }

    @NotNull
    public final SnapshotData copy(@Nullable String title, @Nullable List<? extends Object> suggestions, @Nullable String status, @o(name = "pending_tool_calls") @Nullable List<PendingToolCall> pendingToolCalls, @Nullable ProgressRaw progress) {
        return new SnapshotData(title, suggestions, status, pendingToolCalls, progress);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SnapshotData)) {
            return false;
        }
        SnapshotData snapshotData = (SnapshotData) other;
        return Intrinsics.b(this.title, snapshotData.title) && Intrinsics.b(this.suggestions, snapshotData.suggestions) && Intrinsics.b(this.status, snapshotData.status) && Intrinsics.b(this.pendingToolCalls, snapshotData.pendingToolCalls) && Intrinsics.b(this.progress, snapshotData.progress);
    }

    @Nullable
    public final List<PendingToolCall> getPendingToolCalls() {
        return this.pendingToolCalls;
    }

    @Nullable
    public final ProgressRaw getProgress() {
        return this.progress;
    }

    @Nullable
    public final String getStatus() {
        return this.status;
    }

    @Nullable
    public final List<Object> getSuggestions() {
        return this.suggestions;
    }

    @Nullable
    public final String getTitle() {
        return this.title;
    }

    public int hashCode() {
        String str = this.title;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        List<Object> list = this.suggestions;
        int iHashCode2 = (iHashCode + (list == null ? 0 : list.hashCode())) * 31;
        String str2 = this.status;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        List<PendingToolCall> list2 = this.pendingToolCalls;
        int iHashCode4 = (iHashCode3 + (list2 == null ? 0 : list2.hashCode())) * 31;
        ProgressRaw progressRaw = this.progress;
        return iHashCode4 + (progressRaw != null ? progressRaw.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "SnapshotData(title=" + this.title + ", suggestions=" + this.suggestions + ", status=" + this.status + ", pendingToolCalls=" + this.pendingToolCalls + ", progress=" + this.progress + ')';
    }
}
