package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fe5 extends zb0 {
    public static final Parcelable.Creator<fe5> CREATOR = new rkf(20);
    public final String a;
    public final String b;

    public fe5(String str, String str2) {
        if (str == null && str2 == null) {
            ay0.e("Must specify an idToken or an accessToken.");
            throw null;
        }
        if (str != null && str.length() == 0) {
            ay0.e("idToken cannot be empty");
            throw null;
        }
        if (str2 != null && str2.length() == 0) {
            ay0.e("accessToken cannot be empty");
            throw null;
        }
        this.a = str;
        this.b = str2;
    }

    @Override // defpackage.zb0
    public final String d() {
        return "google.com";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.d0(iC0, parcel);
    }
}
