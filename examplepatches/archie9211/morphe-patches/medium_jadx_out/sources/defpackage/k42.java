package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k42 extends k2 {
    public static final Parcelable.Creator<k42> CREATOR = new r4g(6);
    public final plb a;
    public final boolean b;
    public final boolean c;
    public final int[] d;
    public final int e;
    public final int[] f;

    public k42(plb plbVar, boolean z, boolean z2, int[] iArr, int i, int[] iArr2) {
        this.a = plbVar;
        this.b = z;
        this.c = z2;
        this.d = iArr;
        this.e = i;
        this.f = iArr2;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(this.b ? 1 : 0);
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(this.c ? 1 : 0);
        int[] iArr = this.d;
        if (iArr != null) {
            int iC02 = fo7.c0(4, parcel);
            parcel.writeIntArray(iArr);
            fo7.d0(iC02, parcel);
        }
        fo7.a0(parcel, 5, 4);
        parcel.writeInt(this.e);
        int[] iArr2 = this.f;
        if (iArr2 != null) {
            int iC03 = fo7.c0(6, parcel);
            parcel.writeIntArray(iArr2);
            fo7.d0(iC03, parcel);
        }
        fo7.d0(iC0, parcel);
    }
}
