package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.os.Parcel;
import android.text.TextUtils;
import android.webkit.CookieSyncManager;
import androidx.work.impl.yX.VrhD;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.facebook.FacebookException;
import com.facebook.FacebookOperationCanceledException;
import com.facebook.FacebookServiceException;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class v98 extends ba7 {
    public final /* synthetic */ int c;
    public Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v98(int i, Parcel parcel) {
        super(parcel);
        this.c = i;
        switch (i) {
            case 1:
                super(parcel);
                break;
            default:
                this.d = h4.FACEBOOK_APPLICATION_WEB;
                break;
        }
    }

    @Override // defpackage.ba7
    public boolean h(int i, int i2, Intent intent) {
        String string;
        String string2;
        Object obj;
        switch (this.c) {
            case 0:
                m87 m87Var = d().g;
                if (intent == null) {
                    m(new o87(m87Var, n87.CANCEL, null, "Operation canceled", null));
                    return true;
                }
                if (i2 == 0) {
                    Bundle extras = intent.getExtras();
                    if (extras == null || (string = extras.getString("error")) == null) {
                        string = extras != null ? extras.getString("error_type") : null;
                    }
                    String string3 = (extras == null || (obj = extras.get("error_code")) == null) ? null : obj.toString();
                    if (!"CONNECTION_FAILURE".equals(string3)) {
                        m(new o87(m87Var, n87.CANCEL, null, string, null));
                        return true;
                    }
                    if (extras != null && (string2 = extras.getString("error_message")) != null) {
                        string = string2;
                    } else if (extras != null) {
                        string = extras.getString("error_description");
                    }
                    ArrayList arrayList = new ArrayList();
                    if (string != null) {
                        arrayList.add(string);
                    }
                    if (string != null) {
                        arrayList.add(string);
                    }
                    m(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList), string3));
                    return true;
                }
                if (i2 != -1) {
                    ArrayList arrayList2 = new ArrayList();
                    arrayList2.add("Unexpected resultCode from authorization.");
                    m(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList2), null));
                    return true;
                }
                Bundle extras2 = intent.getExtras();
                if (extras2 == null) {
                    ArrayList arrayList3 = new ArrayList();
                    arrayList3.add("Unexpected null from returned authorization data.");
                    m(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList3), null));
                    return true;
                }
                String string4 = extras2.getString("error");
                if (string4 == null) {
                    string4 = extras2.getString("error_type");
                }
                Object obj2 = extras2.get("error_code");
                string = obj2 != null ? obj2.toString() : null;
                String string5 = extras2.getString("error_message");
                if (string5 == null) {
                    string5 = extras2.getString("error_description");
                }
                String string6 = extras2.getString("e2e");
                if (!epe.J(string6)) {
                    g(string6);
                }
                if (string4 != null || string != null || string5 != null || m87Var == null) {
                    q(m87Var, string4, string5, string);
                    return true;
                }
                if (!extras2.containsKey("code") || epe.J(extras2.getString("code"))) {
                    r(m87Var, extras2);
                    return true;
                }
                f94.c().execute(new ss(this, m87Var, extras2, 15));
                return true;
            default:
                return super.h(i, i2, intent);
        }
    }

    public void l(m87 m87Var, Bundle bundle) {
        m87Var.getClass();
        ea7 ea7Var = m87Var.n;
        String strF = m87Var.e;
        if (strF == null || strF.length() == 0) {
            strF = f();
        }
        bundle.putString("redirect_uri", strF);
        ea7 ea7Var2 = ea7.INSTAGRAM;
        boolean z = ea7Var == ea7Var2;
        String str = m87Var.d;
        if (z) {
            bundle.putString("app_id", str);
        } else {
            bundle.putString("client_id", str);
        }
        bundle.putString("e2e", s42.W());
        if (ea7Var == ea7Var2) {
            bundle.putString("response_type", "token,signed_request,graph_domain,granted_scopes");
        } else {
            if (m87Var.b.contains("openid")) {
                bundle.putString("nonce", m87Var.q);
            }
            bundle.putString("response_type", "id_token,token,signed_request,graph_domain");
        }
        bundle.putString("code_challenge", m87Var.s);
        pp1 pp1Var = m87Var.t;
        bundle.putString("code_challenge_method", pp1Var != null ? pp1Var.name() : null);
        bundle.putString("return_scopes", "true");
        bundle.putString("auth_type", m87Var.j);
        bundle.putString("login_behavior", m87Var.a.name());
        f94 f94Var = f94.a;
        bundle.putString("sdk", "android-18.2.3");
        if (o() != null) {
            bundle.putString("sso", o());
        }
        bundle.putString("cct_prefetching", f94.n ? "1" : "0");
        if (m87Var.o) {
            bundle.putString("fx_app", ea7Var.toString());
        }
        if (m87Var.p) {
            bundle.putString("skip_dedupe", "true");
        }
        String str2 = m87Var.l;
        if (str2 != null) {
            bundle.putString("messenger_page_id", str2);
            bundle.putString("reset_messenger_state", m87Var.m ? "1" : "0");
        }
    }

    public void m(o87 o87Var) {
        if (o87Var != null) {
            d().d(o87Var);
        } else {
            d().j();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0080  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.os.Bundle n(defpackage.m87 r8) {
        /*
            r7 = this;
            r8.getClass()
            android.os.Bundle r0 = new android.os.Bundle
            r0.<init>()
            java.util.Set r1 = r8.b
            java.util.Collection r1 = (java.util.Collection) r1
            if (r1 == 0) goto L27
            boolean r1 = r1.isEmpty()
            if (r1 == 0) goto L15
            goto L27
        L15:
            java.util.Set r1 = r8.b
            java.lang.Iterable r1 = (java.lang.Iterable) r1
            java.lang.String r2 = ","
            java.lang.String r1 = android.text.TextUtils.join(r2, r1)
            java.lang.String r2 = "scope"
            r0.putString(r2, r1)
            r7.a(r2, r1)
        L27:
            dx2 r1 = r8.c
            if (r1 != 0) goto L2d
            dx2 r1 = defpackage.dx2.NONE
        L2d:
            java.lang.String r2 = "default_audience"
            java.lang.String r1 = r1.getNativeProtocolAudience()
            r0.putString(r2, r1)
            java.lang.String r8 = r8.g
            java.lang.String r8 = r7.c(r8)
            java.lang.String r1 = "state"
            r0.putString(r1, r8)
            java.util.Date r8 = defpackage.w3.l
            w3 r8 = defpackage.wgf.r()
            if (r8 == 0) goto L4c
            java.lang.String r8 = r8.e
            goto L4d
        L4c:
            r8 = 0
        L4d:
            java.lang.String r1 = "0"
            java.lang.String r2 = "1"
            java.lang.String r3 = "access_token"
            if (r8 == 0) goto L80
            p87 r4 = r7.d()
            m15 r4 = r4.e()
            if (r4 == 0) goto L60
            goto L64
        L60:
            android.content.Context r4 = defpackage.f94.a()
        L64:
            java.lang.String r5 = "com.facebook.login.AuthorizationClient.WebViewAuthHandler.TOKEN_STORE_KEY"
            r6 = 0
            android.content.SharedPreferences r4 = r4.getSharedPreferences(r5, r6)
            java.lang.String r5 = "TOKEN"
            java.lang.String r6 = ""
            java.lang.String r4 = r4.getString(r5, r6)
            boolean r4 = r8.equals(r4)
            if (r4 == 0) goto L80
            r0.putString(r3, r8)
            r7.a(r3, r2)
            goto L90
        L80:
            p87 r8 = r7.d()
            m15 r8 = r8.e()
            if (r8 == 0) goto L8d
            defpackage.epe.c(r8)
        L8d:
            r7.a(r3, r1)
        L90:
            long r7 = java.lang.System.currentTimeMillis()
            java.lang.String r7 = java.lang.String.valueOf(r7)
            java.lang.String r8 = "cbt"
            r0.putString(r8, r7)
            f94 r7 = defpackage.f94.a
            boolean r7 = defpackage.mme.c()
            if (r7 == 0) goto La6
            r1 = r2
        La6:
            java.lang.String r7 = "ies"
            r0.putString(r7, r1)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v98.n(m87):android.os.Bundle");
    }

    public String o() {
        return null;
    }

    public h4 p() {
        return (h4) this.d;
    }

    public void q(m87 m87Var, String str, String str2, String str3) {
        if (str != null && str.equals("logged_out")) {
            am2.j = true;
            m(null);
            return;
        }
        if (bu1.p0(d46.R("service_disabled", "AndroidAuthKillSwitchException"), str)) {
            m(null);
            return;
        }
        if (bu1.p0(d46.R("access_denied", "OAuthAccessDeniedException"), str)) {
            m(new o87(m87Var, n87.CANCEL, null, null, null));
            return;
        }
        ArrayList arrayList = new ArrayList();
        if (str != null) {
            arrayList.add(str);
        }
        if (str2 != null) {
            arrayList.add(str2);
        }
        m(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList), str3));
    }

    public void r(m87 m87Var, Bundle bundle) {
        try {
            m(new o87(m87Var, n87.SUCCESS, vv2.A(m87Var.b, bundle, p(), m87Var.d), vv2.B(m87Var.q, bundle), null, null));
        } catch (FacebookException e) {
            String message = e.getMessage();
            ArrayList arrayList = new ArrayList();
            if (message != null) {
                arrayList.add(message);
            }
            m(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList), null));
        }
    }

    public boolean t(Intent intent) {
        if (intent == null) {
            return false;
        }
        List<ResolveInfo> listQueryIntentActivities = f94.a().getPackageManager().queryIntentActivities(intent, ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        listQueryIntentActivities.getClass();
        if (listQueryIntentActivities.isEmpty()) {
            return false;
        }
        v97 v97Var = d().c;
        c1e c1eVar = null;
        if (!y30.C(v97Var)) {
            v97Var = null;
        }
        if (v97Var != null) {
            k7 k7Var = v97Var.p0;
            if (k7Var == null) {
                g76.g0("launcher");
                throw null;
            }
            k7Var.a(intent, null);
            c1eVar = c1e.a;
        }
        return c1eVar != null;
    }

    public void s(m87 m87Var, Bundle bundle, FacebookException facebookException) {
        String string;
        o87 o87Var;
        m87Var.getClass();
        p87 p87VarD = d();
        String strValueOf = null;
        this.d = null;
        String str = m87Var.e;
        if (str != null && str.length() != 0 && !str.equals(f())) {
            if (facebookException instanceof FacebookOperationCanceledException) {
                p87VarD.d(new o87(p87VarD.g, n87.CANCEL, null, "User canceled log in.", null));
                return;
            }
            if (facebookException != null) {
                this.d = null;
                String message = facebookException.getMessage();
                if (facebookException instanceof FacebookServiceException) {
                    b94 b94Var = ((FacebookServiceException) facebookException).b;
                    strValueOf = String.valueOf(b94Var.b);
                    message = b94Var.toString();
                }
                String str2 = strValueOf;
                m87 m87Var2 = p87VarD.g;
                ArrayList arrayList = new ArrayList();
                if (message != null) {
                    arrayList.add(message);
                }
                p87VarD.d(new o87(m87Var2, n87.ERROR, null, TextUtils.join(": ", arrayList), str2));
                return;
            }
            return;
        }
        if (bundle != null) {
            if (bundle.containsKey("e2e")) {
                this.d = bundle.getString("e2e");
            }
            try {
                w3 w3VarA = vv2.A(m87Var.b, bundle, p(), m87Var.d);
                o87Var = new o87(p87VarD.g, n87.SUCCESS, w3VarA, vv2.B(m87Var.q, bundle), null, null);
                if (p87VarD.e() != null) {
                    try {
                        CookieSyncManager.createInstance(p87VarD.e()).sync();
                    } catch (Exception unused) {
                    }
                    if (w3VarA != null) {
                        String str3 = w3VarA.e;
                        Context contextE = d().e();
                        if (contextE == null) {
                            contextE = f94.a();
                        }
                        contextE.getSharedPreferences("com.facebook.login.AuthorizationClient.WebViewAuthHandler.TOKEN_STORE_KEY", 0).edit().putString(VrhD.ZdKWzamHoLcvY, str3).apply();
                    }
                }
            } catch (FacebookException e) {
                m87 m87Var3 = p87VarD.g;
                String message2 = e.getMessage();
                ArrayList arrayList2 = new ArrayList();
                if (message2 != null) {
                    arrayList2.add(message2);
                }
                o87Var = new o87(m87Var3, n87.ERROR, null, TextUtils.join(": ", arrayList2), null);
            }
        } else if (facebookException instanceof FacebookOperationCanceledException) {
            o87Var = new o87(p87VarD.g, n87.CANCEL, null, "User canceled log in.", null);
        } else {
            this.d = null;
            if (facebookException != null) {
                string = facebookException.getMessage();
            } else {
                string = null;
            }
            if (facebookException instanceof FacebookServiceException) {
                b94 b94Var2 = ((FacebookServiceException) facebookException).b;
                strValueOf = String.valueOf(b94Var2.b);
                string = b94Var2.toString();
            }
            String str4 = strValueOf;
            m87 m87Var4 = p87VarD.g;
            ArrayList arrayList3 = new ArrayList();
            if (string != null) {
                arrayList3.add(string);
            }
            o87Var = new o87(m87Var4, n87.ERROR, null, TextUtils.join(": ", arrayList3), str4);
        }
        if (!epe.J((String) this.d)) {
            g((String) this.d);
        }
        p87VarD.d(o87Var);
    }

    public /* synthetic */ v98() {
        this.c = 1;
    }

    public v98(p87 p87Var) {
        this.c = 0;
        this.b = p87Var;
        this.d = h4.FACEBOOK_APPLICATION_WEB;
    }
}
