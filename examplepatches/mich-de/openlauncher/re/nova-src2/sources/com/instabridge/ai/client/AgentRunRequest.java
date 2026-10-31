package com.instabridge.ai.client;

import aq.o;
import b.c9;
import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import h6.c1;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\b\u001d\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B\u0095\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0010\b\u0003\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\b\u0012\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\u0018\b\u0002\u0010\f\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\r\u0012\u001e\b\u0002\u0010\u000e\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\r\u0018\u00010\b\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0005HÆ\u0003J\u000b\u0010 \u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0011\u0010!\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\bHÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0019\u0010$\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\rHÆ\u0003J\u001f\u0010%\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\r\u0018\u00010\bHÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0099\u0001\u0010'\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00052\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u00032\u0010\b\u0003\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\b2\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u000b\u001a\u0004\u0018\u00010\u00032\u0018\b\u0002\u0010\f\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\r2\u001e\b\u0002\u0010\u000e\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\r\u0018\u00010\b2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010(\u001a\u00020\u00052\b\u0010)\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010*\u001a\u00020+HÖ\u0001J\t\u0010,\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u0014R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0013R\u0019\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\n\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0013R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0013R!\u0010\f\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR'\u0010\u000e\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\r\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0017R\u0013\u0010\u000f\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0013¨\u0006-"}, d2 = {"Lcom/instabridge/ai/client/AgentRunRequest;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "query", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isChat", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sessionId", "conversationHistory", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/client/ToolResultMessage;", "threadId", "runId", "metadata", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tools", TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, "<init>", "(Ljava/lang/String;ZLjava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;Ljava/lang/String;)V", "getQuery", "()Ljava/lang/String;", "()Z", "getSessionId", "getConversationHistory", "()Ljava/util/List;", "getThreadId", "getRunId", "getMetadata", "()Ljava/util/Map;", "getTools", "getLanguage", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class AgentRunRequest {

    @Nullable
    private final List<ToolResultMessage> conversationHistory;
    private final boolean isChat;

    @Nullable
    private final String language;

    @Nullable
    private final Map<String, Object> metadata;

    @NotNull
    private final String query;

    @Nullable
    private final String runId;

    @Nullable
    private final String sessionId;

    @Nullable
    private final String threadId;

    @Nullable
    private final List<Map<String, Object>> tools;

    /* JADX WARN: Multi-variable type inference failed */
    public AgentRunRequest(@NotNull String query, @o(name = "is_chat") boolean z11, @o(name = SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID) @Nullable String str, @o(name = "conversation_history") @Nullable List<ToolResultMessage> list, @o(name = "thread_id") @Nullable String str2, @o(name = "run_id") @Nullable String str3, @Nullable Map<String, ? extends Object> map, @Nullable List<? extends Map<String, ? extends Object>> list2, @Nullable String str4) {
        Intrinsics.g(query, "query");
        this.query = query;
        this.isChat = z11;
        this.sessionId = str;
        this.conversationHistory = list;
        this.threadId = str2;
        this.runId = str3;
        this.metadata = map;
        this.tools = list2;
        this.language = str4;
    }

    public static /* synthetic */ AgentRunRequest copy$default(AgentRunRequest agentRunRequest, String str, boolean z11, String str2, List list, String str3, String str4, Map map, List list2, String str5, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = agentRunRequest.query;
        }
        if ((i5 & 2) != 0) {
            z11 = agentRunRequest.isChat;
        }
        if ((i5 & 4) != 0) {
            str2 = agentRunRequest.sessionId;
        }
        if ((i5 & 8) != 0) {
            list = agentRunRequest.conversationHistory;
        }
        if ((i5 & 16) != 0) {
            str3 = agentRunRequest.threadId;
        }
        if ((i5 & 32) != 0) {
            str4 = agentRunRequest.runId;
        }
        if ((i5 & 64) != 0) {
            map = agentRunRequest.metadata;
        }
        if ((i5 & 128) != 0) {
            list2 = agentRunRequest.tools;
        }
        if ((i5 & 256) != 0) {
            str5 = agentRunRequest.language;
        }
        List list3 = list2;
        String str6 = str5;
        String str7 = str4;
        Map map2 = map;
        String str8 = str3;
        String str9 = str2;
        return agentRunRequest.copy(str, z11, str9, list, str8, str7, map2, list3, str6);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getQuery() {
        return this.query;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getIsChat() {
        return this.isChat;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getSessionId() {
        return this.sessionId;
    }

    @Nullable
    public final List<ToolResultMessage> component4() {
        return this.conversationHistory;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getThreadId() {
        return this.threadId;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getRunId() {
        return this.runId;
    }

    @Nullable
    public final Map<String, Object> component7() {
        return this.metadata;
    }

    @Nullable
    public final List<Map<String, Object>> component8() {
        return this.tools;
    }

    @Nullable
    /* renamed from: component9, reason: from getter */
    public final String getLanguage() {
        return this.language;
    }

    @NotNull
    public final AgentRunRequest copy(@NotNull String query, @o(name = "is_chat") boolean isChat, @o(name = SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID) @Nullable String sessionId, @o(name = "conversation_history") @Nullable List<ToolResultMessage> conversationHistory, @o(name = "thread_id") @Nullable String threadId, @o(name = "run_id") @Nullable String runId, @Nullable Map<String, ? extends Object> metadata, @Nullable List<? extends Map<String, ? extends Object>> tools, @Nullable String language) {
        Intrinsics.g(query, "query");
        return new AgentRunRequest(query, isChat, sessionId, conversationHistory, threadId, runId, metadata, tools, language);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AgentRunRequest)) {
            return false;
        }
        AgentRunRequest agentRunRequest = (AgentRunRequest) other;
        return Intrinsics.b(this.query, agentRunRequest.query) && this.isChat == agentRunRequest.isChat && Intrinsics.b(this.sessionId, agentRunRequest.sessionId) && Intrinsics.b(this.conversationHistory, agentRunRequest.conversationHistory) && Intrinsics.b(this.threadId, agentRunRequest.threadId) && Intrinsics.b(this.runId, agentRunRequest.runId) && Intrinsics.b(this.metadata, agentRunRequest.metadata) && Intrinsics.b(this.tools, agentRunRequest.tools) && Intrinsics.b(this.language, agentRunRequest.language);
    }

    @Nullable
    public final List<ToolResultMessage> getConversationHistory() {
        return this.conversationHistory;
    }

    @Nullable
    public final String getLanguage() {
        return this.language;
    }

    @Nullable
    public final Map<String, Object> getMetadata() {
        return this.metadata;
    }

    @NotNull
    public final String getQuery() {
        return this.query;
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
        int iF = c9.f(this.query.hashCode() * 31, 31, this.isChat);
        String str = this.sessionId;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        List<ToolResultMessage> list = this.conversationHistory;
        int iHashCode2 = (iHashCode + (list == null ? 0 : list.hashCode())) * 31;
        String str2 = this.threadId;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.runId;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Map<String, Object> map = this.metadata;
        int iHashCode5 = (iHashCode4 + (map == null ? 0 : map.hashCode())) * 31;
        List<Map<String, Object>> list2 = this.tools;
        int iHashCode6 = (iHashCode5 + (list2 == null ? 0 : list2.hashCode())) * 31;
        String str4 = this.language;
        return iHashCode6 + (str4 != null ? str4.hashCode() : 0);
    }

    public final boolean isChat() {
        return this.isChat;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AgentRunRequest(query=");
        sb2.append(this.query);
        sb2.append(", isChat=");
        sb2.append(this.isChat);
        sb2.append(", sessionId=");
        sb2.append(this.sessionId);
        sb2.append(", conversationHistory=");
        sb2.append(this.conversationHistory);
        sb2.append(", threadId=");
        sb2.append(this.threadId);
        sb2.append(", runId=");
        sb2.append(this.runId);
        sb2.append(", metadata=");
        sb2.append(this.metadata);
        sb2.append(", tools=");
        sb2.append(this.tools);
        sb2.append(", language=");
        return c1.t(sb2, this.language, ')');
    }

    public /* synthetic */ AgentRunRequest(String str, boolean z11, String str2, List list, String str3, String str4, Map map, List list2, String str5, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, z11, (i5 & 4) != 0 ? null : str2, (i5 & 8) != 0 ? null : list, (i5 & 16) != 0 ? null : str3, (i5 & 32) != 0 ? null : str4, (i5 & 64) != 0 ? null : map, (i5 & 128) != 0 ? null : list2, (i5 & 256) != 0 ? null : str5);
    }
}
