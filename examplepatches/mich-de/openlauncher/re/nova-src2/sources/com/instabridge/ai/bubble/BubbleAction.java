package com.instabridge.ai.bubble;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import x8.h;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B?\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0016\b\u0003\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0017\u0010\u0012\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0003JC\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u0016\b\u0003\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u001f\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000b¨\u0006\u001b"}, d2 = {"Lcom/instabridge/ai/bubble/BubbleAction;", b.f42142b, "label", b.f42142b, "toolName", "toolArgs", b.f42142b, "query", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V", "getLabel", "()Ljava/lang/String;", "getToolName", "getToolArgs", "()Ljava/util/Map;", "getQuery", "component1", "component2", "component3", "component4", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class BubbleAction {
    public static final int $stable = 8;

    @NotNull
    private final String label;

    @Nullable
    private final String query;

    @NotNull
    private final Map<String, Object> toolArgs;

    @Nullable
    private final String toolName;

    public BubbleAction(@NotNull String label, @o(name = "tool_name") @Nullable String str, @o(name = "tool_args") @NotNull Map<String, ? extends Object> toolArgs, @Nullable String str2) {
        Intrinsics.g(label, "label");
        Intrinsics.g(toolArgs, "toolArgs");
        this.label = label;
        this.toolName = str;
        this.toolArgs = toolArgs;
        this.query = str2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ BubbleAction copy$default(BubbleAction bubbleAction, String str, String str2, Map map, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = bubbleAction.label;
        }
        if ((i5 & 2) != 0) {
            str2 = bubbleAction.toolName;
        }
        if ((i5 & 4) != 0) {
            map = bubbleAction.toolArgs;
        }
        if ((i5 & 8) != 0) {
            str3 = bubbleAction.query;
        }
        return bubbleAction.copy(str, str2, map, str3);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getLabel() {
        return this.label;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getToolName() {
        return this.toolName;
    }

    @NotNull
    public final Map<String, Object> component3() {
        return this.toolArgs;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getQuery() {
        return this.query;
    }

    @NotNull
    public final BubbleAction copy(@NotNull String label, @o(name = "tool_name") @Nullable String toolName, @o(name = "tool_args") @NotNull Map<String, ? extends Object> toolArgs, @Nullable String query) {
        Intrinsics.g(label, "label");
        Intrinsics.g(toolArgs, "toolArgs");
        return new BubbleAction(label, toolName, toolArgs, query);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BubbleAction)) {
            return false;
        }
        BubbleAction bubbleAction = (BubbleAction) other;
        return Intrinsics.b(this.label, bubbleAction.label) && Intrinsics.b(this.toolName, bubbleAction.toolName) && Intrinsics.b(this.toolArgs, bubbleAction.toolArgs) && Intrinsics.b(this.query, bubbleAction.query);
    }

    @NotNull
    public final String getLabel() {
        return this.label;
    }

    @Nullable
    public final String getQuery() {
        return this.query;
    }

    @NotNull
    public final Map<String, Object> getToolArgs() {
        return this.toolArgs;
    }

    @Nullable
    public final String getToolName() {
        return this.toolName;
    }

    public int hashCode() {
        int iHashCode = this.label.hashCode() * 31;
        String str = this.toolName;
        int iC = h.c(this.toolArgs, (iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31);
        String str2 = this.query;
        return iC + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BubbleAction(label=");
        sb2.append(this.label);
        sb2.append(", toolName=");
        sb2.append(this.toolName);
        sb2.append(", toolArgs=");
        sb2.append(this.toolArgs);
        sb2.append(", query=");
        return c1.t(sb2, this.query, ')');
    }

    public /* synthetic */ BubbleAction(String str, String str2, Map map, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? b70.h.f17594a : map, (i5 & 8) != 0 ? null : str3);
    }
}
