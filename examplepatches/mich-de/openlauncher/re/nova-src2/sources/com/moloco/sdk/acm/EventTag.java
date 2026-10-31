package com.moloco.sdk.acm;

import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/moloco/sdk/acm/EventTag;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, DatabaseConstants.KEY_FIELD, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getKey", "()Ljava/lang/String;", "getValue", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "moloco-android-client-metrics_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class EventTag {

    @NotNull
    private final String key;

    @NotNull
    private final String value;

    public EventTag(@NotNull String key, @NotNull String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        this.key = key;
        this.value = value;
    }

    public static /* synthetic */ EventTag copy$default(EventTag eventTag, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = eventTag.key;
        }
        if ((i5 & 2) != 0) {
            str2 = eventTag.value;
        }
        return eventTag.copy(str, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getKey() {
        return this.key;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getValue() {
        return this.value;
    }

    @NotNull
    public final EventTag copy(@NotNull String key, @NotNull String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        return new EventTag(key, value);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EventTag)) {
            return false;
        }
        EventTag eventTag = (EventTag) other;
        return Intrinsics.b(this.key, eventTag.key) && Intrinsics.b(this.value, eventTag.value);
    }

    @NotNull
    public final String getKey() {
        return this.key;
    }

    @NotNull
    public final String getValue() {
        return this.value;
    }

    public int hashCode() {
        return this.value.hashCode() + (this.key.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("EventTag(key=");
        sb2.append(this.key);
        sb2.append(", value=");
        return c1.t(sb2, this.value, ')');
    }
}
