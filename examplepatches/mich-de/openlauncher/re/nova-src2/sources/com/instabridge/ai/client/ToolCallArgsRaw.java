package com.instabridge.ai.client;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J7\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/client/ToolCallArgsRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolCallId", "args", "delta", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getType", "()Ljava/lang/String;", "getToolCallId", "getArgs", "getDelta", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ToolCallArgsRaw {

    @Nullable
    private final String args;

    @Nullable
    private final String delta;

    @Nullable
    private final String toolCallId;

    @NotNull
    private final String type;

    public ToolCallArgsRaw(@NotNull String type, @o(name = "toolCallId") @Nullable String str, @Nullable String str2, @Nullable String str3) {
        Intrinsics.g(type, "type");
        this.type = type;
        this.toolCallId = str;
        this.args = str2;
        this.delta = str3;
    }

    public static /* synthetic */ ToolCallArgsRaw copy$default(ToolCallArgsRaw toolCallArgsRaw, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = toolCallArgsRaw.type;
        }
        if ((i5 & 2) != 0) {
            str2 = toolCallArgsRaw.toolCallId;
        }
        if ((i5 & 4) != 0) {
            str3 = toolCallArgsRaw.args;
        }
        if ((i5 & 8) != 0) {
            str4 = toolCallArgsRaw.delta;
        }
        return toolCallArgsRaw.copy(str, str2, str3, str4);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getArgs() {
        return this.args;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getDelta() {
        return this.delta;
    }

    @NotNull
    public final ToolCallArgsRaw copy(@NotNull String type, @o(name = "toolCallId") @Nullable String toolCallId, @Nullable String args, @Nullable String delta) {
        Intrinsics.g(type, "type");
        return new ToolCallArgsRaw(type, toolCallId, args, delta);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolCallArgsRaw)) {
            return false;
        }
        ToolCallArgsRaw toolCallArgsRaw = (ToolCallArgsRaw) other;
        return Intrinsics.b(this.type, toolCallArgsRaw.type) && Intrinsics.b(this.toolCallId, toolCallArgsRaw.toolCallId) && Intrinsics.b(this.args, toolCallArgsRaw.args) && Intrinsics.b(this.delta, toolCallArgsRaw.delta);
    }

    @Nullable
    public final String getArgs() {
        return this.args;
    }

    @Nullable
    public final String getDelta() {
        return this.delta;
    }

    @Nullable
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @NotNull
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        int iHashCode = this.type.hashCode() * 31;
        String str = this.toolCallId;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.args;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.delta;
        return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ToolCallArgsRaw(type=");
        sb2.append(this.type);
        sb2.append(", toolCallId=");
        sb2.append(this.toolCallId);
        sb2.append(", args=");
        sb2.append(this.args);
        sb2.append(", delta=");
        return c1.t(sb2, this.delta, ')');
    }
}
