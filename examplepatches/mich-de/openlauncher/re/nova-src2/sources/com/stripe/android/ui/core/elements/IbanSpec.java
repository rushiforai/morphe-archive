package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.y2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/IbanSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/x2", "cw/y2", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class IbanSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45315a;

    @NotNull
    public static final y2 Companion = new y2();

    @NotNull
    public static final Parcelable.Creator<IbanSpec> CREATOR = new c(15);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public IbanSpec(int i5, IdentifierSpec identifierSpec) {
        if ((i5 & 1) != 0) {
            this.f45315a = identifierSpec;
        } else {
            IdentifierSpec.Companion.getClass();
            this.f45315a = z0.a("sepa_debit[iban]");
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
        return (obj instanceof IbanSpec) && Intrinsics.b(this.f45315a, ((IbanSpec) obj).f45315a);
    }

    public final int hashCode() {
        return this.f45315a.hashCode();
    }

    public final String toString() {
        return "IbanSpec(apiPath=" + this.f45315a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45315a, i5);
    }

    public IbanSpec(IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45315a = apiPath;
    }
}
