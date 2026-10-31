package com.instabridge.ai.client;

import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J1\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/client/ToolResultMessage;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "role", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolCallId", PendingUpgradeStore.KEY_NAME, "content", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getRole", "()Ljava/lang/String;", "getToolCallId", "getName", "getContent", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ToolResultMessage {

    @NotNull
    private final String content;

    @NotNull
    private final String name;

    @NotNull
    private final String role;

    @NotNull
    private final String toolCallId;

    public ToolResultMessage(@NotNull String role, @o(name = "tool_call_id") @NotNull String toolCallId, @NotNull String name, @NotNull String content) {
        Intrinsics.g(role, "role");
        Intrinsics.g(toolCallId, "toolCallId");
        Intrinsics.g(name, "name");
        Intrinsics.g(content, "content");
        this.role = role;
        this.toolCallId = toolCallId;
        this.name = name;
        this.content = content;
    }

    public static /* synthetic */ ToolResultMessage copy$default(ToolResultMessage toolResultMessage, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = toolResultMessage.role;
        }
        if ((i5 & 2) != 0) {
            str2 = toolResultMessage.toolCallId;
        }
        if ((i5 & 4) != 0) {
            str3 = toolResultMessage.name;
        }
        if ((i5 & 8) != 0) {
            str4 = toolResultMessage.content;
        }
        return toolResultMessage.copy(str, str2, str3, str4);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getRole() {
        return this.role;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getContent() {
        return this.content;
    }

    @NotNull
    public final ToolResultMessage copy(@NotNull String role, @o(name = "tool_call_id") @NotNull String toolCallId, @NotNull String name, @NotNull String content) {
        Intrinsics.g(role, "role");
        Intrinsics.g(toolCallId, "toolCallId");
        Intrinsics.g(name, "name");
        Intrinsics.g(content, "content");
        return new ToolResultMessage(role, toolCallId, name, content);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolResultMessage)) {
            return false;
        }
        ToolResultMessage toolResultMessage = (ToolResultMessage) other;
        return Intrinsics.b(this.role, toolResultMessage.role) && Intrinsics.b(this.toolCallId, toolResultMessage.toolCallId) && Intrinsics.b(this.name, toolResultMessage.name) && Intrinsics.b(this.content, toolResultMessage.content);
    }

    @NotNull
    public final String getContent() {
        return this.content;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final String getRole() {
        return this.role;
    }

    @NotNull
    public final String getToolCallId() {
        return this.toolCallId;
    }

    public int hashCode() {
        return this.content.hashCode() + c0.e(c0.e(this.role.hashCode() * 31, 31, this.toolCallId), 31, this.name);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ToolResultMessage(role=");
        sb2.append(this.role);
        sb2.append(", toolCallId=");
        sb2.append(this.toolCallId);
        sb2.append(", name=");
        sb2.append(this.name);
        sb2.append(", content=");
        return c1.t(sb2, this.content, ')');
    }
}
