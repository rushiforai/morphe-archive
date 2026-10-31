package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0001\u0002\u0082\u0001\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/SourceTypeModel;", "Lcom/stripe/android/core/model/StripeModel;", "Card", "Lcom/stripe/android/model/SourceTypeModel$Card;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class SourceTypeModel implements StripeModel {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/SourceTypeModel$Card;", "Lcom/stripe/android/model/SourceTypeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Card extends SourceTypeModel {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new j5();

        /* renamed from: a, reason: collision with root package name */
        public final String f43868a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43869b;

        /* renamed from: c, reason: collision with root package name */
        public final ft.b f43870c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43871d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43872e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43873f;

        /* renamed from: g, reason: collision with root package name */
        public final Integer f43874g;

        /* renamed from: h, reason: collision with root package name */
        public final Integer f43875h;

        /* renamed from: i, reason: collision with root package name */
        public final ft.c f43876i;

        /* renamed from: j, reason: collision with root package name */
        public final String f43877j;

        /* renamed from: k, reason: collision with root package name */
        public final ft.u0 f43878k;

        public Card(String str, String str2, ft.b brand, String str3, String str4, String str5, Integer num, Integer num2, ft.c cVar, String str6, ft.u0 u0Var) {
            Intrinsics.g(brand, "brand");
            this.f43868a = str;
            this.f43869b = str2;
            this.f43870c = brand;
            this.f43871d = str3;
            this.f43872e = str4;
            this.f43873f = str5;
            this.f43874g = num;
            this.f43875h = num2;
            this.f43876i = cVar;
            this.f43877j = str6;
            this.f43878k = u0Var;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Card)) {
                return false;
            }
            Card card = (Card) obj;
            return Intrinsics.b(this.f43868a, card.f43868a) && Intrinsics.b(this.f43869b, card.f43869b) && this.f43870c == card.f43870c && Intrinsics.b(this.f43871d, card.f43871d) && Intrinsics.b(this.f43872e, card.f43872e) && Intrinsics.b(this.f43873f, card.f43873f) && Intrinsics.b(this.f43874g, card.f43874g) && Intrinsics.b(this.f43875h, card.f43875h) && this.f43876i == card.f43876i && Intrinsics.b(this.f43877j, card.f43877j) && this.f43878k == card.f43878k;
        }

        public final int hashCode() {
            String str = this.f43868a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43869b;
            int iHashCode2 = (this.f43870c.hashCode() + ((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
            String str3 = this.f43871d;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43872e;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43873f;
            int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
            Integer num = this.f43874g;
            int iHashCode6 = (iHashCode5 + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.f43875h;
            int iHashCode7 = (iHashCode6 + (num2 == null ? 0 : num2.hashCode())) * 31;
            ft.c cVar = this.f43876i;
            int iHashCode8 = (iHashCode7 + (cVar == null ? 0 : cVar.hashCode())) * 31;
            String str6 = this.f43877j;
            int iHashCode9 = (iHashCode8 + (str6 == null ? 0 : str6.hashCode())) * 31;
            ft.u0 u0Var = this.f43878k;
            return iHashCode9 + (u0Var != null ? u0Var.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Card(addressLine1Check=", this.f43868a, ", addressZipCheck=", this.f43869b, ", brand=");
            sbW.append(this.f43870c);
            sbW.append(", country=");
            sbW.append(this.f43871d);
            sbW.append(", cvcCheck=");
            b.c0.D(sbW, this.f43872e, ", dynamicLast4=", this.f43873f, ", expiryMonth=");
            sbW.append(this.f43874g);
            sbW.append(", expiryYear=");
            sbW.append(this.f43875h);
            sbW.append(", funding=");
            sbW.append(this.f43876i);
            sbW.append(", last4=");
            sbW.append(this.f43877j);
            sbW.append(", tokenizationMethod=");
            sbW.append(this.f43878k);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43868a);
            dest.writeString(this.f43869b);
            dest.writeString(this.f43870c.name());
            dest.writeString(this.f43871d);
            dest.writeString(this.f43872e);
            dest.writeString(this.f43873f);
            Integer num = this.f43874g;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            Integer num2 = this.f43875h;
            if (num2 == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num2);
            }
            ft.c cVar = this.f43876i;
            if (cVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(cVar.name());
            }
            dest.writeString(this.f43877j);
            ft.u0 u0Var = this.f43878k;
            if (u0Var == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(u0Var.name());
            }
        }
    }
}
