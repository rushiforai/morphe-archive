package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.f0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/BsbSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/e0", "cw/f0", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class BsbSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45296a;

    @NotNull
    public static final f0 Companion = new f0();

    @NotNull
    public static final Parcelable.Creator<BsbSpec> CREATOR = new c(7);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public BsbSpec(int i5, IdentifierSpec identifierSpec) {
        if ((i5 & 1) != 0) {
            this.f45296a = identifierSpec;
        } else {
            IdentifierSpec.Companion.getClass();
            this.f45296a = z0.a("au_becs_debit[bsb_number]");
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
        return (obj instanceof BsbSpec) && Intrinsics.b(this.f45296a, ((BsbSpec) obj).f45296a);
    }

    public final int hashCode() {
        return this.f45296a.hashCode();
    }

    public final String toString() {
        return "BsbSpec(apiPath=" + this.f45296a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45296a, i5);
    }

    public BsbSpec(IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45296a = apiPath;
    }
}
