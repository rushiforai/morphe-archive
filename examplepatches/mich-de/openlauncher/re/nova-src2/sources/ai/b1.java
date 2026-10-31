package ai;

import android.app.BroadcastOptions;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b1 implements v2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12852a;

    /* renamed from: b, reason: collision with root package name */
    public final m1 f12853b;

    public /* synthetic */ b1(m1 m1Var, int i5) {
        this.f12852a = i5;
        this.f12853b = m1Var;
    }

    @Override // ai.v2
    public void a(int i5, Throwable th2, byte[] bArr) {
        int i11;
        o0 o0Var;
        o0 o0Var2;
        m1 m1Var = this.f12853b;
        o0 o0Var3 = m1Var.f13138f;
        if (i5 != 200 && i5 != 204) {
            i11 = Sdk.SDKError.Reason.AD_EXPIRED_VALUE;
            if (i5 != 304) {
                i11 = i5;
            }
            m1.l(o0Var3);
            o0Var3.f13193i.c(Integer.valueOf(i11), "Network Request for Deferred Deep Link failed. response, exception", th2);
        }
        i11 = i5;
        if (th2 == null) {
            z0 z0Var = m1Var.f13137e;
            m1.j(z0Var);
            z0Var.f13501t.d(true);
            if (bArr == null || bArr.length == 0) {
                m1.l(o0Var3);
                o0Var3.f13197m.a("Deferred Deep Link response empty.");
                return;
            }
            try {
                JSONObject jSONObject = new JSONObject(new String(bArr));
                String strOptString = jSONObject.optString("deeplink", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                if (TextUtils.isEmpty(strOptString)) {
                    m1.l(o0Var3);
                    o0Var3.f13197m.a("Deferred Deep Link is empty.");
                    return;
                }
                String strOptString2 = jSONObject.optString("gclid", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                String strOptString3 = jSONObject.optString("gbraid", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                String strOptString4 = jSONObject.optString("gad_source", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                double dOptDouble = jSONObject.optDouble("timestamp", 0.0d);
                Bundle bundle = new Bundle();
                p4 p4Var = m1Var.f13141i;
                m1.j(p4Var);
                m1 m1Var2 = (m1) p4Var.f13368a;
                if (TextUtils.isEmpty(strOptString)) {
                    o0Var2 = o0Var3;
                } else {
                    Context context = m1Var2.f13133a;
                    o0Var2 = o0Var3;
                    try {
                        List<ResolveInfo> listQueryIntentActivities = context.getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse(strOptString)), 0);
                        if (listQueryIntentActivities != null && !listQueryIntentActivities.isEmpty()) {
                            if (!TextUtils.isEmpty(strOptString3)) {
                                bundle.putString("gbraid", strOptString3);
                            }
                            if (!TextUtils.isEmpty(strOptString4)) {
                                bundle.putString("gad_source", strOptString4);
                            }
                            bundle.putString("gclid", strOptString2);
                            bundle.putString("_cis", "ddp");
                            m1Var.f13145m.K(TTConst.TRACK_TYPE_AUTO, "_cmp", bundle);
                            if (TextUtils.isEmpty(strOptString)) {
                                return;
                            }
                            try {
                                SharedPreferences.Editor editorEdit = context.getSharedPreferences("google.analytics.deferred.deeplink.prefs", 0).edit();
                                editorEdit.putString("deeplink", strOptString);
                                editorEdit.putLong("timestamp", Double.doubleToRawLongBits(dOptDouble));
                                if (editorEdit.commit()) {
                                    Intent intent = new Intent("android.google.analytics.action.DEEPLINK_ACTION");
                                    Context context2 = m1Var2.f13133a;
                                    if (Build.VERSION.SDK_INT < 34) {
                                        context2.sendBroadcast(intent);
                                        return;
                                    } else {
                                        context2.sendBroadcast(intent, null, BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
                                        return;
                                    }
                                }
                                return;
                            } catch (RuntimeException e3) {
                                o0 o0Var4 = ((m1) p4Var.f13368a).f13138f;
                                m1.l(o0Var4);
                                o0Var4.f13190f.b(e3, "Failed to persist Deferred Deep Link. exception");
                                return;
                            }
                        }
                    } catch (JSONException e11) {
                        e = e11;
                        o0Var = o0Var2;
                        m1.l(o0Var);
                        o0Var.f13190f.b(e, "Failed to parse the Deferred Deep Link response. exception");
                        return;
                    }
                }
                m1.l(o0Var2);
                o0Var = o0Var2;
                try {
                    o0Var.f13193i.d("Deferred Deep Link validation failed. gclid, gbraid, deep link", strOptString2, strOptString3, strOptString);
                    return;
                } catch (JSONException e12) {
                    e = e12;
                    m1.l(o0Var);
                    o0Var.f13190f.b(e, "Failed to parse the Deferred Deep Link response. exception");
                    return;
                }
            } catch (JSONException e13) {
                e = e13;
                o0Var = o0Var3;
            }
        }
        m1.l(o0Var3);
        o0Var3.f13193i.c(Integer.valueOf(i11), "Network Request for Deferred Deep Link failed. response, exception", th2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean b() {
        switch (this.f12852a) {
            case 0:
                m1 m1Var = this.f12853b;
                boolean z11 = false;
                try {
                    c3.a1 a1VarA = zg.b.a(m1Var.f13133a);
                    if (a1VarA == null) {
                        o0 o0Var = m1Var.f13138f;
                        m1.l(o0Var);
                        o0Var.n.a("Failed to get PackageManager for Install Referrer Play Store compatibility check");
                        m1Var = m1Var;
                    } else {
                        int i5 = a1VarA.c(128, "com.android.vending").versionCode;
                        m1Var = i5;
                        if (i5 >= 80837300) {
                            z11 = true;
                            m1Var = i5;
                        }
                    }
                } catch (Exception e3) {
                    o0 o0Var2 = m1Var.f13138f;
                    m1.l(o0Var2);
                    o0Var2.n.b(e3, "Failed to retrieve Play Store version for Install Referrer");
                }
                return z11;
            default:
                o0 o0Var3 = this.f12853b.f13138f;
                m1.l(o0Var3);
                return Log.isLoggable(o0Var3.N(), 3);
        }
    }

    public void c(String str, Bundle bundle) {
        String string;
        m1 m1Var = this.f12853b;
        k1 k1Var = m1Var.f13139g;
        z0 z0Var = m1Var.f13137e;
        m1.l(k1Var);
        k1Var.D();
        if (m1Var.f()) {
            return;
        }
        if (bundle.isEmpty()) {
            string = null;
        } else {
            Uri.Builder builder = new Uri.Builder();
            builder.path(str);
            for (String str2 : bundle.keySet()) {
                builder.appendQueryParameter(str2, bundle.getString(str2));
            }
            string = builder.build().toString();
        }
        if (TextUtils.isEmpty(string)) {
            return;
        }
        m1.j(z0Var);
        z0Var.f13504w.S(string);
        w0 w0Var = z0Var.f13505x;
        m1Var.f13143k.getClass();
        w0Var.g(System.currentTimeMillis());
    }

    public boolean d() {
        if (!e()) {
            return false;
        }
        m1 m1Var = this.f12853b;
        m1Var.f13143k.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        z0 z0Var = m1Var.f13137e;
        m1.j(z0Var);
        return jCurrentTimeMillis - z0Var.f13505x.f() > m1Var.f13136d.L(null, x.f13423i0);
    }

    public boolean e() {
        z0 z0Var = this.f12853b.f13137e;
        m1.j(z0Var);
        return z0Var.f13505x.f() > 0;
    }

    public b1(j4 j4Var) {
        this.f12852a = 0;
        this.f12853b = j4Var.f13050l;
    }

    public b1(e2 e2Var, m1 m1Var) {
        this.f12852a = 2;
        this.f12853b = m1Var;
    }
}
