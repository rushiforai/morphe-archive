package com.google.android.gms.auth.api.signin;

import ai.r2;
import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.google.android.gms.auth.api.signin.internal.GoogleSignInOptionsExtensionParcelable;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import ji.a;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONArray;
import org.json.JSONObject;
import qg.b;

@Deprecated
/* loaded from: classes3.dex */
public class GoogleSignInOptions extends AbstractSafeParcelable implements b, ReflectedParcelable {
    public static final Parcelable.Creator<GoogleSignInOptions> CREATOR;

    /* renamed from: p, reason: collision with root package name */
    public static final GoogleSignInOptions f31741p;

    /* renamed from: q, reason: collision with root package name */
    public static final Scope f31742q;

    /* renamed from: r, reason: collision with root package name */
    public static final Scope f31743r;

    /* renamed from: s, reason: collision with root package name */
    public static final Scope f31744s;

    /* renamed from: t, reason: collision with root package name */
    public static final Scope f31745t;

    /* renamed from: u, reason: collision with root package name */
    public static final r2 f31746u;

    /* renamed from: f, reason: collision with root package name */
    public final int f31747f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f31748g;

    /* renamed from: h, reason: collision with root package name */
    public final Account f31749h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f31750i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f31751j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f31752k;

    /* renamed from: l, reason: collision with root package name */
    public final String f31753l;

    /* renamed from: m, reason: collision with root package name */
    public final String f31754m;
    public final ArrayList n;
    public final String o;

    static {
        Scope scope = new Scope(1, "profile");
        f31742q = new Scope(1, ActionCategory.EMAIL);
        Scope scope2 = new Scope(1, "openid");
        f31743r = scope2;
        Scope scope3 = new Scope(1, "https://www.googleapis.com/auth/games_lite");
        f31744s = scope3;
        f31745t = new Scope(1, "https://www.googleapis.com/auth/games");
        HashSet hashSet = new HashSet();
        HashMap map = new HashMap();
        hashSet.add(scope2);
        hashSet.add(scope);
        if (hashSet.contains(f31745t)) {
            Scope scope4 = f31744s;
            if (hashSet.contains(scope4)) {
                hashSet.remove(scope4);
            }
        }
        f31741p = new GoogleSignInOptions(3, new ArrayList(hashSet), null, false, false, false, null, null, map, null);
        HashSet hashSet2 = new HashSet();
        HashMap map2 = new HashMap();
        hashSet2.add(scope3);
        hashSet2.addAll(Arrays.asList(new Scope[0]));
        if (hashSet2.contains(f31745t)) {
            Scope scope5 = f31744s;
            if (hashSet2.contains(scope5)) {
                hashSet2.remove(scope5);
            }
        }
        new GoogleSignInOptions(3, new ArrayList(hashSet2), null, false, false, false, null, null, map2, null);
        CREATOR = new a(17);
        f31746u = new r2(21);
    }

    public GoogleSignInOptions(int i5, ArrayList arrayList, Account account, boolean z11, boolean z12, boolean z13, String str, String str2, HashMap map, String str3) {
        this.f31747f = i5;
        this.f31748g = arrayList;
        this.f31749h = account;
        this.f31750i = z11;
        this.f31751j = z12;
        this.f31752k = z13;
        this.f31753l = str;
        this.f31754m = str2;
        this.n = new ArrayList(map.values());
        this.o = str3;
    }

    public static GoogleSignInOptions b(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        JSONObject jSONObject = new JSONObject(str);
        HashSet hashSet = new HashSet();
        JSONArray jSONArray = jSONObject.getJSONArray("scopes");
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            hashSet.add(new Scope(1, jSONArray.getString(i5)));
        }
        String strOptString = jSONObject.has("accountName") ? jSONObject.optString("accountName") : null;
        return new GoogleSignInOptions(3, new ArrayList(hashSet), !TextUtils.isEmpty(strOptString) ? new Account(strOptString, "com.google") : null, jSONObject.getBoolean("idTokenRequested"), jSONObject.getBoolean("serverAuthRequested"), jSONObject.getBoolean("forceCodeForRefreshToken"), jSONObject.has("serverClientId") ? jSONObject.optString("serverClientId") : null, jSONObject.has("hostedDomain") ? jSONObject.optString("hostedDomain") : null, new HashMap(), null);
    }

    public static HashMap d(ArrayList arrayList) {
        HashMap map = new HashMap();
        if (arrayList != null) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                GoogleSignInOptionsExtensionParcelable googleSignInOptionsExtensionParcelable = (GoogleSignInOptionsExtensionParcelable) it.next();
                map.put(Integer.valueOf(googleSignInOptionsExtensionParcelable.f31759g), googleSignInOptionsExtensionParcelable);
            }
        }
        return map;
    }

    public final boolean equals(Object obj) {
        String str = this.f31753l;
        if (obj == null) {
            return false;
        }
        try {
            GoogleSignInOptions googleSignInOptions = (GoogleSignInOptions) obj;
            ArrayList arrayList = googleSignInOptions.f31748g;
            String str2 = googleSignInOptions.f31753l;
            Account account = googleSignInOptions.f31749h;
            if (this.n.isEmpty() && googleSignInOptions.n.isEmpty()) {
                ArrayList arrayList2 = this.f31748g;
                if (arrayList2.size() == new ArrayList(arrayList).size() && arrayList2.containsAll(new ArrayList(arrayList))) {
                    Account account2 = this.f31749h;
                    if (account2 == null) {
                        if (account != null) {
                            return false;
                        }
                    } else if (!account2.equals(account)) {
                        return false;
                    }
                    if (TextUtils.isEmpty(str)) {
                        if (!TextUtils.isEmpty(str2)) {
                            return false;
                        }
                    } else if (!str.equals(str2)) {
                        return false;
                    }
                    if (this.f31752k == googleSignInOptions.f31752k && this.f31750i == googleSignInOptions.f31750i && this.f31751j == googleSignInOptions.f31751j) {
                        return TextUtils.equals(this.o, googleSignInOptions.o);
                    }
                    return false;
                }
                return false;
            }
            return false;
        } catch (ClassCastException unused) {
            return false;
        }
    }

    public final int hashCode() {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = this.f31748g;
        int size = arrayList2.size();
        for (int i5 = 0; i5 < size; i5++) {
            arrayList.add(((Scope) arrayList2.get(i5)).f31805g);
        }
        Collections.sort(arrayList);
        int iHashCode = (arrayList.hashCode() + (1 * 31)) * 31;
        Account account = this.f31749h;
        int iHashCode2 = (iHashCode + (account == null ? 0 : account.hashCode())) * 31;
        String str = this.f31753l;
        int iHashCode3 = (((((((iHashCode2 + (str == null ? 0 : str.hashCode())) * 31) + (this.f31752k ? 1 : 0)) * 31) + (this.f31750i ? 1 : 0)) * 31) + (this.f31751j ? 1 : 0)) * 31;
        String str2 = this.o;
        return iHashCode3 + (str2 != null ? str2.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.i0(parcel, 1, 4);
        parcel.writeInt(this.f31747f);
        fg.a.g0(parcel, new ArrayList(this.f31748g), 2);
        fg.a.b0(parcel, 3, this.f31749h, i5);
        fg.a.i0(parcel, 4, 4);
        parcel.writeInt(this.f31750i ? 1 : 0);
        fg.a.i0(parcel, 5, 4);
        parcel.writeInt(this.f31751j ? 1 : 0);
        fg.a.i0(parcel, 6, 4);
        parcel.writeInt(this.f31752k ? 1 : 0);
        fg.a.c0(parcel, 7, this.f31753l);
        fg.a.c0(parcel, 8, this.f31754m);
        fg.a.g0(parcel, this.n, 9);
        fg.a.c0(parcel, 10, this.o);
        fg.a.k0(parcel, iJ0);
    }
}
