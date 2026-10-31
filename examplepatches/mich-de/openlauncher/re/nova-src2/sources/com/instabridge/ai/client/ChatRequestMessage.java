package com.instabridge.ai.client;

import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J5\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/client/ChatRequestMessage;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "role", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "content", "toolCallId", PendingUpgradeStore.KEY_NAME, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getRole", "()Ljava/lang/String;", "getContent", "getToolCallId", "getName", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ChatRequestMessage {

    @NotNull
    private final String content;

    @Nullable
    private final String name;

    @NotNull
    private final String role;

    @Nullable
    private final String toolCallId;

    public ChatRequestMessage(@NotNull String role, @NotNull String content, @o(name = "tool_call_id") @Nullable String str, @Nullable String str2) {
        Intrinsics.g(role, "role");
        Intrinsics.g(content, "content");
        this.role = role;
        this.content = content;
        this.toolCallId = str;
        this.name = str2;
    }

    public static /* synthetic */ ChatRequestMessage copy$default(ChatRequestMessage chatRequestMessage, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = chatRequestMessage.role;
        }
        if ((i5 & 2) != 0) {
            str2 = chatRequestMessage.content;
        }
        if ((i5 & 4) != 0) {
            str3 = chatRequestMessage.toolCallId;
        }
        if ((i5 & 8) != 0) {
            str4 = chatRequestMessage.name;
        }
        return chatRequestMessage.copy(str, str2, str3, str4);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getRole() {
        return this.role;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getContent() {
        return this.content;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final ChatRequestMessage copy(@NotNull String role, @NotNull String content, @o(name = "tool_call_id") @Nullable String toolCallId, @Nullable String name) {
        Intrinsics.g(role, "role");
        Intrinsics.g(content, "content");
        return new ChatRequestMessage(role, content, toolCallId, name);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ChatRequestMessage)) {
            return false;
        }
        ChatRequestMessage chatRequestMessage = (ChatRequestMessage) other;
        return Intrinsics.b(this.role, chatRequestMessage.role) && Intrinsics.b(this.content, chatRequestMessage.content) && Intrinsics.b(this.toolCallId, chatRequestMessage.toolCallId) && Intrinsics.b(this.name, chatRequestMessage.name);
    }

    @NotNull
    public final String getContent() {
        return this.content;
    }

    @Nullable
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final String getRole() {
        return this.role;
    }

    @Nullable
    public final String getToolCallId() {
        return this.toolCallId;
    }

    public int hashCode() {
        int iE = c0.e(this.role.hashCode() * 31, 31, this.content);
        String str = this.toolCallId;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.name;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ChatRequestMessage(role=");
        sb2.append(this.role);
        sb2.append(", content=");
        sb2.append(this.content);
        sb2.append(", toolCallId=");
        sb2.append(this.toolCallId);
        sb2.append(", name=");
        return c1.t(sb2, this.name, ')');
    }

    public /* synthetic */ ChatRequestMessage(String str, String str2, String str3, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : str4);
    }
}
