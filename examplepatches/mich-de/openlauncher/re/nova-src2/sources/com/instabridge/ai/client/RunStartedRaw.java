package com.instabridge.ai.client;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J+\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/client/RunStartedRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "threadId", "runId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getType", "()Ljava/lang/String;", "getThreadId", "getRunId", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class RunStartedRaw {

    @Nullable
    private final String runId;

    @Nullable
    private final String threadId;

    @NotNull
    private final String type;

    public RunStartedRaw(@NotNull String type, @o(name = "threadId") @Nullable String str, @o(name = "runId") @Nullable String str2) {
        Intrinsics.g(type, "type");
        this.type = type;
        this.threadId = str;
        this.runId = str2;
    }

    public static /* synthetic */ RunStartedRaw copy$default(RunStartedRaw runStartedRaw, String str, String str2, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = runStartedRaw.type;
        }
        if ((i5 & 2) != 0) {
            str2 = runStartedRaw.threadId;
        }
        if ((i5 & 4) != 0) {
            str3 = runStartedRaw.runId;
        }
        return runStartedRaw.copy(str, str2, str3);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getThreadId() {
        return this.threadId;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getRunId() {
        return this.runId;
    }

    @NotNull
    public final RunStartedRaw copy(@NotNull String type, @o(name = "threadId") @Nullable String threadId, @o(name = "runId") @Nullable String runId) {
        Intrinsics.g(type, "type");
        return new RunStartedRaw(type, threadId, runId);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RunStartedRaw)) {
            return false;
        }
        RunStartedRaw runStartedRaw = (RunStartedRaw) other;
        return Intrinsics.b(this.type, runStartedRaw.type) && Intrinsics.b(this.threadId, runStartedRaw.threadId) && Intrinsics.b(this.runId, runStartedRaw.runId);
    }

    @Nullable
    public final String getRunId() {
        return this.runId;
    }

    @Nullable
    public final String getThreadId() {
        return this.threadId;
    }

    @NotNull
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        int iHashCode = this.type.hashCode() * 31;
        String str = this.threadId;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.runId;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("RunStartedRaw(type=");
        sb2.append(this.type);
        sb2.append(", threadId=");
        sb2.append(this.threadId);
        sb2.append(", runId=");
        return c1.t(sb2, this.runId, ')');
    }
}
