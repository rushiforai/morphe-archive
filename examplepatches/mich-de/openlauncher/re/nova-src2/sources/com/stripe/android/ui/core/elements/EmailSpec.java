package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.j2;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.i2;
import kw.o0;
import kw.q0;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/EmailSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/i2", "cw/j2", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class EmailSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45309a;

    @NotNull
    public static final j2 Companion = new j2();

    @NotNull
    public static final Parcelable.Creator<EmailSpec> CREATOR = new c(12);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public EmailSpec() {
        this(IdentifierSpec.f45372m);
        IdentifierSpec.Companion.getClass();
    }

    public final i2 a(Map map) {
        IdentifierSpec.Companion.getClass();
        return o0.c(new q0(this.f45309a, (String) ((LinkedHashMap) map).get(IdentifierSpec.f45372m), 4), null);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof EmailSpec) && Intrinsics.b(this.f45309a, ((EmailSpec) obj).f45309a);
    }

    public final int hashCode() {
        return this.f45309a.hashCode();
    }

    public final String toString() {
        return "EmailSpec(apiPath=" + this.f45309a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45309a, i5);
    }

    public EmailSpec(int i5, IdentifierSpec identifierSpec) {
        if ((i5 & 1) != 0) {
            this.f45309a = identifierSpec;
        } else {
            IdentifierSpec.Companion.getClass();
            this.f45309a = IdentifierSpec.f45372m;
        }
    }

    public EmailSpec(IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45309a = apiPath;
    }
}
