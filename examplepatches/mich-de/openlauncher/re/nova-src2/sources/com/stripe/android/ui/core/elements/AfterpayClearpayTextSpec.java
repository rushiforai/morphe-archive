package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.j;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/AfterpayClearpayTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/i", "cw/j", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class AfterpayClearpayTextSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45289a;

    @NotNull
    public static final j Companion = new j();

    @NotNull
    public static final Parcelable.Creator<AfterpayClearpayTextSpec> CREATOR = new c(2);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public AfterpayClearpayTextSpec(int i5, IdentifierSpec identifierSpec) {
        if ((i5 & 1) != 0) {
            this.f45289a = identifierSpec;
        } else {
            IdentifierSpec.Companion.getClass();
            this.f45289a = z0.a("afterpay_text");
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
        return (obj instanceof AfterpayClearpayTextSpec) && Intrinsics.b(this.f45289a, ((AfterpayClearpayTextSpec) obj).f45289a);
    }

    public final int hashCode() {
        return this.f45289a.hashCode();
    }

    public final String toString() {
        return "AfterpayClearpayTextSpec(apiPath=" + this.f45289a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45289a, i5);
    }

    public AfterpayClearpayTextSpec(IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45289a = apiPath;
    }
}
