package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.c3;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/KlarnaHeaderStaticTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/b3", "cw/c3", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class KlarnaHeaderStaticTextSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45316a;

    @NotNull
    public static final c3 Companion = new c3();

    @NotNull
    public static final Parcelable.Creator<KlarnaHeaderStaticTextSpec> CREATOR = new c(16);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public KlarnaHeaderStaticTextSpec(int i5, IdentifierSpec identifierSpec) {
        if ((i5 & 1) != 0) {
            this.f45316a = identifierSpec;
        } else {
            IdentifierSpec.Companion.getClass();
            this.f45316a = z0.a("klarna_header_text");
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
        return (obj instanceof KlarnaHeaderStaticTextSpec) && Intrinsics.b(this.f45316a, ((KlarnaHeaderStaticTextSpec) obj).f45316a);
    }

    public final int hashCode() {
        return this.f45316a.hashCode();
    }

    public final String toString() {
        return "KlarnaHeaderStaticTextSpec(apiPath=" + this.f45316a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45316a, i5);
    }

    public KlarnaHeaderStaticTextSpec(IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45316a = apiPath;
    }
}
