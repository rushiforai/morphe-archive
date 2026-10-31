package com.stripe.android.customersheet;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.customersheet.InternalCustomerSheetResult;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/customersheet/CustomerSheetContract;", "Lk/b;", "Lcom/stripe/android/customersheet/CustomerSheetContract$Args;", "Lcom/stripe/android/customersheet/InternalCustomerSheetResult;", "<init>", "()V", "Args", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CustomerSheetContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/customersheet/CustomerSheetContract$Args;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final jr.e f42604a;

        /* renamed from: b, reason: collision with root package name */
        public final CustomerSheet$Configuration f42605b;

        /* renamed from: c, reason: collision with root package name */
        public final Integer f42606c;

        public Args(jr.e integrationType, CustomerSheet$Configuration configuration, Integer num) {
            Intrinsics.g(integrationType, "integrationType");
            Intrinsics.g(configuration, "configuration");
            this.f42604a = integrationType;
            this.f42605b = configuration;
            this.f42606c = num;
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
            return this.f42604a == args.f42604a && Intrinsics.b(this.f42605b, args.f42605b) && Intrinsics.b(this.f42606c, args.f42606c);
        }

        public final int hashCode() {
            int iHashCode = (this.f42605b.hashCode() + (this.f42604a.hashCode() * 31)) * 31;
            Integer num = this.f42606c;
            return iHashCode + (num == null ? 0 : num.hashCode());
        }

        public final String toString() {
            return "Args(integrationType=" + this.f42604a + ", configuration=" + this.f42605b + ", statusBarColor=" + this.f42606c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42604a.name());
            this.f42605b.writeToParcel(dest, i5);
            Integer num = this.f42606c;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) CustomerSheetActivity.class).putExtra("args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        InternalCustomerSheetResult internalCustomerSheetResult = intent != null ? (InternalCustomerSheetResult) intent.getParcelableExtra("extra_activity_result") : null;
        return internalCustomerSheetResult == null ? new InternalCustomerSheetResult.Error(new IllegalArgumentException("Failed to retrieve a CustomerSheetResult")) : internalCustomerSheetResult;
    }
}
