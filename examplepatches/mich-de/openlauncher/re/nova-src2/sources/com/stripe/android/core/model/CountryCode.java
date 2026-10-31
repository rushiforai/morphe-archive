package com.stripe.android.core.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import cf.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import cr.c;
import cr.d;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/core/model/CountryCode;", "Landroid/os/Parcelable;", k.O, "cr/d", "cr/c", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class CountryCode implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f42575a;

    @NotNull
    public static final d Companion = new d();

    @NotNull
    public static final Parcelable.Creator<CountryCode> CREATOR = new a(21);

    /* renamed from: b, reason: collision with root package name */
    public static final CountryCode f42574b = new CountryCode("US");

    static {
        new CountryCode("CA");
        new CountryCode("GB");
    }

    public /* synthetic */ CountryCode(int i5, String str) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, c.f47798a.getDescriptor());
        }
        this.f42575a = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof CountryCode) && Intrinsics.b(this.f42575a, ((CountryCode) obj).f42575a);
    }

    public final int hashCode() {
        return this.f42575a.hashCode();
    }

    public final String toString() {
        return c0.l("CountryCode(value=", this.f42575a, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42575a);
    }

    public CountryCode(String value) {
        Intrinsics.g(value, "value");
        this.f42575a = value;
    }
}
