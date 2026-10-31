package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.q3;
import cw.t3;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/ui/core/elements/PlaceholderSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/t3", "cw/p3", "cw/q3", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class PlaceholderSpec extends FormItemSpec {

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f45328c;

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45329a;

    /* renamed from: b, reason: collision with root package name */
    public final t3 f45330b;

    @NotNull
    public static final q3 Companion = new q3();

    @NotNull
    public static final Parcelable.Creator<PlaceholderSpec> CREATOR = new c(22);

    static {
        z0 z0Var = IdentifierSpec.Companion;
        f45328c = new KSerializer[]{null, t3.Companion.serializer()};
    }

    public PlaceholderSpec(int i5, IdentifierSpec identifierSpec, t3 t3Var) {
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = z0.a("placeholder");
        }
        this.f45329a = identifierSpec;
        if ((i5 & 2) == 0) {
            this.f45330b = t3.f48315g;
        } else {
            this.f45330b = t3Var;
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
        if (!(obj instanceof PlaceholderSpec)) {
            return false;
        }
        PlaceholderSpec placeholderSpec = (PlaceholderSpec) obj;
        return Intrinsics.b(this.f45329a, placeholderSpec.f45329a) && this.f45330b == placeholderSpec.f45330b;
    }

    public final int hashCode() {
        return this.f45330b.hashCode() + (this.f45329a.hashCode() * 31);
    }

    public final String toString() {
        return "PlaceholderSpec(apiPath=" + this.f45329a + ", field=" + this.f45330b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45329a, i5);
        dest.writeString(this.f45330b.name());
    }

    public PlaceholderSpec(IdentifierSpec apiPath, t3 field) {
        Intrinsics.g(apiPath, "apiPath");
        Intrinsics.g(field, "field");
        this.f45329a = apiPath;
        this.f45330b = field;
    }
}
