package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tdc extends k2 {
    public static final Parcelable.Creator<tdc> CREATOR = new f08(25);
    public final String a;
    public final String b;
    public final Bundle c;

    public tdc(String str, String str2, Bundle bundle) {
        str.getClass();
        bundle.getClass();
        this.a = str;
        this.b = str2;
        this.c = bundle;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.R(parcel, 3, this.c);
        fo7.d0(iC0, parcel);
    }
}
