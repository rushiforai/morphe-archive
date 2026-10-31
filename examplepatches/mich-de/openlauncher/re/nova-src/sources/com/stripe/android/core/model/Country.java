package com.stripe.android.core.model;

import android.os.Parcel;
import android.os.Parcelable;
import cf.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import cr.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/core/model/Country;", "Landroid/os/Parcelable;", k.O, "cr/a", "cr/b", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class Country implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final CountryCode f42572a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42573b;

    @NotNull
    public static final b Companion = new b();

    @NotNull
    public static final Parcelable.Creator<Country> CREATOR = new a(20);

    public /* synthetic */ Country(int i5, CountryCode countryCode, String str) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, cr.a.f47797a.getDescriptor());
        }
        this.f42572a = countryCode;
        this.f42573b = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Country)) {
            return false;
        }
        Country country = (Country) obj;
        return Intrinsics.b(this.f42572a, country.f42572a) && Intrinsics.b(this.f42573b, country.f42573b);
    }

    public final int hashCode() {
        return this.f42573b.hashCode() + (this.f42572a.f42575a.hashCode() * 31);
    }

    /* renamed from: toString, reason: from getter */
    public final String getF42573b() {
        return this.f42573b;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f42572a.writeToParcel(dest, i5);
        dest.writeString(this.f42573b);
    }

    public Country(CountryCode code, String name) {
        Intrinsics.g(code, "code");
        Intrinsics.g(name, "name");
        this.f42572a = code;
        this.f42573b = name;
    }
}
