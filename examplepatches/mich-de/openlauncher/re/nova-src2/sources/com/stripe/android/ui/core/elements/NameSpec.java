package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.a3;
import cw.c;
import cw.h0;
import cw.i0;
import cw.m3;
import cw.s4;
import cw.z2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/NameSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/l3", "cw/m3", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class NameSpec extends FormItemSpec {

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f45322d;

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45323a;

    /* renamed from: b, reason: collision with root package name */
    public final s4 f45324b;

    /* renamed from: c, reason: collision with root package name */
    public final SimpleTextSpec f45325c;

    @NotNull
    public static final m3 Companion = new m3();

    @NotNull
    public static final Parcelable.Creator<NameSpec> CREATOR = new c(19);

    static {
        z0 z0Var = IdentifierSpec.Companion;
        f45322d = new KSerializer[]{null, s4.Companion.serializer()};
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public NameSpec() {
        this(IdentifierSpec.f45364e, s4.f48301c);
        IdentifierSpec.Companion.getClass();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof NameSpec)) {
            return false;
        }
        NameSpec nameSpec = (NameSpec) obj;
        return Intrinsics.b(this.f45323a, nameSpec.f45323a) && this.f45324b == nameSpec.f45324b;
    }

    public final int hashCode() {
        return this.f45324b.hashCode() + (this.f45323a.hashCode() * 31);
    }

    public final String toString() {
        return "NameSpec(apiPath=" + this.f45323a + ", labelTranslationId=" + this.f45324b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45323a, i5);
        dest.writeString(this.f45324b.name());
    }

    public NameSpec(int i5, IdentifierSpec identifierSpec, s4 s4Var) {
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = IdentifierSpec.f45364e;
        }
        this.f45323a = identifierSpec;
        if ((i5 & 2) == 0) {
            this.f45324b = s4.f48301c;
        } else {
            this.f45324b = s4Var;
        }
        IdentifierSpec identifierSpec2 = this.f45323a;
        int i11 = this.f45324b.f48303a;
        h0 h0Var = i0.Companion;
        z2 z2Var = a3.Companion;
        this.f45325c = new SimpleTextSpec(i11, identifierSpec2);
    }

    public NameSpec(IdentifierSpec apiPath, s4 labelTranslationId) {
        Intrinsics.g(apiPath, "apiPath");
        Intrinsics.g(labelTranslationId, "labelTranslationId");
        this.f45323a = apiPath;
        this.f45324b = labelTranslationId;
        int i5 = labelTranslationId.f48303a;
        h0 h0Var = i0.Companion;
        z2 z2Var = a3.Companion;
        this.f45325c = new SimpleTextSpec(i5, apiPath);
    }
}
