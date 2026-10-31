package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.stripe3ds2.views.ChallengeViewArgs;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/InitChallengeResult;", "Landroid/os/Parcelable;", "Start", "End", "Lcom/stripe/android/stripe3ds2/transaction/InitChallengeResult$End;", "Lcom/stripe/android/stripe3ds2/transaction/InitChallengeResult$Start;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class InitChallengeResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/InitChallengeResult$End;", "Lcom/stripe/android/stripe3ds2/transaction/InitChallengeResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class End extends InitChallengeResult {

        @NotNull
        public static final Parcelable.Creator<End> CREATOR = new v();

        /* renamed from: a, reason: collision with root package name */
        public final ChallengeResult f45111a;

        public End(ChallengeResult challengeResult) {
            Intrinsics.g(challengeResult, "challengeResult");
            this.f45111a = challengeResult;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof End) && Intrinsics.b(this.f45111a, ((End) obj).f45111a);
        }

        public final int hashCode() {
            return this.f45111a.hashCode();
        }

        public final String toString() {
            return "End(challengeResult=" + this.f45111a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f45111a, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/InitChallengeResult$Start;", "Lcom/stripe/android/stripe3ds2/transaction/InitChallengeResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Start extends InitChallengeResult {

        @NotNull
        public static final Parcelable.Creator<Start> CREATOR = new w();

        /* renamed from: a, reason: collision with root package name */
        public final ChallengeViewArgs f45112a;

        public Start(ChallengeViewArgs challengeViewArgs) {
            Intrinsics.g(challengeViewArgs, "challengeViewArgs");
            this.f45112a = challengeViewArgs;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Start) && Intrinsics.b(this.f45112a, ((Start) obj).f45112a);
        }

        public final int hashCode() {
            return this.f45112a.hashCode();
        }

        public final String toString() {
            return "Start(challengeViewArgs=" + this.f45112a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f45112a.writeToParcel(dest, i5);
        }
    }
}
