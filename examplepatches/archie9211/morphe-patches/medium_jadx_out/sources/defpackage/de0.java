package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class de0 implements Parcelable {
    public static final Parcelable.Creator<de0> CREATOR = new xkf(5);
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final long e;
    public final long f;
    public final String g;
    public final String h;
    public final String i;
    public final String j;
    public final String k;
    public final String l;
    public final String m;
    public final Set n;
    public final String o;
    public final Map p;
    public final Map q;
    public final Map r;
    public final String s;
    public final String t;

    /* JADX WARN: Removed duplicated region for block: B:10:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public de0(java.lang.String r12, java.lang.String r13) throws org.json.JSONException {
        /*
            Method dump skipped, instruction units count: 449
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.de0.<init>(java.lang.String, java.lang.String):void");
    }

    public final JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("jti", this.a);
        jSONObject.put("iss", this.b);
        jSONObject.put("aud", this.c);
        jSONObject.put("nonce", this.d);
        jSONObject.put("exp", this.e);
        jSONObject.put("iat", this.f);
        String str = this.g;
        if (str != null) {
            jSONObject.put("sub", str);
        }
        String str2 = this.h;
        if (str2 != null) {
            jSONObject.put("name", str2);
        }
        String str3 = this.i;
        if (str3 != null) {
            jSONObject.put("given_name", str3);
        }
        String str4 = this.j;
        if (str4 != null) {
            jSONObject.put("middle_name", str4);
        }
        String str5 = this.k;
        if (str5 != null) {
            jSONObject.put("family_name", str5);
        }
        String str6 = this.l;
        if (str6 != null) {
            jSONObject.put("email", str6);
        }
        String str7 = this.m;
        if (str7 != null) {
            jSONObject.put("picture", str7);
        }
        Set set = this.n;
        if (set != null) {
            jSONObject.put("user_friends", new JSONArray((Collection) set));
        }
        String str8 = this.o;
        if (str8 != null) {
            jSONObject.put("user_birthday", str8);
        }
        Map map = this.p;
        if (map != null) {
            jSONObject.put("user_age_range", new JSONObject(map));
        }
        Map map2 = this.q;
        if (map2 != null) {
            jSONObject.put("user_hometown", new JSONObject(map2));
        }
        Map map3 = this.r;
        if (map3 != null) {
            jSONObject.put("user_location", new JSONObject(map3));
        }
        String str9 = this.s;
        if (str9 != null) {
            jSONObject.put("user_gender", str9);
        }
        String str10 = this.t;
        if (str10 != null) {
            jSONObject.put("user_link", str10);
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
        if (!(obj instanceof de0)) {
            return false;
        }
        de0 de0Var = (de0) obj;
        return g76.L(this.a, de0Var.a) && g76.L(this.b, de0Var.b) && g76.L(this.c, de0Var.c) && g76.L(this.d, de0Var.d) && this.e == de0Var.e && this.f == de0Var.f && g76.L(this.g, de0Var.g) && g76.L(this.h, de0Var.h) && g76.L(this.i, de0Var.i) && g76.L(this.j, de0Var.j) && g76.L(this.k, de0Var.k) && g76.L(this.l, de0Var.l) && g76.L(this.m, de0Var.m) && g76.L(this.n, de0Var.n) && g76.L(this.o, de0Var.o) && g76.L(this.p, de0Var.p) && g76.L(this.q, de0Var.q) && g76.L(this.r, de0Var.r) && g76.L(this.s, de0Var.s) && g76.L(this.t, de0Var.t);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(wgd.o(wgd.o(527, 31, this.a), 31, this.b), 31, this.c), 31, this.d);
        long j = this.e;
        int i = (iO + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.f;
        int iO2 = wgd.o((i + ((int) (j2 ^ (j2 >>> 32)))) * 31, 31, this.g);
        String str = this.h;
        int iHashCode = (iO2 + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.i;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.j;
        int iHashCode3 = (iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31;
        String str4 = this.k;
        int iHashCode4 = (iHashCode3 + (str4 != null ? str4.hashCode() : 0)) * 31;
        String str5 = this.l;
        int iHashCode5 = (iHashCode4 + (str5 != null ? str5.hashCode() : 0)) * 31;
        String str6 = this.m;
        int iHashCode6 = (iHashCode5 + (str6 != null ? str6.hashCode() : 0)) * 31;
        Set set = this.n;
        int iHashCode7 = (iHashCode6 + (set != null ? set.hashCode() : 0)) * 31;
        String str7 = this.o;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 31;
        Map map = this.p;
        int iHashCode9 = (iHashCode8 + (map != null ? map.hashCode() : 0)) * 31;
        Map map2 = this.q;
        int iHashCode10 = (iHashCode9 + (map2 != null ? map2.hashCode() : 0)) * 31;
        Map map3 = this.r;
        int iHashCode11 = (iHashCode10 + (map3 != null ? map3.hashCode() : 0)) * 31;
        String str8 = this.s;
        int iHashCode12 = (iHashCode11 + (str8 != null ? str8.hashCode() : 0)) * 31;
        String str9 = this.t;
        return iHashCode12 + (str9 != null ? str9.hashCode() : 0);
    }

    public final String toString() {
        String string = a().toString();
        string.getClass();
        return string;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        parcel.writeString(this.b);
        parcel.writeString(this.c);
        parcel.writeString(this.d);
        parcel.writeLong(this.e);
        parcel.writeLong(this.f);
        parcel.writeString(this.g);
        parcel.writeString(this.h);
        parcel.writeString(this.i);
        parcel.writeString(this.j);
        parcel.writeString(this.k);
        parcel.writeString(this.l);
        parcel.writeString(this.m);
        Set set = this.n;
        if (set == null) {
            parcel.writeStringList(null);
        } else {
            parcel.writeStringList(new ArrayList(set));
        }
        parcel.writeString(this.o);
        parcel.writeMap(this.p);
        parcel.writeMap(this.q);
        parcel.writeMap(this.r);
        parcel.writeString(this.s);
        parcel.writeString(this.t);
    }

    public de0(Parcel parcel) {
        String string = parcel.readString();
        hk7.E(string, "jti");
        this.a = string;
        String string2 = parcel.readString();
        hk7.E(string2, "iss");
        this.b = string2;
        String string3 = parcel.readString();
        hk7.E(string3, "aud");
        this.c = string3;
        String string4 = parcel.readString();
        hk7.E(string4, "nonce");
        this.d = string4;
        this.e = parcel.readLong();
        this.f = parcel.readLong();
        String string5 = parcel.readString();
        hk7.E(string5, "sub");
        this.g = string5;
        this.h = parcel.readString();
        this.i = parcel.readString();
        this.j = parcel.readString();
        this.k = parcel.readString();
        this.l = parcel.readString();
        this.m = parcel.readString();
        ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
        this.n = arrayListCreateStringArrayList != null ? DesugarCollections.unmodifiableSet(new HashSet(arrayListCreateStringArrayList)) : null;
        this.o = parcel.readString();
        HashMap hashMap = parcel.readHashMap(d46.class.getClassLoader());
        hashMap = hashMap == null ? null : hashMap;
        this.p = hashMap != null ? DesugarCollections.unmodifiableMap(hashMap) : null;
        HashMap hashMap2 = parcel.readHashMap(guc.class.getClassLoader());
        hashMap2 = hashMap2 == null ? null : hashMap2;
        this.q = hashMap2 != null ? DesugarCollections.unmodifiableMap(hashMap2) : null;
        HashMap hashMap3 = parcel.readHashMap(guc.class.getClassLoader());
        hashMap3 = hashMap3 == null ? null : hashMap3;
        this.r = hashMap3 != null ? DesugarCollections.unmodifiableMap(hashMap3) : null;
        this.s = parcel.readString();
        this.t = parcel.readString();
    }
}
