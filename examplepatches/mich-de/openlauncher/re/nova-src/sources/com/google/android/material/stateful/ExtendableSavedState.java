package com.google.android.material.stateful;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.customview.view.AbsSavedState;
import z.c1;
import z1.p;

/* loaded from: classes3.dex */
public class ExtendableSavedState extends AbsSavedState {
    public static final Parcelable.Creator<ExtendableSavedState> CREATOR = new p(1);

    /* renamed from: c, reason: collision with root package name */
    public final c1 f34360c;

    public ExtendableSavedState(Parcelable parcelable) {
        super(parcelable);
        this.f34360c = new c1(0);
    }

    public final String toString() {
        return "ExtendableSavedState{" + Integer.toHexString(System.identityHashCode(this)) + " states=" + this.f34360c + "}";
    }

    @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        super.writeToParcel(parcel, i5);
        c1 c1Var = this.f34360c;
        int i11 = c1Var.f97753c;
        parcel.writeInt(i11);
        String[] strArr = new String[i11];
        Bundle[] bundleArr = new Bundle[i11];
        for (int i12 = 0; i12 < i11; i12++) {
            strArr[i12] = (String) c1Var.f(i12);
            bundleArr[i12] = (Bundle) c1Var.j(i12);
        }
        parcel.writeStringArray(strArr);
        parcel.writeTypedArray(bundleArr, 0);
    }

    public ExtendableSavedState(Parcel parcel, ClassLoader classLoader) {
        super(parcel, classLoader);
        int i5 = parcel.readInt();
        String[] strArr = new String[i5];
        parcel.readStringArray(strArr);
        Bundle[] bundleArr = new Bundle[i5];
        parcel.readTypedArray(bundleArr, Bundle.CREATOR);
        this.f34360c = new c1(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            this.f34360c.put(strArr[i11], bundleArr[i11]);
        }
    }
}
