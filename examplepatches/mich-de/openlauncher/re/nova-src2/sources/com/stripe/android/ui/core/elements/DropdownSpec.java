package com.stripe.android.ui.core.elements;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.e2;
import cw.g2;
import cw.h2;
import cw.s4;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/DropdownSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/g2", "cw/h2", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class DropdownSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45306a;

    /* renamed from: b, reason: collision with root package name */
    public final s4 f45307b;

    /* renamed from: c, reason: collision with root package name */
    public final List f45308c;

    @NotNull
    public static final h2 Companion = new h2();

    @NotNull
    public static final Parcelable.Creator<DropdownSpec> CREATOR = new c(11);

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f45305d = {null, s4.Companion.serializer(), new ArrayListSerializer(e2.f48138a)};

    public DropdownSpec(int i5, IdentifierSpec identifierSpec, s4 s4Var, List list) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, g2.f48153a.getDescriptor());
        }
        this.f45306a = identifierSpec;
        this.f45307b = s4Var;
        this.f45308c = list;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DropdownSpec)) {
            return false;
        }
        DropdownSpec dropdownSpec = (DropdownSpec) obj;
        return Intrinsics.b(this.f45306a, dropdownSpec.f45306a) && this.f45307b == dropdownSpec.f45307b && Intrinsics.b(this.f45308c, dropdownSpec.f45308c);
    }

    public final int hashCode() {
        return this.f45308c.hashCode() + ((this.f45307b.hashCode() + (this.f45306a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DropdownSpec(apiPath=");
        sb2.append(this.f45306a);
        sb2.append(", labelTranslationId=");
        sb2.append(this.f45307b);
        sb2.append(", items=");
        return m.j(sb2, this.f45308c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45306a, i5);
        dest.writeString(this.f45307b.name());
        Iterator itK = fq.c.k(this.f45308c, dest);
        while (itK.hasNext()) {
            dest.writeParcelable((Parcelable) itK.next(), i5);
        }
    }

    public DropdownSpec(IdentifierSpec apiPath, s4 labelTranslationId, ArrayList arrayList) {
        Intrinsics.g(apiPath, "apiPath");
        Intrinsics.g(labelTranslationId, "labelTranslationId");
        this.f45306a = apiPath;
        this.f45307b = labelTranslationId;
        this.f45308c = arrayList;
    }
}
