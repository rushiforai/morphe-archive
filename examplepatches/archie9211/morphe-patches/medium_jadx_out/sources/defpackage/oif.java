package defpackage;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oif extends k2 implements cjb {
    public static final Parcelable.Creator<oif> CREATOR = new tfd(10);
    public final int a;
    public final int b;
    public final Intent c;

    public oif(int i, int i2, Intent intent) {
        this.a = i;
        this.b = i2;
        this.c = intent;
    }

    @Override // defpackage.cjb
    public final Status c() {
        return this.b == 0 ? Status.e : Status.i;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(this.b);
        fo7.U(parcel, 3, this.c, i);
        fo7.d0(iC0, parcel);
    }
}
