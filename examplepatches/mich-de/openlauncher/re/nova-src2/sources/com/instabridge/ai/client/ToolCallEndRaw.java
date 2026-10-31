package com.instabridge.ai.client;

import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import h6.c1;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001BG\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0001\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\u0016\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0019\u0010\u0015\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003JO\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u00032\u0018\b\u0002\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\fR!\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\f¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/client/ToolCallEndRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolCallId", "toolCallName", "result", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "error", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V", "getType", "()Ljava/lang/String;", "getToolCallId", "getToolCallName", "getResult", "()Ljava/util/Map;", "getError", "component1", "component2", "component3", "component4", "component5", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ToolCallEndRaw {

    @Nullable
    private final String error;

    @Nullable
    private final Map<String, Object> result;

    @NotNull
    private final String toolCallId;

    @Nullable
    private final String toolCallName;

    @NotNull
    private final String type;

    public ToolCallEndRaw(@NotNull String type, @o(name = "toolCallId") @NotNull String toolCallId, @o(name = "toolCallName") @Nullable String str, @Nullable Map<String, ? extends Object> map, @Nullable String str2) {
        Intrinsics.g(type, "type");
        Intrinsics.g(toolCallId, "toolCallId");
        this.type = type;
        this.toolCallId = toolCallId;
        this.toolCallName = str;
        this.result = map;
        this.error = str2;
    }

    public static /* synthetic */ ToolCallEndRaw copy$default(ToolCallEndRaw toolCallEndRaw, String str, String str2, String str3, Map map, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = toolCallEndRaw.type;
        }
        if ((i5 & 2) != 0) {
            str2 = toolCallEndRaw.toolCallId;
        }
        if ((i5 & 4) != 0) {
            str3 = toolCallEndRaw.toolCallName;
        }
        if ((i5 & 8) != 0) {
            map = toolCallEndRaw.result;
        }
        if ((i5 & 16) != 0) {
            str4 = toolCallEndRaw.error;
        }
        String str5 = str4;
        String str6 = str3;
        return toolCallEndRaw.copy(str, str2, str6, map, str5);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getToolCallName() {
        return this.toolCallName;
    }

    @Nullable
    public final Map<String, Object> component4() {
        return this.result;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getError() {
        return this.error;
    }

    @NotNull
    public final ToolCallEndRaw copy(@NotNull String type, @o(name = "toolCallId") @NotNull String toolCallId, @o(name = "toolCallName") @Nullable String toolCallName, @Nullable Map<String, ? extends Object> result, @Nullable String error) {
        Intrinsics.g(type, "type");
        Intrinsics.g(toolCallId, "toolCallId");
        return new ToolCallEndRaw(type, toolCallId, toolCallName, result, error);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolCallEndRaw)) {
            return false;
        }
        ToolCallEndRaw toolCallEndRaw = (ToolCallEndRaw) other;
        return Intrinsics.b(this.type, toolCallEndRaw.type) && Intrinsics.b(this.toolCallId, toolCallEndRaw.toolCallId) && Intrinsics.b(this.toolCallName, toolCallEndRaw.toolCallName) && Intrinsics.b(this.result, toolCallEndRaw.result) && Intrinsics.b(this.error, toolCallEndRaw.error);
    }

    @Nullable
    public final String getError() {
        return this.error;
    }

    @Nullable
    public final Map<String, Object> getResult() {
        return this.result;
    }

    @NotNull
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @Nullable
    public final String getToolCallName() {
        return this.toolCallName;
    }

    @NotNull
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        int iE = c0.e(this.type.hashCode() * 31, 31, this.toolCallId);
        String str = this.toolCallName;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        Map<String, Object> map = this.result;
        int iHashCode2 = (iHashCode + (map == null ? 0 : map.hashCode())) * 31;
        String str2 = this.error;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ToolCallEndRaw(type=");
        sb2.append(this.type);
        sb2.append(", toolCallId=");
        sb2.append(this.toolCallId);
        sb2.append(", toolCallName=");
        sb2.append(this.toolCallName);
        sb2.append(", result=");
        sb2.append(this.result);
        sb2.append(", error=");
        return c1.t(sb2, this.error, ')');
    }
}
