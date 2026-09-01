package defpackage;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xe2 extends k2 {
    public static final Parcelable.Creator<xe2> CREATOR = new xkf(16);
    public final PendingIntent a;
    public final af2 b;

    public xe2(PendingIntent pendingIntent, af2 af2Var) {
        this.a = pendingIntent;
        this.b = af2Var;
        if (pendingIntent == null && af2Var == null) {
            ay0.e("pendingIntent or createCredentialResponse must be specified.");
            throw null;
        }
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.U(parcel, 2, this.b, i);
        fo7.d0(iC0, parcel);
    }
}
