package com.google.android.gms.auth.api.signin;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import ji.a;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import sg.w;

@Deprecated
/* loaded from: classes3.dex */
public class GoogleSignInAccount extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<GoogleSignInAccount> CREATOR = new a(16);

    /* renamed from: f, reason: collision with root package name */
    public final String f31731f;

    /* renamed from: g, reason: collision with root package name */
    public final String f31732g;

    /* renamed from: h, reason: collision with root package name */
    public final String f31733h;

    /* renamed from: i, reason: collision with root package name */
    public final String f31734i;

    /* renamed from: j, reason: collision with root package name */
    public final Uri f31735j;

    /* renamed from: k, reason: collision with root package name */
    public String f31736k;

    /* renamed from: l, reason: collision with root package name */
    public final long f31737l;

    /* renamed from: m, reason: collision with root package name */
    public final String f31738m;
    public final List n;
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final String f31739p;

    /* renamed from: q, reason: collision with root package name */
    public final HashSet f31740q = new HashSet();

    public GoogleSignInAccount(String str, String str2, String str3, String str4, Uri uri, String str5, long j11, String str6, ArrayList arrayList, String str7, String str8) {
        this.f31731f = str;
        this.f31732g = str2;
        this.f31733h = str3;
        this.f31734i = str4;
        this.f31735j = uri;
        this.f31736k = str5;
        this.f31737l = j11;
        this.f31738m = str6;
        this.n = arrayList;
        this.o = str7;
        this.f31739p = str8;
    }

    public static GoogleSignInAccount b(String str) throws JSONException, NumberFormatException {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        JSONObject jSONObject = new JSONObject(str);
        String strOptString = jSONObject.optString("photoUrl");
        Uri uri = !TextUtils.isEmpty(strOptString) ? Uri.parse(strOptString) : null;
        long j11 = Long.parseLong(jSONObject.getString("expirationTime"));
        HashSet hashSet = new HashSet();
        JSONArray jSONArray = jSONObject.getJSONArray("grantedScopes");
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            hashSet.add(new Scope(1, jSONArray.getString(i5)));
        }
        String strOptString2 = jSONObject.optString("id");
        String strOptString3 = jSONObject.has("tokenId") ? jSONObject.optString("tokenId") : null;
        String strOptString4 = jSONObject.has(ActionCategory.EMAIL) ? jSONObject.optString(ActionCategory.EMAIL) : null;
        String strOptString5 = jSONObject.has("displayName") ? jSONObject.optString("displayName") : null;
        String strOptString6 = jSONObject.has("givenName") ? jSONObject.optString("givenName") : null;
        String strOptString7 = jSONObject.has("familyName") ? jSONObject.optString("familyName") : null;
        String string = jSONObject.getString("obfuscatedIdentifier");
        w.e(string);
        GoogleSignInAccount googleSignInAccount = new GoogleSignInAccount(strOptString2, strOptString3, strOptString4, strOptString5, uri, null, j11, string, new ArrayList(hashSet), strOptString6, strOptString7);
        googleSignInAccount.f31736k = jSONObject.has("serverAuthCode") ? jSONObject.optString("serverAuthCode") : null;
        return googleSignInAccount;
    }

    public final boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof GoogleSignInAccount)) {
            return false;
        }
        GoogleSignInAccount googleSignInAccount = (GoogleSignInAccount) obj;
        if (!googleSignInAccount.f31738m.equals(this.f31738m)) {
            return false;
        }
        HashSet hashSet = new HashSet(googleSignInAccount.n);
        hashSet.addAll(googleSignInAccount.f31740q);
        HashSet hashSet2 = new HashSet(this.n);
        hashSet2.addAll(this.f31740q);
        return hashSet.equals(hashSet2);
    }

    public final int hashCode() {
        int iHashCode = this.f31738m.hashCode() + 527;
        HashSet hashSet = new HashSet(this.n);
        hashSet.addAll(this.f31740q);
        return (iHashCode * 31) + hashSet.hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.c0(parcel, 2, this.f31731f);
        fg.a.c0(parcel, 3, this.f31732g);
        fg.a.c0(parcel, 4, this.f31733h);
        fg.a.c0(parcel, 5, this.f31734i);
        fg.a.b0(parcel, 6, this.f31735j, i5);
        fg.a.c0(parcel, 7, this.f31736k);
        fg.a.i0(parcel, 8, 8);
        parcel.writeLong(this.f31737l);
        fg.a.c0(parcel, 9, this.f31738m);
        fg.a.g0(parcel, this.n, 10);
        fg.a.c0(parcel, 11, this.o);
        fg.a.c0(parcel, 12, this.f31739p);
        fg.a.k0(parcel, iJ0);
    }
}
