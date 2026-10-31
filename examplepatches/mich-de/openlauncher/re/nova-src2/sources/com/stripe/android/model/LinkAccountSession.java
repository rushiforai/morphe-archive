package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/LinkAccountSession;", "Lcom/stripe/android/core/model/StripeModel;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkAccountSession implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<LinkAccountSession> CREATOR = new ft.q(5);

    /* renamed from: a, reason: collision with root package name */
    public final String f43501a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43502b;

    public LinkAccountSession(String id2, String clientSecret) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(clientSecret, "clientSecret");
        this.f43501a = id2;
        this.f43502b = clientSecret;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkAccountSession)) {
            return false;
        }
        LinkAccountSession linkAccountSession = (LinkAccountSession) obj;
        return Intrinsics.b(this.f43501a, linkAccountSession.f43501a) && Intrinsics.b(this.f43502b, linkAccountSession.f43502b);
    }

    public final int hashCode() {
        return this.f43502b.hashCode() + (this.f43501a.hashCode() * 31);
    }

    public final String toString() {
        return b.c0.n("LinkAccountSession(id=", this.f43501a, ", clientSecret=", this.f43502b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43501a);
        dest.writeString(this.f43502b);
    }
}
