package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.o3;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.i2;
import kw.o0;
import kw.p1;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/PhoneSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/n3", "cw/o3", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class PhoneSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45327a;

    @NotNull
    public static final o3 Companion = new o3();

    @NotNull
    public static final Parcelable.Creator<PhoneSpec> CREATOR = new c(21);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public PhoneSpec() {
        this(IdentifierSpec.n);
        IdentifierSpec.Companion.getClass();
    }

    public final i2 a(Map map) {
        IdentifierSpec.Companion.getClass();
        String str = (String) ((LinkedHashMap) map).get(IdentifierSpec.n);
        if (str == null) {
            str = b.f42142b;
        }
        return o0.c(new p1(this.f45327a, o0.a(str, 30, null, false, false)), null);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PhoneSpec) && Intrinsics.b(this.f45327a, ((PhoneSpec) obj).f45327a);
    }

    public final int hashCode() {
        return this.f45327a.hashCode();
    }

    public final String toString() {
        return "PhoneSpec(apiPath=" + this.f45327a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45327a, i5);
    }

    public PhoneSpec(int i5, IdentifierSpec identifierSpec) {
        if ((i5 & 1) != 0) {
            this.f45327a = identifierSpec;
        } else {
            IdentifierSpec.Companion.getClass();
            this.f45327a = IdentifierSpec.n;
        }
    }

    public PhoneSpec(IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45327a = apiPath;
    }
}
