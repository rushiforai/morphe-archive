package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j95 extends k2 {
    public static final Parcelable.Creator<j95> CREATOR = new h74(6);
    public final wg2 a;

    public j95(wg2 wg2Var) {
        wg2Var.getClass();
        this.a = wg2Var;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.d0(iC0, parcel);
    }
}
