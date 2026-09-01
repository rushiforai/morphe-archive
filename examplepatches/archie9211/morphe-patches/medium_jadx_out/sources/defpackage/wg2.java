package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wg2 extends k2 {
    public static final Parcelable.Creator<wg2> CREATOR = new xkf(21);
    public final String a;
    public final Bundle b;

    public wg2(String str, Bundle bundle) {
        str.getClass();
        bundle.getClass();
        this.a = str;
        this.b = bundle;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.R(parcel, 2, this.b);
        fo7.d0(iC0, parcel);
    }
}
