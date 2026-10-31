package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import cw.c;
import cw.z3;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@SerialName("next_action_spec")
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/SelectorIcon;", "Landroid/os/Parcelable;", k.O, "cw/y3", "cw/z3", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class SelectorIcon implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f45331a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45332b;

    @NotNull
    public static final z3 Companion = new z3();

    @NotNull
    public static final Parcelable.Creator<SelectorIcon> CREATOR = new c(23);

    public /* synthetic */ SelectorIcon(int i5, String str, String str2) {
        if ((i5 & 1) == 0) {
            this.f45331a = null;
        } else {
            this.f45331a = str;
        }
        if ((i5 & 2) == 0) {
            this.f45332b = null;
        } else {
            this.f45332b = str2;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SelectorIcon)) {
            return false;
        }
        SelectorIcon selectorIcon = (SelectorIcon) obj;
        return Intrinsics.b(this.f45331a, selectorIcon.f45331a) && Intrinsics.b(this.f45332b, selectorIcon.f45332b);
    }

    public final int hashCode() {
        String str = this.f45331a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f45332b;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return c0.n("SelectorIcon(lightThemePng=", this.f45331a, ", darkThemePng=", this.f45332b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45331a);
        dest.writeString(this.f45332b);
    }

    public SelectorIcon(String str, String str2) {
        this.f45331a = str;
        this.f45332b = str2;
    }
}
