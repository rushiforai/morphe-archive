package com.instabridge.ai.protocol;

import a2.c;
import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import x8.h;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010$\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0011\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B;\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\u0014\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\b\b\u0003\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u0017\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006HÆ\u0003J\t\u0010\u0015\u001a\u00020\bHÆ\u0003J?\u0010\u0016\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00062\b\b\u0003\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0017\u001a\u00020\b2\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u001f\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/protocol/PendingToolCall;", b.f42142b, "callId", b.f42142b, "toolName", "arguments", b.f42142b, "userInitiated", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Z)V", "getCallId", "()Ljava/lang/String;", "getToolName", "getArguments", "()Ljava/util/Map;", "getUserInitiated", "()Z", "component1", "component2", "component3", "component4", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class PendingToolCall {
    public static final int $stable = 8;

    @NotNull
    private final Map<String, Object> arguments;

    @NotNull
    private final String callId;

    @NotNull
    private final String toolName;
    private final boolean userInitiated;

    public PendingToolCall(@o(name = "call_id") @NotNull String callId, @o(name = "tool_name") @NotNull String toolName, @NotNull Map<String, ? extends Object> arguments, @o(name = "user_initiated") boolean z11) {
        Intrinsics.g(callId, "callId");
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(arguments, "arguments");
        this.callId = callId;
        this.toolName = toolName;
        this.arguments = arguments;
        this.userInitiated = z11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PendingToolCall copy$default(PendingToolCall pendingToolCall, String str, String str2, Map map, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = pendingToolCall.callId;
        }
        if ((i5 & 2) != 0) {
            str2 = pendingToolCall.toolName;
        }
        if ((i5 & 4) != 0) {
            map = pendingToolCall.arguments;
        }
        if ((i5 & 8) != 0) {
            z11 = pendingToolCall.userInitiated;
        }
        return pendingToolCall.copy(str, str2, map, z11);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getCallId() {
        return this.callId;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getToolName() {
        return this.toolName;
    }

    @NotNull
    public final Map<String, Object> component3() {
        return this.arguments;
    }

    /* renamed from: component4, reason: from getter */
    public final boolean getUserInitiated() {
        return this.userInitiated;
    }

    @NotNull
    public final PendingToolCall copy(@o(name = "call_id") @NotNull String callId, @o(name = "tool_name") @NotNull String toolName, @NotNull Map<String, ? extends Object> arguments, @o(name = "user_initiated") boolean userInitiated) {
        Intrinsics.g(callId, "callId");
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(arguments, "arguments");
        return new PendingToolCall(callId, toolName, arguments, userInitiated);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PendingToolCall)) {
            return false;
        }
        PendingToolCall pendingToolCall = (PendingToolCall) other;
        return Intrinsics.b(this.callId, pendingToolCall.callId) && Intrinsics.b(this.toolName, pendingToolCall.toolName) && Intrinsics.b(this.arguments, pendingToolCall.arguments) && this.userInitiated == pendingToolCall.userInitiated;
    }

    @NotNull
    public final Map<String, Object> getArguments() {
        return this.arguments;
    }

    @NotNull
    public final String getCallId() {
        return this.callId;
    }

    @NotNull
    public final String getToolName() {
        return this.toolName;
    }

    public final boolean getUserInitiated() {
        return this.userInitiated;
    }

    public int hashCode() {
        return Boolean.hashCode(this.userInitiated) + h.c(this.arguments, c0.e(this.callId.hashCode() * 31, 31, this.toolName), 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("PendingToolCall(callId=");
        sb2.append(this.callId);
        sb2.append(", toolName=");
        sb2.append(this.toolName);
        sb2.append(", arguments=");
        sb2.append(this.arguments);
        sb2.append(", userInitiated=");
        return c.p(sb2, this.userInitiated, ')');
    }

    public /* synthetic */ PendingToolCall(String str, String str2, Map map, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, map, (i5 & 8) != 0 ? false : z11);
    }
}
