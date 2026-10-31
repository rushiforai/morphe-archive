package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import cw.c;
import cw.m2;
import cw.n2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/ExternalPaymentMethodSpec;", "Landroid/os/Parcelable;", k.O, "cw/m2", "cw/n2", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class ExternalPaymentMethodSpec implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f45311a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45312b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45313c;

    /* renamed from: d, reason: collision with root package name */
    public final String f45314d;

    @NotNull
    public static final n2 Companion = new n2();

    @NotNull
    public static final Parcelable.Creator<ExternalPaymentMethodSpec> CREATOR = new c(14);

    public /* synthetic */ ExternalPaymentMethodSpec(String str, int i5, String str2, String str3, String str4) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, m2.f48216a.getDescriptor());
        }
        this.f45311a = str;
        this.f45312b = str2;
        this.f45313c = str3;
        if ((i5 & 8) == 0) {
            this.f45314d = null;
        } else {
            this.f45314d = str4;
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
        if (!(obj instanceof ExternalPaymentMethodSpec)) {
            return false;
        }
        ExternalPaymentMethodSpec externalPaymentMethodSpec = (ExternalPaymentMethodSpec) obj;
        return Intrinsics.b(this.f45311a, externalPaymentMethodSpec.f45311a) && Intrinsics.b(this.f45312b, externalPaymentMethodSpec.f45312b) && Intrinsics.b(this.f45313c, externalPaymentMethodSpec.f45313c) && Intrinsics.b(this.f45314d, externalPaymentMethodSpec.f45314d);
    }

    public final int hashCode() {
        int iE = c0.e(c0.e(this.f45311a.hashCode() * 31, 31, this.f45312b), 31, this.f45313c);
        String str = this.f45314d;
        return iE + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return c0.s(c0.w("ExternalPaymentMethodSpec(type=", this.f45311a, ", label=", this.f45312b, ", lightImageUrl="), this.f45313c, ", darkImageUrl=", this.f45314d, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45311a);
        dest.writeString(this.f45312b);
        dest.writeString(this.f45313c);
        dest.writeString(this.f45314d);
    }

    public ExternalPaymentMethodSpec(String type, String label, String lightImageUrl, String str) {
        Intrinsics.g(type, "type");
        Intrinsics.g(label, "label");
        Intrinsics.g(lightImageUrl, "lightImageUrl");
        this.f45311a = type;
        this.f45312b = label;
        this.f45313c = lightImageUrl;
        this.f45314d = str;
    }
}
