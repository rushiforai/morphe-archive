package com.instabridge.ai.chat.ui;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u001e\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001Bg\u0012\n\b\u0003\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000eJn\u0010\u001f\u001a\u00020\u00002\n\b\u0003\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010 J\u0013\u0010!\u001a\u00020\"2\b\u0010#\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010$\u001a\u00020\u0003HÖ\u0001J\t\u0010%\u001a\u00020&HÖ\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\r\u0010\u000eR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0010\u0010\u000eR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0011\u0010\u000eR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0012\u0010\u000eR\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0013\u0010\u000eR\u0015\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0014\u0010\u000eR\u0015\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0015\u0010\u000eR\u0015\u0010\n\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0016\u0010\u000e¨\u0006'"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatTheme;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "inputBackground", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "inputTextColor", "inputHintColor", "sendButtonColor", "userBubbleBackground", "userBubbleTextColor", "aiTextColor", "timestampColor", "<init>", "(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V", "getInputBackground", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getInputTextColor", "getInputHintColor", "getSendButtonColor", "getUserBubbleBackground", "getUserBubbleTextColor", "getAiTextColor", "getTimestampColor", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/instabridge/ai/chat/ui/ChatTheme;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ChatTheme {
    public static final int $stable = 0;

    @Nullable
    private final Integer aiTextColor;

    @Nullable
    private final Integer inputBackground;

    @Nullable
    private final Integer inputHintColor;

    @Nullable
    private final Integer inputTextColor;

    @Nullable
    private final Integer sendButtonColor;

    @Nullable
    private final Integer timestampColor;

    @Nullable
    private final Integer userBubbleBackground;

    @Nullable
    private final Integer userBubbleTextColor;

    public ChatTheme() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }

    public static /* synthetic */ ChatTheme copy$default(ChatTheme chatTheme, Integer num, Integer num2, Integer num3, Integer num4, Integer num5, Integer num6, Integer num7, Integer num8, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = chatTheme.inputBackground;
        }
        if ((i5 & 2) != 0) {
            num2 = chatTheme.inputTextColor;
        }
        if ((i5 & 4) != 0) {
            num3 = chatTheme.inputHintColor;
        }
        if ((i5 & 8) != 0) {
            num4 = chatTheme.sendButtonColor;
        }
        if ((i5 & 16) != 0) {
            num5 = chatTheme.userBubbleBackground;
        }
        if ((i5 & 32) != 0) {
            num6 = chatTheme.userBubbleTextColor;
        }
        if ((i5 & 64) != 0) {
            num7 = chatTheme.aiTextColor;
        }
        if ((i5 & 128) != 0) {
            num8 = chatTheme.timestampColor;
        }
        Integer num9 = num7;
        Integer num10 = num8;
        Integer num11 = num5;
        Integer num12 = num6;
        return chatTheme.copy(num, num2, num3, num4, num11, num12, num9, num10);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final Integer getInputBackground() {
        return this.inputBackground;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final Integer getInputTextColor() {
        return this.inputTextColor;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Integer getInputHintColor() {
        return this.inputHintColor;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Integer getSendButtonColor() {
        return this.sendButtonColor;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final Integer getUserBubbleBackground() {
        return this.userBubbleBackground;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final Integer getUserBubbleTextColor() {
        return this.userBubbleTextColor;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final Integer getAiTextColor() {
        return this.aiTextColor;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final Integer getTimestampColor() {
        return this.timestampColor;
    }

    @NotNull
    public final ChatTheme copy(@Nullable Integer inputBackground, @Nullable Integer inputTextColor, @Nullable Integer inputHintColor, @Nullable Integer sendButtonColor, @Nullable Integer userBubbleBackground, @Nullable Integer userBubbleTextColor, @Nullable Integer aiTextColor, @Nullable Integer timestampColor) {
        return new ChatTheme(inputBackground, inputTextColor, inputHintColor, sendButtonColor, userBubbleBackground, userBubbleTextColor, aiTextColor, timestampColor);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ChatTheme)) {
            return false;
        }
        ChatTheme chatTheme = (ChatTheme) other;
        return Intrinsics.b(this.inputBackground, chatTheme.inputBackground) && Intrinsics.b(this.inputTextColor, chatTheme.inputTextColor) && Intrinsics.b(this.inputHintColor, chatTheme.inputHintColor) && Intrinsics.b(this.sendButtonColor, chatTheme.sendButtonColor) && Intrinsics.b(this.userBubbleBackground, chatTheme.userBubbleBackground) && Intrinsics.b(this.userBubbleTextColor, chatTheme.userBubbleTextColor) && Intrinsics.b(this.aiTextColor, chatTheme.aiTextColor) && Intrinsics.b(this.timestampColor, chatTheme.timestampColor);
    }

    @Nullable
    public final Integer getAiTextColor() {
        return this.aiTextColor;
    }

    @Nullable
    public final Integer getInputBackground() {
        return this.inputBackground;
    }

    @Nullable
    public final Integer getInputHintColor() {
        return this.inputHintColor;
    }

    @Nullable
    public final Integer getInputTextColor() {
        return this.inputTextColor;
    }

    @Nullable
    public final Integer getSendButtonColor() {
        return this.sendButtonColor;
    }

    @Nullable
    public final Integer getTimestampColor() {
        return this.timestampColor;
    }

    @Nullable
    public final Integer getUserBubbleBackground() {
        return this.userBubbleBackground;
    }

    @Nullable
    public final Integer getUserBubbleTextColor() {
        return this.userBubbleTextColor;
    }

    public int hashCode() {
        Integer num = this.inputBackground;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.inputTextColor;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.inputHintColor;
        int iHashCode3 = (iHashCode2 + (num3 == null ? 0 : num3.hashCode())) * 31;
        Integer num4 = this.sendButtonColor;
        int iHashCode4 = (iHashCode3 + (num4 == null ? 0 : num4.hashCode())) * 31;
        Integer num5 = this.userBubbleBackground;
        int iHashCode5 = (iHashCode4 + (num5 == null ? 0 : num5.hashCode())) * 31;
        Integer num6 = this.userBubbleTextColor;
        int iHashCode6 = (iHashCode5 + (num6 == null ? 0 : num6.hashCode())) * 31;
        Integer num7 = this.aiTextColor;
        int iHashCode7 = (iHashCode6 + (num7 == null ? 0 : num7.hashCode())) * 31;
        Integer num8 = this.timestampColor;
        return iHashCode7 + (num8 != null ? num8.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ChatTheme(inputBackground=");
        sb2.append(this.inputBackground);
        sb2.append(", inputTextColor=");
        sb2.append(this.inputTextColor);
        sb2.append(", inputHintColor=");
        sb2.append(this.inputHintColor);
        sb2.append(", sendButtonColor=");
        sb2.append(this.sendButtonColor);
        sb2.append(", userBubbleBackground=");
        sb2.append(this.userBubbleBackground);
        sb2.append(", userBubbleTextColor=");
        sb2.append(this.userBubbleTextColor);
        sb2.append(", aiTextColor=");
        sb2.append(this.aiTextColor);
        sb2.append(", timestampColor=");
        return a2.c.o(sb2, this.timestampColor, ')');
    }

    public ChatTheme(@Nullable Integer num, @Nullable Integer num2, @Nullable Integer num3, @Nullable Integer num4, @Nullable Integer num5, @Nullable Integer num6, @Nullable Integer num7, @Nullable Integer num8) {
        this.inputBackground = num;
        this.inputTextColor = num2;
        this.inputHintColor = num3;
        this.sendButtonColor = num4;
        this.userBubbleBackground = num5;
        this.userBubbleTextColor = num6;
        this.aiTextColor = num7;
        this.timestampColor = num8;
    }

    public /* synthetic */ ChatTheme(Integer num, Integer num2, Integer num3, Integer num4, Integer num5, Integer num6, Integer num7, Integer num8, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : num, (i5 & 2) != 0 ? null : num2, (i5 & 4) != 0 ? null : num3, (i5 & 8) != 0 ? null : num4, (i5 & 16) != 0 ? null : num5, (i5 & 32) != 0 ? null : num6, (i5 & 64) != 0 ? null : num7, (i5 & 128) != 0 ? null : num8);
    }
}
