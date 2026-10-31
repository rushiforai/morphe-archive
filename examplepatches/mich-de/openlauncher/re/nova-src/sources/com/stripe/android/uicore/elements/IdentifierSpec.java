package com.stripe.android.uicore.elements;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.ParameterDestination;
import java.lang.annotation.Annotation;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.PolymorphicSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kw.a1;
import kw.y0;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/uicore/elements/IdentifierSpec;", "Landroid/os/Parcelable;", k.O, "kw/z0", "kw/y0", "stripe-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class IdentifierSpec implements Parcelable {
    public static final IdentifierSpec A;
    public static final IdentifierSpec B;
    public static final IdentifierSpec C;
    public static final IdentifierSpec D;
    public static final IdentifierSpec E;

    /* renamed from: e, reason: collision with root package name */
    public static final IdentifierSpec f45364e;

    /* renamed from: f, reason: collision with root package name */
    public static final IdentifierSpec f45365f;

    /* renamed from: g, reason: collision with root package name */
    public static final IdentifierSpec f45366g;

    /* renamed from: h, reason: collision with root package name */
    public static final IdentifierSpec f45367h;

    /* renamed from: i, reason: collision with root package name */
    public static final IdentifierSpec f45368i;

    /* renamed from: j, reason: collision with root package name */
    public static final IdentifierSpec f45369j;

    /* renamed from: k, reason: collision with root package name */
    public static final IdentifierSpec f45370k;

    /* renamed from: l, reason: collision with root package name */
    public static final IdentifierSpec f45371l;

    /* renamed from: m, reason: collision with root package name */
    public static final IdentifierSpec f45372m;
    public static final IdentifierSpec n;
    public static final IdentifierSpec o;

    /* renamed from: p, reason: collision with root package name */
    public static final IdentifierSpec f45373p;

    /* renamed from: q, reason: collision with root package name */
    public static final IdentifierSpec f45374q;

    /* renamed from: r, reason: collision with root package name */
    public static final IdentifierSpec f45375r;

    /* renamed from: s, reason: collision with root package name */
    public static final IdentifierSpec f45376s;

    /* renamed from: t, reason: collision with root package name */
    public static final IdentifierSpec f45377t;

    /* renamed from: u, reason: collision with root package name */
    public static final IdentifierSpec f45378u;

    /* renamed from: v, reason: collision with root package name */
    public static final IdentifierSpec f45379v;

    /* renamed from: w, reason: collision with root package name */
    public static final IdentifierSpec f45380w;

    /* renamed from: x, reason: collision with root package name */
    public static final IdentifierSpec f45381x;

    /* renamed from: y, reason: collision with root package name */
    public static final IdentifierSpec f45382y;

    /* renamed from: z, reason: collision with root package name */
    public static final IdentifierSpec f45383z;

    /* renamed from: a, reason: collision with root package name */
    public final String f45384a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f45385b;

    /* renamed from: c, reason: collision with root package name */
    public final ParameterDestination f45386c;

    @NotNull
    public static final z0 Companion = new z0();

    @NotNull
    public static final Parcelable.Creator<IdentifierSpec> CREATOR = new a1();

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f45363d = {null, null, new PolymorphicSerializer(Reflection.f71864a.getOrCreateKotlinClass(ParameterDestination.class), new Annotation[0])};

    static {
        ParameterDestination parameterDestination = null;
        int i5 = 2;
        int i11 = 6;
        f45364e = new IdentifierSpec("billing_details[name]", parameterDestination, i11);
        f45365f = new IdentifierSpec("card[brand]", parameterDestination, i11);
        f45366g = new IdentifierSpec("card[networks][preferred]", parameterDestination, i11);
        f45367h = new IdentifierSpec("card[number]", parameterDestination, i11);
        f45368i = new IdentifierSpec("card[cvc]", parameterDestination, i11);
        f45369j = new IdentifierSpec("card[exp_month]", parameterDestination, i11);
        f45370k = new IdentifierSpec("card[exp_year]", parameterDestination, i11);
        f45371l = new IdentifierSpec("billing_details[address]", parameterDestination, i11);
        f45372m = new IdentifierSpec("billing_details[email]", parameterDestination, i11);
        n = new IdentifierSpec("billing_details[phone]", parameterDestination, i11);
        o = new IdentifierSpec("billing_details[address][line1]", parameterDestination, i11);
        f45373p = new IdentifierSpec("billing_details[address][line2]", parameterDestination, i11);
        f45374q = new IdentifierSpec("billing_details[address][city]", parameterDestination, i11);
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        f45375r = new IdentifierSpec(str, parameterDestination, i11);
        f45376s = new IdentifierSpec("billing_details[address][postal_code]", parameterDestination, i11);
        f45377t = new IdentifierSpec(str, parameterDestination, i11);
        f45378u = new IdentifierSpec("billing_details[address][state]", parameterDestination, i11);
        f45379v = new IdentifierSpec("billing_details[address][country]", parameterDestination, i11);
        f45380w = new IdentifierSpec("save_for_future_use", parameterDestination, i11);
        f45381x = new IdentifierSpec(PlaceTypes.ADDRESS, parameterDestination, i11);
        f45382y = new IdentifierSpec("same_as_shipping", parameterDestination, 4);
        ParameterDestination.Local local = ParameterDestination.Local.f45390a;
        f45383z = new IdentifierSpec("set_as_default_payment_method", local, i5);
        new IdentifierSpec("upi", parameterDestination, i11);
        A = new IdentifierSpec("upi[vpa]", parameterDestination, i11);
        ParameterDestination.Api api = ParameterDestination.Api.f45388b;
        new IdentifierSpec("blik", api, i5);
        B = new IdentifierSpec("blik[code]", api, i5);
        C = new IdentifierSpec("konbini[confirmation_number]", api, i5);
        D = new IdentifierSpec("bacs_debit[confirmed]", local, i5);
        E = new IdentifierSpec("phone_number_country", local, i5);
    }

    public /* synthetic */ IdentifierSpec(int i5, String str, boolean z11, ParameterDestination parameterDestination) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, y0.f72733a.getDescriptor());
        }
        this.f45384a = str;
        if ((i5 & 2) == 0) {
            this.f45385b = false;
        } else {
            this.f45385b = z11;
        }
        if ((i5 & 4) == 0) {
            this.f45386c = ParameterDestination.Api.f45387a;
        } else {
            this.f45386c = parameterDestination;
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
        if (!(obj instanceof IdentifierSpec)) {
            return false;
        }
        IdentifierSpec identifierSpec = (IdentifierSpec) obj;
        return Intrinsics.b(this.f45384a, identifierSpec.f45384a) && this.f45385b == identifierSpec.f45385b && Intrinsics.b(this.f45386c, identifierSpec.f45386c);
    }

    public final int hashCode() {
        return this.f45386c.hashCode() + c9.f(this.f45384a.hashCode() * 31, 31, this.f45385b);
    }

    public final String toString() {
        return "IdentifierSpec(v1=" + this.f45384a + ", ignoreField=" + this.f45385b + ", destination=" + this.f45386c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45384a);
        dest.writeInt(this.f45385b ? 1 : 0);
        dest.writeParcelable(this.f45386c, i5);
    }

    public IdentifierSpec(String v12, boolean z11, ParameterDestination destination) {
        Intrinsics.g(v12, "v1");
        Intrinsics.g(destination, "destination");
        this.f45384a = v12;
        this.f45385b = z11;
        this.f45386c = destination;
    }

    public /* synthetic */ IdentifierSpec(String str, ParameterDestination parameterDestination, int i5) {
        this(str, (i5 & 2) == 0, (i5 & 4) != 0 ? ParameterDestination.Api.f45387a : parameterDestination);
    }

    public IdentifierSpec() {
        this(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (ParameterDestination) null, 6);
    }
}
