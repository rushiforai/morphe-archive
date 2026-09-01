package defpackage;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s2a implements Parcelable {
    public static final Parcelable.Creator<s2a> CREATOR = new f08(12);
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final Uri f;
    public final Uri g;

    public s2a(JSONObject jSONObject) {
        this.a = jSONObject.optString("id", null);
        this.b = jSONObject.optString("first_name", null);
        this.c = jSONObject.optString("middle_name", null);
        this.d = jSONObject.optString("last_name", null);
        this.e = jSONObject.optString("name", null);
        String strOptString = jSONObject.optString("link_uri", null);
        this.f = strOptString == null ? null : Uri.parse(strOptString);
        String strOptString2 = jSONObject.optString("picture_uri", null);
        this.g = strOptString2 != null ? Uri.parse(strOptString2) : null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        String str;
        String str2;
        String str3;
        String str4;
        Uri uri;
        Uri uri2;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s2a)) {
            return false;
        }
        String str5 = this.a;
        return ((str5 == null && ((s2a) obj).a == null) || g76.L(str5, ((s2a) obj).a)) && (((str = this.b) == null && ((s2a) obj).b == null) || g76.L(str, ((s2a) obj).b)) && ((((str2 = this.c) == null && ((s2a) obj).c == null) || g76.L(str2, ((s2a) obj).c)) && ((((str3 = this.d) == null && ((s2a) obj).d == null) || g76.L(str3, ((s2a) obj).d)) && ((((str4 = this.e) == null && ((s2a) obj).e == null) || g76.L(str4, ((s2a) obj).e)) && ((((uri = this.f) == null && ((s2a) obj).f == null) || g76.L(uri, ((s2a) obj).f)) && (((uri2 = this.g) == null && ((s2a) obj).g == null) || g76.L(uri2, ((s2a) obj).g))))));
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = 527 + (str != null ? str.hashCode() : 0);
        String str2 = this.b;
        if (str2 != null) {
            iHashCode = (iHashCode * 31) + str2.hashCode();
        }
        String str3 = this.c;
        if (str3 != null) {
            iHashCode = (iHashCode * 31) + str3.hashCode();
        }
        String str4 = this.d;
        if (str4 != null) {
            iHashCode = (iHashCode * 31) + str4.hashCode();
        }
        String str5 = this.e;
        if (str5 != null) {
            iHashCode = (iHashCode * 31) + str5.hashCode();
        }
        Uri uri = this.f;
        if (uri != null) {
            iHashCode = (iHashCode * 31) + uri.hashCode();
        }
        Uri uri2 = this.g;
        if (uri2 != null) {
            return uri2.hashCode() + (iHashCode * 31);
        }
        return iHashCode;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        parcel.writeString(this.b);
        parcel.writeString(this.c);
        parcel.writeString(this.d);
        parcel.writeString(this.e);
        Uri uri = this.f;
        parcel.writeString(uri != null ? uri.toString() : null);
        Uri uri2 = this.g;
        parcel.writeString(uri2 != null ? uri2.toString() : null);
    }

    public s2a(String str, String str2, String str3, String str4, String str5, Uri uri, Uri uri2) {
        hk7.E(str, "id");
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = uri;
        this.g = uri2;
    }

    public s2a(Parcel parcel) {
        this.a = parcel.readString();
        this.b = parcel.readString();
        this.c = parcel.readString();
        this.d = parcel.readString();
        this.e = parcel.readString();
        String string = parcel.readString();
        this.f = string == null ? null : Uri.parse(string);
        String string2 = parcel.readString();
        this.g = string2 != null ? Uri.parse(string2) : null;
    }
}
