package defpackage;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sq0 extends k2 {
    public static final Parcelable.Creator<sq0> CREATOR = new tfd(21);
    public final PendingIntent a;

    public sq0(PendingIntent pendingIntent) {
        vp7.p(pendingIntent);
        this.a = pendingIntent;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.d0(iC0, parcel);
    }
}
