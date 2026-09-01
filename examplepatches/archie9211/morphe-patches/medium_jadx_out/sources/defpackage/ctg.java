package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ctg implements qnb {
    public static final Parcelable.Creator<ctg> CREATOR = new rkf(6);
    public xmf a;
    public npg b;
    public lxf c;

    public ctg(xmf xmfVar) {
        this.a = xmfVar;
        ArrayList arrayList = xmfVar.e;
        this.b = null;
        for (int i = 0; i < arrayList.size(); i++) {
            if (!TextUtils.isEmpty(((ivg) arrayList.get(i)).h)) {
                this.b = new npg(((ivg) arrayList.get(i)).b, ((ivg) arrayList.get(i)).h, xmfVar.j);
            }
        }
        if (this.b == null) {
            this.b = new npg(xmfVar.j);
        }
        this.c = xmfVar.k;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.U(parcel, 2, this.b, i);
        fo7.U(parcel, 3, this.c, i);
        fo7.d0(iC0, parcel);
    }
}
