package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import i2.r0;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/link/LinkAppearance;", "Landroid/os/Parcelable;", "Colors", "Style", "PrimaryButton", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LinkAppearance implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<LinkAppearance> CREATOR = new n();

    /* renamed from: a, reason: collision with root package name */
    public final Colors f42882a;

    /* renamed from: b, reason: collision with root package name */
    public final Colors f42883b;

    /* renamed from: c, reason: collision with root package name */
    public final Style f42884c;

    /* renamed from: d, reason: collision with root package name */
    public final PrimaryButton f42885d;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkAppearance$Colors;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Colors implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Colors> CREATOR = new m();

        /* renamed from: a, reason: collision with root package name */
        public final long f42886a;

        /* renamed from: b, reason: collision with root package name */
        public final long f42887b;

        /* renamed from: c, reason: collision with root package name */
        public final long f42888c;

        public Colors(long j11, long j12, long j13) {
            this.f42886a = j11;
            this.f42887b = j12;
            this.f42888c = j13;
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
            long j11 = colors.f42886a;
            int i5 = i2.s.n;
            return ULong.a(this.f42886a, j11) && ULong.a(this.f42887b, colors.f42887b) && ULong.a(this.f42888c, colors.f42888c);
        }

        public final int hashCode() {
            int i5 = i2.s.n;
            ULong.Companion companion = ULong.f71699b;
            return Long.hashCode(this.f42888c) + b.c0.d(Long.hashCode(this.f42886a) * 31, 31, this.f42887b);
        }

        public final String toString() {
            String strH = i2.s.h(this.f42886a);
            String strH2 = i2.s.h(this.f42887b);
            return b.c0.q(b.c0.w("Colors(primary=", strH, ", contentOnPrimary=", strH2, ", borderSelected="), i2.s.h(this.f42888c), ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(r0.r(this.f42886a));
            dest.writeInt(r0.r(this.f42887b));
            dest.writeInt(r0.r(this.f42888c));
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkAppearance$PrimaryButton;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class PrimaryButton implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<PrimaryButton> CREATOR = new o();

        /* renamed from: a, reason: collision with root package name */
        public final Float f42889a;

        /* renamed from: b, reason: collision with root package name */
        public final Float f42890b;

        public PrimaryButton(Float f11, Float f12) {
            this.f42889a = f11;
            this.f42890b = f12;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PrimaryButton)) {
                return false;
            }
            PrimaryButton primaryButton = (PrimaryButton) obj;
            return Intrinsics.b(this.f42889a, primaryButton.f42889a) && Intrinsics.b(this.f42890b, primaryButton.f42890b);
        }

        public final int hashCode() {
            Float f11 = this.f42889a;
            int iHashCode = (f11 == null ? 0 : f11.hashCode()) * 31;
            Float f12 = this.f42890b;
            return iHashCode + (f12 != null ? f12.hashCode() : 0);
        }

        public final String toString() {
            return "PrimaryButton(cornerRadiusDp=" + this.f42889a + ", heightDp=" + this.f42890b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Float f11 = this.f42889a;
            if (f11 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeFloat(f11.floatValue());
            }
            Float f12 = this.f42890b;
            if (f12 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeFloat(f12.floatValue());
            }
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/link/LinkAppearance$Style;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Style implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Style> CREATOR;

        /* renamed from: a, reason: collision with root package name */
        public static final Style f42891a;

        /* renamed from: b, reason: collision with root package name */
        public static final Style f42892b;

        /* renamed from: c, reason: collision with root package name */
        public static final Style f42893c;

        /* renamed from: d, reason: collision with root package name */
        public static final /* synthetic */ Style[] f42894d;

        static {
            Style style = new Style("AUTOMATIC", 0);
            f42891a = style;
            Style style2 = new Style("ALWAYS_LIGHT", 1);
            f42892b = style2;
            Style style3 = new Style("ALWAYS_DARK", 2);
            f42893c = style3;
            Style[] styleArr = {style, style2, style3};
            f42894d = styleArr;
            EnumEntriesKt.a(styleArr);
            CREATOR = new p();
        }

        public static Style valueOf(String str) {
            return (Style) Enum.valueOf(Style.class, str);
        }

        public static Style[] values() {
            return (Style[]) f42894d.clone();
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

    public LinkAppearance(Colors lightColors, Colors darkColors, Style style, PrimaryButton primaryButton) {
        Intrinsics.g(lightColors, "lightColors");
        Intrinsics.g(darkColors, "darkColors");
        Intrinsics.g(style, "style");
        Intrinsics.g(primaryButton, "primaryButton");
        this.f42882a = lightColors;
        this.f42883b = darkColors;
        this.f42884c = style;
        this.f42885d = primaryButton;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkAppearance)) {
            return false;
        }
        LinkAppearance linkAppearance = (LinkAppearance) obj;
        return Intrinsics.b(this.f42882a, linkAppearance.f42882a) && Intrinsics.b(this.f42883b, linkAppearance.f42883b) && this.f42884c == linkAppearance.f42884c && Intrinsics.b(this.f42885d, linkAppearance.f42885d);
    }

    public final int hashCode() {
        return this.f42885d.hashCode() + ((this.f42884c.hashCode() + ((this.f42883b.hashCode() + (this.f42882a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "LinkAppearance(lightColors=" + this.f42882a + ", darkColors=" + this.f42883b + ", style=" + this.f42884c + ", primaryButton=" + this.f42885d + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f42882a.writeToParcel(dest, i5);
        this.f42883b.writeToParcel(dest, i5);
        this.f42884c.writeToParcel(dest, i5);
        this.f42885d.writeToParcel(dest, i5);
    }
}
