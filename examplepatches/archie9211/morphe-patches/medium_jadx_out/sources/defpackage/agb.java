package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class agb implements Parcelable {
    public static final Parcelable.Creator<agb> CREATOR = new f08(21);
    public final String a;
    public final List b;
    public final Integer c;
    public final String d;
    public final Integer e;
    public final Long f;
    public final String g;
    public final String h;

    public agb(String str, List list, Integer num, String str2, Integer num2, Long l, String str3, String str4) {
        this.a = str;
        this.b = list;
        this.c = num;
        this.d = str2;
        this.e = num2;
        this.f = l;
        this.g = str3;
        this.h = str4;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof agb)) {
            return false;
        }
        agb agbVar = (agb) obj;
        return g76.L(this.a, agbVar.a) && g76.L(this.b, agbVar.b) && g76.L(this.c, agbVar.c) && g76.L(this.d, agbVar.d) && g76.L(this.e, agbVar.e) && g76.L(this.f, agbVar.f) && g76.L(this.g, agbVar.g) && g76.L(this.h, agbVar.h);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        List list = this.b;
        int iHashCode2 = (iHashCode + (list == null ? 0 : list.hashCode())) * 31;
        Integer num = this.c;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        String str2 = this.d;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num2 = this.e;
        int iHashCode5 = (iHashCode4 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Long l = this.f;
        int iHashCode6 = (iHashCode5 + (l == null ? 0 : l.hashCode())) * 31;
        String str3 = this.g;
        int iHashCode7 = (iHashCode6 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.h;
        return iHashCode7 + (str4 != null ? str4.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbE = b09.E("ResponsesPaging(from=", this.a, ", ignoredIds=", ", limit=", this.b);
        sbE.append(this.c);
        sbE.append(", order=");
        sbE.append(this.d);
        sbE.append(", page=");
        sbE.append(this.e);
        sbE.append(", since=");
        sbE.append(this.f);
        sbE.append(", source=");
        return km4.C(sbE, this.g, ", to=", this.h, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        parcel.writeStringList(this.b);
        Integer num = this.c;
        if (num == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeInt(num.intValue());
        }
        parcel.writeString(this.d);
        Integer num2 = this.e;
        if (num2 == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeInt(num2.intValue());
        }
        Long l = this.f;
        if (l == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeLong(l.longValue());
        }
        parcel.writeString(this.g);
        parcel.writeString(this.h);
    }

    public /* synthetic */ agb(Integer num, String str, int i) {
        this(null, null, num, null, null, null, null, (i & 128) != 0 ? null : str);
    }
}
