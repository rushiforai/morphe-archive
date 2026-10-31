package com.instabridge.ai.context.summarizers;

import a2.c;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J1\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0007\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\r¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/context/summarizers/CallEntry;", b.f42142b, "contactName", b.f42142b, "callCount", b.f42142b, "totalDurationMinutes", "lastCallDaysAgo", "<init>", "(Ljava/lang/String;III)V", "getContactName", "()Ljava/lang/String;", "getCallCount", "()I", "getTotalDurationMinutes", "getLastCallDaysAgo", "component1", "component2", "component3", "component4", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class CallEntry {
    public static final int $stable = 0;
    private final int callCount;

    @NotNull
    private final String contactName;
    private final int lastCallDaysAgo;
    private final int totalDurationMinutes;

    public CallEntry(@NotNull String contactName, int i5, int i11, int i12) {
        Intrinsics.g(contactName, "contactName");
        this.contactName = contactName;
        this.callCount = i5;
        this.totalDurationMinutes = i11;
        this.lastCallDaysAgo = i12;
    }

    public static /* synthetic */ CallEntry copy$default(CallEntry callEntry, String str, int i5, int i11, int i12, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            str = callEntry.contactName;
        }
        if ((i13 & 2) != 0) {
            i5 = callEntry.callCount;
        }
        if ((i13 & 4) != 0) {
            i11 = callEntry.totalDurationMinutes;
        }
        if ((i13 & 8) != 0) {
            i12 = callEntry.lastCallDaysAgo;
        }
        return callEntry.copy(str, i5, i11, i12);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getContactName() {
        return this.contactName;
    }

    /* renamed from: component2, reason: from getter */
    public final int getCallCount() {
        return this.callCount;
    }

    /* renamed from: component3, reason: from getter */
    public final int getTotalDurationMinutes() {
        return this.totalDurationMinutes;
    }

    /* renamed from: component4, reason: from getter */
    public final int getLastCallDaysAgo() {
        return this.lastCallDaysAgo;
    }

    @NotNull
    public final CallEntry copy(@NotNull String contactName, int callCount, int totalDurationMinutes, int lastCallDaysAgo) {
        Intrinsics.g(contactName, "contactName");
        return new CallEntry(contactName, callCount, totalDurationMinutes, lastCallDaysAgo);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CallEntry)) {
            return false;
        }
        CallEntry callEntry = (CallEntry) other;
        return Intrinsics.b(this.contactName, callEntry.contactName) && this.callCount == callEntry.callCount && this.totalDurationMinutes == callEntry.totalDurationMinutes && this.lastCallDaysAgo == callEntry.lastCallDaysAgo;
    }

    public final int getCallCount() {
        return this.callCount;
    }

    @NotNull
    public final String getContactName() {
        return this.contactName;
    }

    public final int getLastCallDaysAgo() {
        return this.lastCallDaysAgo;
    }

    public final int getTotalDurationMinutes() {
        return this.totalDurationMinutes;
    }

    public int hashCode() {
        return Integer.hashCode(this.lastCallDaysAgo) + u4.a(this.totalDurationMinutes, u4.a(this.callCount, this.contactName.hashCode() * 31, 31), 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("CallEntry(contactName=");
        sb2.append(this.contactName);
        sb2.append(", callCount=");
        sb2.append(this.callCount);
        sb2.append(", totalDurationMinutes=");
        sb2.append(this.totalDurationMinutes);
        sb2.append(", lastCallDaysAgo=");
        return c.m(sb2, this.lastCallDaysAgo, ')');
    }
}
