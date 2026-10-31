package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.p4;
import cw.q4;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/StaticTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/p4", "cw/q4", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class StaticTextSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45346a;

    /* renamed from: b, reason: collision with root package name */
    public final int f45347b;

    @NotNull
    public static final q4 Companion = new q4();

    @NotNull
    public static final Parcelable.Creator<StaticTextSpec> CREATOR = new c(27);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public StaticTextSpec(int i5, IdentifierSpec identifierSpec, int i11) {
        if (2 != (i5 & 2)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 2, p4.f48265a.getDescriptor());
        }
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            this.f45346a = z0.a("static_text");
        } else {
            this.f45346a = identifierSpec;
        }
        this.f45347b = i11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StaticTextSpec)) {
            return false;
        }
        StaticTextSpec staticTextSpec = (StaticTextSpec) obj;
        return Intrinsics.b(this.f45346a, staticTextSpec.f45346a) && this.f45347b == staticTextSpec.f45347b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f45347b) + (this.f45346a.hashCode() * 31);
    }

    public final String toString() {
        return "StaticTextSpec(apiPath=" + this.f45346a + ", stringResId=" + this.f45347b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45346a, i5);
        dest.writeInt(this.f45347b);
    }

    public StaticTextSpec(int i5, IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45346a = apiPath;
        this.f45347b = i5;
    }
}
