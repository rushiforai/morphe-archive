package com.instabridge.ai.tools;

import aq.o;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010 \n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0081\b\u0018\u00002\u00020\u0001B+\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\u000e\b\u0001\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00030\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00030\u0007HÆ\u0003J-\u0010\u0013\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00052\u000e\b\u0003\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00030\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00030\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/tools/ToolRegistrationResponse;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sessionId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "registeredCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolIds", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;ILjava/util/List;)V", "getSessionId", "()Ljava/lang/String;", "getRegisteredCount", "()I", "getToolIds", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ToolRegistrationResponse {
    public static final int $stable = 8;
    private final int registeredCount;

    @NotNull
    private final String sessionId;

    @NotNull
    private final List<String> toolIds;

    public ToolRegistrationResponse(@o(name = SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID) @NotNull String sessionId, @o(name = "registered_count") int i5, @o(name = SharedPreferencesToolRegistrationStateStore.KEY_TOOL_IDS) @NotNull List<String> toolIds) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(toolIds, "toolIds");
        this.sessionId = sessionId;
        this.registeredCount = i5;
        this.toolIds = toolIds;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ToolRegistrationResponse copy$default(ToolRegistrationResponse toolRegistrationResponse, String str, int i5, List list, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = toolRegistrationResponse.sessionId;
        }
        if ((i11 & 2) != 0) {
            i5 = toolRegistrationResponse.registeredCount;
        }
        if ((i11 & 4) != 0) {
            list = toolRegistrationResponse.toolIds;
        }
        return toolRegistrationResponse.copy(str, i5, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getSessionId() {
        return this.sessionId;
    }

    /* renamed from: component2, reason: from getter */
    public final int getRegisteredCount() {
        return this.registeredCount;
    }

    @NotNull
    public final List<String> component3() {
        return this.toolIds;
    }

    @NotNull
    public final ToolRegistrationResponse copy(@o(name = SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID) @NotNull String sessionId, @o(name = "registered_count") int registeredCount, @o(name = SharedPreferencesToolRegistrationStateStore.KEY_TOOL_IDS) @NotNull List<String> toolIds) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(toolIds, "toolIds");
        return new ToolRegistrationResponse(sessionId, registeredCount, toolIds);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolRegistrationResponse)) {
            return false;
        }
        ToolRegistrationResponse toolRegistrationResponse = (ToolRegistrationResponse) other;
        return Intrinsics.b(this.sessionId, toolRegistrationResponse.sessionId) && this.registeredCount == toolRegistrationResponse.registeredCount && Intrinsics.b(this.toolIds, toolRegistrationResponse.toolIds);
    }

    public final int getRegisteredCount() {
        return this.registeredCount;
    }

    @NotNull
    public final String getSessionId() {
        return this.sessionId;
    }

    @NotNull
    public final List<String> getToolIds() {
        return this.toolIds;
    }

    public int hashCode() {
        return this.toolIds.hashCode() + u4.a(this.registeredCount, this.sessionId.hashCode() * 31, 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ToolRegistrationResponse(sessionId=");
        sb2.append(this.sessionId);
        sb2.append(", registeredCount=");
        sb2.append(this.registeredCount);
        sb2.append(", toolIds=");
        return fq.c.e(sb2, this.toolIds, ')');
    }
}
