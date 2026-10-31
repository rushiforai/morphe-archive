package com.stripe.android.paymentelement.confirmation.link;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import es.o;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import sv.b;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/link/LinkConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkConfirmationOption implements ConfirmationHandler$Option {

    @NotNull
    public static final Parcelable.Creator<LinkConfirmationOption> CREATOR = new b(19);

    /* renamed from: a, reason: collision with root package name */
    public final LinkConfiguration f44178a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkLaunchMode f44179b;

    /* renamed from: c, reason: collision with root package name */
    public final o f44180c;

    public LinkConfirmationOption(LinkConfiguration configuration, LinkLaunchMode linkLaunchMode, o linkExpressMode) {
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(linkLaunchMode, "linkLaunchMode");
        Intrinsics.g(linkExpressMode, "linkExpressMode");
        this.f44178a = configuration;
        this.f44179b = linkLaunchMode;
        this.f44180c = linkExpressMode;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkConfirmationOption)) {
            return false;
        }
        LinkConfirmationOption linkConfirmationOption = (LinkConfirmationOption) obj;
        return Intrinsics.b(this.f44178a, linkConfirmationOption.f44178a) && Intrinsics.b(this.f44179b, linkConfirmationOption.f44179b) && this.f44180c == linkConfirmationOption.f44180c;
    }

    public final int hashCode() {
        return this.f44180c.hashCode() + ((this.f44179b.hashCode() + (this.f44178a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "LinkConfirmationOption(configuration=" + this.f44178a + ", linkLaunchMode=" + this.f44179b + ", linkExpressMode=" + this.f44180c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44178a.writeToParcel(dest, i5);
        dest.writeParcelable(this.f44179b, i5);
        dest.writeString(this.f44180c.name());
    }
}
