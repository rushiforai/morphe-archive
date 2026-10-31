package com.instabridge.ai.chat.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fq.c;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J/\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/chat/model/ConversationDetail;", b.f42142b, "id", b.f42142b, "title", "messages", b.f42142b, "Lcom/instabridge/ai/chat/model/ChatMessage;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "getId", "()Ljava/lang/String;", "getTitle", "getMessages", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ConversationDetail {
    public static final int $stable = 8;

    @NotNull
    private final String id;

    @NotNull
    private final List<ChatMessage> messages;

    @Nullable
    private final String title;

    public ConversationDetail(@NotNull String id2, @Nullable String str, @NotNull List<ChatMessage> messages) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(messages, "messages");
        this.id = id2;
        this.title = str;
        this.messages = messages;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ConversationDetail copy$default(ConversationDetail conversationDetail, String str, String str2, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = conversationDetail.id;
        }
        if ((i5 & 2) != 0) {
            str2 = conversationDetail.title;
        }
        if ((i5 & 4) != 0) {
            list = conversationDetail.messages;
        }
        return conversationDetail.copy(str, str2, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    @NotNull
    public final List<ChatMessage> component3() {
        return this.messages;
    }

    @NotNull
    public final ConversationDetail copy(@NotNull String id2, @Nullable String title, @NotNull List<ChatMessage> messages) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(messages, "messages");
        return new ConversationDetail(id2, title, messages);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ConversationDetail)) {
            return false;
        }
        ConversationDetail conversationDetail = (ConversationDetail) other;
        return Intrinsics.b(this.id, conversationDetail.id) && Intrinsics.b(this.title, conversationDetail.title) && Intrinsics.b(this.messages, conversationDetail.messages);
    }

    @NotNull
    public final String getId() {
        return this.id;
    }

    @NotNull
    public final List<ChatMessage> getMessages() {
        return this.messages;
    }

    @Nullable
    public final String getTitle() {
        return this.title;
    }

    public int hashCode() {
        int iHashCode = this.id.hashCode() * 31;
        String str = this.title;
        return this.messages.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ConversationDetail(id=");
        sb2.append(this.id);
        sb2.append(", title=");
        sb2.append(this.title);
        sb2.append(", messages=");
        return c.e(sb2, this.messages, ')');
    }
}
