package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConsumerShippingAddresses;", "Lcom/stripe/android/core/model/StripeModel;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ConsumerShippingAddresses implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<ConsumerShippingAddresses> CREATOR = new eh.a(28);

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f43357a;

    public ConsumerShippingAddresses(ArrayList arrayList) {
        this.f43357a = arrayList;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ConsumerShippingAddresses) && this.f43357a.equals(((ConsumerShippingAddresses) obj).f43357a);
    }

    public final int hashCode() {
        return this.f43357a.hashCode();
    }

    public final String toString() {
        return "ConsumerShippingAddresses(addresses=" + this.f43357a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Iterator itJ = fq.c.j(this.f43357a, dest);
        while (itJ.hasNext()) {
            ((ConsumerShippingAddress) itJ.next()).writeToParcel(dest, i5);
        }
    }
}
