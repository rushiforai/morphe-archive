package com.instabridge.ai.chat.model;

import a2.c;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.chat.model.ChatMessage;
import com.instabridge.ai.protocol.Suggestion;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import x8.h;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0004\b\t\n\u000bB\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003R\u0012\u0010\u0004\u001a\u00020\u0005X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007\u0082\u0001\u0004\f\r\u000e\u000f¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/chat/model/ChatItem;", b.f42142b, "<init>", "()V", "id", b.f42142b, "getId", "()Ljava/lang/String;", "UserMessage", "AiMessage", "SystemMessage", "ToolCallCard", "Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;", "Lcom/instabridge/ai/chat/model/ChatItem$SystemMessage;", "Lcom/instabridge/ai/chat/model/ChatItem$ToolCallCard;", "Lcom/instabridge/ai/chat/model/ChatItem$UserMessage;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class ChatItem {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0006HÆ\u0003J1\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00062\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\rR\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\r¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/chat/model/ChatItem$SystemMessage;", "Lcom/instabridge/ai/chat/model/ChatItem;", "id", b.f42142b, "text", "isError", b.f42142b, "isRetryable", "<init>", "(Ljava/lang/String;Ljava/lang/String;ZZ)V", "getId", "()Ljava/lang/String;", "getText", "()Z", "component1", "component2", "component3", "component4", "copy", "equals", InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SystemMessage extends ChatItem {
        public static final int $stable = 0;

        @NotNull
        private final String id;
        private final boolean isError;
        private final boolean isRetryable;

        @NotNull
        private final String text;

        public /* synthetic */ SystemMessage(String str, String str2, boolean z11, boolean z12, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, (i5 & 4) != 0 ? false : z11, (i5 & 8) != 0 ? false : z12);
        }

        public static /* synthetic */ SystemMessage copy$default(SystemMessage systemMessage, String str, String str2, boolean z11, boolean z12, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = systemMessage.id;
            }
            if ((i5 & 2) != 0) {
                str2 = systemMessage.text;
            }
            if ((i5 & 4) != 0) {
                z11 = systemMessage.isError;
            }
            if ((i5 & 8) != 0) {
                z12 = systemMessage.isRetryable;
            }
            return systemMessage.copy(str, str2, z11, z12);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getText() {
            return this.text;
        }

        /* renamed from: component3, reason: from getter */
        public final boolean getIsError() {
            return this.isError;
        }

        /* renamed from: component4, reason: from getter */
        public final boolean getIsRetryable() {
            return this.isRetryable;
        }

        @NotNull
        public final SystemMessage copy(@NotNull String id2, @NotNull String text, boolean isError, boolean isRetryable) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(text, "text");
            return new SystemMessage(id2, text, isError, isRetryable);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SystemMessage)) {
                return false;
            }
            SystemMessage systemMessage = (SystemMessage) other;
            return Intrinsics.b(this.id, systemMessage.id) && Intrinsics.b(this.text, systemMessage.text) && this.isError == systemMessage.isError && this.isRetryable == systemMessage.isRetryable;
        }

        @Override // com.instabridge.ai.chat.model.ChatItem
        @NotNull
        public String getId() {
            return this.id;
        }

        @NotNull
        public final String getText() {
            return this.text;
        }

        public int hashCode() {
            return Boolean.hashCode(this.isRetryable) + c9.f(c0.e(this.id.hashCode() * 31, 31, this.text), 31, this.isError);
        }

        public final boolean isError() {
            return this.isError;
        }

        public final boolean isRetryable() {
            return this.isRetryable;
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("SystemMessage(id=");
            sb2.append(this.id);
            sb2.append(", text=");
            sb2.append(this.text);
            sb2.append(", isError=");
            sb2.append(this.isError);
            sb2.append(", isRetryable=");
            return c.p(sb2, this.isRetryable, ')');
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public SystemMessage(@NotNull String id2, @NotNull String text, boolean z11, boolean z12) {
            super(null);
            Intrinsics.g(id2, "id");
            Intrinsics.g(text, "text");
            this.id = id2;
            this.text = text;
            this.isError = z11;
            this.isRetryable = z12;
        }
    }

    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0019\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0014\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0007\u0012\b\b\u0002\u0010\t\u001a\u00020\n\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\u0017\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0007HÆ\u0003J\t\u0010\u001e\u001a\u00020\nHÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003JU\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\u0016\b\u0002\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\b0\u00072\b\b\u0002\u0010\t\u001a\u00020\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010!\u001a\u00020\n2\b\u0010\"\u001a\u0004\u0018\u00010\bHÖ\u0003J\t\u0010#\u001a\u00020$HÖ\u0001J\t\u0010%\u001a\u00020\u0003HÖ\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u001f\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u001a\u0010\t\u001a\u00020\nX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\t\u0010\u0014\"\u0004\b\u0015\u0010\u0016R\u001c\u0010\u000b\u001a\u0004\u0018\u00010\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0017\u0010\u000f\"\u0004\b\u0018\u0010\u0019¨\u0006&"}, d2 = {"Lcom/instabridge/ai/chat/model/ChatItem$ToolCallCard;", "Lcom/instabridge/ai/chat/model/ChatItem;", "id", b.f42142b, "callId", "toolName", "arguments", b.f42142b, b.f42142b, "isCompleted", b.f42142b, "selectedLabel", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;ZLjava/lang/String;)V", "getId", "()Ljava/lang/String;", "getCallId", "getToolName", "getArguments", "()Ljava/util/Map;", "()Z", "setCompleted", "(Z)V", "getSelectedLabel", "setSelectedLabel", "(Ljava/lang/String;)V", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ToolCallCard extends ChatItem {
        public static final int $stable = 8;

        @NotNull
        private final Map<String, Object> arguments;

        @NotNull
        private final String callId;

        @NotNull
        private final String id;
        private boolean isCompleted;

        @Nullable
        private String selectedLabel;

        @NotNull
        private final String toolName;

        public /* synthetic */ ToolCallCard(String str, String str2, String str3, Map map, boolean z11, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, str3, map, (i5 & 16) != 0 ? false : z11, (i5 & 32) != 0 ? null : str4);
        }

        public static /* synthetic */ ToolCallCard copy$default(ToolCallCard toolCallCard, String str, String str2, String str3, Map map, boolean z11, String str4, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = toolCallCard.id;
            }
            if ((i5 & 2) != 0) {
                str2 = toolCallCard.callId;
            }
            if ((i5 & 4) != 0) {
                str3 = toolCallCard.toolName;
            }
            if ((i5 & 8) != 0) {
                map = toolCallCard.arguments;
            }
            if ((i5 & 16) != 0) {
                z11 = toolCallCard.isCompleted;
            }
            if ((i5 & 32) != 0) {
                str4 = toolCallCard.selectedLabel;
            }
            boolean z12 = z11;
            String str5 = str4;
            return toolCallCard.copy(str, str2, str3, map, z12, str5);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getCallId() {
            return this.callId;
        }

        @NotNull
        /* renamed from: component3, reason: from getter */
        public final String getToolName() {
            return this.toolName;
        }

        @NotNull
        public final Map<String, Object> component4() {
            return this.arguments;
        }

        /* renamed from: component5, reason: from getter */
        public final boolean getIsCompleted() {
            return this.isCompleted;
        }

        @Nullable
        /* renamed from: component6, reason: from getter */
        public final String getSelectedLabel() {
            return this.selectedLabel;
        }

        @NotNull
        public final ToolCallCard copy(@NotNull String id2, @NotNull String callId, @NotNull String toolName, @NotNull Map<String, ? extends Object> arguments, boolean isCompleted, @Nullable String selectedLabel) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(callId, "callId");
            Intrinsics.g(toolName, "toolName");
            Intrinsics.g(arguments, "arguments");
            return new ToolCallCard(id2, callId, toolName, arguments, isCompleted, selectedLabel);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ToolCallCard)) {
                return false;
            }
            ToolCallCard toolCallCard = (ToolCallCard) other;
            return Intrinsics.b(this.id, toolCallCard.id) && Intrinsics.b(this.callId, toolCallCard.callId) && Intrinsics.b(this.toolName, toolCallCard.toolName) && Intrinsics.b(this.arguments, toolCallCard.arguments) && this.isCompleted == toolCallCard.isCompleted && Intrinsics.b(this.selectedLabel, toolCallCard.selectedLabel);
        }

        @NotNull
        public final Map<String, Object> getArguments() {
            return this.arguments;
        }

        @NotNull
        public final String getCallId() {
            return this.callId;
        }

        @Override // com.instabridge.ai.chat.model.ChatItem
        @NotNull
        public String getId() {
            return this.id;
        }

        @Nullable
        public final String getSelectedLabel() {
            return this.selectedLabel;
        }

        @NotNull
        public final String getToolName() {
            return this.toolName;
        }

        public int hashCode() {
            int iF = c9.f(h.c(this.arguments, c0.e(c0.e(this.id.hashCode() * 31, 31, this.callId), 31, this.toolName), 31), 31, this.isCompleted);
            String str = this.selectedLabel;
            return iF + (str == null ? 0 : str.hashCode());
        }

        public final boolean isCompleted() {
            return this.isCompleted;
        }

        public final void setCompleted(boolean z11) {
            this.isCompleted = z11;
        }

        public final void setSelectedLabel(@Nullable String str) {
            this.selectedLabel = str;
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ToolCallCard(id=");
            sb2.append(this.id);
            sb2.append(", callId=");
            sb2.append(this.callId);
            sb2.append(", toolName=");
            sb2.append(this.toolName);
            sb2.append(", arguments=");
            sb2.append(this.arguments);
            sb2.append(", isCompleted=");
            sb2.append(this.isCompleted);
            sb2.append(", selectedLabel=");
            return c1.t(sb2, this.selectedLabel, ')');
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ToolCallCard(@NotNull String id2, @NotNull String callId, @NotNull String toolName, @NotNull Map<String, ? extends Object> arguments, boolean z11, @Nullable String str) {
            super(null);
            Intrinsics.g(id2, "id");
            Intrinsics.g(callId, "callId");
            Intrinsics.g(toolName, "toolName");
            Intrinsics.g(arguments, "arguments");
            this.id = id2;
            this.callId = callId;
            this.toolName = toolName;
            this.arguments = arguments;
            this.isCompleted = z11;
            this.selectedLabel = str;
        }
    }

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\f\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/chat/model/ChatItem$UserMessage;", "Lcom/instabridge/ai/chat/model/ChatItem;", "id", b.f42142b, "content", "timestamp", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;J)V", "getId", "()Ljava/lang/String;", "getContent", "getTimestamp", "()J", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class UserMessage extends ChatItem {
        public static final int $stable = 0;

        @NotNull
        private final String content;

        @NotNull
        private final String id;
        private final long timestamp;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public UserMessage(@NotNull String id2, @NotNull String content, long j11) {
            super(null);
            Intrinsics.g(id2, "id");
            Intrinsics.g(content, "content");
            this.id = id2;
            this.content = content;
            this.timestamp = j11;
        }

        public static /* synthetic */ UserMessage copy$default(UserMessage userMessage, String str, String str2, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = userMessage.id;
            }
            if ((i5 & 2) != 0) {
                str2 = userMessage.content;
            }
            if ((i5 & 4) != 0) {
                j11 = userMessage.timestamp;
            }
            return userMessage.copy(str, str2, j11);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getContent() {
            return this.content;
        }

        /* renamed from: component3, reason: from getter */
        public final long getTimestamp() {
            return this.timestamp;
        }

        @NotNull
        public final UserMessage copy(@NotNull String id2, @NotNull String content, long timestamp) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(content, "content");
            return new UserMessage(id2, content, timestamp);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UserMessage)) {
                return false;
            }
            UserMessage userMessage = (UserMessage) other;
            return Intrinsics.b(this.id, userMessage.id) && Intrinsics.b(this.content, userMessage.content) && this.timestamp == userMessage.timestamp;
        }

        @NotNull
        public final String getContent() {
            return this.content;
        }

        @Override // com.instabridge.ai.chat.model.ChatItem
        @NotNull
        public String getId() {
            return this.id;
        }

        public final long getTimestamp() {
            return this.timestamp;
        }

        public int hashCode() {
            return Long.hashCode(this.timestamp) + c0.e(this.id.hashCode() * 31, 31, this.content);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("UserMessage(id=");
            sb2.append(this.id);
            sb2.append(", content=");
            sb2.append(this.content);
            sb2.append(", timestamp=");
            return c.n(sb2, this.timestamp, ')');
        }
    }

    public /* synthetic */ ChatItem(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    @NotNull
    public abstract String getId();

    private ChatItem() {
    }

    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b+\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001B}\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\b\b\u0002\u0010\b\u001a\u00020\t\u0012\b\b\u0002\u0010\n\u001a\u00020\t\u0012\u000e\b\u0002\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\f0\u0006\u0012\u000e\b\u0002\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0006\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0010\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0012\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\t\u00101\u001a\u00020\u0003HÆ\u0003J\t\u00102\u001a\u00020\u0003HÆ\u0003J\u000f\u00103\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J\t\u00104\u001a\u00020\tHÆ\u0003J\t\u00105\u001a\u00020\tHÆ\u0003J\u000f\u00106\u001a\b\u0012\u0004\u0012\u00020\f0\u0006HÆ\u0003J\u000f\u00107\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0006HÆ\u0003J\u000b\u00108\u001a\u0004\u0018\u00010\u0010HÆ\u0003J\t\u00109\u001a\u00020\u0012HÆ\u0003J\u000b\u0010:\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0083\u0001\u0010;\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\t2\u000e\b\u0002\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\f0\u00062\u000e\b\u0002\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u00062\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u00122\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010<\u001a\u00020\t2\b\u0010=\u001a\u0004\u0018\u00010>HÖ\u0003J\t\u0010?\u001a\u00020\u0012HÖ\u0001J\t\u0010@\u001a\u00020\u0003HÖ\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0017\"\u0004\b\u0019\u0010\u001aR \u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR\u001a\u0010\b\u001a\u00020\tX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\u001f\"\u0004\b \u0010!R\u001a\u0010\n\u001a\u00020\tX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u001f\"\u0004\b\"\u0010!R \u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\f0\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b#\u0010\u001c\"\u0004\b$\u0010\u001eR \u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b%\u0010\u001c\"\u0004\b&\u0010\u001eR\u001c\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b'\u0010(\"\u0004\b)\u0010*R\u001a\u0010\u0011\u001a\u00020\u0012X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b+\u0010,\"\u0004\b-\u0010.R\u001c\u0010\u0013\u001a\u0004\u0018\u00010\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b/\u0010\u0017\"\u0004\b0\u0010\u001a¨\u0006A"}, d2 = {"Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;", "Lcom/instabridge/ai/chat/model/ChatItem;", "id", b.f42142b, "content", "suggestions", b.f42142b, "Lcom/instabridge/ai/protocol/Suggestion;", "isStreaming", b.f42142b, "isError", "sources", "Lcom/instabridge/ai/chat/model/ChatMessage$Source;", "activeToolCalls", "Lcom/instabridge/ai/chat/model/ToolCallStatus;", "feedbackState", "Lcom/instabridge/ai/chat/model/FeedbackState;", "messageIndex", b.f42142b, "thinkingText", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ZZLjava/util/List;Ljava/util/List;Lcom/instabridge/ai/chat/model/FeedbackState;ILjava/lang/String;)V", "getId", "()Ljava/lang/String;", "getContent", "setContent", "(Ljava/lang/String;)V", "getSuggestions", "()Ljava/util/List;", "setSuggestions", "(Ljava/util/List;)V", "()Z", "setStreaming", "(Z)V", "setError", "getSources", "setSources", "getActiveToolCalls", "setActiveToolCalls", "getFeedbackState", "()Lcom/instabridge/ai/chat/model/FeedbackState;", "setFeedbackState", "(Lcom/instabridge/ai/chat/model/FeedbackState;)V", "getMessageIndex", "()I", "setMessageIndex", "(I)V", "getThinkingText", "setThinkingText", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "copy", "equals", InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class AiMessage extends ChatItem {
        public static final int $stable = 8;

        @NotNull
        private List<ToolCallStatus> activeToolCalls;

        @NotNull
        private String content;

        @Nullable
        private FeedbackState feedbackState;

        @NotNull
        private final String id;
        private boolean isError;
        private boolean isStreaming;
        private int messageIndex;

        @NotNull
        private List<ChatMessage.Source> sources;

        @NotNull
        private List<Suggestion> suggestions;

        @Nullable
        private String thinkingText;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AiMessage(@NotNull String id2, @NotNull String content, @NotNull List<Suggestion> suggestions, boolean z11, boolean z12, @NotNull List<ChatMessage.Source> sources, @NotNull List<ToolCallStatus> activeToolCalls, @Nullable FeedbackState feedbackState, int i5, @Nullable String str) {
            super(null);
            Intrinsics.g(id2, "id");
            Intrinsics.g(content, "content");
            Intrinsics.g(suggestions, "suggestions");
            Intrinsics.g(sources, "sources");
            Intrinsics.g(activeToolCalls, "activeToolCalls");
            this.id = id2;
            this.content = content;
            this.suggestions = suggestions;
            this.isStreaming = z11;
            this.isError = z12;
            this.sources = sources;
            this.activeToolCalls = activeToolCalls;
            this.feedbackState = feedbackState;
            this.messageIndex = i5;
            this.thinkingText = str;
        }

        public static /* synthetic */ AiMessage copy$default(AiMessage aiMessage, String str, String str2, List list, boolean z11, boolean z12, List list2, List list3, FeedbackState feedbackState, int i5, String str3, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                str = aiMessage.id;
            }
            if ((i11 & 2) != 0) {
                str2 = aiMessage.content;
            }
            if ((i11 & 4) != 0) {
                list = aiMessage.suggestions;
            }
            if ((i11 & 8) != 0) {
                z11 = aiMessage.isStreaming;
            }
            if ((i11 & 16) != 0) {
                z12 = aiMessage.isError;
            }
            if ((i11 & 32) != 0) {
                list2 = aiMessage.sources;
            }
            if ((i11 & 64) != 0) {
                list3 = aiMessage.activeToolCalls;
            }
            if ((i11 & 128) != 0) {
                feedbackState = aiMessage.feedbackState;
            }
            if ((i11 & 256) != 0) {
                i5 = aiMessage.messageIndex;
            }
            if ((i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
                str3 = aiMessage.thinkingText;
            }
            int i12 = i5;
            String str4 = str3;
            List list4 = list3;
            FeedbackState feedbackState2 = feedbackState;
            boolean z13 = z12;
            List list5 = list2;
            return aiMessage.copy(str, str2, list, z11, z13, list5, list4, feedbackState2, i12, str4);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        @Nullable
        /* renamed from: component10, reason: from getter */
        public final String getThinkingText() {
            return this.thinkingText;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getContent() {
            return this.content;
        }

        @NotNull
        public final List<Suggestion> component3() {
            return this.suggestions;
        }

        /* renamed from: component4, reason: from getter */
        public final boolean getIsStreaming() {
            return this.isStreaming;
        }

        /* renamed from: component5, reason: from getter */
        public final boolean getIsError() {
            return this.isError;
        }

        @NotNull
        public final List<ChatMessage.Source> component6() {
            return this.sources;
        }

        @NotNull
        public final List<ToolCallStatus> component7() {
            return this.activeToolCalls;
        }

        @Nullable
        /* renamed from: component8, reason: from getter */
        public final FeedbackState getFeedbackState() {
            return this.feedbackState;
        }

        /* renamed from: component9, reason: from getter */
        public final int getMessageIndex() {
            return this.messageIndex;
        }

        @NotNull
        public final AiMessage copy(@NotNull String id2, @NotNull String content, @NotNull List<Suggestion> suggestions, boolean isStreaming, boolean isError, @NotNull List<ChatMessage.Source> sources, @NotNull List<ToolCallStatus> activeToolCalls, @Nullable FeedbackState feedbackState, int messageIndex, @Nullable String thinkingText) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(content, "content");
            Intrinsics.g(suggestions, "suggestions");
            Intrinsics.g(sources, "sources");
            Intrinsics.g(activeToolCalls, "activeToolCalls");
            return new AiMessage(id2, content, suggestions, isStreaming, isError, sources, activeToolCalls, feedbackState, messageIndex, thinkingText);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AiMessage)) {
                return false;
            }
            AiMessage aiMessage = (AiMessage) other;
            return Intrinsics.b(this.id, aiMessage.id) && Intrinsics.b(this.content, aiMessage.content) && Intrinsics.b(this.suggestions, aiMessage.suggestions) && this.isStreaming == aiMessage.isStreaming && this.isError == aiMessage.isError && Intrinsics.b(this.sources, aiMessage.sources) && Intrinsics.b(this.activeToolCalls, aiMessage.activeToolCalls) && this.feedbackState == aiMessage.feedbackState && this.messageIndex == aiMessage.messageIndex && Intrinsics.b(this.thinkingText, aiMessage.thinkingText);
        }

        @NotNull
        public final List<ToolCallStatus> getActiveToolCalls() {
            return this.activeToolCalls;
        }

        @NotNull
        public final String getContent() {
            return this.content;
        }

        @Nullable
        public final FeedbackState getFeedbackState() {
            return this.feedbackState;
        }

        @Override // com.instabridge.ai.chat.model.ChatItem
        @NotNull
        public String getId() {
            return this.id;
        }

        public final int getMessageIndex() {
            return this.messageIndex;
        }

        @NotNull
        public final List<ChatMessage.Source> getSources() {
            return this.sources;
        }

        @NotNull
        public final List<Suggestion> getSuggestions() {
            return this.suggestions;
        }

        @Nullable
        public final String getThinkingText() {
            return this.thinkingText;
        }

        public int hashCode() {
            int iC = u4.c(u4.c(c9.f(c9.f(u4.c(c0.e(this.id.hashCode() * 31, 31, this.content), 31, this.suggestions), 31, this.isStreaming), 31, this.isError), 31, this.sources), 31, this.activeToolCalls);
            FeedbackState feedbackState = this.feedbackState;
            int iA = u4.a(this.messageIndex, (iC + (feedbackState == null ? 0 : feedbackState.hashCode())) * 31, 31);
            String str = this.thinkingText;
            return iA + (str != null ? str.hashCode() : 0);
        }

        public final boolean isError() {
            return this.isError;
        }

        public final boolean isStreaming() {
            return this.isStreaming;
        }

        public final void setActiveToolCalls(@NotNull List<ToolCallStatus> list) {
            Intrinsics.g(list, "<set-?>");
            this.activeToolCalls = list;
        }

        public final void setContent(@NotNull String str) {
            Intrinsics.g(str, "<set-?>");
            this.content = str;
        }

        public final void setError(boolean z11) {
            this.isError = z11;
        }

        public final void setFeedbackState(@Nullable FeedbackState feedbackState) {
            this.feedbackState = feedbackState;
        }

        public final void setMessageIndex(int i5) {
            this.messageIndex = i5;
        }

        public final void setSources(@NotNull List<ChatMessage.Source> list) {
            Intrinsics.g(list, "<set-?>");
            this.sources = list;
        }

        public final void setStreaming(boolean z11) {
            this.isStreaming = z11;
        }

        public final void setSuggestions(@NotNull List<Suggestion> list) {
            Intrinsics.g(list, "<set-?>");
            this.suggestions = list;
        }

        public final void setThinkingText(@Nullable String str) {
            this.thinkingText = str;
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("AiMessage(id=");
            sb2.append(this.id);
            sb2.append(", content=");
            sb2.append(this.content);
            sb2.append(", suggestions=");
            sb2.append(this.suggestions);
            sb2.append(", isStreaming=");
            sb2.append(this.isStreaming);
            sb2.append(", isError=");
            sb2.append(this.isError);
            sb2.append(", sources=");
            sb2.append(this.sources);
            sb2.append(", activeToolCalls=");
            sb2.append(this.activeToolCalls);
            sb2.append(", feedbackState=");
            sb2.append(this.feedbackState);
            sb2.append(", messageIndex=");
            sb2.append(this.messageIndex);
            sb2.append(", thinkingText=");
            return c1.t(sb2, this.thinkingText, ')');
        }

        /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
            java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.SSAVar.getPhiList()" because "resultVar" is null
            	at jadx.core.dex.visitors.InitCodeVariables.collectConnectedVars(InitCodeVariables.java:119)
            	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:82)
            	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
            	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:48)
            	at jadx.core.dex.visitors.InitCodeVariables.visit(InitCodeVariables.java:29)
            */
        public AiMessage(java.lang.String r14, java.lang.String r15, java.util.List r16, boolean r17, boolean r18, java.util.List r19, java.util.List r20, com.instabridge.ai.chat.model.FeedbackState r21, int r22, java.lang.String r23, int r24, kotlin.jvm.internal.DefaultConstructorMarker r25) {
            /*
                r13 = this;
                r0 = r24
                r1 = r0 & 4
                if (r1 == 0) goto La
                kotlin.collections.EmptyList r1 = kotlin.collections.EmptyList.f71733a
                r5 = r1
                goto Lc
            La:
                r5 = r16
            Lc:
                r1 = r0 & 8
                r2 = 0
                if (r1 == 0) goto L13
                r6 = r2
                goto L15
            L13:
                r6 = r17
            L15:
                r1 = r0 & 16
                if (r1 == 0) goto L1b
                r7 = r2
                goto L1d
            L1b:
                r7 = r18
            L1d:
                r1 = r0 & 32
                if (r1 == 0) goto L25
                kotlin.collections.EmptyList r1 = kotlin.collections.EmptyList.f71733a
                r8 = r1
                goto L27
            L25:
                r8 = r19
            L27:
                r1 = r0 & 64
                if (r1 == 0) goto L2f
                kotlin.collections.EmptyList r1 = kotlin.collections.EmptyList.f71733a
                r9 = r1
                goto L31
            L2f:
                r9 = r20
            L31:
                r1 = r0 & 128(0x80, float:1.8E-43)
                r2 = 0
                if (r1 == 0) goto L38
                r10 = r2
                goto L3a
            L38:
                r10 = r21
            L3a:
                r1 = r0 & 256(0x100, float:3.59E-43)
                if (r1 == 0) goto L41
                r1 = -1
                r11 = r1
                goto L43
            L41:
                r11 = r22
            L43:
                r0 = r0 & 512(0x200, float:7.17E-43)
                if (r0 == 0) goto L4c
                r12 = r2
                r3 = r14
                r4 = r15
                r2 = r13
                goto L51
            L4c:
                r12 = r23
                r2 = r13
                r3 = r14
                r4 = r15
            L51:
                r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12)
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.instabridge.ai.chat.model.ChatItem.AiMessage.<init>(java.lang.String, java.lang.String, java.util.List, boolean, boolean, java.util.List, java.util.List, com.instabridge.ai.chat.model.FeedbackState, int, java.lang.String, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
        }
    }
}
