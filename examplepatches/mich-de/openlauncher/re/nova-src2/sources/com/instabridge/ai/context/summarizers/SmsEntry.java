package com.instabridge.ai.context.summarizers;

import a2.c;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/instabridge/ai/context/summarizers/SmsEntry;", b.f42142b, "contactName", b.f42142b, "messageCount", b.f42142b, "lastMessageDaysAgo", "<init>", "(Ljava/lang/String;II)V", "getContactName", "()Ljava/lang/String;", "getMessageCount", "()I", "getLastMessageDaysAgo", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class SmsEntry {
    public static final int $stable = 0;

    @NotNull
    private final String contactName;
    private final int lastMessageDaysAgo;
    private final int messageCount;

    public SmsEntry(@NotNull String contactName, int i5, int i11) {
        Intrinsics.g(contactName, "contactName");
        this.contactName = contactName;
        this.messageCount = i5;
        this.lastMessageDaysAgo = i11;
    }

    public static /* synthetic */ SmsEntry copy$default(SmsEntry smsEntry, String str, int i5, int i11, int i12, Object obj) {
        if ((i12 & 1) != 0) {
            str = smsEntry.contactName;
        }
        if ((i12 & 2) != 0) {
            i5 = smsEntry.messageCount;
        }
        if ((i12 & 4) != 0) {
            i11 = smsEntry.lastMessageDaysAgo;
        }
        return smsEntry.copy(str, i5, i11);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getContactName() {
        return this.contactName;
    }

    /* renamed from: component2, reason: from getter */
    public final int getMessageCount() {
        return this.messageCount;
    }

    /* renamed from: component3, reason: from getter */
    public final int getLastMessageDaysAgo() {
        return this.lastMessageDaysAgo;
    }

    @NotNull
    public final SmsEntry copy(@NotNull String contactName, int messageCount, int lastMessageDaysAgo) {
        Intrinsics.g(contactName, "contactName");
        return new SmsEntry(contactName, messageCount, lastMessageDaysAgo);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SmsEntry)) {
            return false;
        }
        SmsEntry smsEntry = (SmsEntry) other;
        return Intrinsics.b(this.contactName, smsEntry.contactName) && this.messageCount == smsEntry.messageCount && this.lastMessageDaysAgo == smsEntry.lastMessageDaysAgo;
    }

    @NotNull
    public final String getContactName() {
        return this.contactName;
    }

    public final int getLastMessageDaysAgo() {
        return this.lastMessageDaysAgo;
    }

    public final int getMessageCount() {
        return this.messageCount;
    }

    public int hashCode() {
        return Integer.hashCode(this.lastMessageDaysAgo) + u4.a(this.messageCount, this.contactName.hashCode() * 31, 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("SmsEntry(contactName=");
        sb2.append(this.contactName);
        sb2.append(", messageCount=");
        sb2.append(this.messageCount);
        sb2.append(", lastMessageDaysAgo=");
        return c.m(sb2, this.lastMessageDaysAgo, ')');
    }
}
