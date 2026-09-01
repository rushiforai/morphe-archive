package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fy1 extends k2 {
    public static final Parcelable.Creator<fy1> CREATOR = new lvf(19);
    public final int a;
    public final int b;
    public final int c;
    public final boolean d;

    public fy1(int i, int i2, int i3, boolean z) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof fy1)) {
            return false;
        }
        fy1 fy1Var = (fy1) obj;
        return this.a == fy1Var.a && this.b == fy1Var.b && this.c == fy1Var.c && this.d == fy1Var.d;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.a), Integer.valueOf(this.b), Integer.valueOf(this.c), Boolean.valueOf(this.d)});
    }

    public final String toString() {
        int i = this.a;
        int length = String.valueOf(i).length();
        int i2 = this.b;
        int length2 = String.valueOf(i2).length();
        int i3 = this.c;
        int length3 = String.valueOf(i3).length();
        boolean z = this.d;
        StringBuilder sb = new StringBuilder(length + 55 + length2 + 19 + length3 + 13 + String.valueOf(z).length() + 1);
        sb.append("ComplianceOptions{callerProductId=");
        sb.append(i);
        sb.append(", dataOwnerProductId=");
        sb.append(i2);
        sb.append(", processingReason=");
        sb.append(i3);
        sb.append(", isUserData=");
        sb.append(z);
        sb.append("}");
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(this.b);
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(this.c);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.d ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
