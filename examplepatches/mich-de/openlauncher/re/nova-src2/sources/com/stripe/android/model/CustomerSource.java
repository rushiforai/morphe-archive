package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.SourceTypeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/CustomerSource;", "Lcom/stripe/android/model/CustomerPaymentSource;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CustomerSource extends CustomerPaymentSource {

    @NotNull
    public static final Parcelable.Creator<CustomerSource> CREATOR = new ft.q(2);

    /* renamed from: a, reason: collision with root package name */
    public final Source f43370a;

    public CustomerSource(Source source) {
        Intrinsics.g(source, "source");
        this.f43370a = source;
    }

    @Override // com.stripe.android.model.CustomerPaymentSource
    public final ft.u0 b() {
        SourceTypeModel sourceTypeModel = this.f43370a.f43805j;
        if (sourceTypeModel instanceof SourceTypeModel.Card) {
            return ((SourceTypeModel.Card) sourceTypeModel).f43878k;
        }
        return null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof CustomerSource) && Intrinsics.b(this.f43370a, ((CustomerSource) obj).f43370a);
    }

    public final int hashCode() {
        return this.f43370a.hashCode();
    }

    public final String toString() {
        return "CustomerSource(source=" + this.f43370a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f43370a.writeToParcel(dest, i5);
    }
}
