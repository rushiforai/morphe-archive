package com.instabridge.ai.auth;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0012\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J5\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u00032\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\tHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentMutationResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "success", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "decision", "Lcom/instabridge/ai/auth/AiAccessDecision;", "errorCategory", "Lcom/instabridge/ai/auth/AiConsentErrorCategory;", "errorMessage", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(ZLcom/instabridge/ai/auth/AiAccessDecision;Lcom/instabridge/ai/auth/AiConsentErrorCategory;Ljava/lang/String;)V", "getSuccess", "()Z", "getDecision", "()Lcom/instabridge/ai/auth/AiAccessDecision;", "getErrorCategory", "()Lcom/instabridge/ai/auth/AiConsentErrorCategory;", "getErrorMessage", "()Ljava/lang/String;", "component1", "component2", "component3", "component4", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class AiConsentMutationResult {
    public static final int $stable = 0;

    @NotNull
    private final AiAccessDecision decision;

    @Nullable
    private final AiConsentErrorCategory errorCategory;

    @Nullable
    private final String errorMessage;
    private final boolean success;

    public AiConsentMutationResult(boolean z11, @NotNull AiAccessDecision decision, @Nullable AiConsentErrorCategory aiConsentErrorCategory, @Nullable String str) {
        Intrinsics.g(decision, "decision");
        this.success = z11;
        this.decision = decision;
        this.errorCategory = aiConsentErrorCategory;
        this.errorMessage = str;
    }

    public static /* synthetic */ AiConsentMutationResult copy$default(AiConsentMutationResult aiConsentMutationResult, boolean z11, AiAccessDecision aiAccessDecision, AiConsentErrorCategory aiConsentErrorCategory, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = aiConsentMutationResult.success;
        }
        if ((i5 & 2) != 0) {
            aiAccessDecision = aiConsentMutationResult.decision;
        }
        if ((i5 & 4) != 0) {
            aiConsentErrorCategory = aiConsentMutationResult.errorCategory;
        }
        if ((i5 & 8) != 0) {
            str = aiConsentMutationResult.errorMessage;
        }
        return aiConsentMutationResult.copy(z11, aiAccessDecision, aiConsentErrorCategory, str);
    }

    /* renamed from: component1, reason: from getter */
    public final boolean getSuccess() {
        return this.success;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final AiAccessDecision getDecision() {
        return this.decision;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final AiConsentErrorCategory getErrorCategory() {
        return this.errorCategory;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getErrorMessage() {
        return this.errorMessage;
    }

    @NotNull
    public final AiConsentMutationResult copy(boolean success, @NotNull AiAccessDecision decision, @Nullable AiConsentErrorCategory errorCategory, @Nullable String errorMessage) {
        Intrinsics.g(decision, "decision");
        return new AiConsentMutationResult(success, decision, errorCategory, errorMessage);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AiConsentMutationResult)) {
            return false;
        }
        AiConsentMutationResult aiConsentMutationResult = (AiConsentMutationResult) other;
        return this.success == aiConsentMutationResult.success && this.decision == aiConsentMutationResult.decision && this.errorCategory == aiConsentMutationResult.errorCategory && Intrinsics.b(this.errorMessage, aiConsentMutationResult.errorMessage);
    }

    @NotNull
    public final AiAccessDecision getDecision() {
        return this.decision;
    }

    @Nullable
    public final AiConsentErrorCategory getErrorCategory() {
        return this.errorCategory;
    }

    @Nullable
    public final String getErrorMessage() {
        return this.errorMessage;
    }

    public final boolean getSuccess() {
        return this.success;
    }

    public int hashCode() {
        int iHashCode = (this.decision.hashCode() + (Boolean.hashCode(this.success) * 31)) * 31;
        AiConsentErrorCategory aiConsentErrorCategory = this.errorCategory;
        int iHashCode2 = (iHashCode + (aiConsentErrorCategory == null ? 0 : aiConsentErrorCategory.hashCode())) * 31;
        String str = this.errorMessage;
        return iHashCode2 + (str != null ? str.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AiConsentMutationResult(success=");
        sb2.append(this.success);
        sb2.append(", decision=");
        sb2.append(this.decision);
        sb2.append(", errorCategory=");
        sb2.append(this.errorCategory);
        sb2.append(", errorMessage=");
        return c1.t(sb2, this.errorMessage, ')');
    }

    public /* synthetic */ AiConsentMutationResult(boolean z11, AiAccessDecision aiAccessDecision, AiConsentErrorCategory aiConsentErrorCategory, String str, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(z11, aiAccessDecision, (i5 & 4) != 0 ? null : aiConsentErrorCategory, (i5 & 8) != 0 ? null : str);
    }
}
