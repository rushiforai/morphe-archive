package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class g08 implements Parcelable {
    public static final Parcelable.Creator<g08> CREATOR = new f08(0);
    public final String a;
    public final SourceParameter b;
    public final String c;
    public final String d;

    public g08(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        str2.getClass();
        this.a = str;
        this.b = sourceParameter;
        this.c = str2;
        this.d = gp7.u(sourceParameter);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g08)) {
            return false;
        }
        g08 g08Var = (g08) obj;
        return g76.L(this.a, g08Var.a) && g76.L(this.b, g08Var.b) && g76.L(this.c, g08Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ev6.o(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MetricsContext(referrerSource=");
        sb.append(this.a);
        sb.append(", sourceParameter=");
        sb.append(this.b);
        sb.append(", location=");
        return ka1.v(sb, this.c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        parcel.writeParcelable(this.b, i);
        parcel.writeString(this.c);
    }
}
