package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.v;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/BacsDebitConfirmSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/u", "cw/v", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final class BacsDebitConfirmSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45295a;

    @NotNull
    public static final v Companion = new v();

    @NotNull
    public static final Parcelable.Creator<BacsDebitConfirmSpec> CREATOR = new c(6);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public BacsDebitConfirmSpec() {
        IdentifierSpec.Companion.getClass();
        this.f45295a = IdentifierSpec.D;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(1);
    }

    public BacsDebitConfirmSpec(int i5, IdentifierSpec identifierSpec) {
        if ((i5 & 1) != 0) {
            this.f45295a = identifierSpec;
        } else {
            IdentifierSpec.Companion.getClass();
            this.f45295a = IdentifierSpec.D;
        }
    }
}
