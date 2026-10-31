package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/SetupIntentResult;", "Lcom/stripe/android/StripeIntentResult;", "Lcom/stripe/android/model/SetupIntent;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class SetupIntentResult extends StripeIntentResult<SetupIntent> {

    @NotNull
    public static final Parcelable.Creator<SetupIntentResult> CREATOR = new di.b(14);

    /* renamed from: b, reason: collision with root package name */
    public final SetupIntent f42451b;

    /* renamed from: c, reason: collision with root package name */
    public final int f42452c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42453d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SetupIntentResult(SetupIntent intent, int i5, String str) {
        super(i5);
        Intrinsics.g(intent, "intent");
        this.f42451b = intent;
        this.f42452c = i5;
        this.f42453d = str;
    }

    @Override // com.stripe.android.StripeIntentResult
    /* renamed from: b, reason: from getter */
    public final String getF42453d() {
        return this.f42453d;
    }

    @Override // com.stripe.android.StripeIntentResult
    public final StripeIntent d() {
        return this.f42451b;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SetupIntentResult)) {
            return false;
        }
        SetupIntentResult setupIntentResult = (SetupIntentResult) obj;
        return Intrinsics.b(this.f42451b, setupIntentResult.f42451b) && this.f42452c == setupIntentResult.f42452c && Intrinsics.b(this.f42453d, setupIntentResult.f42453d);
    }

    public final int hashCode() {
        int iHashCode = ((this.f42451b.hashCode() * 31) + this.f42452c) * 31;
        String str = this.f42453d;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SetupIntentResult(intent=");
        sb2.append(this.f42451b);
        sb2.append(", outcomeFromFlow=");
        sb2.append(this.f42452c);
        sb2.append(", failureMessage=");
        return c0.q(sb2, this.f42453d, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f42451b.writeToParcel(dest, i5);
        dest.writeInt(this.f42452c);
        dest.writeString(this.f42453d);
    }
}
