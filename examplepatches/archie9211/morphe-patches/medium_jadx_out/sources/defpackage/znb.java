package defpackage;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class znb extends k2 {
    public static final Parcelable.Creator<znb> CREATOR = new tfd(28);
    public final PendingIntent a;

    public znb(PendingIntent pendingIntent) {
        vp7.p(pendingIntent);
        this.a = pendingIntent;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof znb) {
            return en7.u(this.a, ((znb) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.d0(iC0, parcel);
    }
}
