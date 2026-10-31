package com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionResult;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/cvcrecollection/CvcRecollectionContract;", "Lk/b;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/cvcrecollection/CvcRecollectionContract$Args;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/cvcrecollection/CvcRecollectionResult;", "<init>", "()V", "Args", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CvcRecollectionContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/cvcrecollection/CvcRecollectionContract$Args;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final String f44921a;

        /* renamed from: b, reason: collision with root package name */
        public final ft.b f44922b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentSheet$Appearance f44923c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f44924d;

        public Args(String lastFour, ft.b cardBrand, PaymentSheet$Appearance appearance, boolean z11) {
            Intrinsics.g(lastFour, "lastFour");
            Intrinsics.g(cardBrand, "cardBrand");
            Intrinsics.g(appearance, "appearance");
            this.f44921a = lastFour;
            this.f44922b = cardBrand;
            this.f44923c = appearance;
            this.f44924d = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Args)) {
                return false;
            }
            Args args = (Args) obj;
            return Intrinsics.b(this.f44921a, args.f44921a) && this.f44922b == args.f44922b && Intrinsics.b(this.f44923c, args.f44923c) && this.f44924d == args.f44924d;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f44924d) + ((this.f44923c.hashCode() + ((this.f44922b.hashCode() + (this.f44921a.hashCode() * 31)) * 31)) * 31);
        }

        public final String toString() {
            return "Args(lastFour=" + this.f44921a + ", cardBrand=" + this.f44922b + ", appearance=" + this.f44923c + ", isTestMode=" + this.f44924d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44921a);
            dest.writeString(this.f44922b.name());
            this.f44923c.writeToParcel(dest, i5);
            dest.writeInt(this.f44924d ? 1 : 0);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) CvcRecollectionActivity.class).putExtra("extra_activity_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Bundle extras;
        CvcRecollectionResult cvcRecollectionResult = (intent == null || (extras = intent.getExtras()) == null) ? null : (CvcRecollectionResult) vm.d.i(extras, "extra_activity_result", CvcRecollectionResult.class);
        return cvcRecollectionResult == null ? CvcRecollectionResult.Cancelled.f44925a : cvcRecollectionResult;
    }
}
