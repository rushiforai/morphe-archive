package com.instabridge.ai.chat.ui;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.l1;
import w70.q1;
import w70.t1;
import w70.u1;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\bÁ\u0002\u0018\u00002\u00020\u0001:\u0001\u0013B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001d\u0010\b\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004¢\u0006\u0004\b\b\u0010\tR\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\rR\u001d\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000b0\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/chat/ui/ConversationTitleBus;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "conversationId", "title", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "emit", "(Ljava/lang/String;Ljava/lang/String;)V", "Lw70/l1;", "Lcom/instabridge/ai/chat/ui/ConversationTitleBus$TitleUpdate;", "_updates", "Lw70/l1;", "Lw70/q1;", "updates", "Lw70/q1;", "getUpdates", "()Lw70/q1;", "TitleUpdate", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ConversationTitleBus {
    public static final int $stable;

    @NotNull
    public static final ConversationTitleBus INSTANCE = new ConversationTitleBus();

    @NotNull
    private static final l1 _updates;

    @NotNull
    private static final q1 updates;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/chat/ui/ConversationTitleBus$TitleUpdate;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "conversationId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "title", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getConversationId", "()Ljava/lang/String;", "getTitle", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class TitleUpdate {
        public static final int $stable = 0;

        @NotNull
        private final String conversationId;

        @NotNull
        private final String title;

        public TitleUpdate(@NotNull String conversationId, @NotNull String title) {
            Intrinsics.g(conversationId, "conversationId");
            Intrinsics.g(title, "title");
            this.conversationId = conversationId;
            this.title = title;
        }

        public static /* synthetic */ TitleUpdate copy$default(TitleUpdate titleUpdate, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = titleUpdate.conversationId;
            }
            if ((i5 & 2) != 0) {
                str2 = titleUpdate.title;
            }
            return titleUpdate.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getConversationId() {
            return this.conversationId;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        @NotNull
        public final TitleUpdate copy(@NotNull String conversationId, @NotNull String title) {
            Intrinsics.g(conversationId, "conversationId");
            Intrinsics.g(title, "title");
            return new TitleUpdate(conversationId, title);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TitleUpdate)) {
                return false;
            }
            TitleUpdate titleUpdate = (TitleUpdate) other;
            return Intrinsics.b(this.conversationId, titleUpdate.conversationId) && Intrinsics.b(this.title, titleUpdate.title);
        }

        @NotNull
        public final String getConversationId() {
            return this.conversationId;
        }

        @NotNull
        public final String getTitle() {
            return this.title;
        }

        public int hashCode() {
            return this.title.hashCode() + (this.conversationId.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("TitleUpdate(conversationId=");
            sb2.append(this.conversationId);
            sb2.append(", title=");
            return c1.t(sb2, this.title, ')');
        }
    }

    static {
        t1 t1VarB = u1.b(0, 1, null, 5);
        _updates = t1VarB;
        updates = t1VarB;
        $stable = 8;
    }

    private ConversationTitleBus() {
    }

    public final void emit(@NotNull String conversationId, @NotNull String title) {
        Intrinsics.g(conversationId, "conversationId");
        Intrinsics.g(title, "title");
        _updates.c(new TitleUpdate(conversationId, title));
    }

    @NotNull
    public final q1 getUpdates() {
        return updates;
    }
}
