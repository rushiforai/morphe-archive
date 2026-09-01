package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kkg extends k2 {
    public static final Parcelable.Creator<kkg> CREATOR = new r4g(12);
    public final List a;

    public kkg(ArrayList arrayList) {
        vp7.p(arrayList);
        this.a = arrayList;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof kkg)) {
            return false;
        }
        List list = ((kkg) obj).a;
        List list2 = this.a;
        return list2.containsAll(list) && list.containsAll(list2);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{new HashSet(this.a)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.Y(parcel, 1, this.a);
        fo7.d0(iC0, parcel);
    }
}
