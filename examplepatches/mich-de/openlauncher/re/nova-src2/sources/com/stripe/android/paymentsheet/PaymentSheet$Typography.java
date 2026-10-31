package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$Typography", "Landroid/os/Parcelable;", "Custom", "Font", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$Typography implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$Typography> CREATOR = new k0();

    /* renamed from: d, reason: collision with root package name */
    public static final PaymentSheet$Typography f44646d;

    /* renamed from: a, reason: collision with root package name */
    public final float f44647a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f44648b;

    /* renamed from: c, reason: collision with root package name */
    public final Custom f44649c;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Typography$Custom;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Custom implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Custom> CREATOR = new l0();

        /* renamed from: a, reason: collision with root package name */
        public final Font f44650a;

        public Custom(Font font) {
            this.f44650a = font;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Custom) && Intrinsics.b(this.f44650a, ((Custom) obj).f44650a);
        }

        public final int hashCode() {
            Font font = this.f44650a;
            if (font == null) {
                return 0;
            }
            return font.hashCode();
        }

        public final String toString() {
            return "Custom(h1=" + this.f44650a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Font font = this.f44650a;
            if (font == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                font.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Typography$Font;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Font implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Font> CREATOR = new m0();

        /* renamed from: a, reason: collision with root package name */
        public final Integer f44651a;

        /* renamed from: b, reason: collision with root package name */
        public final Float f44652b;

        /* renamed from: c, reason: collision with root package name */
        public final Integer f44653c;

        /* renamed from: d, reason: collision with root package name */
        public final Float f44654d;

        public Font(Integer num, Float f11, Integer num2, Float f12) {
            this.f44651a = num;
            this.f44652b = f11;
            this.f44653c = num2;
            this.f44654d = f12;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Font)) {
                return false;
            }
            Font font = (Font) obj;
            return Intrinsics.b(this.f44651a, font.f44651a) && Intrinsics.b(this.f44652b, font.f44652b) && Intrinsics.b(this.f44653c, font.f44653c) && Intrinsics.b(this.f44654d, font.f44654d);
        }

        public final int hashCode() {
            Integer num = this.f44651a;
            int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
            Float f11 = this.f44652b;
            int iHashCode2 = (iHashCode + (f11 == null ? 0 : f11.hashCode())) * 31;
            Integer num2 = this.f44653c;
            int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
            Float f12 = this.f44654d;
            return iHashCode3 + (f12 != null ? f12.hashCode() : 0);
        }

        public final String toString() {
            return "Font(fontFamily=" + this.f44651a + ", fontSizeSp=" + this.f44652b + ", fontWeight=" + this.f44653c + ", letterSpacingSp=" + this.f44654d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Integer num = this.f44651a;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            Float f11 = this.f44652b;
            if (f11 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeFloat(f11.floatValue());
            }
            Integer num2 = this.f44653c;
            if (num2 == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num2);
            }
            Float f12 = this.f44654d;
            if (f12 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeFloat(f12.floatValue());
            }
        }
    }

    static {
        hw.s sVar = hw.q.f60779d;
        f44646d = new PaymentSheet$Typography(sVar.f60805d, sVar.f60812k, new Custom(null));
    }

    public PaymentSheet$Typography(float f11, Integer num, Custom custom) {
        Intrinsics.g(custom, "custom");
        this.f44647a = f11;
        this.f44648b = num;
        this.f44649c = custom;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$Typography)) {
            return false;
        }
        PaymentSheet$Typography paymentSheet$Typography = (PaymentSheet$Typography) obj;
        return Float.compare(this.f44647a, paymentSheet$Typography.f44647a) == 0 && Intrinsics.b(this.f44648b, paymentSheet$Typography.f44648b) && Intrinsics.b(this.f44649c, paymentSheet$Typography.f44649c);
    }

    public final int hashCode() {
        int iHashCode = Float.hashCode(this.f44647a) * 31;
        Integer num = this.f44648b;
        return this.f44649c.hashCode() + ((iHashCode + (num == null ? 0 : num.hashCode())) * 31);
    }

    public final String toString() {
        return "Typography(sizeScaleFactor=" + this.f44647a + ", fontResId=" + this.f44648b + ", custom=" + this.f44649c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeFloat(this.f44647a);
        Integer num = this.f44648b;
        if (num == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num);
        }
        this.f44649c.writeToParcel(dest, i5);
    }
}
