package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/NativeLinkArgs;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class NativeLinkArgs implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<NativeLinkArgs> CREATOR = new e0();

    /* renamed from: a, reason: collision with root package name */
    public final LinkConfiguration f42950a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodMetadata f42951b;

    /* renamed from: c, reason: collision with root package name */
    public final jt.b f42952c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42953d;

    /* renamed from: e, reason: collision with root package name */
    public final String f42954e;

    /* renamed from: f, reason: collision with root package name */
    public final es.o f42955f;

    /* renamed from: g, reason: collision with root package name */
    public final LinkAccountUpdate.Value f42956g;

    /* renamed from: h, reason: collision with root package name */
    public final String f42957h;

    /* renamed from: i, reason: collision with root package name */
    public final LinkLaunchMode f42958i;

    public NativeLinkArgs(LinkConfiguration configuration, PaymentMethodMetadata paymentMethodMetadata, jt.b requestSurface, String publishableKey, String str, es.o linkExpressMode, LinkAccountUpdate.Value linkAccountInfo, String paymentElementCallbackIdentifier, LinkLaunchMode launchMode) {
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(requestSurface, "requestSurface");
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(linkExpressMode, "linkExpressMode");
        Intrinsics.g(linkAccountInfo, "linkAccountInfo");
        Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
        Intrinsics.g(launchMode, "launchMode");
        this.f42950a = configuration;
        this.f42951b = paymentMethodMetadata;
        this.f42952c = requestSurface;
        this.f42953d = publishableKey;
        this.f42954e = str;
        this.f42955f = linkExpressMode;
        this.f42956g = linkAccountInfo;
        this.f42957h = paymentElementCallbackIdentifier;
        this.f42958i = launchMode;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof NativeLinkArgs)) {
            return false;
        }
        NativeLinkArgs nativeLinkArgs = (NativeLinkArgs) obj;
        return Intrinsics.b(this.f42950a, nativeLinkArgs.f42950a) && Intrinsics.b(this.f42951b, nativeLinkArgs.f42951b) && this.f42952c == nativeLinkArgs.f42952c && Intrinsics.b(this.f42953d, nativeLinkArgs.f42953d) && Intrinsics.b(this.f42954e, nativeLinkArgs.f42954e) && this.f42955f == nativeLinkArgs.f42955f && Intrinsics.b(this.f42956g, nativeLinkArgs.f42956g) && Intrinsics.b(this.f42957h, nativeLinkArgs.f42957h) && Intrinsics.b(this.f42958i, nativeLinkArgs.f42958i);
    }

    public final int hashCode() {
        int iE = b.c0.e((this.f42952c.hashCode() + ((this.f42951b.hashCode() + (this.f42950a.hashCode() * 31)) * 31)) * 31, 31, this.f42953d);
        String str = this.f42954e;
        return this.f42958i.hashCode() + b.c0.e((this.f42956g.hashCode() + ((this.f42955f.hashCode() + ((iE + (str == null ? 0 : str.hashCode())) * 31)) * 31)) * 31, 31, this.f42957h);
    }

    public final String toString() {
        return "NativeLinkArgs(configuration=" + this.f42950a + ", paymentMethodMetadata=" + this.f42951b + ", requestSurface=" + this.f42952c + ", publishableKey=" + this.f42953d + ", stripeAccountId=" + this.f42954e + ", linkExpressMode=" + this.f42955f + ", linkAccountInfo=" + this.f42956g + ", paymentElementCallbackIdentifier=" + this.f42957h + ", launchMode=" + this.f42958i + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f42950a.writeToParcel(dest, i5);
        this.f42951b.writeToParcel(dest, i5);
        dest.writeString(this.f42952c.name());
        dest.writeString(this.f42953d);
        dest.writeString(this.f42954e);
        dest.writeString(this.f42955f.name());
        this.f42956g.writeToParcel(dest, i5);
        dest.writeString(this.f42957h);
        dest.writeParcelable(this.f42958i, i5);
    }
}
