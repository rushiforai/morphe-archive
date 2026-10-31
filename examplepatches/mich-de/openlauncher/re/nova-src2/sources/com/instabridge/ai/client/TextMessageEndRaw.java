package com.instabridge.ai.client;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/client/TextMessageEndRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "messageId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getType", "()Ljava/lang/String;", "getMessageId", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class TextMessageEndRaw {

    @NotNull
    private final String messageId;

    @NotNull
    private final String type;

    public TextMessageEndRaw(@NotNull String type, @o(name = "messageId") @NotNull String messageId) {
        Intrinsics.g(type, "type");
        Intrinsics.g(messageId, "messageId");
        this.type = type;
        this.messageId = messageId;
    }

    public static /* synthetic */ TextMessageEndRaw copy$default(TextMessageEndRaw textMessageEndRaw, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = textMessageEndRaw.type;
        }
        if ((i5 & 2) != 0) {
            str2 = textMessageEndRaw.messageId;
        }
        return textMessageEndRaw.copy(str, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getMessageId() {
        return this.messageId;
    }

    @NotNull
    public final TextMessageEndRaw copy(@NotNull String type, @o(name = "messageId") @NotNull String messageId) {
        Intrinsics.g(type, "type");
        Intrinsics.g(messageId, "messageId");
        return new TextMessageEndRaw(type, messageId);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TextMessageEndRaw)) {
            return false;
        }
        TextMessageEndRaw textMessageEndRaw = (TextMessageEndRaw) other;
        return Intrinsics.b(this.type, textMessageEndRaw.type) && Intrinsics.b(this.messageId, textMessageEndRaw.messageId);
    }

    @NotNull
    public final String getMessageId() {
        return this.messageId;
    }

    @NotNull
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        return this.messageId.hashCode() + (this.type.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("TextMessageEndRaw(type=");
        sb2.append(this.type);
        sb2.append(", messageId=");
        return c1.t(sb2, this.messageId, ')');
    }
}
