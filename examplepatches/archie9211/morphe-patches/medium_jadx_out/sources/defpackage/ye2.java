package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ye2 extends k2 {
    public static final Parcelable.Creator<ye2> CREATOR = new xkf(17);
    public final String a;
    public final Bundle b;
    public final Bundle c;
    public final String d;
    public final String e;
    public final ResultReceiver f;

    public ye2(String str, Bundle bundle, Bundle bundle2, String str2, String str3, ResultReceiver resultReceiver) {
        str.getClass();
        bundle.getClass();
        bundle2.getClass();
        this.a = str;
        this.b = bundle;
        this.c = bundle2;
        this.d = str2;
        this.e = str3;
        this.f = resultReceiver;
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
        fo7.U(parcel, 6, this.f, i);
        fo7.d0(iC0, parcel);
    }
}
