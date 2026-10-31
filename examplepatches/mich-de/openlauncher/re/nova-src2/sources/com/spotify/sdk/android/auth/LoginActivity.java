package com.spotify.sdk.android.auth;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.internal.measurement.le;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Iterator;
import m.w;
import yp.a;

/* loaded from: classes4.dex */
public class LoginActivity extends Activity {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f42419b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final le f42420a;

    public LoginActivity() {
        le leVar = new le();
        ArrayList arrayList = new ArrayList();
        leVar.f32795d = arrayList;
        leVar.f32793b = this;
        arrayList.add(new a());
        arrayList.add(new zp.a());
        this.f42420a = leVar;
    }

    @Override // android.app.Activity
    public final void onActivityResult(int i5, int i11, Intent intent) {
        int i12;
        String str;
        String str2;
        String str3;
        String str4;
        String string;
        String string2;
        String str5;
        super.onActivityResult(i5, i11, intent);
        if (i5 == 1138) {
            int i13 = 3;
            String string3 = null;
            int i14 = 0;
            if (i11 == -2) {
                String stringExtra = intent == null ? "Invalid message format" : intent.getStringExtra("ERROR");
                if (stringExtra == null) {
                    stringExtra = "Unknown error";
                }
                str4 = stringExtra;
                i12 = 3;
                str = null;
                str2 = null;
                str3 = null;
            } else if (i11 == -1) {
                Bundle bundle = (Bundle) intent.getParcelableExtra("REPLY");
                if (bundle == null) {
                    str5 = "Missing response data";
                    string2 = null;
                    string = null;
                } else {
                    String string4 = bundle.getString("RESPONSE_TYPE", "unknown");
                    string = bundle.getString("STATE", null);
                    string4.getClass();
                    if (string4.equals(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE)) {
                        i13 = 1;
                        string2 = null;
                        string3 = bundle.getString("AUTHORIZATION_CODE");
                        str5 = null;
                    } else if (string4.equals("token")) {
                        string2 = bundle.getString("ACCESS_TOKEN");
                        i14 = bundle.getInt("EXPIRES_IN");
                        i13 = 2;
                        str5 = null;
                    } else {
                        i13 = 5;
                        str5 = null;
                        string2 = null;
                    }
                }
                str4 = str5;
                str2 = string2;
                str3 = string;
                i12 = i13;
                str = string3;
            } else {
                i12 = 4;
                str = null;
                str2 = null;
                str3 = null;
                str4 = null;
            }
            int i15 = i14;
            le leVar = this.f42420a;
            leVar.f32796e = this;
            leVar.e((xp.a) leVar.f32794c, new AuthorizationResponse(str, i12, str2, str3, i15, str4));
        }
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2131624069);
        Bundle bundleExtra = getIntent().getBundleExtra("EXTRA_AUTH_REQUEST");
        AuthorizationRequest authorizationRequest = bundleExtra == null ? null : (AuthorizationRequest) bundleExtra.getParcelable("request");
        le leVar = this.f42420a;
        leVar.f32796e = this;
        if (getCallingActivity() == null) {
            Log.e("com.spotify.sdk.android.auth.LoginActivity", "Can't use LoginActivity with a null caller. Possible reasons: calling activity has a singleInstance mode or LoginActivity is in a singleInstance/singleTask mode");
            finish();
            return;
        }
        if (authorizationRequest == null) {
            Log.e("com.spotify.sdk.android.auth.LoginActivity", "No authorization request");
            setResult(0);
            finish();
            return;
        }
        if (bundle == null) {
            authorizationRequest.b().toString();
            if (leVar.f32792a) {
                return;
            }
            leVar.f32792a = true;
            Iterator it = ((ArrayList) leVar.f32795d).iterator();
            while (it.hasNext()) {
                xp.a aVar = (xp.a) it.next();
                aVar.b(new w(25, leVar, aVar));
                if (aVar.a((LoginActivity) leVar.f32793b, authorizationRequest)) {
                    leVar.f32794c = aVar;
                    return;
                } else {
                    aVar.b(null);
                    aVar.stop();
                }
            }
        }
    }

    @Override // android.app.Activity
    public final void onDestroy() {
        le leVar = this.f42420a;
        if (leVar.f32792a) {
            leVar.f32792a = false;
            xp.a aVar = (xp.a) leVar.f32794c;
            if (aVar != null) {
                aVar.b(null);
                aVar.stop();
            }
            LoginActivity loginActivity = (LoginActivity) leVar.f32796e;
            if (loginActivity != null) {
                Log.w("com.spotify.sdk.android.auth.LoginActivity", "Spotify Auth cancelled due to LoginActivity being finished");
                loginActivity.setResult(0);
                leVar.f32796e = null;
            }
        }
        leVar.f32796e = null;
        super.onDestroy();
    }

    @Override // android.app.Activity
    public final void onNewIntent(Intent intent) throws NumberFormatException {
        AuthorizationResponse authorizationResponse;
        super.onNewIntent(intent);
        Uri data = intent.getData();
        int i5 = 0;
        if (data == null) {
            authorizationResponse = new AuthorizationResponse(null, 4, null, null, 0, null);
        } else {
            String queryParameter = data.getQueryParameter("error");
            if (queryParameter != null) {
                authorizationResponse = new AuthorizationResponse(null, 3, null, data.getQueryParameter("state"), 0, queryParameter);
            } else {
                String queryParameter2 = data.getQueryParameter(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE);
                if (queryParameter2 != null) {
                    authorizationResponse = new AuthorizationResponse(queryParameter2, 1, null, data.getQueryParameter("state"), 0, null);
                } else {
                    String encodedFragment = data.getEncodedFragment();
                    if (encodedFragment == null || encodedFragment.length() <= 0) {
                        authorizationResponse = new AuthorizationResponse(null, 5, null, null, 0, null);
                    } else {
                        String strDecode = null;
                        String strDecode2 = null;
                        String strDecode3 = null;
                        for (String str : encodedFragment.split("&")) {
                            String[] strArrSplit = str.split("=");
                            if (strArrSplit.length == 2) {
                                if (strArrSplit[0].startsWith("access_token")) {
                                    strDecode2 = Uri.decode(strArrSplit[1]);
                                }
                                if (strArrSplit[0].startsWith("state")) {
                                    strDecode3 = Uri.decode(strArrSplit[1]);
                                }
                                if (strArrSplit[0].startsWith("expires_in")) {
                                    strDecode = Uri.decode(strArrSplit[1]);
                                }
                            }
                        }
                        if (strDecode != null) {
                            try {
                                i5 = Integer.parseInt(strDecode);
                            } catch (NumberFormatException unused) {
                            }
                        }
                        authorizationResponse = new AuthorizationResponse(null, 2, strDecode2, strDecode3, i5, null);
                    }
                }
            }
        }
        le leVar = this.f42420a;
        leVar.e((xp.a) leVar.f32794c, authorizationResponse);
    }
}
