package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/LinkAuthIntent;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "ft/b0", "ft/z", "ft/a0", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class LinkAuthIntent implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final ft.b0 f43504a;

    @NotNull
    public static final ft.a0 Companion = new ft.a0();

    @NotNull
    public static final Parcelable.Creator<LinkAuthIntent> CREATOR = new ft.q(6);

    /* renamed from: b, reason: collision with root package name */
    public static final KSerializer[] f43503b = {EnumsKt.createSimpleEnumSerializer("com.stripe.android.model.LinkAuthIntent.Status", ft.b0.values())};

    public /* synthetic */ LinkAuthIntent(int i5, ft.b0 b0Var) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, ft.z.f56078a.getDescriptor());
        }
        this.f43504a = b0Var;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof LinkAuthIntent) && this.f43504a == ((LinkAuthIntent) obj).f43504a;
    }

    public final int hashCode() {
        return this.f43504a.hashCode();
    }

    public final String toString() {
        return "LinkAuthIntent(status=" + this.f43504a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43504a.name());
    }

    public LinkAuthIntent(ft.b0 status) {
        Intrinsics.g(status, "status");
        this.f43504a = status;
    }
}
