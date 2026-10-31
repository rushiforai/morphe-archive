package com.stripe.android.link.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.model.ConsentPresentation;
import com.stripe.android.model.ConsentUi;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ConsentPresentation.Inline((ConsentUi.ConsentSection) parcel.readParcelable(ConsentPresentation.Inline.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConsentPresentation.Inline[i5];
    }
}
