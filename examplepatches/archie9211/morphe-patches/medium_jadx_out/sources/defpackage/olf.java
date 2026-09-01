package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class olf extends k2 {
    public static final Parcelable.Creator<olf> CREATOR = new rkf(7);
    public final long a;

    public olf(long j) {
        this.a = Long.valueOf(j).longValue();
    }

    public final boolean equals(Object obj) {
        return (obj instanceof olf) && this.a == ((olf) obj).a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Long.valueOf(this.a)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 8);
        parcel.writeLong(this.a);
        fo7.d0(iC0, parcel);
    }
}
