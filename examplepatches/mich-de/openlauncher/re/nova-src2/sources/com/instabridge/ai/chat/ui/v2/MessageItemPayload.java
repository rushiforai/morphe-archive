package com.instabridge.ai.chat.ui.v2;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0006\u0004\u0005\u0006\u0007\b\tB\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0006\n\u000b\f\r\u000e\u000f¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "StreamDelta", "StreamEnd", "ThinkingText", "Phase", "Feedback", "Suggestions", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$Feedback;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$Phase;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$StreamDelta;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$StreamEnd;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$Suggestions;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$ThinkingText;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class MessageItemPayload {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$Feedback;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload;", "<init>", "()V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Feedback extends MessageItemPayload {
        public static final int $stable = 0;

        @NotNull
        public static final Feedback INSTANCE = new Feedback();

        private Feedback() {
            super(null);
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$Phase;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload;", "phase", "Lcom/instabridge/ai/chat/ui/v2/AiMessagePhase;", "<init>", "(Lcom/instabridge/ai/chat/ui/v2/AiMessagePhase;)V", "getPhase", "()Lcom/instabridge/ai/chat/ui/v2/AiMessagePhase;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Phase extends MessageItemPayload {
        public static final int $stable = 0;

        @NotNull
        private final AiMessagePhase phase;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Phase(@NotNull AiMessagePhase phase) {
            super(null);
            Intrinsics.g(phase, "phase");
            this.phase = phase;
        }

        public static /* synthetic */ Phase copy$default(Phase phase, AiMessagePhase aiMessagePhase, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                aiMessagePhase = phase.phase;
            }
            return phase.copy(aiMessagePhase);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final AiMessagePhase getPhase() {
            return this.phase;
        }

        @NotNull
        public final Phase copy(@NotNull AiMessagePhase phase) {
            Intrinsics.g(phase, "phase");
            return new Phase(phase);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Phase) && this.phase == ((Phase) other).phase;
        }

        @NotNull
        public final AiMessagePhase getPhase() {
            return this.phase;
        }

        public int hashCode() {
            return this.phase.hashCode();
        }

        @NotNull
        public String toString() {
            return "Phase(phase=" + this.phase + ')';
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$StreamDelta;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload;", "cumulativeText", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;)V", "getCumulativeText", "()Ljava/lang/String;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class StreamDelta extends MessageItemPayload {
        public static final int $stable = 0;

        @NotNull
        private final String cumulativeText;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public StreamDelta(@NotNull String cumulativeText) {
            super(null);
            Intrinsics.g(cumulativeText, "cumulativeText");
            this.cumulativeText = cumulativeText;
        }

        public static /* synthetic */ StreamDelta copy$default(StreamDelta streamDelta, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = streamDelta.cumulativeText;
            }
            return streamDelta.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getCumulativeText() {
            return this.cumulativeText;
        }

        @NotNull
        public final StreamDelta copy(@NotNull String cumulativeText) {
            Intrinsics.g(cumulativeText, "cumulativeText");
            return new StreamDelta(cumulativeText);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof StreamDelta) && Intrinsics.b(this.cumulativeText, ((StreamDelta) other).cumulativeText);
        }

        @NotNull
        public final String getCumulativeText() {
            return this.cumulativeText;
        }

        public int hashCode() {
            return this.cumulativeText.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("StreamDelta(cumulativeText="), this.cumulativeText, ')');
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$StreamEnd;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload;", "<init>", "()V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class StreamEnd extends MessageItemPayload {
        public static final int $stable = 0;

        @NotNull
        public static final StreamEnd INSTANCE = new StreamEnd();

        private StreamEnd() {
            super(null);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$Suggestions;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload;", "<init>", "()V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Suggestions extends MessageItemPayload {
        public static final int $stable = 0;

        @NotNull
        public static final Suggestions INSTANCE = new Suggestions();

        private Suggestions() {
            super(null);
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload$ThinkingText;", "Lcom/instabridge/ai/chat/ui/v2/MessageItemPayload;", "text", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;)V", "getText", "()Ljava/lang/String;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ThinkingText extends MessageItemPayload {
        public static final int $stable = 0;

        @NotNull
        private final String text;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ThinkingText(@NotNull String text) {
            super(null);
            Intrinsics.g(text, "text");
            this.text = text;
        }

        public static /* synthetic */ ThinkingText copy$default(ThinkingText thinkingText, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = thinkingText.text;
            }
            return thinkingText.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getText() {
            return this.text;
        }

        @NotNull
        public final ThinkingText copy(@NotNull String text) {
            Intrinsics.g(text, "text");
            return new ThinkingText(text);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof ThinkingText) && Intrinsics.b(this.text, ((ThinkingText) other).text);
        }

        @NotNull
        public final String getText() {
            return this.text;
        }

        public int hashCode() {
            return this.text.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("ThinkingText(text="), this.text, ')');
        }
    }

    public /* synthetic */ MessageItemPayload(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private MessageItemPayload() {
    }
}
