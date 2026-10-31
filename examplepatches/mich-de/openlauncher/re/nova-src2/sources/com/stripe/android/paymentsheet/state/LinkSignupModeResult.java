package com.stripe.android.paymentsheet.state;

import android.os.Parcel;
import android.os.Parcelable;
import ft.e0;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import rs.a0;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult;", "Landroid/os/Parcelable;", "AlreadyRegistered", "Enabled", "Disabled", "Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult$AlreadyRegistered;", "Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult$Disabled;", "Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult$Enabled;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface LinkSignupModeResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult$AlreadyRegistered;", "Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class AlreadyRegistered implements LinkSignupModeResult {

        /* renamed from: a, reason: collision with root package name */
        public static final AlreadyRegistered f44959a = new AlreadyRegistered();

        @NotNull
        public static final Parcelable.Creator<AlreadyRegistered> CREATOR = new c();

        @Override // com.stripe.android.paymentsheet.state.LinkSignupModeResult
        /* renamed from: Y */
        public final List getF44960a() {
            return null;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof AlreadyRegistered);
        }

        public final int hashCode() {
            return 222586717;
        }

        @Override // com.stripe.android.paymentsheet.state.LinkSignupModeResult
        /* renamed from: n */
        public final a0 getF44961a() {
            return null;
        }

        public final String toString() {
            return "AlreadyRegistered";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult$Disabled;", "Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Disabled implements LinkSignupModeResult {

        @NotNull
        public static final Parcelable.Creator<Disabled> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final List f44960a;

        public Disabled(AbstractList disabledReasons) {
            Intrinsics.g(disabledReasons, "disabledReasons");
            this.f44960a = disabledReasons;
        }

        @Override // com.stripe.android.paymentsheet.state.LinkSignupModeResult
        /* renamed from: Y, reason: from getter */
        public final List getF44960a() {
            return this.f44960a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Disabled) && Intrinsics.b(this.f44960a, ((Disabled) obj).f44960a);
        }

        public final int hashCode() {
            return this.f44960a.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.state.LinkSignupModeResult
        /* renamed from: n */
        public final a0 getF44961a() {
            return null;
        }

        public final String toString() {
            return "Disabled(disabledReasons=" + this.f44960a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Iterator itK = fq.c.k(this.f44960a, dest);
            while (itK.hasNext()) {
                dest.writeString(((e0) itK.next()).name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult$Enabled;", "Lcom/stripe/android/paymentsheet/state/LinkSignupModeResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Enabled implements LinkSignupModeResult {

        @NotNull
        public static final Parcelable.Creator<Enabled> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final a0 f44961a;

        public Enabled(a0 mode) {
            Intrinsics.g(mode, "mode");
            this.f44961a = mode;
        }

        @Override // com.stripe.android.paymentsheet.state.LinkSignupModeResult
        /* renamed from: Y */
        public final List getF44960a() {
            return null;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Enabled) && this.f44961a == ((Enabled) obj).f44961a;
        }

        public final int hashCode() {
            return this.f44961a.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.state.LinkSignupModeResult
        /* renamed from: n, reason: from getter */
        public final a0 getF44961a() {
            return this.f44961a;
        }

        public final String toString() {
            return "Enabled(mode=" + this.f44961a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44961a.name());
        }
    }

    /* renamed from: Y */
    List getF44960a();

    /* renamed from: n */
    a0 getF44961a();
}
