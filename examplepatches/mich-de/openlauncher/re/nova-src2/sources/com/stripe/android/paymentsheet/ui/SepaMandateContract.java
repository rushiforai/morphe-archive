package com.stripe.android.paymentsheet.ui;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.paymentsheet.ui.SepaMandateResult;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/paymentsheet/ui/SepaMandateContract;", "Lk/b;", "Lcom/stripe/android/paymentsheet/ui/SepaMandateContract$Args;", "Lcom/stripe/android/paymentsheet/ui/SepaMandateResult;", "<init>", "()V", "Args", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class SepaMandateContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/ui/SepaMandateContract$Args;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f44999a;

        public Args(String merchantName) {
            Intrinsics.g(merchantName, "merchantName");
            this.f44999a = merchantName;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Args) && Intrinsics.b(this.f44999a, ((Args) obj).f44999a);
        }

        public final int hashCode() {
            return this.f44999a.hashCode();
        }

        public final String toString() {
            return c0.l("Args(merchantName=", this.f44999a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44999a);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) SepaMandateActivity.class).putExtra("extra_activity_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        SepaMandateResult sepaMandateResult;
        return (intent == null || (sepaMandateResult = (SepaMandateResult) intent.getParcelableExtra("extra_activity_result")) == null) ? SepaMandateResult.Canceled.f45001a : sepaMandateResult;
    }
}
