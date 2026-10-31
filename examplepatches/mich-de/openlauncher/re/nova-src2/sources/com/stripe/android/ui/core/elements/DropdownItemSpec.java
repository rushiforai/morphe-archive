package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import cw.c;
import cw.f2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/DropdownItemSpec;", "Landroid/os/Parcelable;", k.O, "cw/e2", "cw/f2", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class DropdownItemSpec implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f45303a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45304b;

    @NotNull
    public static final f2 Companion = new f2();

    @NotNull
    public static final Parcelable.Creator<DropdownItemSpec> CREATOR = new c(10);

    public /* synthetic */ DropdownItemSpec(int i5, String str, String str2) {
        this.f45303a = (i5 & 1) == 0 ? null : str;
        if ((i5 & 2) == 0) {
            this.f45304b = "Other";
        } else {
            this.f45304b = str2;
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
        if (!(obj instanceof DropdownItemSpec)) {
            return false;
        }
        DropdownItemSpec dropdownItemSpec = (DropdownItemSpec) obj;
        return Intrinsics.b(this.f45303a, dropdownItemSpec.f45303a) && Intrinsics.b(this.f45304b, dropdownItemSpec.f45304b);
    }

    public final int hashCode() {
        String str = this.f45303a;
        return this.f45304b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return c0.n("DropdownItemSpec(apiValue=", this.f45303a, ", displayText=", this.f45304b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45303a);
        dest.writeString(this.f45304b);
    }

    public DropdownItemSpec(String str, String displayText) {
        Intrinsics.g(displayText, "displayText");
        this.f45303a = str;
        this.f45304b = displayText;
    }
}
