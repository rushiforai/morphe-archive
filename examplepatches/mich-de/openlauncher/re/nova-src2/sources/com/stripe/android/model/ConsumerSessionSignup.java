package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/ConsumerSessionSignup;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "ft/l", "ft/m", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class ConsumerSessionSignup implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final ConsumerSession f43351a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43352b;

    @NotNull
    public static final ft.m Companion = new ft.m();

    @NotNull
    public static final Parcelable.Creator<ConsumerSessionSignup> CREATOR = new eh.a(27);

    public /* synthetic */ ConsumerSessionSignup(int i5, ConsumerSession consumerSession, String str) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, ft.l.f55959a.getDescriptor());
        }
        this.f43351a = consumerSession;
        if ((i5 & 2) == 0) {
            this.f43352b = null;
        } else {
            this.f43352b = str;
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
        if (!(obj instanceof ConsumerSessionSignup)) {
            return false;
        }
        ConsumerSessionSignup consumerSessionSignup = (ConsumerSessionSignup) obj;
        return Intrinsics.b(this.f43351a, consumerSessionSignup.f43351a) && Intrinsics.b(this.f43352b, consumerSessionSignup.f43352b);
    }

    public final int hashCode() {
        int iHashCode = this.f43351a.hashCode() * 31;
        String str = this.f43352b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "ConsumerSessionSignup(consumerSession=" + this.f43351a + ", publishableKey=" + this.f43352b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f43351a.writeToParcel(dest, i5);
        dest.writeString(this.f43352b);
    }

    public ConsumerSessionSignup(ConsumerSession consumerSession, String str) {
        Intrinsics.g(consumerSession, "consumerSession");
        this.f43351a = consumerSession;
        this.f43352b = str;
    }
}
