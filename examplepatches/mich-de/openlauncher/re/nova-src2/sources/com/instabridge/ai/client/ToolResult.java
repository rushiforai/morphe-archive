package com.instabridge.ai.client;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J'\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/client/ToolResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolCallId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolName", "resultJson", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getToolCallId", "()Ljava/lang/String;", "getToolName", "getResultJson", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ToolResult {
    public static final int $stable = 0;

    @NotNull
    private final String resultJson;

    @NotNull
    private final String toolCallId;

    @NotNull
    private final String toolName;

    public ToolResult(@NotNull String toolCallId, @NotNull String toolName, @NotNull String resultJson) {
        Intrinsics.g(toolCallId, "toolCallId");
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(resultJson, "resultJson");
        this.toolCallId = toolCallId;
        this.toolName = toolName;
        this.resultJson = resultJson;
    }

    public static /* synthetic */ ToolResult copy$default(ToolResult toolResult, String str, String str2, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = toolResult.toolCallId;
        }
        if ((i5 & 2) != 0) {
            str2 = toolResult.toolName;
        }
        if ((i5 & 4) != 0) {
            str3 = toolResult.resultJson;
        }
        return toolResult.copy(str, str2, str3);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getToolName() {
        return this.toolName;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getResultJson() {
        return this.resultJson;
    }

    @NotNull
    public final ToolResult copy(@NotNull String toolCallId, @NotNull String toolName, @NotNull String resultJson) {
        Intrinsics.g(toolCallId, "toolCallId");
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(resultJson, "resultJson");
        return new ToolResult(toolCallId, toolName, resultJson);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolResult)) {
            return false;
        }
        ToolResult toolResult = (ToolResult) other;
        return Intrinsics.b(this.toolCallId, toolResult.toolCallId) && Intrinsics.b(this.toolName, toolResult.toolName) && Intrinsics.b(this.resultJson, toolResult.resultJson);
    }

    @NotNull
    public final String getResultJson() {
        return this.resultJson;
    }

    @NotNull
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @NotNull
    public final String getToolName() {
        return this.toolName;
    }

    public int hashCode() {
        return this.resultJson.hashCode() + c0.e(this.toolCallId.hashCode() * 31, 31, this.toolName);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ToolResult(toolCallId=");
        sb2.append(this.toolCallId);
        sb2.append(", toolName=");
        sb2.append(this.toolName);
        sb2.append(", resultJson=");
        return c1.t(sb2, this.resultJson, ')');
    }
}
