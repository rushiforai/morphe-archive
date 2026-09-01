package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kwf extends k2 {
    public static final Parcelable.Creator<kwf> CREATOR = new lvf(18);
    public final List a;
    public final List b;

    public kwf(ArrayList arrayList, ArrayList arrayList2) {
        this.a = arrayList == null ? new ArrayList() : arrayList;
        this.b = arrayList2 == null ? new ArrayList() : arrayList2;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.Y(parcel, 1, this.a);
        fo7.Y(parcel, 2, this.b);
        fo7.d0(iC0, parcel);
    }
}
