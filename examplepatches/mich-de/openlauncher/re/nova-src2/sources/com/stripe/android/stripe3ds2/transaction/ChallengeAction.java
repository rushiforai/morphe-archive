package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.gms.internal.measurement.k2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b0\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006\u0082\u0001\u0005\u0007\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction;", "Landroid/os/Parcelable;", "NativeForm", "HtmlForm", "Oob", "Resend", "Cancel", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$Cancel;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$HtmlForm;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$NativeForm;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$Oob;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$Resend;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class ChallengeAction implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$Cancel;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Cancel extends ChallengeAction {

        /* renamed from: a, reason: collision with root package name */
        public static final Cancel f45064a = new Cancel();

        @NotNull
        public static final Parcelable.Creator<Cancel> CREATOR = new a();

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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$HtmlForm;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class HtmlForm extends ChallengeAction {

        @NotNull
        public static final Parcelable.Creator<HtmlForm> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f45065a;

        public HtmlForm(String userEntry) {
            Intrinsics.g(userEntry, "userEntry");
            this.f45065a = userEntry;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof HtmlForm) && Intrinsics.b(this.f45065a, ((HtmlForm) obj).f45065a);
        }

        public final int hashCode() {
            return this.f45065a.hashCode();
        }

        public final String toString() {
            return c0.l("HtmlForm(userEntry=", this.f45065a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45065a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$NativeForm;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class NativeForm extends ChallengeAction {

        @NotNull
        public static final Parcelable.Creator<NativeForm> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final String f45066a;

        /* renamed from: b, reason: collision with root package name */
        public final Boolean f45067b;

        public NativeForm(String userEntry, Boolean bool) {
            Intrinsics.g(userEntry, "userEntry");
            this.f45066a = userEntry;
            this.f45067b = bool;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof NativeForm)) {
                return false;
            }
            NativeForm nativeForm = (NativeForm) obj;
            return Intrinsics.b(this.f45066a, nativeForm.f45066a) && Intrinsics.b(this.f45067b, nativeForm.f45067b);
        }

        public final int hashCode() {
            int iHashCode = this.f45066a.hashCode() * 31;
            Boolean bool = this.f45067b;
            return iHashCode + (bool == null ? 0 : bool.hashCode());
        }

        public final String toString() {
            return "NativeForm(userEntry=" + this.f45066a + ", whitelistingValue=" + this.f45067b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45066a);
            Boolean bool = this.f45067b;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                k2.w(dest, 1, bool);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$Oob;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Oob extends ChallengeAction {

        @NotNull
        public static final Parcelable.Creator<Oob> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final Boolean f45068a;

        public Oob(Boolean bool) {
            this.f45068a = bool;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Oob) && Intrinsics.b(this.f45068a, ((Oob) obj).f45068a);
        }

        public final int hashCode() {
            Boolean bool = this.f45068a;
            if (bool == null) {
                return 0;
            }
            return bool.hashCode();
        }

        public final String toString() {
            return "Oob(whitelistingValue=" + this.f45068a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Boolean bool = this.f45068a;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                k2.w(dest, 1, bool);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction$Resend;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeAction;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Resend extends ChallengeAction {

        /* renamed from: a, reason: collision with root package name */
        public static final Resend f45069a = new Resend();

        @NotNull
        public static final Parcelable.Creator<Resend> CREATOR = new e();

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
