package com.instabridge.ai.proactive;

import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0001\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00052\b\b\u0003\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/proactive/AiTriggeredQuery;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lead", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "expiresAt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "triggerEvent", "<init>", "(Ljava/lang/String;JLjava/lang/String;)V", "getLead", "()Ljava/lang/String;", "getExpiresAt", "()J", "getTriggerEvent", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class AiTriggeredQuery {
    public static final int $stable = 0;
    private final long expiresAt;

    @NotNull
    private final String lead;

    @NotNull
    private final String triggerEvent;

    public AiTriggeredQuery(@NotNull String lead, @o(name = "expires_at") long j11, @o(name = AiDatabase.COL_TQ_TRIGGER_EVENT) @NotNull String triggerEvent) {
        Intrinsics.g(lead, "lead");
        Intrinsics.g(triggerEvent, "triggerEvent");
        this.lead = lead;
        this.expiresAt = j11;
        this.triggerEvent = triggerEvent;
    }

    public static /* synthetic */ AiTriggeredQuery copy$default(AiTriggeredQuery aiTriggeredQuery, String str, long j11, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = aiTriggeredQuery.lead;
        }
        if ((i5 & 2) != 0) {
            j11 = aiTriggeredQuery.expiresAt;
        }
        if ((i5 & 4) != 0) {
            str2 = aiTriggeredQuery.triggerEvent;
        }
        return aiTriggeredQuery.copy(str, j11, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getLead() {
        return this.lead;
    }

    /* renamed from: component2, reason: from getter */
    public final long getExpiresAt() {
        return this.expiresAt;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getTriggerEvent() {
        return this.triggerEvent;
    }

    @NotNull
    public final AiTriggeredQuery copy(@NotNull String lead, @o(name = "expires_at") long expiresAt, @o(name = AiDatabase.COL_TQ_TRIGGER_EVENT) @NotNull String triggerEvent) {
        Intrinsics.g(lead, "lead");
        Intrinsics.g(triggerEvent, "triggerEvent");
        return new AiTriggeredQuery(lead, expiresAt, triggerEvent);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AiTriggeredQuery)) {
            return false;
        }
        AiTriggeredQuery aiTriggeredQuery = (AiTriggeredQuery) other;
        return Intrinsics.b(this.lead, aiTriggeredQuery.lead) && this.expiresAt == aiTriggeredQuery.expiresAt && Intrinsics.b(this.triggerEvent, aiTriggeredQuery.triggerEvent);
    }

    public final long getExpiresAt() {
        return this.expiresAt;
    }

    @NotNull
    public final String getLead() {
        return this.lead;
    }

    @NotNull
    public final String getTriggerEvent() {
        return this.triggerEvent;
    }

    public int hashCode() {
        return this.triggerEvent.hashCode() + c0.d(this.lead.hashCode() * 31, 31, this.expiresAt);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AiTriggeredQuery(lead=");
        sb2.append(this.lead);
        sb2.append(", expiresAt=");
        sb2.append(this.expiresAt);
        sb2.append(", triggerEvent=");
        return c1.t(sb2, this.triggerEvent, ')');
    }
}
