package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/MobileFallbackWebviewParams;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "ft/j0", "ft/g0", "ft/h0", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class MobileFallbackWebviewParams implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final ft.j0 f43529a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43530b;

    @NotNull
    public static final ft.h0 Companion = new ft.h0();

    @NotNull
    public static final Parcelable.Creator<MobileFallbackWebviewParams> CREATOR = new ft.q(7);

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f43528c = {ft.j0.Companion.serializer(), null};

    public /* synthetic */ MobileFallbackWebviewParams(int i5, ft.j0 j0Var, String str) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, ft.g0.f55946a.getDescriptor());
        }
        this.f43529a = j0Var;
        if ((i5 & 2) == 0) {
            this.f43530b = null;
        } else {
            this.f43530b = str;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MobileFallbackWebviewParams)) {
            return false;
        }
        MobileFallbackWebviewParams mobileFallbackWebviewParams = (MobileFallbackWebviewParams) obj;
        return this.f43529a == mobileFallbackWebviewParams.f43529a && Intrinsics.b(this.f43530b, mobileFallbackWebviewParams.f43530b);
    }

    public final int hashCode() {
        int iHashCode = this.f43529a.hashCode() * 31;
        String str = this.f43530b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "MobileFallbackWebviewParams(webViewRequirementType=" + this.f43529a + ", webviewOpenUrl=" + this.f43530b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43529a.name());
        dest.writeString(this.f43530b);
    }

    public MobileFallbackWebviewParams(ft.j0 webViewRequirementType, String str) {
        Intrinsics.g(webViewRequirementType, "webViewRequirementType");
        this.f43529a = webViewRequirementType;
        this.f43530b = str;
    }
}
