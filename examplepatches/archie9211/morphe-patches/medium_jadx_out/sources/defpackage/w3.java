package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w3 implements Parcelable {
    public final Date a;
    public final Set b;
    public final Set c;
    public final Set d;
    public final String e;
    public final h4 f;
    public final Date g;
    public final String h;
    public final String i;
    public final Date j;
    public final String k;
    public static final Date l = new Date(Long.MAX_VALUE);
    public static final Date m = new Date();
    public static final h4 n = h4.FACEBOOK_APPLICATION_WEB;
    public static final Parcelable.Creator<w3> CREATOR = new xkf(1);

    public w3(String str, String str2, String str3, Collection collection, Collection collection2, Collection collection3, h4 h4Var, Date date, Date date2, Date date3, String str4) {
        b09.I(str, str2, str3);
        hk7.C(str, "accessToken");
        hk7.C(str2, "applicationId");
        hk7.C(str3, "userId");
        Date date4 = l;
        this.a = date == null ? date4 : date;
        Set setUnmodifiableSet = DesugarCollections.unmodifiableSet(collection != null ? new HashSet(collection) : new HashSet());
        setUnmodifiableSet.getClass();
        this.b = setUnmodifiableSet;
        Set setUnmodifiableSet2 = DesugarCollections.unmodifiableSet(collection2 != null ? new HashSet(collection2) : new HashSet());
        setUnmodifiableSet2.getClass();
        this.c = setUnmodifiableSet2;
        Set setUnmodifiableSet3 = DesugarCollections.unmodifiableSet(collection3 != null ? new HashSet(collection3) : new HashSet());
        setUnmodifiableSet3.getClass();
        this.d = setUnmodifiableSet3;
        this.e = str;
        h4Var = h4Var == null ? n : h4Var;
        if (str4 != null && str4.equals("instagram")) {
            int i = v3.a[h4Var.ordinal()];
            if (i == 1) {
                h4Var = h4.INSTAGRAM_APPLICATION_WEB;
            } else if (i == 2) {
                h4Var = h4.INSTAGRAM_CUSTOM_CHROME_TAB;
            } else if (i == 3) {
                h4Var = h4.INSTAGRAM_WEB_VIEW;
            }
        }
        this.f = h4Var;
        this.g = date2 == null ? m : date2;
        this.h = str2;
        this.i = str3;
        this.j = (date3 == null || date3.getTime() == 0) ? date4 : date3;
        this.k = str4 == null ? "facebook" : str4;
    }

    public final JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("version", 1);
        jSONObject.put("token", this.e);
        jSONObject.put("expires_at", this.a.getTime());
        jSONObject.put("permissions", new JSONArray((Collection) this.b));
        jSONObject.put("declined_permissions", new JSONArray((Collection) this.c));
        jSONObject.put("expired_permissions", new JSONArray((Collection) this.d));
        jSONObject.put("last_refresh", this.g.getTime());
        jSONObject.put("source", this.f.name());
        jSONObject.put("application_id", this.h);
        jSONObject.put("user_id", this.i);
        jSONObject.put("data_access_expiration_time", this.j.getTime());
        String str = this.k;
        if (str != null) {
            jSONObject.put("graph_domain", str);
        }
        return jSONObject;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w3)) {
            return false;
        }
        w3 w3Var = (w3) obj;
        if (g76.L(this.a, w3Var.a) && g76.L(this.b, w3Var.b) && g76.L(this.c, w3Var.c) && g76.L(this.d, w3Var.d) && g76.L(this.e, w3Var.e) && this.f == w3Var.f && g76.L(this.g, w3Var.g) && g76.L(this.h, w3Var.h) && g76.L(this.i, w3Var.i) && g76.L(this.j, w3Var.j)) {
            String str = w3Var.k;
            String str2 = this.k;
            if (str2 == null ? str == null : g76.L(str2, str)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.j.hashCode() + wgd.o(wgd.o((this.g.hashCode() + ((this.f.hashCode() + wgd.o((this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + ((this.a.hashCode() + 527) * 31)) * 31)) * 31)) * 31, 31, this.e)) * 31)) * 31, 31, this.h), 31, this.i)) * 31;
        String str = this.k;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("{AccessToken token:ACCESS_TOKEN_REMOVED permissions:[");
        f94.h(i87.INCLUDE_ACCESS_TOKENS);
        sb.append(TextUtils.join(", ", this.b));
        sb.append("]}");
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeLong(this.a.getTime());
        parcel.writeStringList(new ArrayList(this.b));
        parcel.writeStringList(new ArrayList(this.c));
        parcel.writeStringList(new ArrayList(this.d));
        parcel.writeString(this.e);
        parcel.writeString(this.f.name());
        parcel.writeLong(this.g.getTime());
        parcel.writeString(this.h);
        parcel.writeString(this.i);
        parcel.writeLong(this.j.getTime());
        parcel.writeString(this.k);
    }

    public w3(Parcel parcel) {
        h4 h4VarValueOf;
        this.a = new Date(parcel.readLong());
        ArrayList arrayList = new ArrayList();
        parcel.readStringList(arrayList);
        Set setUnmodifiableSet = DesugarCollections.unmodifiableSet(new HashSet(arrayList));
        setUnmodifiableSet.getClass();
        this.b = setUnmodifiableSet;
        arrayList.clear();
        parcel.readStringList(arrayList);
        Set setUnmodifiableSet2 = DesugarCollections.unmodifiableSet(new HashSet(arrayList));
        setUnmodifiableSet2.getClass();
        this.c = setUnmodifiableSet2;
        arrayList.clear();
        parcel.readStringList(arrayList);
        Set setUnmodifiableSet3 = DesugarCollections.unmodifiableSet(new HashSet(arrayList));
        setUnmodifiableSet3.getClass();
        this.d = setUnmodifiableSet3;
        String string = parcel.readString();
        hk7.E(string, "token");
        this.e = string;
        String string2 = parcel.readString();
        if (string2 != null) {
            h4VarValueOf = h4.valueOf(string2);
        } else {
            h4VarValueOf = n;
        }
        this.f = h4VarValueOf;
        this.g = new Date(parcel.readLong());
        String string3 = parcel.readString();
        hk7.E(string3, "applicationId");
        this.h = string3;
        String string4 = parcel.readString();
        hk7.E(string4, "userId");
        this.i = string4;
        this.j = new Date(parcel.readLong());
        this.k = parcel.readString();
    }
}
