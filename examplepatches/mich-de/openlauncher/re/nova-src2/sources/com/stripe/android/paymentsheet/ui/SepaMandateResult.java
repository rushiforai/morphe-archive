package com.stripe.android.paymentsheet.ui;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentsheet/ui/SepaMandateResult;", "Landroid/os/Parcelable;", "Canceled", "Acknowledged", "Lcom/stripe/android/paymentsheet/ui/SepaMandateResult$Acknowledged;", "Lcom/stripe/android/paymentsheet/ui/SepaMandateResult$Canceled;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface SepaMandateResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/ui/SepaMandateResult$Acknowledged;", "Lcom/stripe/android/paymentsheet/ui/SepaMandateResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Acknowledged implements SepaMandateResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Acknowledged f45000a = new Acknowledged();

        @NotNull
        public static final Parcelable.Creator<Acknowledged> CREATOR = new c();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/ui/SepaMandateResult$Canceled;", "Lcom/stripe/android/paymentsheet/ui/SepaMandateResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Canceled implements SepaMandateResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f45001a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new d();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }
}
