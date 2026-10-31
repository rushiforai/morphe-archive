package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.paymentsheet.PaymentSheet$Typography;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$Appearance", "Landroid/os/Parcelable;", "Embedded", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$Appearance implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$Appearance> CREATOR = new l();

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Colors f44453a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$Colors f44454b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSheet$Shapes f44455c;

    /* renamed from: d, reason: collision with root package name */
    public final PaymentSheet$Typography f44456d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentSheet$PrimaryButton f44457e;

    /* renamed from: f, reason: collision with root package name */
    public final Embedded f44458f;

    /* renamed from: g, reason: collision with root package name */
    public final PaymentSheet$Insets f44459g;

    /* renamed from: h, reason: collision with root package name */
    public final PaymentSheet$Spacing f44460h;

    /* renamed from: i, reason: collision with root package name */
    public final PaymentSheet$Insets f44461i;

    /* renamed from: j, reason: collision with root package name */
    public final ou.r0 f44462j;

    /* renamed from: k, reason: collision with root package name */
    public final float f44463k;

    public PaymentSheet$Appearance(PaymentSheet$Colors colorsLight, PaymentSheet$Colors colorsDark, PaymentSheet$Shapes shapes, PaymentSheet$Typography typography, PaymentSheet$PrimaryButton primaryButton, Embedded embeddedAppearance, PaymentSheet$Insets formInsetValues, PaymentSheet$Spacing sectionSpacing, PaymentSheet$Insets textFieldInsets, ou.r0 iconStyle, float f11) {
        Intrinsics.g(colorsLight, "colorsLight");
        Intrinsics.g(colorsDark, "colorsDark");
        Intrinsics.g(shapes, "shapes");
        Intrinsics.g(typography, "typography");
        Intrinsics.g(primaryButton, "primaryButton");
        Intrinsics.g(embeddedAppearance, "embeddedAppearance");
        Intrinsics.g(formInsetValues, "formInsetValues");
        Intrinsics.g(sectionSpacing, "sectionSpacing");
        Intrinsics.g(textFieldInsets, "textFieldInsets");
        Intrinsics.g(iconStyle, "iconStyle");
        this.f44453a = colorsLight;
        this.f44454b = colorsDark;
        this.f44455c = shapes;
        this.f44456d = typography;
        this.f44457e = primaryButton;
        this.f44458f = embeddedAppearance;
        this.f44459g = formInsetValues;
        this.f44460h = sectionSpacing;
        this.f44461i = textFieldInsets;
        this.f44462j = iconStyle;
        this.f44463k = f11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$Appearance)) {
            return false;
        }
        PaymentSheet$Appearance paymentSheet$Appearance = (PaymentSheet$Appearance) obj;
        return Intrinsics.b(this.f44453a, paymentSheet$Appearance.f44453a) && Intrinsics.b(this.f44454b, paymentSheet$Appearance.f44454b) && Intrinsics.b(this.f44455c, paymentSheet$Appearance.f44455c) && Intrinsics.b(this.f44456d, paymentSheet$Appearance.f44456d) && Intrinsics.b(this.f44457e, paymentSheet$Appearance.f44457e) && Intrinsics.b(this.f44458f, paymentSheet$Appearance.f44458f) && Intrinsics.b(this.f44459g, paymentSheet$Appearance.f44459g) && Intrinsics.b(this.f44460h, paymentSheet$Appearance.f44460h) && Intrinsics.b(this.f44461i, paymentSheet$Appearance.f44461i) && this.f44462j == paymentSheet$Appearance.f44462j && Float.compare(this.f44463k, paymentSheet$Appearance.f44463k) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f44463k) + ((this.f44462j.hashCode() + ((this.f44461i.hashCode() + a80.m.d(this.f44460h.f44645a, (this.f44459g.hashCode() + ((this.f44458f.hashCode() + ((this.f44457e.hashCode() + ((this.f44456d.hashCode() + ((this.f44455c.hashCode() + ((this.f44454b.hashCode() + (this.f44453a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31, 31)) * 31)) * 31);
    }

    public final String toString() {
        return "Appearance(colorsLight=" + this.f44453a + ", colorsDark=" + this.f44454b + ", shapes=" + this.f44455c + ", typography=" + this.f44456d + ", primaryButton=" + this.f44457e + ", embeddedAppearance=" + this.f44458f + ", formInsetValues=" + this.f44459g + ", sectionSpacing=" + this.f44460h + ", textFieldInsets=" + this.f44461i + ", iconStyle=" + this.f44462j + ", verticalModeRowPadding=" + this.f44463k + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44453a.writeToParcel(dest, i5);
        this.f44454b.writeToParcel(dest, i5);
        this.f44455c.writeToParcel(dest, i5);
        this.f44456d.writeToParcel(dest, i5);
        this.f44457e.writeToParcel(dest, i5);
        this.f44458f.writeToParcel(dest, i5);
        this.f44459g.writeToParcel(dest, i5);
        this.f44460h.writeToParcel(dest, i5);
        this.f44461i.writeToParcel(dest, i5);
        dest.writeString(this.f44462j.name());
        dest.writeFloat(this.f44463k);
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded;", "Landroid/os/Parcelable;", "RowStyle", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Embedded implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Embedded> CREATOR = new m();

        /* renamed from: e, reason: collision with root package name */
        public static final Embedded f44464e = new Embedded(RowStyle.FlatWithRadio.f44493j);

        /* renamed from: a, reason: collision with root package name */
        public final RowStyle f44465a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentSheet$Insets f44466b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentSheet$Typography.Font f44467c;

        /* renamed from: d, reason: collision with root package name */
        public final PaymentSheet$Typography.Font f44468d;

        @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0004\u0006\u0007\b\t¨\u0006\n"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle;", "Landroid/os/Parcelable;", "FlatWithRadio", "FlatWithCheckmark", "FloatingButton", "FlatWithDisclosure", "Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithCheckmark;", "Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithDisclosure;", "Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithRadio;", "Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FloatingButton;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static abstract class RowStyle implements Parcelable {

            @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithCheckmark;", "Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle;", "Colors", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final class FlatWithCheckmark extends RowStyle {

                @NotNull
                public static final Parcelable.Creator<FlatWithCheckmark> CREATOR = new o();

                /* renamed from: a, reason: collision with root package name */
                public final float f44469a;

                /* renamed from: b, reason: collision with root package name */
                public final float f44470b;

                /* renamed from: c, reason: collision with root package name */
                public final float f44471c;

                /* renamed from: d, reason: collision with root package name */
                public final boolean f44472d;

                /* renamed from: e, reason: collision with root package name */
                public final boolean f44473e;

                /* renamed from: f, reason: collision with root package name */
                public final float f44474f;

                /* renamed from: g, reason: collision with root package name */
                public final float f44475g;

                /* renamed from: h, reason: collision with root package name */
                public final float f44476h;

                /* renamed from: i, reason: collision with root package name */
                public final Colors f44477i;

                /* renamed from: j, reason: collision with root package name */
                public final Colors f44478j;

                @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithCheckmark$Colors;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
                public static final class Colors implements Parcelable {

                    @NotNull
                    public static final Parcelable.Creator<Colors> CREATOR = new n();

                    /* renamed from: a, reason: collision with root package name */
                    public final int f44479a;

                    /* renamed from: b, reason: collision with root package name */
                    public final int f44480b;

                    public Colors(int i5, int i11) {
                        this.f44479a = i5;
                        this.f44480b = i11;
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        if (this == obj) {
                            return true;
                        }
                        if (!(obj instanceof Colors)) {
                            return false;
                        }
                        Colors colors = (Colors) obj;
                        return this.f44479a == colors.f44479a && this.f44480b == colors.f44480b;
                    }

                    public final int hashCode() {
                        return (this.f44479a * 31) + this.f44480b;
                    }

                    public final String toString() {
                        return h6.c1.n(this.f44479a, "Colors(separatorColor=", ", checkmarkColor=", this.f44480b, ")");
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel dest, int i5) {
                        Intrinsics.g(dest, "dest");
                        dest.writeInt(this.f44479a);
                        dest.writeInt(this.f44480b);
                    }
                }

                static {
                    hw.q.f60781f.getClass();
                    hw.q.f60788m.getClass();
                    hw.a aVar = hw.q.f60782g;
                    Colors colors = new Colors(i2.r0.r(aVar.f60722a), i2.r0.r(aVar.f60723b));
                    hw.a aVar2 = hw.q.f60783h;
                    new FlatWithCheckmark(1.0f, 0.0f, 0.0f, true, true, 0.0f, 0.0f, 0.0f, colors, new Colors(i2.r0.r(aVar2.f60722a), i2.r0.r(aVar2.f60723b)));
                }

                public FlatWithCheckmark(float f11, float f12, float f13, boolean z11, boolean z12, float f14, float f15, float f16, Colors colorsLight, Colors colorsDark) {
                    Intrinsics.g(colorsLight, "colorsLight");
                    Intrinsics.g(colorsDark, "colorsDark");
                    this.f44469a = f11;
                    this.f44470b = f12;
                    this.f44471c = f13;
                    this.f44472d = z11;
                    this.f44473e = z12;
                    this.f44474f = f14;
                    this.f44475g = f15;
                    this.f44476h = f16;
                    this.f44477i = colorsLight;
                    this.f44478j = colorsDark;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof FlatWithCheckmark)) {
                        return false;
                    }
                    FlatWithCheckmark flatWithCheckmark = (FlatWithCheckmark) obj;
                    return Float.compare(this.f44469a, flatWithCheckmark.f44469a) == 0 && Float.compare(this.f44470b, flatWithCheckmark.f44470b) == 0 && Float.compare(this.f44471c, flatWithCheckmark.f44471c) == 0 && this.f44472d == flatWithCheckmark.f44472d && this.f44473e == flatWithCheckmark.f44473e && Float.compare(this.f44474f, flatWithCheckmark.f44474f) == 0 && Float.compare(this.f44475g, flatWithCheckmark.f44475g) == 0 && Float.compare(this.f44476h, flatWithCheckmark.f44476h) == 0 && Intrinsics.b(this.f44477i, flatWithCheckmark.f44477i) && Intrinsics.b(this.f44478j, flatWithCheckmark.f44478j);
                }

                public final int hashCode() {
                    return this.f44478j.hashCode() + ((this.f44477i.hashCode() + a80.m.d(this.f44476h, a80.m.d(this.f44475g, a80.m.d(this.f44474f, c9.f(c9.f(a80.m.d(this.f44471c, a80.m.d(this.f44470b, Float.hashCode(this.f44469a) * 31, 31), 31), 31, this.f44472d), 31, this.f44473e), 31), 31), 31)) * 31);
                }

                public final String toString() {
                    return "FlatWithCheckmark(separatorThicknessDp=" + this.f44469a + ", startSeparatorInsetDp=" + this.f44470b + ", endSeparatorInsetDp=" + this.f44471c + ", topSeparatorEnabled=" + this.f44472d + ", bottomSeparatorEnabled=" + this.f44473e + ", checkmarkInsetDp=" + this.f44474f + ", additionalVerticalInsetsDp=" + this.f44475g + ", horizontalInsetsDp=" + this.f44476h + ", colorsLight=" + this.f44477i + ", colorsDark=" + this.f44478j + ")";
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    dest.writeFloat(this.f44469a);
                    dest.writeFloat(this.f44470b);
                    dest.writeFloat(this.f44471c);
                    dest.writeInt(this.f44472d ? 1 : 0);
                    dest.writeInt(this.f44473e ? 1 : 0);
                    dest.writeFloat(this.f44474f);
                    dest.writeFloat(this.f44475g);
                    dest.writeFloat(this.f44476h);
                    this.f44477i.writeToParcel(dest, i5);
                    this.f44478j.writeToParcel(dest, i5);
                }
            }

            @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithDisclosure;", "Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle;", "Colors", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final class FlatWithDisclosure extends RowStyle {

                @NotNull
                public static final Parcelable.Creator<FlatWithDisclosure> CREATOR = new q();

                /* renamed from: a, reason: collision with root package name */
                public final float f44481a;

                /* renamed from: b, reason: collision with root package name */
                public final float f44482b;

                /* renamed from: c, reason: collision with root package name */
                public final float f44483c;

                /* renamed from: d, reason: collision with root package name */
                public final boolean f44484d;

                /* renamed from: e, reason: collision with root package name */
                public final float f44485e;

                /* renamed from: f, reason: collision with root package name */
                public final boolean f44486f;

                /* renamed from: g, reason: collision with root package name */
                public final float f44487g;

                /* renamed from: h, reason: collision with root package name */
                public final Colors f44488h;

                /* renamed from: i, reason: collision with root package name */
                public final Colors f44489i;

                /* renamed from: j, reason: collision with root package name */
                public final int f44490j;

                @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithDisclosure$Colors;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
                public static final class Colors implements Parcelable {

                    @NotNull
                    public static final Parcelable.Creator<Colors> CREATOR = new p();

                    /* renamed from: a, reason: collision with root package name */
                    public final int f44491a;

                    /* renamed from: b, reason: collision with root package name */
                    public final int f44492b;

                    public Colors(int i5, int i11) {
                        this.f44491a = i5;
                        this.f44492b = i11;
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        if (this == obj) {
                            return true;
                        }
                        if (!(obj instanceof Colors)) {
                            return false;
                        }
                        Colors colors = (Colors) obj;
                        return this.f44491a == colors.f44491a && this.f44492b == colors.f44492b;
                    }

                    public final int hashCode() {
                        return (this.f44491a * 31) + this.f44492b;
                    }

                    public final String toString() {
                        return h6.c1.n(this.f44491a, "Colors(separatorColor=", ", disclosureColor=", this.f44492b, ")");
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel dest, int i5) {
                        Intrinsics.g(dest, "dest");
                        dest.writeInt(this.f44491a);
                        dest.writeInt(this.f44492b);
                    }
                }

                static {
                    hw.q.f60781f.getClass();
                    hw.q.f60788m.getClass();
                    hw.b bVar = hw.q.f60786k;
                    Colors colors = new Colors(i2.r0.r(bVar.f60724a), i2.r0.r(bVar.f60725b));
                    hw.b bVar2 = hw.q.f60787l;
                    new FlatWithDisclosure(1.0f, 0.0f, 0.0f, true, 0.0f, true, 0.0f, colors, new Colors(i2.r0.r(bVar2.f60724a), i2.r0.r(bVar2.f60725b)), 2131232163);
                }

                public FlatWithDisclosure(float f11, float f12, float f13, boolean z11, float f14, boolean z12, float f15, Colors colorsLight, Colors colorsDark, int i5) {
                    Intrinsics.g(colorsLight, "colorsLight");
                    Intrinsics.g(colorsDark, "colorsDark");
                    this.f44481a = f11;
                    this.f44482b = f12;
                    this.f44483c = f13;
                    this.f44484d = z11;
                    this.f44485e = f14;
                    this.f44486f = z12;
                    this.f44487g = f15;
                    this.f44488h = colorsLight;
                    this.f44489i = colorsDark;
                    this.f44490j = i5;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof FlatWithDisclosure)) {
                        return false;
                    }
                    FlatWithDisclosure flatWithDisclosure = (FlatWithDisclosure) obj;
                    return Float.compare(this.f44481a, flatWithDisclosure.f44481a) == 0 && Float.compare(this.f44482b, flatWithDisclosure.f44482b) == 0 && Float.compare(this.f44483c, flatWithDisclosure.f44483c) == 0 && this.f44484d == flatWithDisclosure.f44484d && Float.compare(this.f44485e, flatWithDisclosure.f44485e) == 0 && this.f44486f == flatWithDisclosure.f44486f && Float.compare(this.f44487g, flatWithDisclosure.f44487g) == 0 && Intrinsics.b(this.f44488h, flatWithDisclosure.f44488h) && Intrinsics.b(this.f44489i, flatWithDisclosure.f44489i) && this.f44490j == flatWithDisclosure.f44490j;
                }

                public final int hashCode() {
                    return ((this.f44489i.hashCode() + ((this.f44488h.hashCode() + a80.m.d(this.f44487g, c9.f(a80.m.d(this.f44485e, c9.f(a80.m.d(this.f44483c, a80.m.d(this.f44482b, Float.hashCode(this.f44481a) * 31, 31), 31), 31, this.f44484d), 31), 31, this.f44486f), 31)) * 31)) * 31) + this.f44490j;
                }

                public final String toString() {
                    return "FlatWithDisclosure(separatorThicknessDp=" + this.f44481a + ", startSeparatorInsetDp=" + this.f44482b + ", endSeparatorInsetDp=" + this.f44483c + ", topSeparatorEnabled=" + this.f44484d + ", additionalVerticalInsetsDp=" + this.f44485e + ", bottomSeparatorEnabled=" + this.f44486f + ", horizontalInsetsDp=" + this.f44487g + ", colorsLight=" + this.f44488h + ", colorsDark=" + this.f44489i + ", disclosureIconRes=" + this.f44490j + ")";
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    dest.writeFloat(this.f44481a);
                    dest.writeFloat(this.f44482b);
                    dest.writeFloat(this.f44483c);
                    dest.writeInt(this.f44484d ? 1 : 0);
                    dest.writeFloat(this.f44485e);
                    dest.writeInt(this.f44486f ? 1 : 0);
                    dest.writeFloat(this.f44487g);
                    this.f44488h.writeToParcel(dest, i5);
                    this.f44489i.writeToParcel(dest, i5);
                    dest.writeInt(this.f44490j);
                }
            }

            @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithRadio;", "Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle;", "Colors", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final class FlatWithRadio extends RowStyle {

                @NotNull
                public static final Parcelable.Creator<FlatWithRadio> CREATOR = new s();

                /* renamed from: j, reason: collision with root package name */
                public static final FlatWithRadio f44493j;

                /* renamed from: a, reason: collision with root package name */
                public final float f44494a;

                /* renamed from: b, reason: collision with root package name */
                public final float f44495b;

                /* renamed from: c, reason: collision with root package name */
                public final float f44496c;

                /* renamed from: d, reason: collision with root package name */
                public final boolean f44497d;

                /* renamed from: e, reason: collision with root package name */
                public final boolean f44498e;

                /* renamed from: f, reason: collision with root package name */
                public final float f44499f;

                /* renamed from: g, reason: collision with root package name */
                public final float f44500g;

                /* renamed from: h, reason: collision with root package name */
                public final Colors f44501h;

                /* renamed from: i, reason: collision with root package name */
                public final Colors f44502i;

                @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FlatWithRadio$Colors;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
                public static final class Colors implements Parcelable {

                    @NotNull
                    public static final Parcelable.Creator<Colors> CREATOR = new r();

                    /* renamed from: a, reason: collision with root package name */
                    public final int f44503a;

                    /* renamed from: b, reason: collision with root package name */
                    public final int f44504b;

                    /* renamed from: c, reason: collision with root package name */
                    public final int f44505c;

                    public Colors(int i5, int i11, int i12) {
                        this.f44503a = i5;
                        this.f44504b = i11;
                        this.f44505c = i12;
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        if (this == obj) {
                            return true;
                        }
                        if (!(obj instanceof Colors)) {
                            return false;
                        }
                        Colors colors = (Colors) obj;
                        return this.f44503a == colors.f44503a && this.f44504b == colors.f44504b && this.f44505c == colors.f44505c;
                    }

                    public final int hashCode() {
                        return (((this.f44503a * 31) + this.f44504b) * 31) + this.f44505c;
                    }

                    public final String toString() {
                        return b.c0.o(b.c0.t(this.f44503a, "Colors(separatorColor=", ", selectedColor=", this.f44504b, ", unselectedColor="), this.f44505c, ")");
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel dest, int i5) {
                        Intrinsics.g(dest, "dest");
                        dest.writeInt(this.f44503a);
                        dest.writeInt(this.f44504b);
                        dest.writeInt(this.f44505c);
                    }
                }

                static {
                    hw.q.f60781f.getClass();
                    hw.q.f60788m.getClass();
                    hw.f fVar = hw.q.f60784i;
                    Colors colors = new Colors(i2.r0.r(fVar.f60726a), i2.r0.r(fVar.f60727b), i2.r0.r(fVar.f60728c));
                    hw.f fVar2 = hw.q.f60785j;
                    f44493j = new FlatWithRadio(1.0f, 0.0f, 0.0f, true, true, 0.0f, 0.0f, colors, new Colors(i2.r0.r(fVar2.f60726a), i2.r0.r(fVar2.f60727b), i2.r0.r(fVar2.f60728c)));
                }

                public FlatWithRadio(float f11, float f12, float f13, boolean z11, boolean z12, float f14, float f15, Colors colorsLight, Colors colorsDark) {
                    Intrinsics.g(colorsLight, "colorsLight");
                    Intrinsics.g(colorsDark, "colorsDark");
                    this.f44494a = f11;
                    this.f44495b = f12;
                    this.f44496c = f13;
                    this.f44497d = z11;
                    this.f44498e = z12;
                    this.f44499f = f14;
                    this.f44500g = f15;
                    this.f44501h = colorsLight;
                    this.f44502i = colorsDark;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof FlatWithRadio)) {
                        return false;
                    }
                    FlatWithRadio flatWithRadio = (FlatWithRadio) obj;
                    return Float.compare(this.f44494a, flatWithRadio.f44494a) == 0 && Float.compare(this.f44495b, flatWithRadio.f44495b) == 0 && Float.compare(this.f44496c, flatWithRadio.f44496c) == 0 && this.f44497d == flatWithRadio.f44497d && this.f44498e == flatWithRadio.f44498e && Float.compare(this.f44499f, flatWithRadio.f44499f) == 0 && Float.compare(this.f44500g, flatWithRadio.f44500g) == 0 && Intrinsics.b(this.f44501h, flatWithRadio.f44501h) && Intrinsics.b(this.f44502i, flatWithRadio.f44502i);
                }

                public final int hashCode() {
                    return this.f44502i.hashCode() + ((this.f44501h.hashCode() + a80.m.d(this.f44500g, a80.m.d(this.f44499f, c9.f(c9.f(a80.m.d(this.f44496c, a80.m.d(this.f44495b, Float.hashCode(this.f44494a) * 31, 31), 31), 31, this.f44497d), 31, this.f44498e), 31), 31)) * 31);
                }

                public final String toString() {
                    return "FlatWithRadio(separatorThicknessDp=" + this.f44494a + ", startSeparatorInsetDp=" + this.f44495b + ", endSeparatorInsetDp=" + this.f44496c + ", topSeparatorEnabled=" + this.f44497d + ", bottomSeparatorEnabled=" + this.f44498e + ", additionalVerticalInsetsDp=" + this.f44499f + ", horizontalInsetsDp=" + this.f44500g + ", colorsLight=" + this.f44501h + ", colorsDark=" + this.f44502i + ")";
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    dest.writeFloat(this.f44494a);
                    dest.writeFloat(this.f44495b);
                    dest.writeFloat(this.f44496c);
                    dest.writeInt(this.f44497d ? 1 : 0);
                    dest.writeInt(this.f44498e ? 1 : 0);
                    dest.writeFloat(this.f44499f);
                    dest.writeFloat(this.f44500g);
                    this.f44501h.writeToParcel(dest, i5);
                    this.f44502i.writeToParcel(dest, i5);
                }
            }

            @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle$FloatingButton;", "Lcom/stripe/android/paymentsheet/PaymentSheet$Appearance$Embedded$RowStyle;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final class FloatingButton extends RowStyle {

                @NotNull
                public static final Parcelable.Creator<FloatingButton> CREATOR = new t();

                /* renamed from: c, reason: collision with root package name */
                public static final FloatingButton f44506c;

                /* renamed from: a, reason: collision with root package name */
                public final float f44507a;

                /* renamed from: b, reason: collision with root package name */
                public final float f44508b;

                static {
                    hw.q.n.getClass();
                    hw.q.f60788m.getClass();
                    f44506c = new FloatingButton(12.0f, 0.0f);
                }

                public FloatingButton(float f11, float f12) {
                    this.f44507a = f11;
                    this.f44508b = f12;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof FloatingButton)) {
                        return false;
                    }
                    FloatingButton floatingButton = (FloatingButton) obj;
                    return Float.compare(this.f44507a, floatingButton.f44507a) == 0 && Float.compare(this.f44508b, floatingButton.f44508b) == 0;
                }

                public final int hashCode() {
                    return Float.hashCode(this.f44508b) + (Float.hashCode(this.f44507a) * 31);
                }

                public final String toString() {
                    return "FloatingButton(spacingDp=" + this.f44507a + ", additionalInsetsDp=" + this.f44508b + ")";
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    dest.writeFloat(this.f44507a);
                    dest.writeFloat(this.f44508b);
                }
            }
        }

        public Embedded(RowStyle style, PaymentSheet$Insets paymentSheet$Insets, PaymentSheet$Typography.Font font, PaymentSheet$Typography.Font font2) {
            Intrinsics.g(style, "style");
            this.f44465a = style;
            this.f44466b = paymentSheet$Insets;
            this.f44467c = font;
            this.f44468d = font2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Embedded)) {
                return false;
            }
            Embedded embedded = (Embedded) obj;
            return Intrinsics.b(this.f44465a, embedded.f44465a) && Intrinsics.b(this.f44466b, embedded.f44466b) && Intrinsics.b(this.f44467c, embedded.f44467c) && Intrinsics.b(this.f44468d, embedded.f44468d);
        }

        public final int hashCode() {
            int iHashCode = this.f44465a.hashCode() * 31;
            PaymentSheet$Insets paymentSheet$Insets = this.f44466b;
            int iHashCode2 = (iHashCode + (paymentSheet$Insets == null ? 0 : paymentSheet$Insets.hashCode())) * 31;
            PaymentSheet$Typography.Font font = this.f44467c;
            int iHashCode3 = (iHashCode2 + (font == null ? 0 : font.hashCode())) * 31;
            PaymentSheet$Typography.Font font2 = this.f44468d;
            return iHashCode3 + (font2 != null ? font2.hashCode() : 0);
        }

        public final String toString() {
            return "Embedded(style=" + this.f44465a + ", paymentMethodIconMargins=" + this.f44466b + ", titleFont=" + this.f44467c + ", subtitleFont=" + this.f44468d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44465a, i5);
            PaymentSheet$Insets paymentSheet$Insets = this.f44466b;
            if (paymentSheet$Insets == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                paymentSheet$Insets.writeToParcel(dest, i5);
            }
            PaymentSheet$Typography.Font font = this.f44467c;
            if (font == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                font.writeToParcel(dest, i5);
            }
            PaymentSheet$Typography.Font font2 = this.f44468d;
            if (font2 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                font2.writeToParcel(dest, i5);
            }
        }

        /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
        public Embedded(RowStyle style) {
            this(style, null, null, null);
            Intrinsics.g(style, "style");
        }
    }

    public PaymentSheet$Appearance() {
        PaymentSheet$Colors colorsLight = PaymentSheet$Colors.f44531l;
        PaymentSheet$Colors colorsDark = PaymentSheet$Colors.f44532m;
        PaymentSheet$Shapes shapes = PaymentSheet$Shapes.f44628d;
        PaymentSheet$Typography typography = PaymentSheet$Typography.f44646d;
        PaymentSheet$PrimaryButton paymentSheet$PrimaryButton = new PaymentSheet$PrimaryButton(PaymentSheet$PrimaryButtonColors.f44616f, PaymentSheet$PrimaryButtonColors.f44617g, new PaymentSheet$PrimaryButtonShape(null, null, null), new PaymentSheet$PrimaryButtonTypography(null, null));
        Intrinsics.g(colorsLight, "colorsLight");
        Intrinsics.g(colorsDark, "colorsDark");
        Intrinsics.g(shapes, "shapes");
        Intrinsics.g(typography, "typography");
        Embedded embeddedAppearance = Embedded.f44464e;
        PaymentSheet$Insets paymentSheet$Insets = PaymentSheet$Insets.f44582e;
        Intrinsics.g(embeddedAppearance, "embeddedAppearance");
        PaymentSheet$Insets paymentSheet$Insets2 = PaymentSheet$Insets.f44583f;
        ou.r0.f80968a.getClass();
        ou.r0 r0Var = ou.r0.f80969b;
        hw.n nVar = hw.q.f60776a;
        this(colorsLight, colorsDark, shapes, typography, paymentSheet$PrimaryButton, embeddedAppearance, paymentSheet$Insets, PaymentSheet$Spacing.f44644b, paymentSheet$Insets2, r0Var, 0.0f);
    }
}
