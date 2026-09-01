package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hz extends k2 {
    public static final Parcelable.Creator<hz> CREATOR = xkf.b;
    public static final hz d;
    public final fy1 a;
    public final boolean b;
    public boolean c;

    static {
        hz hzVar = new hz(null, false);
        hzVar.c = false;
        d = hzVar;
    }

    public hz(fy1 fy1Var, boolean z) {
        this.a = fy1Var;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof hz)) {
            return false;
        }
        hz hzVar = (hz) obj;
        return en7.u(this.a, hzVar.a) && this.c == hzVar.c && this.b == hzVar.b;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, Boolean.valueOf(this.c), Boolean.valueOf(this.b)});
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.a);
        return y30.s(new StringBuilder(strValueOf.length() + 31), "ApiMetadata(complianceOptions=", strValueOf, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        if (this.c) {
            parcel.setDataPosition(parcel.dataPosition() - 4);
            parcel.setDataSize(parcel.dataSize() - 4);
            return;
        }
        parcel.writeInt(-204102970);
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(this.b ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
