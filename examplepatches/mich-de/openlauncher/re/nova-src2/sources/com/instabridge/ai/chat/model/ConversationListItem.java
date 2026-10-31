package com.instabridge.ai.chat.model;

import a2.c;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0002\b\tB\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003R\u0012\u0010\u0004\u001a\u00020\u0005X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007\u0082\u0001\u0002\n\u000b¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/chat/model/ConversationListItem;", b.f42142b, "<init>", "()V", "stableId", b.f42142b, "getStableId", "()Ljava/lang/String;", "Header", "ConversationRow", "Lcom/instabridge/ai/chat/model/ConversationListItem$ConversationRow;", "Lcom/instabridge/ai/chat/model/ConversationListItem$Header;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class ConversationListItem {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00052\b\u0010\u0013\u001a\u0004\u0018\u00010\u0014HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\nR\u0014\u0010\u000b\u001a\u00020\f8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\r\u0010\u000e¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/chat/model/ConversationListItem$ConversationRow;", "Lcom/instabridge/ai/chat/model/ConversationListItem;", "conversation", "Lcom/instabridge/ai/chat/model/Conversation;", "isActive", b.f42142b, "<init>", "(Lcom/instabridge/ai/chat/model/Conversation;Z)V", "getConversation", "()Lcom/instabridge/ai/chat/model/Conversation;", "()Z", "stableId", b.f42142b, "getStableId", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ConversationRow extends ConversationListItem {
        public static final int $stable = 0;

        @NotNull
        private final Conversation conversation;
        private final boolean isActive;

        public /* synthetic */ ConversationRow(Conversation conversation, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(conversation, (i5 & 2) != 0 ? false : z11);
        }

        public static /* synthetic */ ConversationRow copy$default(ConversationRow conversationRow, Conversation conversation, boolean z11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                conversation = conversationRow.conversation;
            }
            if ((i5 & 2) != 0) {
                z11 = conversationRow.isActive;
            }
            return conversationRow.copy(conversation, z11);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final Conversation getConversation() {
            return this.conversation;
        }

        /* renamed from: component2, reason: from getter */
        public final boolean getIsActive() {
            return this.isActive;
        }

        @NotNull
        public final ConversationRow copy(@NotNull Conversation conversation, boolean isActive) {
            Intrinsics.g(conversation, "conversation");
            return new ConversationRow(conversation, isActive);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ConversationRow)) {
                return false;
            }
            ConversationRow conversationRow = (ConversationRow) other;
            return Intrinsics.b(this.conversation, conversationRow.conversation) && this.isActive == conversationRow.isActive;
        }

        @NotNull
        public final Conversation getConversation() {
            return this.conversation;
        }

        @Override // com.instabridge.ai.chat.model.ConversationListItem
        @NotNull
        public String getStableId() {
            return this.conversation.getId();
        }

        public int hashCode() {
            return Boolean.hashCode(this.isActive) + (this.conversation.hashCode() * 31);
        }

        public final boolean isActive() {
            return this.isActive;
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ConversationRow(conversation=");
            sb2.append(this.conversation);
            sb2.append(", isActive=");
            return c.p(sb2, this.isActive, ')');
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ConversationRow(@NotNull Conversation conversation, boolean z11) {
            super(null);
            Intrinsics.g(conversation, "conversation");
            this.conversation = conversation;
            this.isActive = z11;
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\u000b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u00038VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\u0007¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/chat/model/ConversationListItem$Header;", "Lcom/instabridge/ai/chat/model/ConversationListItem;", "label", b.f42142b, "<init>", "(Ljava/lang/String;)V", "getLabel", "()Ljava/lang/String;", "stableId", "getStableId", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Header extends ConversationListItem {
        public static final int $stable = 0;

        @NotNull
        private final String label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Header(@NotNull String label) {
            super(null);
            Intrinsics.g(label, "label");
            this.label = label;
        }

        public static /* synthetic */ Header copy$default(Header header, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = header.label;
            }
            return header.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getLabel() {
            return this.label;
        }

        @NotNull
        public final Header copy(@NotNull String label) {
            Intrinsics.g(label, "label");
            return new Header(label);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Header) && Intrinsics.b(this.label, ((Header) other).label);
        }

        @NotNull
        public final String getLabel() {
            return this.label;
        }

        @Override // com.instabridge.ai.chat.model.ConversationListItem
        @NotNull
        public String getStableId() {
            return "header_" + this.label;
        }

        public int hashCode() {
            return this.label.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("Header(label="), this.label, ')');
        }
    }

    public /* synthetic */ ConversationListItem(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    @NotNull
    public abstract String getStableId();

    private ConversationListItem() {
    }
}
