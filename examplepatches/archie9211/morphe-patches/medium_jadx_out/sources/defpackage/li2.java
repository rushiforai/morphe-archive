package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class li2 extends k2 {
    public static final Parcelable.Creator<li2> CREATOR = new xkf(23);
    public final Bundle a;

    public li2(Bundle bundle) {
        bundle.getClass();
        this.a = bundle;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        int iC0 = fo7.c0(20293, parcel);
        fo7.R(parcel, 1, this.a);
        fo7.d0(iC0, parcel);
    }
}
