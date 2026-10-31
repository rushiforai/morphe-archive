package com.instabridge.ai.client;

import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J'\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/client/TextMessageContentRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "messageId", "delta", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getType", "()Ljava/lang/String;", "getMessageId", "getDelta", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class TextMessageContentRaw {

    @NotNull
    private final String delta;

    @NotNull
    private final String messageId;

    @NotNull
    private final String type;

    public TextMessageContentRaw(@NotNull String type, @o(name = "messageId") @NotNull String messageId, @NotNull String delta) {
        Intrinsics.g(type, "type");
        Intrinsics.g(messageId, "messageId");
        Intrinsics.g(delta, "delta");
        this.type = type;
        this.messageId = messageId;
        this.delta = delta;
    }

    public static /* synthetic */ TextMessageContentRaw copy$default(TextMessageContentRaw textMessageContentRaw, String str, String str2, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = textMessageContentRaw.type;
        }
        if ((i5 & 2) != 0) {
            str2 = textMessageContentRaw.messageId;
        }
        if ((i5 & 4) != 0) {
            str3 = textMessageContentRaw.delta;
        }
        return textMessageContentRaw.copy(str, str2, str3);
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
    /* renamed from: component3, reason: from getter */
    public final String getDelta() {
        return this.delta;
    }

    @NotNull
    public final TextMessageContentRaw copy(@NotNull String type, @o(name = "messageId") @NotNull String messageId, @NotNull String delta) {
        Intrinsics.g(type, "type");
        Intrinsics.g(messageId, "messageId");
        Intrinsics.g(delta, "delta");
        return new TextMessageContentRaw(type, messageId, delta);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TextMessageContentRaw)) {
            return false;
        }
        TextMessageContentRaw textMessageContentRaw = (TextMessageContentRaw) other;
        return Intrinsics.b(this.type, textMessageContentRaw.type) && Intrinsics.b(this.messageId, textMessageContentRaw.messageId) && Intrinsics.b(this.delta, textMessageContentRaw.delta);
    }

    @NotNull
    public final String getDelta() {
        return this.delta;
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
        return this.delta.hashCode() + c0.e(this.type.hashCode() * 31, 31, this.messageId);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("TextMessageContentRaw(type=");
        sb2.append(this.type);
        sb2.append(", messageId=");
        sb2.append(this.messageId);
        sb2.append(", delta=");
        return c1.t(sb2, this.delta, ')');
    }
}
