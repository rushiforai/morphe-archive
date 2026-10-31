package com.instabridge.ai.client;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J7\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/client/ReasoningContentRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "messageId", "delta", "text", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getType", "()Ljava/lang/String;", "getMessageId", "getDelta", "getText", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ReasoningContentRaw {

    @Nullable
    private final String delta;

    @Nullable
    private final String messageId;

    @Nullable
    private final String text;

    @NotNull
    private final String type;

    public ReasoningContentRaw(@NotNull String type, @o(name = "messageId") @Nullable String str, @Nullable String str2, @Nullable String str3) {
        Intrinsics.g(type, "type");
        this.type = type;
        this.messageId = str;
        this.delta = str2;
        this.text = str3;
    }

    public static /* synthetic */ ReasoningContentRaw copy$default(ReasoningContentRaw reasoningContentRaw, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = reasoningContentRaw.type;
        }
        if ((i5 & 2) != 0) {
            str2 = reasoningContentRaw.messageId;
        }
        if ((i5 & 4) != 0) {
            str3 = reasoningContentRaw.delta;
        }
        if ((i5 & 8) != 0) {
            str4 = reasoningContentRaw.text;
        }
        return reasoningContentRaw.copy(str, str2, str3, str4);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getMessageId() {
        return this.messageId;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getDelta() {
        return this.delta;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getText() {
        return this.text;
    }

    @NotNull
    public final ReasoningContentRaw copy(@NotNull String type, @o(name = "messageId") @Nullable String messageId, @Nullable String delta, @Nullable String text) {
        Intrinsics.g(type, "type");
        return new ReasoningContentRaw(type, messageId, delta, text);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ReasoningContentRaw)) {
            return false;
        }
        ReasoningContentRaw reasoningContentRaw = (ReasoningContentRaw) other;
        return Intrinsics.b(this.type, reasoningContentRaw.type) && Intrinsics.b(this.messageId, reasoningContentRaw.messageId) && Intrinsics.b(this.delta, reasoningContentRaw.delta) && Intrinsics.b(this.text, reasoningContentRaw.text);
    }

    @Nullable
    public final String getDelta() {
        return this.delta;
    }

    @Nullable
    public final String getMessageId() {
        return this.messageId;
    }

    @Nullable
    public final String getText() {
        return this.text;
    }

    @NotNull
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        int iHashCode = this.type.hashCode() * 31;
        String str = this.messageId;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.delta;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.text;
        return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ReasoningContentRaw(type=");
        sb2.append(this.type);
        sb2.append(", messageId=");
        sb2.append(this.messageId);
        sb2.append(", delta=");
        sb2.append(this.delta);
        sb2.append(", text=");
        return c1.t(sb2, this.text, ')');
    }
}
