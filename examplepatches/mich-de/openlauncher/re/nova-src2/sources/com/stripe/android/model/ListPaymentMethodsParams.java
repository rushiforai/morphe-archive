package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.tiktok.util.TTConst;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/ListPaymentMethodsParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ListPaymentMethodsParams implements StripeParamsModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<ListPaymentMethodsParams> CREATOR = new x1();

    /* renamed from: a, reason: collision with root package name */
    public final String f43516a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethod.Type f43517b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f43518c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43519d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43520e;

    public ListPaymentMethodsParams(String customerId, PaymentMethod.Type paymentMethodType, Integer num, String str, String str2) {
        Intrinsics.g(customerId, "customerId");
        Intrinsics.g(paymentMethodType, "paymentMethodType");
        this.f43516a = customerId;
        this.f43517b = paymentMethodType;
        this.f43518c = num;
        this.f43519d = str;
        this.f43520e = str2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ListPaymentMethodsParams)) {
            return false;
        }
        ListPaymentMethodsParams listPaymentMethodsParams = (ListPaymentMethodsParams) obj;
        return Intrinsics.b(this.f43516a, listPaymentMethodsParams.f43516a) && this.f43517b == listPaymentMethodsParams.f43517b && Intrinsics.b(this.f43518c, listPaymentMethodsParams.f43518c) && Intrinsics.b(this.f43519d, listPaymentMethodsParams.f43519d) && Intrinsics.b(this.f43520e, listPaymentMethodsParams.f43520e);
    }

    public final int hashCode() {
        int iHashCode = (this.f43517b.hashCode() + (this.f43516a.hashCode() * 31)) * 31;
        Integer num = this.f43518c;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        String str = this.f43519d;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f43520e;
        return iHashCode3 + (str2 != null ? str2.hashCode() : 0);
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        b70.h hVar = b70.h.f17594a;
        Map mapM0 = hVar;
        for (Pair pair : ul.b.Q(new Pair("customer", this.f43516a), new Pair(TTConst.TRACK_TYPE, this.f43517b.f43655a), new Pair("limit", this.f43518c), new Pair("ending_before", this.f43519d), new Pair("starting_after", this.f43520e))) {
            String str = (String) pair.f71683a;
            Object obj = pair.f71684b;
            Map mapE0 = obj != null ? b70.k.e0(new Pair(str, obj)) : null;
            if (mapE0 == null) {
                mapE0 = hVar;
            }
            mapM0 = MapsKt.m0(mapM0, mapE0);
        }
        return mapM0;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ListPaymentMethodsParams(customerId=");
        sb2.append(this.f43516a);
        sb2.append(", paymentMethodType=");
        sb2.append(this.f43517b);
        sb2.append(", limit=");
        sb2.append(this.f43518c);
        sb2.append(", endingBefore=");
        sb2.append(this.f43519d);
        sb2.append(", startingAfter=");
        return b.c0.q(sb2, this.f43520e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43516a);
        this.f43517b.writeToParcel(dest, i5);
        Integer num = this.f43518c;
        if (num == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num);
        }
        dest.writeString(this.f43519d);
        dest.writeString(this.f43520e);
    }
}
