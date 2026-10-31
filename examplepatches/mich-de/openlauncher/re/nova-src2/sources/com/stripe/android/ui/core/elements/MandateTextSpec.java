package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.h3;
import cw.i3;
import cw.j3;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/MandateTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/i3", "cw/j3", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class MandateTextSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45320a;

    /* renamed from: b, reason: collision with root package name */
    public final int f45321b;

    @NotNull
    public static final j3 Companion = new j3();

    @NotNull
    public static final Parcelable.Creator<MandateTextSpec> CREATOR = new c(18);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public MandateTextSpec(int i5, IdentifierSpec identifierSpec, int i11) {
        if (2 != (i5 & 2)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 2, i3.f48170a.getDescriptor());
        }
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            this.f45320a = z0.a("mandate");
        } else {
            this.f45320a = identifierSpec;
        }
        this.f45321b = i11;
    }

    public final h3 a(String... strArr) {
        return new h3(this.f45320a, this.f45321b, kotlin.collections.c.b1(strArr), 0.0f, 24);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MandateTextSpec)) {
            return false;
        }
        MandateTextSpec mandateTextSpec = (MandateTextSpec) obj;
        return Intrinsics.b(this.f45320a, mandateTextSpec.f45320a) && this.f45321b == mandateTextSpec.f45321b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f45321b) + (this.f45320a.hashCode() * 31);
    }

    public final String toString() {
        return "MandateTextSpec(apiPath=" + this.f45320a + ", stringResId=" + this.f45321b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45320a, i5);
        dest.writeInt(this.f45321b);
    }

    public MandateTextSpec(int i5, IdentifierSpec apiPath) {
        Intrinsics.g(apiPath, "apiPath");
        this.f45320a = apiPath;
        this.f45321b = i5;
    }
}
