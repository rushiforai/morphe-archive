package com.google.firebase.auth.internal;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.text.TextUtils;
import android.util.Log;
import com.drew.imaging.tiff.DJ.QntrFMZg;
import com.google.android.gms.common.api.Status;
import com.google.android.recaptcha.tqn.zghxFB;
import defpackage.d2f;
import defpackage.en7;
import defpackage.h8a;
import defpackage.hp7;
import defpackage.iq1;
import defpackage.jrg;
import defpackage.m15;
import defpackage.myf;
import defpackage.nwf;
import defpackage.onf;
import defpackage.pxf;
import defpackage.qyf;
import defpackage.rd6;
import defpackage.vp7;
import defpackage.xof;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class GenericIdpActivity extends m15 implements onf {
    public static long g;
    public static final myf h = myf.c;
    public boolean f = false;

    @Override // defpackage.onf
    public final String a(String str) {
        String strV = en7.V("firebear.identityToolkit");
        if (TextUtils.isEmpty(strV)) {
            return xof.c(str);
        }
        Log.e("GenericIdpActivity", "Found hermetic configuration for identityToolkit URL: " + strV);
        return strV;
    }

    @Override // defpackage.onf
    public final void b(Status status) {
        if (status == null) {
            p();
        } else {
            o(status);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x00c1, code lost:
    
        r13 = r13.toCharArray();
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00c5, code lost:
    
        if (r14 >= r11) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00c7, code lost:
    
        r15 = r13[r14];
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00c9, code lost:
    
        if (r15 < 'A') goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00cb, code lost:
    
        if (r15 > 'Z') goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00cd, code lost:
    
        r13[r14] = (char) (r15 ^ ' ');
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00d2, code lost:
    
        r14 = r14 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00d5, code lost:
    
        r13 = java.lang.String.valueOf(r13);
     */
    @Override // defpackage.onf
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.net.Uri.Builder d(android.content.Intent r19, java.lang.String r20, java.lang.String r21) throws org.json.JSONException {
        /*
            Method dump skipped, instruction units count: 545
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.firebase.auth.internal.GenericIdpActivity.d(android.content.Intent, java.lang.String, java.lang.String):android.net.Uri$Builder");
    }

    @Override // defpackage.onf
    public final void e(Uri uri, String str, h8a h8aVar) {
        if (h8aVar.get() != null) {
            rd6.m();
            return;
        }
        jrg jrgVarX = vp7.x(uri);
        d2f d2fVar = new d2f(11);
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
            Log.e("GenericIdpActivity", "Error generating URL connection");
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
        if (iq1.C(this).O(intent)) {
            h.a(this);
        } else {
            nwf.a(getApplicationContext(), status);
        }
        finish();
    }

    @Override // defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) throws IllegalAccessException, InvocationTargetException {
        zghxFB.LzpYBnwOblxI.invoke(null, this, bundle);
    }

    @Override // defpackage.xy1, android.app.Activity
    public final void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
    }

    @Override // defpackage.m15, android.app.Activity
    public final void onResume() throws IllegalAccessException, InvocationTargetException {
        QntrFMZg.KECoSLe.invoke(null, this);
    }

    @Override // defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("com.google.firebase.auth.internal.KEY_STARTED_SIGN_IN", this.f);
    }

    public final void p() {
        g = 0L;
        this.f = false;
        Intent intent = new Intent();
        intent.putExtra("com.google.firebase.auth.internal.EXTRA_CANCELED", true);
        intent.setAction("com.google.firebase.auth.ACTION_RECEIVE_FIREBASE_AUTH_INTENT");
        if (iq1.C(this).O(intent)) {
            h.a(this);
        } else {
            nwf.a(this, hp7.K("WEB_CONTEXT_CANCELED"));
        }
        finish();
    }
}
