package com.google.firebase.auth.internal;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.text.TextUtils;
import android.util.Log;
import com.drew.imaging.tiff.DJ.QntrFMZg;
import com.google.android.gms.common.api.Status;
import com.google.android.recaptcha.tqn.zghxFB;
import com.google.firebase.auth.FirebaseAuth;
import com.medium.android.admin.stagebranch.uG.peNPu;
import defpackage.d2f;
import defpackage.en7;
import defpackage.h8a;
import defpackage.hp7;
import defpackage.iq1;
import defpackage.jrg;
import defpackage.m15;
import defpackage.myf;
import defpackage.ok7;
import defpackage.onf;
import defpackage.pxf;
import defpackage.qyf;
import defpackage.rd6;
import defpackage.vp7;
import defpackage.xj4;
import defpackage.xof;
import defpackage.z46;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.UUID;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class RecaptchaActivity extends m15 implements onf {
    public static long g;
    public static final myf h = myf.c;
    public boolean f = false;

    @Override // defpackage.onf
    public final void b(Status status) {
        if (status == null) {
            p();
        } else {
            o(status);
        }
    }

    @Override // defpackage.onf
    public final Uri.Builder d(Intent intent, String str, String str2) throws JSONException {
        Uri.Builder builderAppendPath = new Uri.Builder().scheme("https").appendPath("__").appendPath("auth").appendPath("handler");
        String stringExtra = intent.getStringExtra("com.google.firebase.auth.KEY_API_KEY");
        String string = UUID.randomUUID().toString();
        String stringExtra2 = intent.getStringExtra("com.google.firebase.auth.internal.CLIENT_VERSION");
        String stringExtra3 = intent.getStringExtra("com.google.firebase.auth.internal.FIREBASE_APP_NAME");
        xj4 xj4VarE = xj4.e(stringExtra3);
        FirebaseAuth firebaseAuth = FirebaseAuth.getInstance(xj4VarE);
        z46 z46Var = z46.y;
        Context applicationContext = getApplicationContext();
        synchronized (z46Var) {
            vp7.n(str);
            vp7.n(string);
            SharedPreferences sharedPreferencesX = z46.x(applicationContext, str);
            z46.y(sharedPreferencesX);
            SharedPreferences.Editor editorEdit = sharedPreferencesX.edit();
            editorEdit.putString("com.google.firebase.auth.internal.EVENT_ID." + string + ".OPERATION", "com.google.firebase.auth.internal.ACTION_SHOW_RECAPTCHA");
            editorEdit.putString("com.google.firebase.auth.internal.EVENT_ID." + string + ".FIREBASE_APP_NAME", stringExtra3);
            editorEdit.apply();
        }
        String strZza = d2f.t0(getApplicationContext(), xj4VarE.f()).zza();
        String strK = null;
        if (TextUtils.isEmpty(strZza)) {
            Log.e("RecaptchaActivity", "Could not generate an encryption key for reCAPTCHA - cancelling flow.");
            o(hp7.K("Failed to generate/retrieve public encryption key for reCAPTCHA flow."));
            return null;
        }
        firebaseAuth.b();
        if (TextUtils.isEmpty(null)) {
            strK = ok7.K();
        } else {
            firebaseAuth.b();
        }
        builderAppendPath.appendQueryParameter("apiKey", stringExtra).appendQueryParameter("authType", "verifyApp").appendQueryParameter("apn", str).appendQueryParameter("hl", strK).appendQueryParameter("eventId", string).appendQueryParameter("v", "X" + stringExtra2).appendQueryParameter("eid", "p").appendQueryParameter("appName", stringExtra3).appendQueryParameter("sha1Cert", str2).appendQueryParameter("publicKey", strZza);
        return builderAppendPath;
    }

    @Override // defpackage.onf
    public final void e(Uri uri, String str, h8a h8aVar) {
        if (h8aVar.get() != null) {
            rd6.m();
            return;
        }
        jrg jrgVarX = vp7.x(uri);
        d2f d2fVar = new d2f(12);
        d2fVar.b = this;
        d2fVar.c = str;
        jrgVarX.a(d2fVar);
    }

    @Override // defpackage.onf
    public final HttpURLConnection f(URL url) {
        try {
            synchronized (pxf.class) {
            }
            return (HttpURLConnection) url.openConnection();
        } catch (IOException unused) {
            onf.j0.j("Error generating connection", new Object[0]);
            return null;
        }
    }

    public final void o(Status status) {
        g = 0L;
        this.f = false;
        Intent intent = new Intent();
        HashMap map = qyf.a;
        Parcel parcelObtain = Parcel.obtain();
        status.writeToParcel(parcelObtain, 0);
        byte[] bArrMarshall = parcelObtain.marshall();
        parcelObtain.recycle();
        intent.putExtra("com.google.firebase.auth.internal.STATUS", bArrMarshall);
        intent.setAction("com.google.firebase.auth.ACTION_RECEIVE_FIREBASE_AUTH_INTENT");
        iq1.C(this).O(intent);
        h.a(this);
        finish();
    }

    @Override // defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) throws IllegalAccessException, InvocationTargetException {
        QntrFMZg.GRGmEwDNJf.invoke(null, this, bundle);
    }

    @Override // defpackage.xy1, android.app.Activity
    public final void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
    }

    @Override // defpackage.m15, android.app.Activity
    public final void onResume() throws IllegalAccessException, InvocationTargetException {
        zghxFB.JgDyRJYNpKQ.invoke(null, this);
    }

    @Override // defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("com.google.firebase.auth.internal.KEY_ALREADY_STARTED_RECAPTCHA_FLOW", this.f);
    }

    public final void p() {
        g = 0L;
        this.f = false;
        Intent intent = new Intent();
        intent.putExtra("com.google.firebase.auth.internal.EXTRA_CANCELED", true);
        intent.setAction("com.google.firebase.auth.ACTION_RECEIVE_FIREBASE_AUTH_INTENT");
        iq1.C(this).O(intent);
        h.a(this);
        finish();
    }

    @Override // defpackage.onf
    public final String a(String str) {
        String strV = en7.V("firebear.identityToolkit");
        if (TextUtils.isEmpty(strV)) {
            return xof.c(str);
        }
        Log.e(peNPu.YTMTQt, "Found hermetic configuration for identityToolkit URL: " + strV);
        return strV;
    }
}
