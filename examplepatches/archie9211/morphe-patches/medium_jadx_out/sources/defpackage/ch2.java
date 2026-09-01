package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ch2 extends k2 {
    public static final Parcelable.Creator<ch2> CREATOR = new xkf(22);
    public final String a;
    public final Bundle b;
    public final Bundle c;
    public final String d;
    public final String e;
    public final String f;

    public ch2(String str, Bundle bundle, Bundle bundle2, String str2, String str3, String str4) {
        str.getClass();
        bundle.getClass();
        bundle2.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        this.a = str;
        this.b = bundle;
        this.c = bundle2;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        boolean z = (muc.b0(str3) || muc.b0(str4)) ? false : true;
        boolean z2 = !muc.b0(str) && str3.length() == 0 && str4.length() == 0;
        if (z || z2) {
            return;
        }
        StringBuilder sb = new StringBuilder(String.valueOf(str4).length() + String.valueOf(str).length() + 31 + String.valueOf(str3).length() + 19 + 69);
        ka1.C(sb, "Either type: ", str, ", or requestType: ", str3);
        ay0.e(y30.s(sb, " and protocolType: ", str4, " must be specified, but at least one contains an invalid blank value."));
        throw null;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.R(parcel, 2, this.b);
        fo7.R(parcel, 3, this.c);
        fo7.V(parcel, 4, this.d);
        fo7.V(parcel, 5, this.e);
        fo7.V(parcel, 6, this.f);
        fo7.d0(iC0, parcel);
    }
}
