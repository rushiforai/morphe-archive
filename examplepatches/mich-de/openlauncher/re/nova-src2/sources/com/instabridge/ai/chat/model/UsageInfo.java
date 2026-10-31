package com.instabridge.ai.chat.model;

import a2.c;
import aq.o;
import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u001d\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B_\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0006\u001a\u00020\u0007\u0012\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0003\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0007HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u0010\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0016J\u0010\u0010 \u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0016J\u0010\u0010!\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0016Jf\u0010\"\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\b\b\u0003\u0010\u0005\u001a\u00020\u00032\b\b\u0003\u0010\u0006\u001a\u00020\u00072\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0003\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010#J\u0013\u0010$\u001a\u00020%2\b\u0010&\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010'\u001a\u00020\u0003HÖ\u0001J\t\u0010(\u001a\u00020\u0007HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0013R\u0015\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0015\u0010\u0016R\u0015\u0010\n\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0018\u0010\u0016R\u0015\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0019\u0010\u0016¨\u0006)"}, d2 = {"Lcom/instabridge/ai/chat/model/UsageInfo;", b.f42142b, "messagesUsed", b.f42142b, "messagesLimit", "messagesRemaining", "resetsIn", b.f42142b, "product", "agentRunsUsed", "agentRunsLimit", "agentRunsRemaining", "<init>", "(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V", "getMessagesUsed", "()I", "getMessagesLimit", "getMessagesRemaining", "getResetsIn", "()Ljava/lang/String;", "getProduct", "getAgentRunsUsed", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getAgentRunsLimit", "getAgentRunsRemaining", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/instabridge/ai/chat/model/UsageInfo;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class UsageInfo {
    public static final int $stable = 0;

    @Nullable
    private final Integer agentRunsLimit;

    @Nullable
    private final Integer agentRunsRemaining;

    @Nullable
    private final Integer agentRunsUsed;
    private final int messagesLimit;
    private final int messagesRemaining;
    private final int messagesUsed;

    @Nullable
    private final String product;

    @NotNull
    private final String resetsIn;

    public UsageInfo(@o(name = "messages_used") int i5, @o(name = "messages_limit") int i11, @o(name = "messages_remaining") int i12, @o(name = "resets_in") @NotNull String resetsIn, @o(name = "product") @Nullable String str, @o(name = "agent_runs_used") @Nullable Integer num, @o(name = "agent_runs_limit") @Nullable Integer num2, @o(name = "agent_runs_remaining") @Nullable Integer num3) {
        Intrinsics.g(resetsIn, "resetsIn");
        this.messagesUsed = i5;
        this.messagesLimit = i11;
        this.messagesRemaining = i12;
        this.resetsIn = resetsIn;
        this.product = str;
        this.agentRunsUsed = num;
        this.agentRunsLimit = num2;
        this.agentRunsRemaining = num3;
    }

    public static /* synthetic */ UsageInfo copy$default(UsageInfo usageInfo, int i5, int i11, int i12, String str, String str2, Integer num, Integer num2, Integer num3, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            i5 = usageInfo.messagesUsed;
        }
        if ((i13 & 2) != 0) {
            i11 = usageInfo.messagesLimit;
        }
        if ((i13 & 4) != 0) {
            i12 = usageInfo.messagesRemaining;
        }
        if ((i13 & 8) != 0) {
            str = usageInfo.resetsIn;
        }
        if ((i13 & 16) != 0) {
            str2 = usageInfo.product;
        }
        if ((i13 & 32) != 0) {
            num = usageInfo.agentRunsUsed;
        }
        if ((i13 & 64) != 0) {
            num2 = usageInfo.agentRunsLimit;
        }
        if ((i13 & 128) != 0) {
            num3 = usageInfo.agentRunsRemaining;
        }
        Integer num4 = num2;
        Integer num5 = num3;
        String str3 = str2;
        Integer num6 = num;
        return usageInfo.copy(i5, i11, i12, str, str3, num6, num4, num5);
    }

    /* renamed from: component1, reason: from getter */
    public final int getMessagesUsed() {
        return this.messagesUsed;
    }

    /* renamed from: component2, reason: from getter */
    public final int getMessagesLimit() {
        return this.messagesLimit;
    }

    /* renamed from: component3, reason: from getter */
    public final int getMessagesRemaining() {
        return this.messagesRemaining;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getResetsIn() {
        return this.resetsIn;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getProduct() {
        return this.product;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final Integer getAgentRunsUsed() {
        return this.agentRunsUsed;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final Integer getAgentRunsLimit() {
        return this.agentRunsLimit;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final Integer getAgentRunsRemaining() {
        return this.agentRunsRemaining;
    }

    @NotNull
    public final UsageInfo copy(@o(name = "messages_used") int messagesUsed, @o(name = "messages_limit") int messagesLimit, @o(name = "messages_remaining") int messagesRemaining, @o(name = "resets_in") @NotNull String resetsIn, @o(name = "product") @Nullable String product, @o(name = "agent_runs_used") @Nullable Integer agentRunsUsed, @o(name = "agent_runs_limit") @Nullable Integer agentRunsLimit, @o(name = "agent_runs_remaining") @Nullable Integer agentRunsRemaining) {
        Intrinsics.g(resetsIn, "resetsIn");
        return new UsageInfo(messagesUsed, messagesLimit, messagesRemaining, resetsIn, product, agentRunsUsed, agentRunsLimit, agentRunsRemaining);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UsageInfo)) {
            return false;
        }
        UsageInfo usageInfo = (UsageInfo) other;
        return this.messagesUsed == usageInfo.messagesUsed && this.messagesLimit == usageInfo.messagesLimit && this.messagesRemaining == usageInfo.messagesRemaining && Intrinsics.b(this.resetsIn, usageInfo.resetsIn) && Intrinsics.b(this.product, usageInfo.product) && Intrinsics.b(this.agentRunsUsed, usageInfo.agentRunsUsed) && Intrinsics.b(this.agentRunsLimit, usageInfo.agentRunsLimit) && Intrinsics.b(this.agentRunsRemaining, usageInfo.agentRunsRemaining);
    }

    @Nullable
    public final Integer getAgentRunsLimit() {
        return this.agentRunsLimit;
    }

    @Nullable
    public final Integer getAgentRunsRemaining() {
        return this.agentRunsRemaining;
    }

    @Nullable
    public final Integer getAgentRunsUsed() {
        return this.agentRunsUsed;
    }

    public final int getMessagesLimit() {
        return this.messagesLimit;
    }

    public final int getMessagesRemaining() {
        return this.messagesRemaining;
    }

    public final int getMessagesUsed() {
        return this.messagesUsed;
    }

    @Nullable
    public final String getProduct() {
        return this.product;
    }

    @NotNull
    public final String getResetsIn() {
        return this.resetsIn;
    }

    public int hashCode() {
        int iE = c0.e(u4.a(this.messagesRemaining, u4.a(this.messagesLimit, Integer.hashCode(this.messagesUsed) * 31, 31), 31), 31, this.resetsIn);
        String str = this.product;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.agentRunsUsed;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.agentRunsLimit;
        int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.agentRunsRemaining;
        return iHashCode3 + (num3 != null ? num3.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("UsageInfo(messagesUsed=");
        sb2.append(this.messagesUsed);
        sb2.append(", messagesLimit=");
        sb2.append(this.messagesLimit);
        sb2.append(", messagesRemaining=");
        sb2.append(this.messagesRemaining);
        sb2.append(", resetsIn=");
        sb2.append(this.resetsIn);
        sb2.append(", product=");
        sb2.append(this.product);
        sb2.append(", agentRunsUsed=");
        sb2.append(this.agentRunsUsed);
        sb2.append(", agentRunsLimit=");
        sb2.append(this.agentRunsLimit);
        sb2.append(", agentRunsRemaining=");
        return c.o(sb2, this.agentRunsRemaining, ')');
    }

    public /* synthetic */ UsageInfo(int i5, int i11, int i12, String str, String str2, Integer num, Integer num2, Integer num3, int i13, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, i11, i12, str, (i13 & 16) != 0 ? null : str2, (i13 & 32) != 0 ? null : num, (i13 & 64) != 0 ? null : num2, (i13 & 128) != 0 ? null : num3);
    }
}
