package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.c;
import cw.t;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kw.z0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/BacsDebitBankAccountSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/t", "cw/s", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final class BacsDebitBankAccountSpec extends FormItemSpec {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45292a;

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierSpec f45293b;

    /* renamed from: c, reason: collision with root package name */
    public final IdentifierSpec f45294c;

    @NotNull
    private static final t Companion = new t();

    @NotNull
    public static final Parcelable.Creator<BacsDebitBankAccountSpec> CREATOR = new c(5);

    static {
        z0 z0Var = IdentifierSpec.Companion;
    }

    public BacsDebitBankAccountSpec() {
        IdentifierSpec.Companion.getClass();
        this.f45292a = z0.a("bacs_debit[sort_code]");
        this.f45293b = z0.a("bacs_debit[account_number]");
        this.f45294c = new IdentifierSpec();
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

    public BacsDebitBankAccountSpec(int i5, IdentifierSpec identifierSpec, IdentifierSpec identifierSpec2, IdentifierSpec identifierSpec3) {
        if ((i5 & 1) == 0) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = z0.a("bacs_debit[sort_code]");
        }
        this.f45292a = identifierSpec;
        if ((i5 & 2) == 0) {
            IdentifierSpec.Companion.getClass();
            this.f45293b = z0.a("bacs_debit[account_number]");
        } else {
            this.f45293b = identifierSpec2;
        }
        if ((i5 & 4) == 0) {
            this.f45294c = new IdentifierSpec();
        } else {
            this.f45294c = identifierSpec3;
        }
    }
}
