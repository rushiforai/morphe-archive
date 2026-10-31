package com.instabridge.mobilesdk.internal.data.api.dto;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 !2\u00020\u0001:\u0002 !B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007B-\b\u0010\u0012\u0006\u0010\b\u001a\u00020\t\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u0006\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00052\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\tHÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001J%\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u00002\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0001¢\u0006\u0002\b\u001fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\""}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentRequest;", b.f42142b, "purchaseId", b.f42142b, "enablePayAsYouGo", b.f42142b, "<init>", "(Ljava/lang/String;Z)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;ZLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPurchaseId", "()Ljava/lang/String;", "getEnablePayAsYouGo", "()Z", "component1", "component2", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PayIntentRequest {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final boolean enablePayAsYouGo;

    @NotNull
    private final String purchaseId;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentRequest$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentRequest;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PayIntentRequest> serializer() {
            return PayIntentRequest$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ PayIntentRequest(int i5, String str, boolean z11, SerializationConstructorMarker serializationConstructorMarker) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, PayIntentRequest$$serializer.INSTANCE.getDescriptor());
        }
        this.purchaseId = str;
        if ((i5 & 2) == 0) {
            this.enablePayAsYouGo = false;
        } else {
            this.enablePayAsYouGo = z11;
        }
    }

    public static /* synthetic */ PayIntentRequest copy$default(PayIntentRequest payIntentRequest, String str, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = payIntentRequest.purchaseId;
        }
        if ((i5 & 2) != 0) {
            z11 = payIntentRequest.enablePayAsYouGo;
        }
        return payIntentRequest.copy(str, z11);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(PayIntentRequest self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.purchaseId);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.enablePayAsYouGo) {
            output.encodeBooleanElement(serialDesc, 1, self.enablePayAsYouGo);
        }
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPurchaseId() {
        return this.purchaseId;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getEnablePayAsYouGo() {
        return this.enablePayAsYouGo;
    }

    @NotNull
    public final PayIntentRequest copy(@NotNull String purchaseId, boolean enablePayAsYouGo) {
        Intrinsics.g(purchaseId, "purchaseId");
        return new PayIntentRequest(purchaseId, enablePayAsYouGo);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PayIntentRequest)) {
            return false;
        }
        PayIntentRequest payIntentRequest = (PayIntentRequest) other;
        return Intrinsics.b(this.purchaseId, payIntentRequest.purchaseId) && this.enablePayAsYouGo == payIntentRequest.enablePayAsYouGo;
    }

    public final boolean getEnablePayAsYouGo() {
        return this.enablePayAsYouGo;
    }

    @NotNull
    public final String getPurchaseId() {
        return this.purchaseId;
    }

    public int hashCode() {
        return Boolean.hashCode(this.enablePayAsYouGo) + (this.purchaseId.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        return "PayIntentRequest(purchaseId=" + this.purchaseId + ", enablePayAsYouGo=" + this.enablePayAsYouGo + ")";
    }

    public PayIntentRequest(@NotNull String purchaseId, boolean z11) {
        Intrinsics.g(purchaseId, "purchaseId");
        this.purchaseId = purchaseId;
        this.enablePayAsYouGo = z11;
    }

    public /* synthetic */ PayIntentRequest(String str, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? false : z11);
    }
}
