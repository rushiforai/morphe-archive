package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ac5 extends k2 {
    public static final Parcelable.Creator<ac5> CREATOR = new tfd(22);
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final boolean e;
    public final int f;

    public ac5(int i, String str, String str2, String str3, String str4, boolean z) {
        vp7.p(str);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = z;
        this.f = i;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ac5)) {
            return false;
        }
        ac5 ac5Var = (ac5) obj;
        return en7.u(this.a, ac5Var.a) && en7.u(this.d, ac5Var.d) && en7.u(this.b, ac5Var.b) && en7.u(Boolean.valueOf(this.e), Boolean.valueOf(ac5Var.e)) && this.f == ac5Var.f;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.d, Boolean.valueOf(this.e), Integer.valueOf(this.f)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.V(parcel, 3, this.c);
        fo7.V(parcel, 4, this.d);
        fo7.a0(parcel, 5, 4);
        parcel.writeInt(this.e ? 1 : 0);
        fo7.a0(parcel, 6, 4);
        parcel.writeInt(this.f);
        fo7.d0(iC0, parcel);
    }
}
