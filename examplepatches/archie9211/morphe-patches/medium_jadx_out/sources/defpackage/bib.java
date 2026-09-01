package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.responses.ResponsesViewModel$WriteState$Highlight;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bib implements Parcelable {
    public static final Parcelable.Creator<bib> CREATOR = new f08(22);
    public final String a;
    public final zw7 b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final boolean g;
    public final String h;
    public final boolean i;
    public final ResponsesViewModel$WriteState$Highlight j;

    public bib(String str, zw7 zw7Var, String str2, String str3, String str4, String str5, boolean z, String str6, boolean z2, ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight) {
        str2.getClass();
        str3.getClass();
        this.a = str;
        this.b = zw7Var;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = z;
        this.h = str6;
        this.i = z2;
        this.j = responsesViewModel$WriteState$Highlight;
    }

    public static bib a(bib bibVar, String str, String str2, String str3, String str4, boolean z, String str5, boolean z2, ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight, int i) {
        String str6 = bibVar.a;
        zw7 zw7Var = bibVar.b;
        if ((i & 4) != 0) {
            str = bibVar.c;
        }
        String str7 = str;
        if ((i & 8) != 0) {
            str2 = bibVar.d;
        }
        String str8 = str2;
        if ((i & 16) != 0) {
            str3 = bibVar.e;
        }
        String str9 = str3;
        String str10 = (i & 32) != 0 ? bibVar.f : str4;
        boolean z3 = (i & 64) != 0 ? bibVar.g : z;
        String str11 = (i & 128) != 0 ? bibVar.h : str5;
        boolean z4 = (i & 256) != 0 ? bibVar.i : z2;
        ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight2 = (i & 512) != 0 ? bibVar.j : responsesViewModel$WriteState$Highlight;
        bibVar.getClass();
        str7.getClass();
        str8.getClass();
        return new bib(str6, zw7Var, str7, str8, str9, str10, z3, str11, z4, responsesViewModel$WriteState$Highlight2);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bib)) {
            return false;
        }
        bib bibVar = (bib) obj;
        return g76.L(this.a, bibVar.a) && this.b == bibVar.b && g76.L(this.c, bibVar.c) && g76.L(this.d, bibVar.d) && g76.L(this.e, bibVar.e) && g76.L(this.f, bibVar.f) && this.g == bibVar.g && g76.L(this.h, bibVar.h) && this.i == bibVar.i && g76.L(this.j, bibVar.j);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        zw7 zw7Var = this.b;
        int iO = wgd.o(wgd.o((iHashCode + (zw7Var == null ? 0 : zw7Var.hashCode())) * 31, 31, this.c), 31, this.d);
        String str2 = this.e;
        int iHashCode2 = (iO + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f;
        int iHashCode3 = (((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31) + (this.g ? 1231 : 1237)) * 31;
        String str4 = this.h;
        int iHashCode4 = (((iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31) + (this.i ? 1231 : 1237)) * 31;
        ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight = this.j;
        return iHashCode4 + (responsesViewModel$WriteState$Highlight != null ? responsesViewModel$WriteState$Highlight.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("WriteState(currentUserImageId=");
        sb.append(this.a);
        sb.append(", currentUserMembershipType=");
        sb.append(this.b);
        sb.append(", inResponseToId=");
        ka1.C(sb, this.c, ", inResponseToSource=", this.d, ", highlightedId=");
        ka1.C(sb, this.e, ", inResponseToAuthorName=", this.f, ", isResponding=");
        sb.append(this.g);
        sb.append(", responseId=");
        sb.append(this.h);
        sb.append(", isFocused=");
        sb.append(this.i);
        sb.append(", highlight=");
        sb.append(this.j);
        sb.append(")");
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        zw7 zw7Var = this.b;
        if (zw7Var == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeString(zw7Var.name());
        }
        parcel.writeString(this.c);
        parcel.writeString(this.d);
        parcel.writeString(this.e);
        parcel.writeString(this.f);
        parcel.writeInt(this.g ? 1 : 0);
        parcel.writeString(this.h);
        parcel.writeInt(this.i ? 1 : 0);
        ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight = this.j;
        if (responsesViewModel$WriteState$Highlight == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            responsesViewModel$WriteState$Highlight.writeToParcel(parcel, i);
        }
    }
}
