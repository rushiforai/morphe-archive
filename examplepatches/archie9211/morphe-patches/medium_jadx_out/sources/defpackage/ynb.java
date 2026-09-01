package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ynb extends k2 {
    public static final Parcelable.Creator<ynb> CREATOR = new tfd(27);
    public final y9c a;
    public final String b;
    public final int c;

    public ynb(y9c y9cVar, String str, int i) {
        vp7.p(y9cVar);
        this.a = y9cVar;
        this.b = str;
        this.c = i;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ynb)) {
            return false;
        }
        ynb ynbVar = (ynb) obj;
        return en7.u(this.a, ynbVar.a) && en7.u(this.b, ynbVar.b) && this.c == ynbVar.c;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.V(parcel, 2, this.b);
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(this.c);
        fo7.d0(iC0, parcel);
    }
}
