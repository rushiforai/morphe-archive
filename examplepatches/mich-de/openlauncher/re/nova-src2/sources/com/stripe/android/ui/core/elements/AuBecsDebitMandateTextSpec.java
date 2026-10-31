package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.p;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/AuBecsDebitMandateTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/o", "cw/p", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class AuBecsDebitMandateTextSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45291a;

    @NotNull
    public static final p Companion = new p();

    @NotNull
    public static final Parcelable.Creator<AuBecsDebitMandateTextSpec> CREATOR = new c(4);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public AuBecsDebitMandateTextSpec(int i5, IdentifierSpec identifierSpec) {
        if ((i5 & 1) != 0) {
            this.f45291a = identifierSpec;
        } else {
            IdentifierSpec.Companion.getClass();
            this.f45291a = z0.a("au_becs_mandate");
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
        return (obj instanceof AuBecsDebitMandateTextSpec) && Intrinsics.b(this.f45291a, ((AuBecsDebitMandateTextSpec) obj).f45291a);
    }

    public final int hashCode() {
        return this.f45291a.hashCode();
    }

    public final String toString() {
        return "AuBecsDebitMandateTextSpec(apiPath=" + this.f45291a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45291a, i5);
    }

    public AuBecsDebitMandateTextSpec(IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45291a = apiPath;
    }
}
