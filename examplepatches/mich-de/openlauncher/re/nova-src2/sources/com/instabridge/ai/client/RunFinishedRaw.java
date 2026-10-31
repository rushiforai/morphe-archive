package com.instabridge.ai.client;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.measurement.k2;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0001¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÆ\u0003J7\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0001HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0001¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/client/RunFinishedRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "threadId", "runId", "result", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V", "getType", "()Ljava/lang/String;", "getThreadId", "getRunId", "getResult", "()Ljava/lang/Object;", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class RunFinishedRaw {

    @Nullable
    private final Object result;

    @Nullable
    private final String runId;

    @Nullable
    private final String threadId;

    @NotNull
    private final String type;

    public RunFinishedRaw(@NotNull String type, @o(name = "threadId") @Nullable String str, @o(name = "runId") @Nullable String str2, @Nullable Object obj) {
        Intrinsics.g(type, "type");
        this.type = type;
        this.threadId = str;
        this.runId = str2;
        this.result = obj;
    }

    public static /* synthetic */ RunFinishedRaw copy$default(RunFinishedRaw runFinishedRaw, String str, String str2, String str3, Object obj, int i5, Object obj2) {
        if ((i5 & 1) != 0) {
            str = runFinishedRaw.type;
        }
        if ((i5 & 2) != 0) {
            str2 = runFinishedRaw.threadId;
        }
        if ((i5 & 4) != 0) {
            str3 = runFinishedRaw.runId;
        }
        if ((i5 & 8) != 0) {
            obj = runFinishedRaw.result;
        }
        return runFinishedRaw.copy(str, str2, str3, obj);
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

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Object getResult() {
        return this.result;
    }

    @NotNull
    public final RunFinishedRaw copy(@NotNull String type, @o(name = "threadId") @Nullable String threadId, @o(name = "runId") @Nullable String runId, @Nullable Object result) {
        Intrinsics.g(type, "type");
        return new RunFinishedRaw(type, threadId, runId, result);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RunFinishedRaw)) {
            return false;
        }
        RunFinishedRaw runFinishedRaw = (RunFinishedRaw) other;
        return Intrinsics.b(this.type, runFinishedRaw.type) && Intrinsics.b(this.threadId, runFinishedRaw.threadId) && Intrinsics.b(this.runId, runFinishedRaw.runId) && Intrinsics.b(this.result, runFinishedRaw.result);
    }

    @Nullable
    public final Object getResult() {
        return this.result;
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
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Object obj = this.result;
        return iHashCode3 + (obj != null ? obj.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("RunFinishedRaw(type=");
        sb2.append(this.type);
        sb2.append(", threadId=");
        sb2.append(this.threadId);
        sb2.append(", runId=");
        sb2.append(this.runId);
        sb2.append(", result=");
        return k2.j(sb2, this.result, ')');
    }

    public /* synthetic */ RunFinishedRaw(String str, String str2, String str3, Object obj, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3, (i5 & 8) != 0 ? null : obj);
    }
}
