package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.e3;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/KlarnaMandateTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/d3", "cw/e3", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class KlarnaMandateTextSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45317a;

    /* renamed from: b, reason: collision with root package name */
    public final int f45318b;

    /* renamed from: c, reason: collision with root package name */
    public final MandateTextSpec f45319c;

    @NotNull
    public static final e3 Companion = new e3();

    @NotNull
    public static final Parcelable.Creator<KlarnaMandateTextSpec> CREATOR = new c(17);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public KlarnaMandateTextSpec(int i5, IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45317a = apiPath;
        this.f45318b = i5;
        this.f45319c = new MandateTextSpec(i5, apiPath);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof KlarnaMandateTextSpec)) {
            return false;
        }
        KlarnaMandateTextSpec klarnaMandateTextSpec = (KlarnaMandateTextSpec) obj;
        return Intrinsics.b(this.f45317a, klarnaMandateTextSpec.f45317a) && this.f45318b == klarnaMandateTextSpec.f45318b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f45318b) + (this.f45317a.hashCode() * 31);
    }

    public final String toString() {
        return "KlarnaMandateTextSpec(apiPath=" + this.f45317a + ", stringResId=" + this.f45318b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45317a, i5);
        dest.writeInt(this.f45318b);
    }

    public KlarnaMandateTextSpec(int i5, IdentifierSpec identifierSpec, int i11) {
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = z0.a("klarna_mandate");
        }
        this.f45317a = identifierSpec;
        if ((i5 & 2) == 0) {
            this.f45318b = 2132019821;
        } else {
            this.f45318b = i11;
        }
        this.f45319c = new MandateTextSpec(this.f45318b, this.f45317a);
    }
}
