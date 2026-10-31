package kw;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.uicore.elements.IdentifierSpec;
import com.stripe.android.uicore.elements.ParameterDestination;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new IdentifierSpec(parcel.readString(), parcel.readInt() != 0, (ParameterDestination) parcel.readParcelable(IdentifierSpec.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new IdentifierSpec[i5];
    }
}
