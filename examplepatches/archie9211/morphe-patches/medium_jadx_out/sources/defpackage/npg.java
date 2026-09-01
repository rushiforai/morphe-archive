package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class npg implements qnb {
    public static final Parcelable.Creator<npg> CREATOR = new r4g(16);
    public final String a;
    public final String b;
    public final y70 c;
    public final boolean d;

    public npg(String str, String str2, boolean z) {
        vp7.n(str);
        vp7.n(str2);
        this.a = str;
        this.b = str2;
        this.c = hwf.d(str2);
        this.d = z;
    }

    public final String a() {
        String str = this.a;
        boolean zEquals = "github.com".equals(str);
        y70 y70Var = this.c;
        if (zEquals) {
            return (String) y70Var.get("login");
        }
        if ("twitter.com".equals(str)) {
            return (String) y70Var.get("screen_name");
        }
        return null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(this.d ? 1 : 0);
        fo7.d0(iC0, parcel);
    }

    public npg(boolean z) {
        this.d = z;
        this.b = null;
        this.a = null;
        this.c = null;
    }
}
