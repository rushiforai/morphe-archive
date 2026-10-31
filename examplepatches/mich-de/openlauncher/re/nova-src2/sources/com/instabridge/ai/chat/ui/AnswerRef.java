package com.instabridge.ai.chat.ui;

import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0017"}, d2 = {"Lcom/instabridge/ai/chat/ui/AnswerRef;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "conversationId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "messageIndex", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "text", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getConversationId", "()Ljava/lang/String;", "getMessageIndex", "()I", "getText", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class AnswerRef {
    public static final int $stable = 0;

    @NotNull
    private final String conversationId;
    private final int messageIndex;

    @NotNull
    private final String text;

    public AnswerRef(@NotNull String conversationId, int i5, @NotNull String text) {
        Intrinsics.g(conversationId, "conversationId");
        Intrinsics.g(text, "text");
        this.conversationId = conversationId;
        this.messageIndex = i5;
        this.text = text;
    }

    public static /* synthetic */ AnswerRef copy$default(AnswerRef answerRef, String str, int i5, String str2, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = answerRef.conversationId;
        }
        if ((i11 & 2) != 0) {
            i5 = answerRef.messageIndex;
        }
        if ((i11 & 4) != 0) {
            str2 = answerRef.text;
        }
        return answerRef.copy(str, i5, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getConversationId() {
        return this.conversationId;
    }

    /* renamed from: component2, reason: from getter */
    public final int getMessageIndex() {
        return this.messageIndex;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getText() {
        return this.text;
    }

    @NotNull
    public final AnswerRef copy(@NotNull String conversationId, int messageIndex, @NotNull String text) {
        Intrinsics.g(conversationId, "conversationId");
        Intrinsics.g(text, "text");
        return new AnswerRef(conversationId, messageIndex, text);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AnswerRef)) {
            return false;
        }
        AnswerRef answerRef = (AnswerRef) other;
        return Intrinsics.b(this.conversationId, answerRef.conversationId) && this.messageIndex == answerRef.messageIndex && Intrinsics.b(this.text, answerRef.text);
    }

    @NotNull
    public final String getConversationId() {
        return this.conversationId;
    }

    public final int getMessageIndex() {
        return this.messageIndex;
    }

    @NotNull
    public final String getText() {
        return this.text;
    }

    public int hashCode() {
        return this.text.hashCode() + u4.a(this.messageIndex, this.conversationId.hashCode() * 31, 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AnswerRef(conversationId=");
        sb2.append(this.conversationId);
        sb2.append(", messageIndex=");
        sb2.append(this.messageIndex);
        sb2.append(", text=");
        return c1.t(sb2, this.text, ')');
    }
}
