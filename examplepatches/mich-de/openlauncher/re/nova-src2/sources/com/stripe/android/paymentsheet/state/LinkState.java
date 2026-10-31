package com.stripe.android.paymentsheet.state;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkConfiguration;
import gv.d0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import rs.a0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/state/LinkState;", "Lcom/stripe/android/paymentsheet/state/LinkStateResult;", "gv/d0", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkState implements LinkStateResult {

    @NotNull
    public static final Parcelable.Creator<LinkState> CREATOR = new gi.g(16);

    /* renamed from: a, reason: collision with root package name */
    public final LinkConfiguration f44962a;

    /* renamed from: b, reason: collision with root package name */
    public final d0 f44963b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkSignupModeResult f44964c;

    /* renamed from: d, reason: collision with root package name */
    public final a0 f44965d;

    public LinkState(LinkConfiguration configuration, d0 loginState, LinkSignupModeResult signupModeResult) {
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(loginState, "loginState");
        Intrinsics.g(signupModeResult, "signupModeResult");
        this.f44962a = configuration;
        this.f44963b = loginState;
        this.f44964c = signupModeResult;
        this.f44965d = signupModeResult.getF44961a();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkState)) {
            return false;
        }
        LinkState linkState = (LinkState) obj;
        return Intrinsics.b(this.f44962a, linkState.f44962a) && this.f44963b == linkState.f44963b && Intrinsics.b(this.f44964c, linkState.f44964c);
    }

    public final int hashCode() {
        return this.f44964c.hashCode() + ((this.f44963b.hashCode() + (this.f44962a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "LinkState(configuration=" + this.f44962a + ", loginState=" + this.f44963b + ", signupModeResult=" + this.f44964c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44962a.writeToParcel(dest, i5);
        dest.writeString(this.f44963b.name());
        dest.writeParcelable(this.f44964c, i5);
    }
}
