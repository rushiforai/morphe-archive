package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00030\u0002¨\u0006\u0004"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$CardFundingType", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/stripe/android/paymentsheet/PaymentSheet$CardFundingType;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$CardFundingType implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$CardFundingType> CREATOR;

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ PaymentSheet$CardFundingType[] f44529a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ i70.a f44530b;

    static {
        PaymentSheet$CardFundingType[] paymentSheet$CardFundingTypeArr = {new PaymentSheet$CardFundingType("Debit", 0), new PaymentSheet$CardFundingType("Credit", 1), new PaymentSheet$CardFundingType("Prepaid", 2), new PaymentSheet$CardFundingType("Unknown", 3)};
        f44529a = paymentSheet$CardFundingTypeArr;
        f44530b = EnumEntriesKt.a(paymentSheet$CardFundingTypeArr);
        CREATOR = new ou.l0(4);
    }

    public static PaymentSheet$CardFundingType valueOf(String str) {
        return (PaymentSheet$CardFundingType) Enum.valueOf(PaymentSheet$CardFundingType.class, str);
    }

    public static PaymentSheet$CardFundingType[] values() {
        return (PaymentSheet$CardFundingType[]) f44529a.clone();
    }

    public final ft.c b() {
        int iOrdinal = ordinal();
        if (iOrdinal == 0) {
            return ft.c.f55912d;
        }
        if (iOrdinal == 1) {
            return ft.c.f55911c;
        }
        if (iOrdinal == 2) {
            return ft.c.f55913e;
        }
        if (iOrdinal == 3) {
            return ft.c.f55914f;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(name());
    }
}
