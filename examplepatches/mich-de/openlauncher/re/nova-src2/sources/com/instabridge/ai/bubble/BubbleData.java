package com.instabridge.ai.bubble;

import a2.c;
import aq.o;
import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0016\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BG\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\f¢\u0006\u0004\b\r\u0010\u000eJ\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\nHÆ\u0003J\t\u0010\u001e\u001a\u00020\fHÆ\u0003JM\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\fHÆ\u0001J\u0013\u0010 \u001a\u00020\f2\b\u0010!\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\"\u001a\u00020#HÖ\u0001J\t\u0010$\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010R\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0010R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u000b\u001a\u00020\f¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018¨\u0006%"}, d2 = {"Lcom/instabridge/ai/bubble/BubbleData;", b.f42142b, "text", b.f42142b, "topic", "actions", b.f42142b, "Lcom/instabridge/ai/bubble/BubbleAction;", "chatPrompt", "fetchedAt", b.f42142b, "wasInteractedWith", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;JZ)V", "getText", "()Ljava/lang/String;", "getTopic", "getActions", "()Ljava/util/List;", "getChatPrompt", "getFetchedAt", "()J", "getWasInteractedWith", "()Z", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class BubbleData {
    public static final int $stable = 8;

    @NotNull
    private final List<BubbleAction> actions;

    @Nullable
    private final String chatPrompt;
    private final long fetchedAt;

    @NotNull
    private final String text;

    @NotNull
    private final String topic;
    private final transient boolean wasInteractedWith;

    public BubbleData(@NotNull String text, @NotNull String topic, @NotNull List<BubbleAction> actions, @o(name = "chat_prompt") @Nullable String str, long j11, boolean z11) {
        Intrinsics.g(text, "text");
        Intrinsics.g(topic, "topic");
        Intrinsics.g(actions, "actions");
        this.text = text;
        this.topic = topic;
        this.actions = actions;
        this.chatPrompt = str;
        this.fetchedAt = j11;
        this.wasInteractedWith = z11;
    }

    public static /* synthetic */ BubbleData copy$default(BubbleData bubbleData, String str, String str2, List list, String str3, long j11, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = bubbleData.text;
        }
        if ((i5 & 2) != 0) {
            str2 = bubbleData.topic;
        }
        if ((i5 & 4) != 0) {
            list = bubbleData.actions;
        }
        if ((i5 & 8) != 0) {
            str3 = bubbleData.chatPrompt;
        }
        if ((i5 & 16) != 0) {
            j11 = bubbleData.fetchedAt;
        }
        if ((i5 & 32) != 0) {
            z11 = bubbleData.wasInteractedWith;
        }
        boolean z12 = z11;
        long j12 = j11;
        return bubbleData.copy(str, str2, list, str3, j12, z12);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getText() {
        return this.text;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getTopic() {
        return this.topic;
    }

    @NotNull
    public final List<BubbleAction> component3() {
        return this.actions;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getChatPrompt() {
        return this.chatPrompt;
    }

    /* renamed from: component5, reason: from getter */
    public final long getFetchedAt() {
        return this.fetchedAt;
    }

    /* renamed from: component6, reason: from getter */
    public final boolean getWasInteractedWith() {
        return this.wasInteractedWith;
    }

    @NotNull
    public final BubbleData copy(@NotNull String text, @NotNull String topic, @NotNull List<BubbleAction> actions, @o(name = "chat_prompt") @Nullable String chatPrompt, long fetchedAt, boolean wasInteractedWith) {
        Intrinsics.g(text, "text");
        Intrinsics.g(topic, "topic");
        Intrinsics.g(actions, "actions");
        return new BubbleData(text, topic, actions, chatPrompt, fetchedAt, wasInteractedWith);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BubbleData)) {
            return false;
        }
        BubbleData bubbleData = (BubbleData) other;
        return Intrinsics.b(this.text, bubbleData.text) && Intrinsics.b(this.topic, bubbleData.topic) && Intrinsics.b(this.actions, bubbleData.actions) && Intrinsics.b(this.chatPrompt, bubbleData.chatPrompt) && this.fetchedAt == bubbleData.fetchedAt && this.wasInteractedWith == bubbleData.wasInteractedWith;
    }

    @NotNull
    public final List<BubbleAction> getActions() {
        return this.actions;
    }

    @Nullable
    public final String getChatPrompt() {
        return this.chatPrompt;
    }

    public final long getFetchedAt() {
        return this.fetchedAt;
    }

    @NotNull
    public final String getText() {
        return this.text;
    }

    @NotNull
    public final String getTopic() {
        return this.topic;
    }

    public final boolean getWasInteractedWith() {
        return this.wasInteractedWith;
    }

    public int hashCode() {
        int iC = u4.c(c0.e(this.text.hashCode() * 31, 31, this.topic), 31, this.actions);
        String str = this.chatPrompt;
        return Boolean.hashCode(this.wasInteractedWith) + c0.d((iC + (str == null ? 0 : str.hashCode())) * 31, 31, this.fetchedAt);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BubbleData(text=");
        sb2.append(this.text);
        sb2.append(", topic=");
        sb2.append(this.topic);
        sb2.append(", actions=");
        sb2.append(this.actions);
        sb2.append(", chatPrompt=");
        sb2.append(this.chatPrompt);
        sb2.append(", fetchedAt=");
        sb2.append(this.fetchedAt);
        sb2.append(", wasInteractedWith=");
        return c.p(sb2, this.wasInteractedWith, ')');
    }

    public BubbleData(String str, String str2, List list, String str3, long j11, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? EmptyList.f71733a : list, (i5 & 8) != 0 ? null : str3, (i5 & 16) != 0 ? System.currentTimeMillis() : j11, (i5 & 32) != 0 ? false : z11);
    }
}
