package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eud extends zb0 {
    public static final Parcelable.Creator<eud> CREATOR = new lvf(4);
    public final String a;
    public final String b;

    public eud(String str, String str2) {
        vp7.n(str);
        this.a = str;
        vp7.n(str2);
        this.b = str2;
    }

    @Override // defpackage.zb0
    public final String d() {
        return "twitter.com";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.d0(iC0, parcel);
    }
}
