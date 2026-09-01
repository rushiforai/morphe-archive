package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y9c extends k2 {
    public static final Parcelable.Creator<y9c> CREATOR = new rkf(1);
    public final String a;
    public final String b;

    public y9c(String str, String str2) {
        vp7.q("Account identifier cannot be null", str);
        String strTrim = str.trim();
        vp7.o(strTrim, "Account identifier cannot be empty");
        this.a = strTrim;
        vp7.n(str2);
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof y9c)) {
            return false;
        }
        y9c y9cVar = (y9c) obj;
        return en7.u(this.a, y9cVar.a) && en7.u(this.b, y9cVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.d0(iC0, parcel);
    }
}
