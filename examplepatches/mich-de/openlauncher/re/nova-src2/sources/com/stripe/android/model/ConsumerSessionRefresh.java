package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/ConsumerSessionRefresh;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "ft/j", "ft/k", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class ConsumerSessionRefresh implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final ConsumerSession f43349a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkAuthIntent f43350b;

    @NotNull
    public static final ft.k Companion = new ft.k();

    @NotNull
    public static final Parcelable.Creator<ConsumerSessionRefresh> CREATOR = new eh.a(26);

    public /* synthetic */ ConsumerSessionRefresh(int i5, ConsumerSession consumerSession, LinkAuthIntent linkAuthIntent) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, ft.j.f55948a.getDescriptor());
        }
        this.f43349a = consumerSession;
        this.f43350b = linkAuthIntent;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConsumerSessionRefresh)) {
            return false;
        }
        ConsumerSessionRefresh consumerSessionRefresh = (ConsumerSessionRefresh) obj;
        return Intrinsics.b(this.f43349a, consumerSessionRefresh.f43349a) && Intrinsics.b(this.f43350b, consumerSessionRefresh.f43350b);
    }

    public final int hashCode() {
        int iHashCode = this.f43349a.hashCode() * 31;
        LinkAuthIntent linkAuthIntent = this.f43350b;
        return iHashCode + (linkAuthIntent == null ? 0 : linkAuthIntent.f43504a.hashCode());
    }

    public final String toString() {
        return "ConsumerSessionRefresh(consumerSession=" + this.f43349a + ", linkAuthIntent=" + this.f43350b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f43349a.writeToParcel(dest, i5);
        LinkAuthIntent linkAuthIntent = this.f43350b;
        if (linkAuthIntent == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            linkAuthIntent.writeToParcel(dest, i5);
        }
    }

    public ConsumerSessionRefresh(ConsumerSession consumerSession, LinkAuthIntent linkAuthIntent) {
        Intrinsics.g(consumerSession, "consumerSession");
        this.f43349a = consumerSession;
        this.f43350b = linkAuthIntent;
    }
}
