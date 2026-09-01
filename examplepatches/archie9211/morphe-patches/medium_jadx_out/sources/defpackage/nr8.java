package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class nr8 implements Parcelable {
    public static final Parcelable.Creator<nr8> CREATOR = new f08(2);
    public final long a;
    public final long b;
    public final long c;
    public final float d;

    public nr8(float f, long j, long j2, long j3) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = f;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nr8)) {
            return false;
        }
        nr8 nr8Var = (nr8) obj;
        long j = nr8Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, nr8Var.b) && ezd.a(this.c, nr8Var.c) && Float.compare(this.d, nr8Var.d) == 0;
    }

    public final int hashCode() {
        int i = uu1.i;
        return Float.floatToIntBits(this.d) + lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeLong(this.a);
        parcel.writeLong(this.b);
        parcel.writeLong(this.c);
        parcel.writeFloat(this.d);
    }

    public final String toString() {
        String strH = uu1.h(this.a);
        String strH2 = uu1.h(this.b);
        String strH3 = uu1.h(this.c);
        StringBuilder sbU = y30.u("OnboardingCategoryColors(strokeColor=", strH, ", backgroundColor=", strH2, ", foregroundColor=");
        sbU.append(strH3);
        sbU.append(AXoTRPEGKEve.lCqOIeIMpVu);
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }

    public /* synthetic */ nr8(long j, long j2, long j3) {
        this(1.0f, j, j2, j3);
    }
}
