package com.instabridge.ai.tools;

import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0007HÆ\u0003J-\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0007HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/tools/ToolRegistrationSnapshot;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sessionId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolIds", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "version", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/util/List;I)V", "getSessionId", "()Ljava/lang/String;", "getToolIds", "()Ljava/util/List;", "getVersion", "()I", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ToolRegistrationSnapshot {
    public static final int CURRENT_VERSION = 1;

    @NotNull
    private final String sessionId;

    @NotNull
    private final List<String> toolIds;
    private final int version;
    public static final int $stable = 8;

    public ToolRegistrationSnapshot(@NotNull String sessionId, @NotNull List<String> toolIds, int i5) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(toolIds, "toolIds");
        this.sessionId = sessionId;
        this.toolIds = toolIds;
        this.version = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ToolRegistrationSnapshot copy$default(ToolRegistrationSnapshot toolRegistrationSnapshot, String str, List list, int i5, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = toolRegistrationSnapshot.sessionId;
        }
        if ((i11 & 2) != 0) {
            list = toolRegistrationSnapshot.toolIds;
        }
        if ((i11 & 4) != 0) {
            i5 = toolRegistrationSnapshot.version;
        }
        return toolRegistrationSnapshot.copy(str, list, i5);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getSessionId() {
        return this.sessionId;
    }

    @NotNull
    public final List<String> component2() {
        return this.toolIds;
    }

    /* renamed from: component3, reason: from getter */
    public final int getVersion() {
        return this.version;
    }

    @NotNull
    public final ToolRegistrationSnapshot copy(@NotNull String sessionId, @NotNull List<String> toolIds, int version) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(toolIds, "toolIds");
        return new ToolRegistrationSnapshot(sessionId, toolIds, version);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolRegistrationSnapshot)) {
            return false;
        }
        ToolRegistrationSnapshot toolRegistrationSnapshot = (ToolRegistrationSnapshot) other;
        return Intrinsics.b(this.sessionId, toolRegistrationSnapshot.sessionId) && Intrinsics.b(this.toolIds, toolRegistrationSnapshot.toolIds) && this.version == toolRegistrationSnapshot.version;
    }

    @NotNull
    public final String getSessionId() {
        return this.sessionId;
    }

    @NotNull
    public final List<String> getToolIds() {
        return this.toolIds;
    }

    public final int getVersion() {
        return this.version;
    }

    public int hashCode() {
        return Integer.hashCode(this.version) + u4.c(this.sessionId.hashCode() * 31, 31, this.toolIds);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ToolRegistrationSnapshot(sessionId=");
        sb2.append(this.sessionId);
        sb2.append(", toolIds=");
        sb2.append(this.toolIds);
        sb2.append(", version=");
        return a2.c.m(sb2, this.version, ')');
    }

    public /* synthetic */ ToolRegistrationSnapshot(String str, List list, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, list, (i11 & 4) != 0 ? 1 : i5);
    }
}
