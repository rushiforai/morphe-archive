package com.instabridge.ai.chat.model;

import b.c0;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001:\u0001'Be\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\u0018\b\u0002\u0010\u000b\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\f¢\u0006\u0004\b\r\u0010\u000eJ\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0011\u0010\u001c\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0019\u0010\u001f\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\fHÆ\u0003Jm\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\u0018\b\u0002\u0010\u000b\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\fHÆ\u0001J\u0013\u0010!\u001a\u00020\"2\b\u0010#\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010$\u001a\u00020%HÖ\u0001J\t\u0010&\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0010R\u0019\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0010R\u0013\u0010\n\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0010R!\u0010\u000b\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\f¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018¨\u0006("}, d2 = {"Lcom/instabridge/ai/chat/model/ChatMessage;", b.f42142b, "role", b.f42142b, "content", "timestamp", "sources", b.f42142b, "Lcom/instabridge/ai/chat/model/ChatMessage$Source;", "toolName", "toolCallId", "toolArguments", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", "getRole", "()Ljava/lang/String;", "getContent", "getTimestamp", "getSources", "()Ljava/util/List;", "getToolName", "getToolCallId", "getToolArguments", "()Ljava/util/Map;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "Source", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ChatMessage {
    public static final int $stable = 8;

    @NotNull
    private final String content;

    @NotNull
    private final String role;

    @Nullable
    private final List<Source> sources;

    @Nullable
    private final String timestamp;

    @Nullable
    private final Map<String, Object> toolArguments;

    @Nullable
    private final String toolCallId;

    @Nullable
    private final String toolName;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/chat/model/ChatMessage$Source;", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, b.f42142b, "title", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getUrl", "()Ljava/lang/String;", "getTitle", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Source {
        public static final int $stable = 0;

        @NotNull
        private final String title;

        @NotNull
        private final String url;

        public Source(@NotNull String url, @NotNull String title) {
            Intrinsics.g(url, "url");
            Intrinsics.g(title, "title");
            this.url = url;
            this.title = title;
        }

        public static /* synthetic */ Source copy$default(Source source, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = source.url;
            }
            if ((i5 & 2) != 0) {
                str2 = source.title;
            }
            return source.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getUrl() {
            return this.url;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        @NotNull
        public final Source copy(@NotNull String url, @NotNull String title) {
            Intrinsics.g(url, "url");
            Intrinsics.g(title, "title");
            return new Source(url, title);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Source)) {
                return false;
            }
            Source source = (Source) other;
            return Intrinsics.b(this.url, source.url) && Intrinsics.b(this.title, source.title);
        }

        @NotNull
        public final String getTitle() {
            return this.title;
        }

        @NotNull
        public final String getUrl() {
            return this.url;
        }

        public int hashCode() {
            return this.title.hashCode() + (this.url.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Source(url=");
            sb2.append(this.url);
            sb2.append(", title=");
            return c1.t(sb2, this.title, ')');
        }
    }

    public ChatMessage(@NotNull String role, @NotNull String content, @Nullable String str, @Nullable List<Source> list, @Nullable String str2, @Nullable String str3, @Nullable Map<String, ? extends Object> map) {
        Intrinsics.g(role, "role");
        Intrinsics.g(content, "content");
        this.role = role;
        this.content = content;
        this.timestamp = str;
        this.sources = list;
        this.toolName = str2;
        this.toolCallId = str3;
        this.toolArguments = map;
    }

    public static /* synthetic */ ChatMessage copy$default(ChatMessage chatMessage, String str, String str2, String str3, List list, String str4, String str5, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = chatMessage.role;
        }
        if ((i5 & 2) != 0) {
            str2 = chatMessage.content;
        }
        if ((i5 & 4) != 0) {
            str3 = chatMessage.timestamp;
        }
        if ((i5 & 8) != 0) {
            list = chatMessage.sources;
        }
        if ((i5 & 16) != 0) {
            str4 = chatMessage.toolName;
        }
        if ((i5 & 32) != 0) {
            str5 = chatMessage.toolCallId;
        }
        if ((i5 & 64) != 0) {
            map = chatMessage.toolArguments;
        }
        String str6 = str5;
        Map map2 = map;
        String str7 = str4;
        String str8 = str3;
        return chatMessage.copy(str, str2, str8, list, str7, str6, map2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getRole() {
        return this.role;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getContent() {
        return this.content;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getTimestamp() {
        return this.timestamp;
    }

    @Nullable
    public final List<Source> component4() {
        return this.sources;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getToolName() {
        return this.toolName;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @Nullable
    public final Map<String, Object> component7() {
        return this.toolArguments;
    }

    @NotNull
    public final ChatMessage copy(@NotNull String role, @NotNull String content, @Nullable String timestamp, @Nullable List<Source> sources, @Nullable String toolName, @Nullable String toolCallId, @Nullable Map<String, ? extends Object> toolArguments) {
        Intrinsics.g(role, "role");
        Intrinsics.g(content, "content");
        return new ChatMessage(role, content, timestamp, sources, toolName, toolCallId, toolArguments);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ChatMessage)) {
            return false;
        }
        ChatMessage chatMessage = (ChatMessage) other;
        return Intrinsics.b(this.role, chatMessage.role) && Intrinsics.b(this.content, chatMessage.content) && Intrinsics.b(this.timestamp, chatMessage.timestamp) && Intrinsics.b(this.sources, chatMessage.sources) && Intrinsics.b(this.toolName, chatMessage.toolName) && Intrinsics.b(this.toolCallId, chatMessage.toolCallId) && Intrinsics.b(this.toolArguments, chatMessage.toolArguments);
    }

    @NotNull
    public final String getContent() {
        return this.content;
    }

    @NotNull
    public final String getRole() {
        return this.role;
    }

    @Nullable
    public final List<Source> getSources() {
        return this.sources;
    }

    @Nullable
    public final String getTimestamp() {
        return this.timestamp;
    }

    @Nullable
    public final Map<String, Object> getToolArguments() {
        return this.toolArguments;
    }

    @Nullable
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @Nullable
    public final String getToolName() {
        return this.toolName;
    }

    public int hashCode() {
        int iE = c0.e(this.role.hashCode() * 31, 31, this.content);
        String str = this.timestamp;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        List<Source> list = this.sources;
        int iHashCode2 = (iHashCode + (list == null ? 0 : list.hashCode())) * 31;
        String str2 = this.toolName;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.toolCallId;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Map<String, Object> map = this.toolArguments;
        return iHashCode4 + (map != null ? map.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ChatMessage(role=");
        sb2.append(this.role);
        sb2.append(", content=");
        sb2.append(this.content);
        sb2.append(", timestamp=");
        sb2.append(this.timestamp);
        sb2.append(", sources=");
        sb2.append(this.sources);
        sb2.append(", toolName=");
        sb2.append(this.toolName);
        sb2.append(", toolCallId=");
        sb2.append(this.toolCallId);
        sb2.append(", toolArguments=");
        return c9.l(sb2, this.toolArguments, ')');
    }

    public /* synthetic */ ChatMessage(String str, String str2, String str3, List list, String str4, String str5, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3, (i5 & 8) != 0 ? null : list, (i5 & 16) != 0 ? null : str4, (i5 & 32) != 0 ? null : str5, (i5 & 64) != 0 ? null : map);
    }
}
