package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import b70.g;
import bn.d1;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.uicore.elements.AddressInputMode;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cr.e;
import cw.b;
import cw.c;
import cw.d2;
import cw.v3;
import h6.c1;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.LinkedHashSetSerializer;
import kotlinx.serialization.internal.StringSerializer;
import kw.a0;
import kw.h2;
import kw.i0;
import kw.k2;
import kw.l;
import kw.o0;
import kw.p;
import kw.x0;
import kw.z0;
import org.jetbrains.annotations.NotNull;
import zg.a;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/ui/core/elements/AddressSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", "Landroid/os/Parcelable;", k.O, "cw/a", "cw/b", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class AddressSpec extends FormItemSpec implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45282a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f45283b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f45284c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f45285d;

    /* renamed from: e, reason: collision with root package name */
    public final AddressInputMode f45286e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f45287f;

    @NotNull
    public static final b Companion = new b();

    @NotNull
    public static final Parcelable.Creator<AddressSpec> CREATOR = new c(0);

    /* renamed from: g, reason: collision with root package name */
    public static final KSerializer[] f45281g = {null, new LinkedHashSetSerializer(StringSerializer.INSTANCE), new LinkedHashSetSerializer(d2.Companion.serializer()), null};

    public AddressSpec(int i5, IdentifierSpec identifierSpec, Set set, Set set2, boolean z11) {
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = z0.a("billing_details[address]");
        }
        this.f45282a = identifierSpec;
        if ((i5 & 2) == 0) {
            this.f45283b = e.f47799a;
        } else {
            this.f45283b = set;
        }
        if ((i5 & 4) == 0) {
            this.f45284c = EmptySet.f71734a;
        } else {
            this.f45284c = set2;
        }
        if ((i5 & 8) == 0) {
            this.f45285d = true;
        } else {
            this.f45285d = z11;
        }
        this.f45286e = new AddressInputMode.NoAutocomplete(null, 7);
        this.f45287f = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x008a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final List a(LinkedHashMap linkedHashMap, Map map, p pVar) {
        h2 h2Var;
        char c11;
        h2 h2Var2;
        k2 aVar;
        Boolean boolT1;
        IdentifierResolvableString identifierResolvableStringU = this.f45285d ? a.U(2132019728, new Object[0], EmptyList.f71733a) : null;
        Set set = this.f45284c;
        if (set.size() == 1 && g.V0(set) == d2.f48124b) {
            IdentifierSpec.Companion.getClass();
            return ul.b.R(this.f45287f ? null : o0.c(new a0(z0.a("billing_details[address][country]"), new i0(new d1(this.f45283b, null, null, 62), (String) linkedHashMap.get(this.f45282a))), identifierResolvableStringU));
        }
        if (map != null) {
            IdentifierSpec.Companion.getClass();
            IdentifierSpec identifierSpec = IdentifierSpec.f45382y;
            String str = (String) map.get(identifierSpec);
            h2Var = (str == null || (boolT1 = r70.k.t1(str)) == null) ? null : new h2(identifierSpec, new v3(boolT1.booleanValue()));
        }
        if (pVar != null) {
            c11 = 1;
            aVar = new l(this.f45282a, linkedHashMap, this.f45283b, null, null, null, null, h2Var, map, pVar, this.f45287f, 120);
            h2Var2 = h2Var;
        } else {
            c11 = 1;
            h2Var2 = h2Var;
            aVar = new com.stripe.android.uicore.elements.a(this.f45282a, linkedHashMap, this.f45286e, this.f45283b, null, h2Var2, map, false, this.f45287f, 144);
        }
        x0[] x0VarArr = new x0[2];
        x0VarArr[0] = o0.c(aVar, identifierResolvableStringU);
        x0VarArr[c11] = h2Var2;
        return kotlin.collections.c.v0(x0VarArr);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AddressSpec)) {
            return false;
        }
        AddressSpec addressSpec = (AddressSpec) obj;
        return Intrinsics.b(this.f45282a, addressSpec.f45282a) && Intrinsics.b(this.f45283b, addressSpec.f45283b) && Intrinsics.b(this.f45284c, addressSpec.f45284c) && this.f45285d == addressSpec.f45285d && Intrinsics.b(this.f45286e, addressSpec.f45286e) && this.f45287f == addressSpec.f45287f;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f45287f) + ((this.f45286e.hashCode() + c9.f(c1.k(this.f45284c, c1.k(this.f45283b, this.f45282a.hashCode() * 31, 31), 31), 31, this.f45285d)) * 31);
    }

    public final String toString() {
        return "AddressSpec(apiPath=" + this.f45282a + ", allowedCountryCodes=" + this.f45283b + ", displayFields=" + this.f45284c + ", showLabel=" + this.f45285d + ", type=" + this.f45286e + ", hideCountry=" + this.f45287f + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45282a, i5);
        Set set = this.f45283b;
        dest.writeInt(set.size());
        Iterator it = set.iterator();
        while (it.hasNext()) {
            dest.writeString((String) it.next());
        }
        Set set2 = this.f45284c;
        dest.writeInt(set2.size());
        Iterator it2 = set2.iterator();
        while (it2.hasNext()) {
            dest.writeString(((d2) it2.next()).name());
        }
        dest.writeInt(this.f45285d ? 1 : 0);
        dest.writeParcelable(this.f45286e, i5);
        dest.writeInt(this.f45287f ? 1 : 0);
    }

    public AddressSpec(IdentifierSpec apiPath, Set allowedCountryCodes, Set displayFields, boolean z11, AddressInputMode type, boolean z12) {
        Intrinsics.g(apiPath, "apiPath");
        Intrinsics.g(allowedCountryCodes, "allowedCountryCodes");
        Intrinsics.g(displayFields, "displayFields");
        Intrinsics.g(type, "type");
        this.f45282a = apiPath;
        this.f45283b = allowedCountryCodes;
        this.f45284c = displayFields;
        this.f45285d = z11;
        this.f45286e = type;
        this.f45287f = z12;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public AddressSpec(Set set, int i5) {
        this(z0.a("billing_details[address]"), set, EmptySet.f71734a, true, new AddressInputMode.NoAutocomplete(null, 7), (i5 & 32) == 0);
        IdentifierSpec.Companion.getClass();
    }
}
