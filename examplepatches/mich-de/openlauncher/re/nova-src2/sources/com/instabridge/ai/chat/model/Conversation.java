package com.instabridge.ai.chat.model;

import a2.c;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0011\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\bHÆ\u0003J=\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0017\u001a\u00020\b2\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/chat/model/Conversation;", b.f42142b, "id", b.f42142b, "title", "createdAt", "updatedAt", "isPublic", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V", "getId", "()Ljava/lang/String;", "getTitle", "getCreatedAt", "getUpdatedAt", "()Z", "component1", "component2", "component3", "component4", "component5", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class Conversation {
    public static final int $stable = 0;

    @NotNull
    private final String createdAt;

    @NotNull
    private final String id;
    private final boolean isPublic;

    @Nullable
    private final String title;

    @NotNull
    private final String updatedAt;

    public Conversation(@NotNull String id2, @Nullable String str, @NotNull String createdAt, @NotNull String updatedAt, boolean z11) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(createdAt, "createdAt");
        Intrinsics.g(updatedAt, "updatedAt");
        this.id = id2;
        this.title = str;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isPublic = z11;
    }

    public static /* synthetic */ Conversation copy$default(Conversation conversation, String str, String str2, String str3, String str4, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = conversation.id;
        }
        if ((i5 & 2) != 0) {
            str2 = conversation.title;
        }
        if ((i5 & 4) != 0) {
            str3 = conversation.createdAt;
        }
        if ((i5 & 8) != 0) {
            str4 = conversation.updatedAt;
        }
        if ((i5 & 16) != 0) {
            z11 = conversation.isPublic;
        }
        boolean z12 = z11;
        String str5 = str3;
        return conversation.copy(str, str2, str5, str4, z12);
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
    /* renamed from: component3, reason: from getter */
    public final String getCreatedAt() {
        return this.createdAt;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getUpdatedAt() {
        return this.updatedAt;
    }

    /* renamed from: component5, reason: from getter */
    public final boolean getIsPublic() {
        return this.isPublic;
    }

    @NotNull
    public final Conversation copy(@NotNull String id2, @Nullable String title, @NotNull String createdAt, @NotNull String updatedAt, boolean isPublic) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(createdAt, "createdAt");
        Intrinsics.g(updatedAt, "updatedAt");
        return new Conversation(id2, title, createdAt, updatedAt, isPublic);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Conversation)) {
            return false;
        }
        Conversation conversation = (Conversation) other;
        return Intrinsics.b(this.id, conversation.id) && Intrinsics.b(this.title, conversation.title) && Intrinsics.b(this.createdAt, conversation.createdAt) && Intrinsics.b(this.updatedAt, conversation.updatedAt) && this.isPublic == conversation.isPublic;
    }

    @NotNull
    public final String getCreatedAt() {
        return this.createdAt;
    }

    @NotNull
    public final String getId() {
        return this.id;
    }

    @Nullable
    public final String getTitle() {
        return this.title;
    }

    @NotNull
    public final String getUpdatedAt() {
        return this.updatedAt;
    }

    public int hashCode() {
        int iHashCode = this.id.hashCode() * 31;
        String str = this.title;
        return Boolean.hashCode(this.isPublic) + c0.e(c0.e((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.createdAt), 31, this.updatedAt);
    }

    public final boolean isPublic() {
        return this.isPublic;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("Conversation(id=");
        sb2.append(this.id);
        sb2.append(", title=");
        sb2.append(this.title);
        sb2.append(", createdAt=");
        sb2.append(this.createdAt);
        sb2.append(", updatedAt=");
        sb2.append(this.updatedAt);
        sb2.append(", isPublic=");
        return c.p(sb2, this.isPublic, ')');
    }

    public /* synthetic */ Conversation(String str, String str2, String str3, String str4, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3, str4, (i5 & 16) != 0 ? false : z11);
    }
}
