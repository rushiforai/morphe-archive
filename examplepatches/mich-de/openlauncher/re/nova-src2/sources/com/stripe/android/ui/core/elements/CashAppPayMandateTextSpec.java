package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.j1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/CashAppPayMandateTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/i1", "cw/j1", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class CashAppPayMandateTextSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45297a;

    /* renamed from: b, reason: collision with root package name */
    public final int f45298b;

    /* renamed from: c, reason: collision with root package name */
    public final MandateTextSpec f45299c;

    @NotNull
    public static final j1 Companion = new j1();

    @NotNull
    public static final Parcelable.Creator<CashAppPayMandateTextSpec> CREATOR = new c(8);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public CashAppPayMandateTextSpec(int i5, IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45297a = apiPath;
        this.f45298b = i5;
        this.f45299c = new MandateTextSpec(i5, apiPath);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CashAppPayMandateTextSpec)) {
            return false;
        }
        CashAppPayMandateTextSpec cashAppPayMandateTextSpec = (CashAppPayMandateTextSpec) obj;
        return Intrinsics.b(this.f45297a, cashAppPayMandateTextSpec.f45297a) && this.f45298b == cashAppPayMandateTextSpec.f45298b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f45298b) + (this.f45297a.hashCode() * 31);
    }

    public final String toString() {
        return "CashAppPayMandateTextSpec(apiPath=" + this.f45297a + ", stringResId=" + this.f45298b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45297a, i5);
        dest.writeInt(this.f45298b);
    }

    public CashAppPayMandateTextSpec(int i5, IdentifierSpec identifierSpec, int i11) {
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = z0.a("cashapp_mandate");
        }
        this.f45297a = identifierSpec;
        if ((i5 & 2) == 0) {
            this.f45298b = 2132019750;
        } else {
            this.f45298b = i11;
        }
        this.f45299c = new MandateTextSpec(this.f45298b, this.f45297a);
    }
}
