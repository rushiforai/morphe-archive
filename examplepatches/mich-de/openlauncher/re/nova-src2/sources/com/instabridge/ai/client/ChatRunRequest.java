package com.instabridge.ai.client;

import aq.o;
import b.c9;
import b.u4;
import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u001d\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B\u0093\u0001\u0012\n\b\u0001\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u001c\u0010\u0007\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b\u0018\u00010\u0005\u0012\n\b\u0001\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\r\u001a\u00020\u000e\u0012\u0018\b\u0002\u0010\u000f\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\b¢\u0006\u0004\b\u0010\u0010\u0011J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010 \u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\u001f\u0010!\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010&\u001a\u00020\u000eHÆ\u0003J\u0019\u0010'\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\bHÆ\u0003J\u0099\u0001\u0010(\u001a\u00020\u00002\n\b\u0003\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u001e\b\u0002\u0010\u0007\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b\u0018\u00010\u00052\n\b\u0003\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\f\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\r\u001a\u00020\u000e2\u0018\b\u0002\u0010\u000f\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\bHÆ\u0001J\u0013\u0010)\u001a\u00020\u000e2\b\u0010*\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010+\u001a\u00020,HÖ\u0001J\t\u0010-\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R'\u0010\u0007\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0015R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0013R\u0013\u0010\n\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0013R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0013R\u0013\u0010\f\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0013R\u0011\u0010\r\u001a\u00020\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001cR!\u0010\u000f\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001e¨\u0006."}, d2 = {"Lcom/instabridge/ai/client/ChatRunRequest;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "threadId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "messages", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/client/ChatRequestMessage;", "tools", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sessionId", "modelPreference", TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, "runId", "regenerate", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "metadata", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;)V", "getThreadId", "()Ljava/lang/String;", "getMessages", "()Ljava/util/List;", "getTools", "getSessionId", "getModelPreference", "getLanguage", "getRunId", "getRegenerate", "()Z", "getMetadata", "()Ljava/util/Map;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ChatRunRequest {

    @Nullable
    private final String language;

    @NotNull
    private final List<ChatRequestMessage> messages;

    @Nullable
    private final Map<String, Object> metadata;

    @Nullable
    private final String modelPreference;
    private final boolean regenerate;

    @Nullable
    private final String runId;

    @Nullable
    private final String sessionId;

    @Nullable
    private final String threadId;

    @Nullable
    private final List<Map<String, Object>> tools;

    /* JADX WARN: Multi-variable type inference failed */
    public ChatRunRequest(@o(name = "threadId") @Nullable String str, @NotNull List<ChatRequestMessage> messages, @Nullable List<? extends Map<String, ? extends Object>> list, @o(name = "sessionId") @Nullable String str2, @o(name = "modelPreference") @Nullable String str3, @Nullable String str4, @o(name = "runId") @Nullable String str5, boolean z11, @Nullable Map<String, ? extends Object> map) {
        Intrinsics.g(messages, "messages");
        this.threadId = str;
        this.messages = messages;
        this.tools = list;
        this.sessionId = str2;
        this.modelPreference = str3;
        this.language = str4;
        this.runId = str5;
        this.regenerate = z11;
        this.metadata = map;
    }

    public static /* synthetic */ ChatRunRequest copy$default(ChatRunRequest chatRunRequest, String str, List list, List list2, String str2, String str3, String str4, String str5, boolean z11, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = chatRunRequest.threadId;
        }
        if ((i5 & 2) != 0) {
            list = chatRunRequest.messages;
        }
        if ((i5 & 4) != 0) {
            list2 = chatRunRequest.tools;
        }
        if ((i5 & 8) != 0) {
            str2 = chatRunRequest.sessionId;
        }
        if ((i5 & 16) != 0) {
            str3 = chatRunRequest.modelPreference;
        }
        if ((i5 & 32) != 0) {
            str4 = chatRunRequest.language;
        }
        if ((i5 & 64) != 0) {
            str5 = chatRunRequest.runId;
        }
        if ((i5 & 128) != 0) {
            z11 = chatRunRequest.regenerate;
        }
        if ((i5 & 256) != 0) {
            map = chatRunRequest.metadata;
        }
        boolean z12 = z11;
        Map map2 = map;
        String str6 = str4;
        String str7 = str5;
        String str8 = str3;
        List list3 = list2;
        return chatRunRequest.copy(str, list, list3, str2, str8, str6, str7, z12, map2);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getThreadId() {
        return this.threadId;
    }

    @NotNull
    public final List<ChatRequestMessage> component2() {
        return this.messages;
    }

    @Nullable
    public final List<Map<String, Object>> component3() {
        return this.tools;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getSessionId() {
        return this.sessionId;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getModelPreference() {
        return this.modelPreference;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getLanguage() {
        return this.language;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getRunId() {
        return this.runId;
    }

    /* renamed from: component8, reason: from getter */
    public final boolean getRegenerate() {
        return this.regenerate;
    }

    @Nullable
    public final Map<String, Object> component9() {
        return this.metadata;
    }

    @NotNull
    public final ChatRunRequest copy(@o(name = "threadId") @Nullable String threadId, @NotNull List<ChatRequestMessage> messages, @Nullable List<? extends Map<String, ? extends Object>> tools, @o(name = "sessionId") @Nullable String sessionId, @o(name = "modelPreference") @Nullable String modelPreference, @Nullable String language, @o(name = "runId") @Nullable String runId, boolean regenerate, @Nullable Map<String, ? extends Object> metadata) {
        Intrinsics.g(messages, "messages");
        return new ChatRunRequest(threadId, messages, tools, sessionId, modelPreference, language, runId, regenerate, metadata);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ChatRunRequest)) {
            return false;
        }
        ChatRunRequest chatRunRequest = (ChatRunRequest) other;
        return Intrinsics.b(this.threadId, chatRunRequest.threadId) && Intrinsics.b(this.messages, chatRunRequest.messages) && Intrinsics.b(this.tools, chatRunRequest.tools) && Intrinsics.b(this.sessionId, chatRunRequest.sessionId) && Intrinsics.b(this.modelPreference, chatRunRequest.modelPreference) && Intrinsics.b(this.language, chatRunRequest.language) && Intrinsics.b(this.runId, chatRunRequest.runId) && this.regenerate == chatRunRequest.regenerate && Intrinsics.b(this.metadata, chatRunRequest.metadata);
    }

    @Nullable
    public final String getLanguage() {
        return this.language;
    }

    @NotNull
    public final List<ChatRequestMessage> getMessages() {
        return this.messages;
    }

    @Nullable
    public final Map<String, Object> getMetadata() {
        return this.metadata;
    }

    @Nullable
    public final String getModelPreference() {
        return this.modelPreference;
    }

    public final boolean getRegenerate() {
        return this.regenerate;
    }

    @Nullable
    public final String getRunId() {
        return this.runId;
    }

    @Nullable
    public final String getSessionId() {
        return this.sessionId;
    }

    @Nullable
    public final String getThreadId() {
        return this.threadId;
    }

    @Nullable
    public final List<Map<String, Object>> getTools() {
        return this.tools;
    }

    public int hashCode() {
        String str = this.threadId;
        int iC = u4.c((str == null ? 0 : str.hashCode()) * 31, 31, this.messages);
        List<Map<String, Object>> list = this.tools;
        int iHashCode = (iC + (list == null ? 0 : list.hashCode())) * 31;
        String str2 = this.sessionId;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.modelPreference;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.language;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.runId;
        int iF = c9.f((iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.regenerate);
        Map<String, Object> map = this.metadata;
        return iF + (map != null ? map.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ChatRunRequest(threadId=");
        sb2.append(this.threadId);
        sb2.append(", messages=");
        sb2.append(this.messages);
        sb2.append(", tools=");
        sb2.append(this.tools);
        sb2.append(", sessionId=");
        sb2.append(this.sessionId);
        sb2.append(", modelPreference=");
        sb2.append(this.modelPreference);
        sb2.append(", language=");
        sb2.append(this.language);
        sb2.append(", runId=");
        sb2.append(this.runId);
        sb2.append(", regenerate=");
        sb2.append(this.regenerate);
        sb2.append(", metadata=");
        return c9.l(sb2, this.metadata, ')');
    }

    public /* synthetic */ ChatRunRequest(String str, List list, List list2, String str2, String str3, String str4, String str5, boolean z11, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, list, list2, str2, (i5 & 16) != 0 ? null : str3, (i5 & 32) != 0 ? null : str4, (i5 & 64) != 0 ? null : str5, (i5 & 128) != 0 ? false : z11, (i5 & 256) != 0 ? null : map);
    }
}
