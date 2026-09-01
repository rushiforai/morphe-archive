package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sjf extends k2 {
    public static final Parcelable.Creator<sjf> CREATOR = new tfd(15);
    public final int a;
    public final h42 b;
    public final yjf c;

    public sjf(int i, h42 h42Var, yjf yjfVar) {
        this.a = i;
        this.b = h42Var;
        this.c = yjfVar;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.U(parcel, 2, this.b, i);
        fo7.U(parcel, 3, this.c, i);
        fo7.d0(iC0, parcel);
    }
}
