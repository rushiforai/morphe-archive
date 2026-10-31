package com.stripe.hcaptcha;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.Serializable;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import ww.c;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/hcaptcha/HCaptchaStateListener;", "Landroid/os/Parcelable;", "hcaptcha_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class HCaptchaStateListener implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<HCaptchaStateListener> CREATOR = new c(24);

    /* renamed from: a, reason: collision with root package name */
    public final Function0 f45525a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f45526b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f45527c;

    public HCaptchaStateListener(Function0 onOpen, Function1 onSuccess, Function1 onFailure) {
        Intrinsics.g(onOpen, "onOpen");
        Intrinsics.g(onSuccess, "onSuccess");
        Intrinsics.g(onFailure, "onFailure");
        this.f45525a = onOpen;
        this.f45526b = onSuccess;
        this.f45527c = onFailure;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof HCaptchaStateListener)) {
            return false;
        }
        HCaptchaStateListener hCaptchaStateListener = (HCaptchaStateListener) obj;
        return Intrinsics.b(this.f45525a, hCaptchaStateListener.f45525a) && Intrinsics.b(this.f45526b, hCaptchaStateListener.f45526b) && Intrinsics.b(this.f45527c, hCaptchaStateListener.f45527c);
    }

    public final int hashCode() {
        return this.f45527c.hashCode() + ((this.f45526b.hashCode() + (this.f45525a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "HCaptchaStateListener(onOpen=" + this.f45525a + ", onSuccess=" + this.f45526b + ", onFailure=" + this.f45527c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeSerializable((Serializable) this.f45525a);
        dest.writeSerializable((Serializable) this.f45526b);
        dest.writeSerializable((Serializable) this.f45527c);
    }
}
