package com.instabridge.ai.client;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B%\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\rJ2\u0010\u0012\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\r¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/client/ProgressRaw;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "phase", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PglCryptUtils.KEY_MESSAGE, "sequence", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V", "getPhase", "()Ljava/lang/String;", "getMessage", "getSequence", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)Lcom/instabridge/ai/client/ProgressRaw;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ProgressRaw {

    @Nullable
    private final String message;

    @Nullable
    private final String phase;

    @Nullable
    private final Long sequence;

    public ProgressRaw(@Nullable String str, @Nullable String str2, @Nullable Long l9) {
        this.phase = str;
        this.message = str2;
        this.sequence = l9;
    }

    public static /* synthetic */ ProgressRaw copy$default(ProgressRaw progressRaw, String str, String str2, Long l9, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = progressRaw.phase;
        }
        if ((i5 & 2) != 0) {
            str2 = progressRaw.message;
        }
        if ((i5 & 4) != 0) {
            l9 = progressRaw.sequence;
        }
        return progressRaw.copy(str, str2, l9);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getPhase() {
        return this.phase;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getMessage() {
        return this.message;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Long getSequence() {
        return this.sequence;
    }

    @NotNull
    public final ProgressRaw copy(@Nullable String phase, @Nullable String message, @Nullable Long sequence) {
        return new ProgressRaw(phase, message, sequence);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ProgressRaw)) {
            return false;
        }
        ProgressRaw progressRaw = (ProgressRaw) other;
        return Intrinsics.b(this.phase, progressRaw.phase) && Intrinsics.b(this.message, progressRaw.message) && Intrinsics.b(this.sequence, progressRaw.sequence);
    }

    @Nullable
    public final String getMessage() {
        return this.message;
    }

    @Nullable
    public final String getPhase() {
        return this.phase;
    }

    @Nullable
    public final Long getSequence() {
        return this.sequence;
    }

    public int hashCode() {
        String str = this.phase;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.message;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l9 = this.sequence;
        return iHashCode2 + (l9 != null ? l9.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "ProgressRaw(phase=" + this.phase + ", message=" + this.message + ", sequence=" + this.sequence + ')';
    }
}
