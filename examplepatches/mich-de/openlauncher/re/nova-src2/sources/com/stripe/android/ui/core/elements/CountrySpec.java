package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cr.e;
import cw.c;
import cw.l1;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.LinkedHashSetSerializer;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/CountrySpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/k1", "cw/l1", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class CountrySpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45301a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f45302b;

    @NotNull
    public static final l1 Companion = new l1();

    @NotNull
    public static final Parcelable.Creator<CountrySpec> CREATOR = new c(9);

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f45300c = {null, new LinkedHashSetSerializer(StringSerializer.INSTANCE)};

    public CountrySpec(int i5, IdentifierSpec identifierSpec, Set set) {
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = IdentifierSpec.f45379v;
        }
        this.f45301a = identifierSpec;
        if ((i5 & 2) == 0) {
            this.f45302b = e.f47799a;
        } else {
            this.f45302b = set;
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
        if (!(obj instanceof CountrySpec)) {
            return false;
        }
        CountrySpec countrySpec = (CountrySpec) obj;
        return Intrinsics.b(this.f45301a, countrySpec.f45301a) && Intrinsics.b(this.f45302b, countrySpec.f45302b);
    }

    public final int hashCode() {
        return this.f45302b.hashCode() + (this.f45301a.hashCode() * 31);
    }

    public final String toString() {
        return "CountrySpec(apiPath=" + this.f45301a + ", allowedCountryCodes=" + this.f45302b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45301a, i5);
        Set set = this.f45302b;
        dest.writeInt(set.size());
        Iterator it = set.iterator();
        while (it.hasNext()) {
            dest.writeString((String) it.next());
        }
    }

    public CountrySpec(IdentifierSpec apiPath, LinkedHashSet linkedHashSet) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45301a = apiPath;
        this.f45302b = linkedHashSet;
    }
}
