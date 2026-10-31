package br;

import android.os.Bundle;
import android.text.TextUtils;
import androidx.fragment.app.h0;
import androidx.fragment.app.h1;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import com.android.volley.AuthFailureError;
import com.instabridge.ai.consent.AiConsentDialog;
import io.e;
import io.sentry.clientreport.f;
import io.sentry.e3;
import io.sentry.z2;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import jb.d;
import jb.i;
import k0.h;
import ke.l;
import ke.s;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import m90.g;
import m90.z;
import org.json.JSONException;
import org.json.JSONObject;
import q.k;
import q.v;
import rg.j;
import sp.m0;
import tx.s2;
import y3.n;

/* loaded from: classes4.dex */
public final class a implements k6.b, f, h, l, m.c, j, v, r6.c, sp.a, u60.c {

    /* renamed from: b, reason: collision with root package name */
    public static a f18425b;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18426a;

    public /* synthetic */ a(int i5) {
        this.f18426a = i5;
    }

    public static void p(HttpURLConnection httpURLConnection, i iVar, byte[] bArr) throws IOException {
        httpURLConnection.setDoOutput(true);
        if (!httpURLConnection.getRequestProperties().containsKey("Content-Type")) {
            httpURLConnection.setRequestProperty("Content-Type", iVar.getBodyContentType());
        }
        DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
        dataOutputStream.write(bArr);
        dataOutputStream.close();
    }

    public static ArrayList q(Map map) {
        ArrayList arrayList = new ArrayList(map.size());
        for (Map.Entry entry : map.entrySet()) {
            if (entry.getKey() != null) {
                Iterator it = ((List) entry.getValue()).iterator();
                while (it.hasNext()) {
                    arrayList.add(new d((String) entry.getKey(), (String) it.next()));
                }
            }
        }
        return arrayList;
    }

    public static long r() {
        return System.currentTimeMillis();
    }

    public static z u(String str, boolean z11) {
        Intrinsics.g(str, "<this>");
        m90.j jVar = n90.c.f78034a;
        g gVar = new g();
        gVar.m0(str);
        return n90.c.d(gVar, z11);
    }

    public static z v(File file) {
        String str = z.f76176b;
        String string = file.toString();
        Intrinsics.f(string, "toString(...)");
        return u(string, false);
    }

    public static void x(HttpURLConnection httpURLConnection, i iVar) throws IOException, AuthFailureError {
        switch (iVar.getMethod()) {
            case -1:
                byte[] postBody = iVar.getPostBody();
                if (postBody != null) {
                    httpURLConnection.setRequestMethod("POST");
                    p(httpURLConnection, iVar, postBody);
                    return;
                }
                return;
            case 0:
                httpURLConnection.setRequestMethod("GET");
                return;
            case 1:
                httpURLConnection.setRequestMethod("POST");
                byte[] body = iVar.getBody();
                if (body != null) {
                    p(httpURLConnection, iVar, body);
                    return;
                }
                return;
            case 2:
                httpURLConnection.setRequestMethod("PUT");
                byte[] body2 = iVar.getBody();
                if (body2 != null) {
                    p(httpURLConnection, iVar, body2);
                    return;
                }
                return;
            case 3:
                httpURLConnection.setRequestMethod("DELETE");
                return;
            case 4:
                httpURLConnection.setRequestMethod("HEAD");
                return;
            case 5:
                httpURLConnection.setRequestMethod("OPTIONS");
                return;
            case 6:
                httpURLConnection.setRequestMethod("TRACE");
                return;
            case 7:
                httpURLConnection.setRequestMethod("PATCH");
                byte[] body3 = iVar.getBody();
                if (body3 != null) {
                    p(httpURLConnection, iVar, body3);
                    return;
                }
                return;
            default:
                throw new IllegalStateException("Unknown method type.");
        }
    }

    public static boolean y(h1 fragmentManager, boolean z11, boolean z12, String str, sx.d dVar, sx.d dVar2, s2 s2Var) {
        Object objA;
        Intrinsics.g(fragmentManager, "fragmentManager");
        if (!fo.d.j()) {
            return false;
        }
        if (!z11) {
            int i5 = e.f66523a[fo.d.a().getAiAccessDecision().ordinal()];
            if (i5 != 1) {
                if (i5 != 2) {
                    if (i5 == 3) {
                        return false;
                    }
                    throw new NoWhenBranchMatchedException();
                }
            } else if (!fo.d.a().getNeedsCategoryConsentPrompt()) {
                return false;
            }
        }
        if (fragmentManager.O()) {
            return false;
        }
        h0 h0VarE = fragmentManager.E("AiConsentDialog");
        AiConsentDialog aiConsentDialog = h0VarE instanceof AiConsentDialog ? (AiConsentDialog) h0VarE : null;
        if (aiConsentDialog != null) {
            if (dVar != null) {
                aiConsentDialog.f35488a.add(dVar);
            }
            if (dVar2 != null) {
                aiConsentDialog.f35489b.add(dVar2);
            }
            if (s2Var != null) {
                aiConsentDialog.f35490c.add(s2Var);
                return true;
            }
        } else {
            AiConsentDialog aiConsentDialog2 = AiConsentDialog.o;
            if (aiConsentDialog2 == null) {
                AiConsentDialog aiConsentDialog3 = new AiConsentDialog();
                aiConsentDialog3.f35493f = z11;
                aiConsentDialog3.f35494g = z12;
                Bundle bundle = new Bundle();
                bundle.putString("privacy_policy_url", str);
                bundle.putString("terms_of_service_url", "https://instabridge.com/terms-of-service/");
                aiConsentDialog3.setArguments(bundle);
                if (dVar != null) {
                    aiConsentDialog3.f35488a.add(dVar);
                }
                if (dVar2 != null) {
                    aiConsentDialog3.f35489b.add(dVar2);
                }
                if (s2Var != null) {
                    aiConsentDialog3.f35490c.add(s2Var);
                }
                AiConsentDialog.o = aiConsentDialog3;
                try {
                    int i11 = Result.f71687b;
                    aiConsentDialog3.show(fragmentManager, "AiConsentDialog");
                    objA = Boolean.TRUE;
                } catch (Throwable th2) {
                    int i12 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (Result.a(objA) != null) {
                    if (AiConsentDialog.o == aiConsentDialog3) {
                        AiConsentDialog.o = null;
                    }
                    objA = Boolean.FALSE;
                }
                return ((Boolean) objA).booleanValue();
            }
            if (dVar != null) {
                aiConsentDialog2.f35488a.add(dVar);
            }
            if (dVar2 != null) {
                aiConsentDialog2.f35489b.add(dVar2);
            }
            if (s2Var != null) {
                aiConsentDialog2.f35490c.add(s2Var);
            }
        }
        return true;
    }

    @Override // q.v
    public void b(k kVar, boolean z11) {
    }

    @Override // io.sentry.clientreport.f
    public void c(io.sentry.clientreport.d dVar, io.sentry.i iVar) {
    }

    @Override // u60.c
    public boolean d(u60.j jVar) {
        return !"class-name".equals(jVar.f90659a);
    }

    @Override // rg.j
    public /* synthetic */ void e(Object obj) {
    }

    @Override // r6.c
    public CharSequence f(Preference preference) {
        ListPreference listPreference = (ListPreference) preference;
        CharSequence[] charSequenceArr = listPreference.f14751m;
        int iL = listPreference.l(listPreference.o);
        if (TextUtils.isEmpty((iL < 0 || charSequenceArr == null) ? null : charSequenceArr[iL])) {
            return listPreference.f14769a.getString(2132018740);
        }
        int iL2 = listPreference.l(listPreference.o);
        if (iL2 < 0 || charSequenceArr == null) {
            return null;
        }
        return charSequenceArr[iL2];
    }

    @Override // io.sentry.clientreport.f
    public void g(io.sentry.clientreport.d dVar, io.sentry.i iVar, long j11) {
    }

    @Override // io.sentry.clientreport.f
    public void h(io.sentry.clientreport.d dVar, z2 z2Var) {
    }

    @Override // io.sentry.clientreport.f
    public void i(io.sentry.clientreport.d dVar, e3 e3Var) {
    }

    @Override // ke.l
    public void j(s sVar) {
        throw new UnsupportedOperationException();
    }

    @Override // k0.h
    public void k(y3.c cVar, int i5, int[] iArr, n nVar, int[] iArr2) {
        k0.k.c(i5, iArr, iArr2, false);
    }

    @Override // io.sentry.clientreport.f
    public e3 l(e3 e3Var) {
        return e3Var;
    }

    @Override // q.v
    public boolean m(k kVar) {
        return false;
    }

    @Override // sp.a
    public boolean n(m0 m0Var, int i5, String str) {
        if (i5 != 200) {
            m0.a("e111");
            return false;
        }
        try {
            if (new JSONObject(str).optString("status", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equalsIgnoreCase("ok")) {
                return true;
            }
            m0.a("e112");
            return false;
        } catch (JSONException unused) {
            int i11 = sp.e.f87574b;
            m0.a("e113");
            m0.a("e114");
            return false;
        }
    }

    @Override // ke.l
    public void o() {
        throw new UnsupportedOperationException();
    }

    @Override // ke.l
    public ke.v s(int i5, int i11) {
        throw new UnsupportedOperationException();
    }

    public com.android.volley.toolbox.a t(i iVar, Map map) throws Throwable {
        String url = iVar.getUrl();
        HashMap map2 = new HashMap();
        map2.putAll(map);
        map2.putAll(iVar.getHeaders());
        URL url2 = new URL(url);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url2.openConnection();
        httpURLConnection.setInstanceFollowRedirects(HttpURLConnection.getFollowRedirects());
        int timeoutMs = iVar.getTimeoutMs();
        httpURLConnection.setConnectTimeout(timeoutMs);
        httpURLConnection.setReadTimeout(timeoutMs);
        boolean z11 = false;
        httpURLConnection.setUseCaches(false);
        httpURLConnection.setDoInput(true);
        "https".equals(url2.getProtocol());
        try {
            for (String str : map2.keySet()) {
                httpURLConnection.setRequestProperty(str, (String) map2.get(str));
            }
            x(httpURLConnection, iVar);
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode == -1) {
                throw new IOException("Could not retrieve response code from HttpUrlConnection.");
            }
            if (iVar.getMethod() == 4 || ((100 <= responseCode && responseCode < 200) || responseCode == 204 || responseCode == 304)) {
                com.android.volley.toolbox.a aVar = new com.android.volley.toolbox.a(responseCode, q(httpURLConnection.getHeaderFields()), -1, null);
                httpURLConnection.disconnect();
                return aVar;
            }
            try {
                return new com.android.volley.toolbox.a(responseCode, q(httpURLConnection.getHeaderFields()), httpURLConnection.getContentLength(), new com.android.volley.toolbox.e(httpURLConnection));
            } catch (Throwable th2) {
                th = th2;
                z11 = true;
                if (!z11) {
                    httpURLConnection.disconnect();
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public String toString() {
        switch (this.f18426a) {
            case 12:
                return "AbsoluteArrangement#Right";
            default:
                return super.toString();
        }
    }

    public a(ni.v vVar) {
        this.f18426a = 27;
    }
}
