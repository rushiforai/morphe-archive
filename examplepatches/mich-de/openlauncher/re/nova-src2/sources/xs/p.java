package xs;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.link.ui.verification.VerificationViewState;
import com.stripe.android.link.ui.wallet.DefaultPaymentUI;
import com.stripe.android.model.ConsentUi;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        boolean z12;
        Class cls;
        boolean z13;
        boolean z14;
        ResolvableString resolvableString;
        boolean z15;
        Class cls2;
        boolean z16;
        boolean z17;
        ConsentUi.ConsentSection consentSection;
        DefaultPaymentUI defaultPaymentUI;
        boolean z18;
        Intrinsics.g(parcel, "parcel");
        boolean z19 = false;
        boolean z21 = true;
        if (parcel.readInt() != 0) {
            z11 = false;
            z19 = true;
        } else {
            z11 = false;
        }
        if (parcel.readInt() != 0) {
            z12 = true;
        } else {
            z12 = true;
            z21 = z11;
        }
        ResolvableString resolvableString2 = (ResolvableString) parcel.readParcelable(VerificationViewState.class.getClassLoader());
        if (parcel.readInt() != 0) {
            cls = VerificationViewState.class;
            z13 = z12;
        } else {
            cls = VerificationViewState.class;
            z13 = z11;
        }
        if (parcel.readInt() != 0) {
            z14 = z12;
            resolvableString = resolvableString2;
            z15 = z14;
        } else {
            z14 = z12;
            resolvableString = resolvableString2;
            z15 = z11;
        }
        Class cls3 = cls;
        String string = parcel.readString();
        boolean z22 = z14;
        String string2 = parcel.readString();
        if (parcel.readInt() != 0) {
            cls2 = cls3;
            z16 = z22;
        } else {
            cls2 = cls3;
            z16 = z11;
        }
        if (parcel.readInt() != 0) {
            z17 = z22;
        } else {
            z17 = z22;
            z22 = z11;
        }
        DefaultPaymentUI defaultPaymentUICreateFromParcel = parcel.readInt() == 0 ? null : DefaultPaymentUI.CREATOR.createFromParcel(parcel);
        ConsentUi.ConsentSection consentSection2 = (ConsentUi.ConsentSection) parcel.readParcelable(cls2.getClassLoader());
        if (parcel.readInt() != 0) {
            boolean z23 = z17;
            consentSection = consentSection2;
            defaultPaymentUI = defaultPaymentUICreateFromParcel;
            z18 = z23;
        } else {
            consentSection = consentSection2;
            defaultPaymentUI = defaultPaymentUICreateFromParcel;
            z18 = z11;
        }
        return new VerificationViewState(z19, z21, resolvableString, z13, z15, string, string2, z16, z22, defaultPaymentUI, consentSection, z18);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new VerificationViewState[i5];
    }
}
