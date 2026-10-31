package com.stripe.android.stripe3ds2.init.ui;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;
import sv.b;
import sv.c;
import vm.d;

/* loaded from: classes4.dex */
public final class StripeUiCustomization implements Parcelable {
    public static final Parcelable.Creator<StripeUiCustomization> CREATOR = new b(0);

    /* renamed from: a, reason: collision with root package name */
    public final StripeToolbarCustomization f45048a;

    /* renamed from: b, reason: collision with root package name */
    public final StripeLabelCustomization f45049b;

    /* renamed from: c, reason: collision with root package name */
    public final StripeTextBoxCustomization f45050c;

    /* renamed from: d, reason: collision with root package name */
    public final AbstractMap f45051d;

    /* renamed from: e, reason: collision with root package name */
    public final HashMap f45052e;

    /* renamed from: f, reason: collision with root package name */
    public final String f45053f;

    public StripeUiCustomization() {
        this.f45051d = new EnumMap(c.class);
        this.f45052e = new HashMap();
    }

    public final StripeButtonCustomization a(c cVar) {
        return (StripeButtonCustomization) this.f45051d.get(cVar);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StripeUiCustomization)) {
            return false;
        }
        StripeUiCustomization stripeUiCustomization = (StripeUiCustomization) obj;
        return Intrinsics.b(this.f45048a, stripeUiCustomization.f45048a) && Intrinsics.b(this.f45053f, stripeUiCustomization.f45053f) && Intrinsics.b(this.f45049b, stripeUiCustomization.f45049b) && Intrinsics.b(this.f45050c, stripeUiCustomization.f45050c) && Intrinsics.b(this.f45051d, stripeUiCustomization.f45051d) && Intrinsics.b(this.f45052e, stripeUiCustomization.f45052e);
    }

    public final int hashCode() {
        return Objects.hash(Arrays.copyOf(new Object[]{this.f45048a, this.f45053f, this.f45049b, this.f45050c, this.f45051d, this.f45052e}, 6));
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f45053f);
        parcel.writeParcelable(this.f45048a, 0);
        parcel.writeParcelable(this.f45049b, 0);
        parcel.writeParcelable(this.f45050c, 0);
        Bundle bundle = new Bundle();
        for (Map.Entry entry : this.f45051d.entrySet()) {
            bundle.putParcelable(((c) entry.getKey()).name(), (StripeButtonCustomization) entry.getValue());
        }
        parcel.writeBundle(bundle);
        Bundle bundle2 = new Bundle();
        for (Map.Entry entry2 : this.f45052e.entrySet()) {
            bundle2.putParcelable((String) entry2.getKey(), (StripeButtonCustomization) entry2.getValue());
        }
        parcel.writeBundle(bundle2);
    }

    public StripeUiCustomization(Parcel parcel) {
        this.f45053f = parcel.readString();
        this.f45048a = (StripeToolbarCustomization) parcel.readParcelable(StripeToolbarCustomization.class.getClassLoader());
        this.f45049b = (StripeLabelCustomization) parcel.readParcelable(StripeLabelCustomization.class.getClassLoader());
        this.f45050c = (StripeTextBoxCustomization) parcel.readParcelable(StripeTextBoxCustomization.class.getClassLoader());
        this.f45051d = new HashMap();
        Bundle bundle = parcel.readBundle(StripeUiCustomization.class.getClassLoader());
        if (bundle != null) {
            for (String str : bundle.keySet()) {
                StripeButtonCustomization stripeButtonCustomization = (StripeButtonCustomization) d.i(bundle, str, StripeButtonCustomization.class);
                if (stripeButtonCustomization != null) {
                    this.f45051d.put(c.valueOf(str), stripeButtonCustomization);
                }
            }
        }
        this.f45052e = new HashMap();
        Bundle bundle2 = parcel.readBundle(StripeUiCustomization.class.getClassLoader());
        if (bundle2 != null) {
            for (String str2 : bundle2.keySet()) {
                StripeButtonCustomization stripeButtonCustomization2 = (StripeButtonCustomization) d.i(bundle2, str2, StripeButtonCustomization.class);
                if (stripeButtonCustomization2 != null) {
                    this.f45052e.put(str2, stripeButtonCustomization2);
                }
            }
        }
    }
}
