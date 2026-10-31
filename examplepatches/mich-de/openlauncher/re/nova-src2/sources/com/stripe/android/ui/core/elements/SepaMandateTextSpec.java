package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.b4;
import cw.c;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/SepaMandateTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/a4", "cw/b4", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class SepaMandateTextSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45333a;

    /* renamed from: b, reason: collision with root package name */
    public final int f45334b;

    /* renamed from: c, reason: collision with root package name */
    public final MandateTextSpec f45335c;

    @NotNull
    public static final b4 Companion = new b4();

    @NotNull
    public static final Parcelable.Creator<SepaMandateTextSpec> CREATOR = new c(24);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public SepaMandateTextSpec(int i5, IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45333a = apiPath;
        this.f45334b = i5;
        this.f45335c = new MandateTextSpec(i5, apiPath);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SepaMandateTextSpec)) {
            return false;
        }
        SepaMandateTextSpec sepaMandateTextSpec = (SepaMandateTextSpec) obj;
        return Intrinsics.b(this.f45333a, sepaMandateTextSpec.f45333a) && this.f45334b == sepaMandateTextSpec.f45334b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f45334b) + (this.f45333a.hashCode() * 31);
    }

    public final String toString() {
        return "SepaMandateTextSpec(apiPath=" + this.f45333a + ", stringResId=" + this.f45334b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45333a, i5);
        dest.writeInt(this.f45334b);
    }

    public SepaMandateTextSpec(int i5, IdentifierSpec identifierSpec, int i11) {
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = z0.a("sepa_mandate");
        }
        this.f45333a = identifierSpec;
        if ((i5 & 2) == 0) {
            this.f45334b = 2132020008;
        } else {
            this.f45334b = i11;
        }
        this.f45335c = new MandateTextSpec(this.f45334b, this.f45333a);
    }
}
