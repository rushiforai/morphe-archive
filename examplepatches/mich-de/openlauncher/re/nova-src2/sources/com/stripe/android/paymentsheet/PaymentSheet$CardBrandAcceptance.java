package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0003\u0006\u0007\b¨\u0006\t"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance", "Landroid/os/Parcelable;", "BrandCategory", "All", "Allowed", "Disallowed", "Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance$All;", "Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance$Allowed;", "Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance$Disallowed;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class PaymentSheet$CardBrandAcceptance implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÁ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance$All;", "Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class All extends PaymentSheet$CardBrandAcceptance {

        /* renamed from: a, reason: collision with root package name */
        public static final All f44521a = new All();

        @NotNull
        public static final Parcelable.Creator<All> CREATOR = new u();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof All);
        }

        public final int hashCode() {
            return 1733345294;
        }

        public final String toString() {
            return "All";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance$Allowed;", "Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Allowed extends PaymentSheet$CardBrandAcceptance {

        @NotNull
        public static final Parcelable.Creator<Allowed> CREATOR = new v();

        /* renamed from: a, reason: collision with root package name */
        public final ArrayList f44522a;

        public Allowed(ArrayList arrayList) {
            this.f44522a = arrayList;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Allowed) && this.f44522a.equals(((Allowed) obj).f44522a);
        }

        public final int hashCode() {
            return this.f44522a.hashCode();
        }

        public final String toString() {
            return "Allowed(brands=" + this.f44522a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Iterator itJ = fq.c.j(this.f44522a, dest);
            while (itJ.hasNext()) {
                ((BrandCategory) itJ.next()).writeToParcel(dest, i5);
            }
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance$BrandCategory;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class BrandCategory implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<BrandCategory> CREATOR;

        /* renamed from: a, reason: collision with root package name */
        public static final BrandCategory f44523a;

        /* renamed from: b, reason: collision with root package name */
        public static final BrandCategory f44524b;

        /* renamed from: c, reason: collision with root package name */
        public static final BrandCategory f44525c;

        /* renamed from: d, reason: collision with root package name */
        public static final BrandCategory f44526d;

        /* renamed from: e, reason: collision with root package name */
        public static final /* synthetic */ BrandCategory[] f44527e;

        static {
            BrandCategory brandCategory = new BrandCategory("Visa", 0);
            f44523a = brandCategory;
            BrandCategory brandCategory2 = new BrandCategory("Mastercard", 1);
            f44524b = brandCategory2;
            BrandCategory brandCategory3 = new BrandCategory("Amex", 2);
            f44525c = brandCategory3;
            BrandCategory brandCategory4 = new BrandCategory("Discover", 3);
            f44526d = brandCategory4;
            BrandCategory[] brandCategoryArr = {brandCategory, brandCategory2, brandCategory3, brandCategory4};
            f44527e = brandCategoryArr;
            EnumEntriesKt.a(brandCategoryArr);
            CREATOR = new w();
        }

        public static BrandCategory valueOf(String str) {
            return (BrandCategory) Enum.valueOf(BrandCategory.class, str);
        }

        public static BrandCategory[] values() {
            return (BrandCategory[]) f44527e.clone();
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance$Disallowed;", "Lcom/stripe/android/paymentsheet/PaymentSheet$CardBrandAcceptance;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Disallowed extends PaymentSheet$CardBrandAcceptance {

        @NotNull
        public static final Parcelable.Creator<Disallowed> CREATOR = new x();

        /* renamed from: a, reason: collision with root package name */
        public final ArrayList f44528a;

        public Disallowed(ArrayList arrayList) {
            this.f44528a = arrayList;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Disallowed) && this.f44528a.equals(((Disallowed) obj).f44528a);
        }

        public final int hashCode() {
            return this.f44528a.hashCode();
        }

        public final String toString() {
            return "Disallowed(brands=" + this.f44528a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Iterator itJ = fq.c.j(this.f44528a, dest);
            while (itJ.hasNext()) {
                ((BrandCategory) itJ.next()).writeToParcel(dest, i5);
            }
        }
    }
}
