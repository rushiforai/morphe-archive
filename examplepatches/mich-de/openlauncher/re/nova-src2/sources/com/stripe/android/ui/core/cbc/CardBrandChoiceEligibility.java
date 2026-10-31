package com.stripe.android.ui.core.cbc;

import android.os.Parcel;
import android.os.Parcelable;
import fq.c;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/ui/core/cbc/CardBrandChoiceEligibility;", "Landroid/os/Parcelable;", "Eligible", "Ineligible", "Lcom/stripe/android/ui/core/cbc/CardBrandChoiceEligibility$Eligible;", "Lcom/stripe/android/ui/core/cbc/CardBrandChoiceEligibility$Ineligible;", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface CardBrandChoiceEligibility extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/ui/core/cbc/CardBrandChoiceEligibility$Eligible;", "Lcom/stripe/android/ui/core/cbc/CardBrandChoiceEligibility;", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Eligible implements CardBrandChoiceEligibility {

        @NotNull
        public static final Parcelable.Creator<Eligible> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final List f45279a;

        public Eligible(List preferredNetworks) {
            Intrinsics.g(preferredNetworks, "preferredNetworks");
            this.f45279a = preferredNetworks;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Eligible) && Intrinsics.b(this.f45279a, ((Eligible) obj).f45279a);
        }

        public final int hashCode() {
            return this.f45279a.hashCode();
        }

        public final String toString() {
            return "Eligible(preferredNetworks=" + this.f45279a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Iterator itK = c.k(this.f45279a, dest);
            while (itK.hasNext()) {
                dest.writeString(((ft.b) itK.next()).name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/ui/core/cbc/CardBrandChoiceEligibility$Ineligible;", "Lcom/stripe/android/ui/core/cbc/CardBrandChoiceEligibility;", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Ineligible implements CardBrandChoiceEligibility {

        /* renamed from: a, reason: collision with root package name */
        public static final Ineligible f45280a = new Ineligible();

        @NotNull
        public static final Parcelable.Creator<Ineligible> CREATOR = new b();

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
