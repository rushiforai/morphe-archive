package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qw3 extends zb0 {
    public static final Parcelable.Creator<qw3> CREATOR = new lvf(27);
    public final String a;
    public final String b;
    public final String c;
    public String d;
    public boolean e;

    public qw3(String str, String str2, String str3, String str4, boolean z) {
        vp7.n(str);
        this.a = str;
        if (TextUtils.isEmpty(str2) && TextUtils.isEmpty(str3)) {
            ay0.e("Cannot create an EmailAuthCredential without a password or emailLink.");
            throw null;
        }
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = z;
    }

    @Override // defpackage.zb0
    public final String d() {
        return "password";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.V(parcel, 3, this.c);
        fo7.V(parcel, 4, this.d);
        boolean z = this.e;
        fo7.a0(parcel, 5, 4);
        parcel.writeInt(z ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
