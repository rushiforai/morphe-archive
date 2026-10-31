package com.instabridge.mobilesdk.internal.data.repo;

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

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 #2\u00020\u0001:\u0002\"#B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007B/\b\u0010\u0012\u0006\u0010\b\u001a\u00020\t\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u0006\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\tHÖ\u0001J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J%\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 H\u0001¢\u0006\u0002\b!R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006$"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelPurchase;", b.f42142b, "plan", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "target", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPlan", "()Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "getTarget", "()Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class TravelPurchase {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final TravelPlan plan;

    @NotNull
    private final TravelTarget target;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelPurchase$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPurchase;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<TravelPurchase> serializer() {
            return TravelPurchase$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ TravelPurchase(int i5, TravelPlan travelPlan, TravelTarget travelTarget, SerializationConstructorMarker serializationConstructorMarker) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, TravelPurchase$$serializer.INSTANCE.getDescriptor());
        }
        this.plan = travelPlan;
        this.target = travelTarget;
    }

    public static /* synthetic */ TravelPurchase copy$default(TravelPurchase travelPurchase, TravelPlan travelPlan, TravelTarget travelTarget, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            travelPlan = travelPurchase.plan;
        }
        if ((i5 & 2) != 0) {
            travelTarget = travelPurchase.target;
        }
        return travelPurchase.copy(travelPlan, travelTarget);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(TravelPurchase self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeSerializableElement(serialDesc, 0, TravelPlan$$serializer.INSTANCE, self.plan);
        output.encodeSerializableElement(serialDesc, 1, TravelTarget$$serializer.INSTANCE, self.target);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final TravelPlan getPlan() {
        return this.plan;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final TravelTarget getTarget() {
        return this.target;
    }

    @NotNull
    public final TravelPurchase copy(@NotNull TravelPlan plan, @NotNull TravelTarget target) {
        Intrinsics.g(plan, "plan");
        Intrinsics.g(target, "target");
        return new TravelPurchase(plan, target);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TravelPurchase)) {
            return false;
        }
        TravelPurchase travelPurchase = (TravelPurchase) other;
        return Intrinsics.b(this.plan, travelPurchase.plan) && Intrinsics.b(this.target, travelPurchase.target);
    }

    @NotNull
    public final TravelPlan getPlan() {
        return this.plan;
    }

    @NotNull
    public final TravelTarget getTarget() {
        return this.target;
    }

    public int hashCode() {
        return this.target.hashCode() + (this.plan.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        return "TravelPurchase(plan=" + this.plan + ", target=" + this.target + ")";
    }

    public TravelPurchase(@NotNull TravelPlan plan, @NotNull TravelTarget target) {
        Intrinsics.g(plan, "plan");
        Intrinsics.g(target, "target");
        this.plan = plan;
        this.target = target;
    }
}
