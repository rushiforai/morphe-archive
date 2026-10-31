package mg;

import ai.r2;
import android.accounts.Account;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.text.TextUtils;
import b.c0;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.Scope;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import sg.w;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: c, reason: collision with root package name */
    public static final ReentrantLock f76277c = new ReentrantLock();

    /* renamed from: d, reason: collision with root package name */
    public static a f76278d;

    /* renamed from: a, reason: collision with root package name */
    public final ReentrantLock f76279a = new ReentrantLock();

    /* renamed from: b, reason: collision with root package name */
    public final SharedPreferences f76280b;

    public a(Context context) {
        this.f76280b = context.getSharedPreferences("com.google.android.gms.signin", 0);
    }

    public static a a(Context context) {
        w.h(context);
        ReentrantLock reentrantLock = f76277c;
        reentrantLock.lock();
        try {
            if (f76278d == null) {
                f76278d = new a(context.getApplicationContext());
            }
            a aVar = f76278d;
            reentrantLock.unlock();
            return aVar;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public static final String f(String str, String str2) {
        return c0.r(new StringBuilder(str.length() + 1 + String.valueOf(str2).length()), str, ":", str2);
    }

    public final GoogleSignInAccount b() {
        String strE;
        String strE2 = e("defaultGoogleSignInAccount");
        if (!TextUtils.isEmpty(strE2) && (strE = e(f("googleSignInAccount", strE2))) != null) {
            try {
                return GoogleSignInAccount.b(strE);
            } catch (JSONException unused) {
            }
        }
        return null;
    }

    public final void c(GoogleSignInAccount googleSignInAccount, GoogleSignInOptions googleSignInOptions) throws JSONException {
        w.h(googleSignInAccount);
        w.h(googleSignInOptions);
        String str = googleSignInAccount.f31738m;
        d("defaultGoogleSignInAccount", str);
        String strF = f("googleSignInAccount", str);
        JSONObject jSONObject = new JSONObject();
        try {
            String str2 = googleSignInAccount.f31731f;
            if (str2 != null) {
                jSONObject.put("id", str2);
            }
            String str3 = googleSignInAccount.f31732g;
            if (str3 != null) {
                jSONObject.put("tokenId", str3);
            }
            String str4 = googleSignInAccount.f31733h;
            if (str4 != null) {
                jSONObject.put(ActionCategory.EMAIL, str4);
            }
            String str5 = googleSignInAccount.f31734i;
            if (str5 != null) {
                jSONObject.put("displayName", str5);
            }
            String str6 = googleSignInAccount.o;
            if (str6 != null) {
                jSONObject.put("givenName", str6);
            }
            String str7 = googleSignInAccount.f31739p;
            if (str7 != null) {
                jSONObject.put("familyName", str7);
            }
            Uri uri = googleSignInAccount.f31735j;
            if (uri != null) {
                jSONObject.put("photoUrl", uri.toString());
            }
            String str8 = googleSignInAccount.f31736k;
            if (str8 != null) {
                jSONObject.put("serverAuthCode", str8);
            }
            jSONObject.put("expirationTime", googleSignInAccount.f31737l);
            jSONObject.put("obfuscatedIdentifier", str);
            JSONArray jSONArray = new JSONArray();
            List list = googleSignInAccount.n;
            Scope[] scopeArr = (Scope[]) list.toArray(new Scope[list.size()]);
            Arrays.sort(scopeArr, r2.f13280c);
            for (Scope scope : scopeArr) {
                jSONArray.put(scope.f31805g);
            }
            jSONObject.put("grantedScopes", jSONArray);
            jSONObject.remove("serverAuthCode");
            d(strF, jSONObject.toString());
            String strF2 = f("googleSignInOptions", str);
            String str9 = googleSignInOptions.f31754m;
            String str10 = googleSignInOptions.f31753l;
            JSONObject jSONObject2 = new JSONObject();
            try {
                JSONArray jSONArray2 = new JSONArray();
                ArrayList arrayList = googleSignInOptions.f31748g;
                Collections.sort(arrayList, GoogleSignInOptions.f31746u);
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    jSONArray2.put(((Scope) it.next()).f31805g);
                }
                jSONObject2.put("scopes", jSONArray2);
                Account account = googleSignInOptions.f31749h;
                if (account != null) {
                    jSONObject2.put("accountName", account.name);
                }
                jSONObject2.put("idTokenRequested", googleSignInOptions.f31750i);
                jSONObject2.put("forceCodeForRefreshToken", googleSignInOptions.f31752k);
                jSONObject2.put("serverAuthRequested", googleSignInOptions.f31751j);
                if (!TextUtils.isEmpty(str10)) {
                    jSONObject2.put("serverClientId", str10);
                }
                if (!TextUtils.isEmpty(str9)) {
                    jSONObject2.put("hostedDomain", str9);
                }
                d(strF2, jSONObject2.toString());
            } catch (JSONException e3) {
                throw new RuntimeException(e3);
            }
        } catch (JSONException e11) {
            throw new RuntimeException(e11);
        }
    }

    public final void d(String str, String str2) {
        ReentrantLock reentrantLock = this.f76279a;
        reentrantLock.lock();
        try {
            this.f76280b.edit().putString(str, str2).apply();
        } finally {
            reentrantLock.unlock();
        }
    }

    public final String e(String str) {
        ReentrantLock reentrantLock = this.f76279a;
        reentrantLock.lock();
        try {
            return this.f76280b.getString(str, null);
        } finally {
            reentrantLock.unlock();
        }
    }
}
