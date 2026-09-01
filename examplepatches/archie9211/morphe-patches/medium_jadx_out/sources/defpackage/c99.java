package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c99 extends zb0 implements Cloneable {
    public static final Parcelable.Creator<c99> CREATOR = new rkf(25);
    public final String a;
    public final String b;
    public final String c;
    public boolean d;
    public final String e;

    public c99(String str, String str2, String str3, String str4, boolean z) {
        vp7.k("Cannot create PhoneAuthCredential without either sessionInfo + smsCode or temporary proof + phoneNumber.", ((TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) && (TextUtils.isEmpty(str3) || TextUtils.isEmpty(str4))) ? false : true);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = str4;
    }

    public final Object clone() {
        boolean z = this.d;
        return new c99(this.a, this.b, this.c, this.e, z);
    }

    @Override // defpackage.zb0
    public final String d() {
        return "phone";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.V(parcel, 4, this.c);
        boolean z = this.d;
        fo7.a0(parcel, 5, 4);
        parcel.writeInt(z ? 1 : 0);
        fo7.V(parcel, 6, this.e);
        fo7.d0(iC0, parcel);
    }
}
