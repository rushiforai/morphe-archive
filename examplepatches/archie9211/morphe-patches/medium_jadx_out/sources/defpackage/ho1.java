package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ho1 extends k2 {
    public static final Parcelable.Creator<ho1> CREATOR = new xkf(9);
    public final boolean a;

    public ho1(boolean z) {
        this.a = z;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
