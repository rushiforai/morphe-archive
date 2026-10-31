package com.instabridge.ai.context.collectors;

import a2.c;
import b.c0;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0012\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0014\u001a\u00020\bHÆ\u0003J1\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0016\u001a\u00020\u00062\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\bHÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/context/collectors/RecentMessage;", b.f42142b, "contactName", b.f42142b, "snippet", "isIncoming", b.f42142b, "hoursAgo", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;ZI)V", "getContactName", "()Ljava/lang/String;", "getSnippet", "()Z", "getHoursAgo", "()I", "component1", "component2", "component3", "component4", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class RecentMessage {
    public static final int $stable = 0;

    @NotNull
    private final String contactName;
    private final int hoursAgo;
    private final boolean isIncoming;

    @NotNull
    private final String snippet;

    public RecentMessage(@NotNull String contactName, @NotNull String snippet, boolean z11, int i5) {
        Intrinsics.g(contactName, "contactName");
        Intrinsics.g(snippet, "snippet");
        this.contactName = contactName;
        this.snippet = snippet;
        this.isIncoming = z11;
        this.hoursAgo = i5;
    }

    public static /* synthetic */ RecentMessage copy$default(RecentMessage recentMessage, String str, String str2, boolean z11, int i5, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = recentMessage.contactName;
        }
        if ((i11 & 2) != 0) {
            str2 = recentMessage.snippet;
        }
        if ((i11 & 4) != 0) {
            z11 = recentMessage.isIncoming;
        }
        if ((i11 & 8) != 0) {
            i5 = recentMessage.hoursAgo;
        }
        return recentMessage.copy(str, str2, z11, i5);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getContactName() {
        return this.contactName;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getSnippet() {
        return this.snippet;
    }

    /* renamed from: component3, reason: from getter */
    public final boolean getIsIncoming() {
        return this.isIncoming;
    }

    /* renamed from: component4, reason: from getter */
    public final int getHoursAgo() {
        return this.hoursAgo;
    }

    @NotNull
    public final RecentMessage copy(@NotNull String contactName, @NotNull String snippet, boolean isIncoming, int hoursAgo) {
        Intrinsics.g(contactName, "contactName");
        Intrinsics.g(snippet, "snippet");
        return new RecentMessage(contactName, snippet, isIncoming, hoursAgo);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RecentMessage)) {
            return false;
        }
        RecentMessage recentMessage = (RecentMessage) other;
        return Intrinsics.b(this.contactName, recentMessage.contactName) && Intrinsics.b(this.snippet, recentMessage.snippet) && this.isIncoming == recentMessage.isIncoming && this.hoursAgo == recentMessage.hoursAgo;
    }

    @NotNull
    public final String getContactName() {
        return this.contactName;
    }

    public final int getHoursAgo() {
        return this.hoursAgo;
    }

    @NotNull
    public final String getSnippet() {
        return this.snippet;
    }

    public int hashCode() {
        return Integer.hashCode(this.hoursAgo) + c9.f(c0.e(this.contactName.hashCode() * 31, 31, this.snippet), 31, this.isIncoming);
    }

    public final boolean isIncoming() {
        return this.isIncoming;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("RecentMessage(contactName=");
        sb2.append(this.contactName);
        sb2.append(", snippet=");
        sb2.append(this.snippet);
        sb2.append(", isIncoming=");
        sb2.append(this.isIncoming);
        sb2.append(", hoursAgo=");
        return c.m(sb2, this.hoursAgo, ')');
    }
}
