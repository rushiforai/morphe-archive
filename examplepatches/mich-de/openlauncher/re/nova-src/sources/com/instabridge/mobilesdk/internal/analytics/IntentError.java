package com.instabridge.mobilesdk.internal.analytics;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B%\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u000b\u0010\f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J-\u0010\u000f\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/internal/analytics/IntentError;", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, b.f42142b, "declineCode", TTConst.TRACK_TYPE, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getCode", "()Ljava/lang/String;", "getDeclineCode", "getType", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class IntentError {
    public static final int $stable = 0;

    @Nullable
    private final String code;

    @Nullable
    private final String declineCode;

    @Nullable
    private final String type;

    public IntentError(@Nullable String str, @Nullable String str2, @Nullable String str3) {
        this.code = str;
        this.declineCode = str2;
        this.type = str3;
    }

    public static /* synthetic */ IntentError copy$default(IntentError intentError, String str, String str2, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = intentError.code;
        }
        if ((i5 & 2) != 0) {
            str2 = intentError.declineCode;
        }
        if ((i5 & 4) != 0) {
            str3 = intentError.type;
        }
        return intentError.copy(str, str2, str3);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getCode() {
        return this.code;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getDeclineCode() {
        return this.declineCode;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @NotNull
    public final IntentError copy(@Nullable String code, @Nullable String declineCode, @Nullable String type) {
        return new IntentError(code, declineCode, type);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof IntentError)) {
            return false;
        }
        IntentError intentError = (IntentError) other;
        return Intrinsics.b(this.code, intentError.code) && Intrinsics.b(this.declineCode, intentError.declineCode) && Intrinsics.b(this.type, intentError.type);
    }

    @Nullable
    public final String getCode() {
        return this.code;
    }

    @Nullable
    public final String getDeclineCode() {
        return this.declineCode;
    }

    @Nullable
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        String str = this.code;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.declineCode;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.type;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.code;
        String str2 = this.declineCode;
        return c0.q(c0.w("IntentError(code=", str, ", declineCode=", str2, ", type="), this.type, ")");
    }
}
