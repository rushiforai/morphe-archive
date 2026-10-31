package com.instabridge.ai.tools;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B+\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J/\u0010\u0012\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/tools/ToolRegistrationRequest;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sessionId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appId", "tools", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/tools/ToolDefinitionApi;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "getSessionId", "()Ljava/lang/String;", "getAppId", "getTools", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ToolRegistrationRequest {
    public static final int $stable = 8;

    @Nullable
    private final String appId;

    @NotNull
    private final String sessionId;

    @NotNull
    private final List<ToolDefinitionApi> tools;

    public ToolRegistrationRequest(@o(name = SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID) @NotNull String sessionId, @o(name = "app_id") @Nullable String str, @NotNull List<ToolDefinitionApi> tools) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(tools, "tools");
        this.sessionId = sessionId;
        this.appId = str;
        this.tools = tools;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ToolRegistrationRequest copy$default(ToolRegistrationRequest toolRegistrationRequest, String str, String str2, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = toolRegistrationRequest.sessionId;
        }
        if ((i5 & 2) != 0) {
            str2 = toolRegistrationRequest.appId;
        }
        if ((i5 & 4) != 0) {
            list = toolRegistrationRequest.tools;
        }
        return toolRegistrationRequest.copy(str, str2, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getSessionId() {
        return this.sessionId;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getAppId() {
        return this.appId;
    }

    @NotNull
    public final List<ToolDefinitionApi> component3() {
        return this.tools;
    }

    @NotNull
    public final ToolRegistrationRequest copy(@o(name = SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID) @NotNull String sessionId, @o(name = "app_id") @Nullable String appId, @NotNull List<ToolDefinitionApi> tools) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(tools, "tools");
        return new ToolRegistrationRequest(sessionId, appId, tools);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolRegistrationRequest)) {
            return false;
        }
        ToolRegistrationRequest toolRegistrationRequest = (ToolRegistrationRequest) other;
        return Intrinsics.b(this.sessionId, toolRegistrationRequest.sessionId) && Intrinsics.b(this.appId, toolRegistrationRequest.appId) && Intrinsics.b(this.tools, toolRegistrationRequest.tools);
    }

    @Nullable
    public final String getAppId() {
        return this.appId;
    }

    @NotNull
    public final String getSessionId() {
        return this.sessionId;
    }

    @NotNull
    public final List<ToolDefinitionApi> getTools() {
        return this.tools;
    }

    public int hashCode() {
        int iHashCode = this.sessionId.hashCode() * 31;
        String str = this.appId;
        return this.tools.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ToolRegistrationRequest(sessionId=");
        sb2.append(this.sessionId);
        sb2.append(", appId=");
        sb2.append(this.appId);
        sb2.append(", tools=");
        return fq.c.e(sb2, this.tools, ')');
    }
}
