package com.stripe.android.link.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.model.ConsentPresentation;
import com.stripe.android.model.ConsentUi;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ConsentPresentation.FullScreen((ConsentUi.ConsentPane) parcel.readParcelable(ConsentPresentation.FullScreen.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConsentPresentation.FullScreen[i5];
    }
}
