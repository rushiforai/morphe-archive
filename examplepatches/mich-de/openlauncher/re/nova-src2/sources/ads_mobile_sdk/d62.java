package ads_mobile_sdk;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.text.TextUtils;
import android.webkit.WebView;
import b.n9;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import eg.t;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class d62 implements eg.m, eg.r, eg.g, t, ni.h0, b.l6 {

    /* renamed from: a, reason: collision with root package name */
    public static final d62 f2192a = new d62();
    public static final d62 a$1 = new d62();

    /* renamed from: b, reason: collision with root package name */
    public static final n9 f2193b = new n9();

    public d62(InternalNativeAd internalNativeAd) {
        Intrinsics.g(internalNativeAd, "internalNativeAd");
    }

    public static boolean a(com.google.gson.r rVar) {
        Intrinsics.g(rVar, "<this>");
        return rVar.v("isSuccessful").d();
    }

    public static Bundle b(com.google.gson.r rVar) {
        Intrinsics.g(rVar, "<this>");
        Bundle bundleC = c(rVar);
        return bundleC == null ? new Bundle() : bundleC;
    }

    public static Bundle c(com.google.gson.r rVar) {
        Intrinsics.g(rVar, "<this>");
        try {
            Bundle bundle = new Bundle();
            Iterator it = ((hn.m) rVar.f34795a.keySet()).iterator();
            while (((hn.l) it).hasNext()) {
                String str = (String) ((hn.l) it).b().f59928f;
                com.google.gson.p pVarV = rVar.v(str);
                pVarV.getClass();
                if (pVarV instanceof com.google.gson.s) {
                    com.google.gson.s sVarK = pVarV.k();
                    Intrinsics.d(str);
                    a(sVarK, bundle, str);
                } else if (pVarV instanceof com.google.gson.m) {
                    com.google.gson.m mVarH = pVarV.h();
                    Intrinsics.d(str);
                    a(mVarH, bundle, str);
                } else if (pVarV instanceof com.google.gson.r) {
                    bundle.putBundle(str, b(pVarV.j()));
                }
            }
            return bundle;
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.a(e3);
            ArrayList arrayList = th3VarA.e().f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList.add(message);
            return null;
        }
    }

    public static com.google.gson.m e(com.google.gson.r rVar, String key) {
        Intrinsics.g(key, "key");
        if (rVar == null) {
            return null;
        }
        try {
            return rVar.w(key);
        } catch (Exception unused) {
            return null;
        }
    }

    public static long g(com.google.gson.r rVar, String str) {
        if (rVar == null) {
            return 0L;
        }
        try {
            return rVar.v(str).l();
        } catch (Exception unused) {
            return 0L;
        }
    }

    @Override // b.l6
    public Object a(qw2 qw2Var) {
        throw null;
    }

    @Override // ni.h0
    public void getVideoLifecycleCallbacks() {
        synchronized (this) {
        }
    }

    public d62() {
    }

    @Override // b.l6
    public Object a(ni.k kVar) {
        kVar.getClass();
        return this;
    }

    @Override // b.l6
    public Object b(boolean z11) {
        return this;
    }

    public d62(db0 db0Var) {
    }

    @Override // b.l6
    public Object a(ni.q qVar) {
        qVar.getClass();
        return this;
    }

    @Override // b.l6
    public Object a(boolean z11) {
        return this;
    }

    public static String a(com.google.gson.r rVar, String str) {
        Intrinsics.g(rVar, "<this>");
        String strO = rVar.v(str).o();
        Intrinsics.f(strO, "getAsString(...)");
        return strO;
    }

    public static Bundle a(String str) {
        try {
            return c(p7.u.T(str).j());
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.a(e3);
            ArrayList arrayList = th3VarA.e().f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList.add(message);
            return null;
        }
    }

    public static com.google.gson.r a(com.google.gson.p pVar) {
        if (pVar == null) {
            return null;
        }
        try {
            return pVar.j();
        } catch (Exception unused) {
            return null;
        }
    }

    public static void a(com.google.gson.s sVar, Bundle bundle, String str) {
        Serializable serializable = sVar.f34796a;
        if (serializable instanceof Boolean) {
            bundle.putBoolean(str, sVar.d());
            return;
        }
        if (serializable instanceof Number) {
            Number numberN = sVar.n();
            int iIntValue = numberN.intValue();
            double dDoubleValue = numberN.doubleValue();
            if (iIntValue == dDoubleValue) {
                bundle.putInt(str, iIntValue);
                return;
            } else {
                bundle.putDouble(str, dDoubleValue);
                return;
            }
        }
        if (serializable instanceof String) {
            bundle.putString(str, sVar.o());
            return;
        }
        cz.b bVar = mu0.f7335a;
        mu0.c("Unexpected primitive json type: " + sVar, null);
    }

    public static boolean a(com.google.gson.r rVar, String str, boolean z11) {
        if (rVar != null) {
            try {
                return rVar.v(str).d();
            } catch (Exception unused) {
            }
        }
        return z11;
    }

    public static com.google.gson.r a(com.google.gson.m mVar, int i5) {
        if (mVar == null || i5 >= mVar.f34793a.size()) {
            return null;
        }
        try {
            return mVar.r(i5).j();
        } catch (Exception unused) {
            return null;
        }
    }

    public static void a(com.google.gson.m mVar, Bundle bundle, String str) {
        Object objO;
        ArrayList arrayList = mVar.f34793a;
        if (arrayList.isEmpty()) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Unable to parse empty JsonArray for key: ".concat(str), null);
            return;
        }
        com.google.gson.p pVar = (com.google.gson.p) b70.g.V0(mVar);
        pVar.getClass();
        int i5 = 0;
        if (pVar instanceof com.google.gson.r) {
            ArrayList arrayList2 = new ArrayList(b70.c.u0(mVar, 10));
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                arrayList2.add(b(((com.google.gson.p) it.next()).j()));
            }
            bundle.putParcelableArray(str, (Parcelable[]) arrayList2.toArray(new Bundle[0]));
            return;
        }
        if (pVar instanceof com.google.gson.s) {
            ArrayList arrayList3 = new ArrayList(b70.c.u0(mVar, 10));
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                com.google.gson.s sVarK = ((com.google.gson.p) it2.next()).k();
                Serializable serializable = sVarK.f34796a;
                if (serializable instanceof Boolean) {
                    objO = Boolean.valueOf(sVarK.d());
                } else if (serializable instanceof Number) {
                    Number numberN = sVarK.n();
                    int iIntValue = numberN.intValue();
                    double dDoubleValue = numberN.doubleValue();
                    if (iIntValue == dDoubleValue) {
                        objO = Integer.valueOf(iIntValue);
                    } else {
                        objO = Double.valueOf(dDoubleValue);
                    }
                } else if (serializable instanceof String) {
                    objO = sVarK.o();
                } else {
                    cz.b bVar2 = mu0.f7335a;
                    mu0.c("Unexpected primitive json type: " + sVarK, null);
                    objO = null;
                }
                Intrinsics.d(objO);
                arrayList3.add(objO);
            }
            if (b70.g.W0(arrayList3) instanceof String) {
                ArrayList arrayList4 = new ArrayList(b70.c.u0(arrayList3, 10));
                Iterator it3 = arrayList3.iterator();
                while (it3.hasNext()) {
                    arrayList4.add(it3.next().toString());
                }
                bundle.putStringArray(str, (String[]) arrayList4.toArray(new String[0]));
                return;
            }
            if (b70.g.W0(arrayList3) instanceof Integer) {
                int size = arrayList3.size();
                int[] iArr = new int[size];
                while (i5 < size) {
                    Object obj = arrayList3.get(i5);
                    Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Int");
                    iArr[i5] = ((Integer) obj).intValue();
                    i5++;
                }
                bundle.putIntArray(str, iArr);
                return;
            }
            if (b70.g.W0(arrayList3) instanceof Double) {
                int size2 = arrayList3.size();
                double[] dArr = new double[size2];
                while (i5 < size2) {
                    Object obj2 = arrayList3.get(i5);
                    Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.Double");
                    dArr[i5] = ((Double) obj2).doubleValue();
                    i5++;
                }
                bundle.putDoubleArray(str, dArr);
                return;
            }
            if (b70.g.W0(arrayList3) instanceof Boolean) {
                int size3 = arrayList3.size();
                boolean[] zArr = new boolean[size3];
                while (i5 < size3) {
                    Object obj3 = arrayList3.get(i5);
                    Intrinsics.e(obj3, "null cannot be cast to non-null type kotlin.Boolean");
                    zArr[i5] = ((Boolean) obj3).booleanValue();
                    i5++;
                }
                bundle.putBooleanArray(str, zArr);
                return;
            }
            cz.b bVar3 = mu0.f7335a;
            mu0.c("Unable to parse array element type: " + b70.g.W0(arrayList3), null);
            return;
        }
        cz.b bVar4 = mu0.f7335a;
        mu0.c("Unable to parse array element type: " + pVar, null);
    }

    public void a(WebView webView, String str, Object... objArr) {
        if (webView != null) {
            StringBuilder sb2 = new StringBuilder(128);
            sb2.append("if(window.omidBridge!==undefined){omidBridge.");
            sb2.append(str);
            sb2.append("(");
            if (objArr.length > 0) {
                for (Object obj : objArr) {
                    if (obj == null) {
                        sb2.append(AbstractJsonLexerKt.NULL);
                    } else if (obj instanceof String) {
                        String string = obj.toString();
                        if (string.startsWith("{")) {
                            sb2.append(string);
                        } else {
                            sb2.append(AbstractJsonLexerKt.STRING);
                            sb2.append(string);
                            sb2.append(AbstractJsonLexerKt.STRING);
                        }
                    } else {
                        sb2.append(obj);
                    }
                    sb2.append(",");
                }
                sb2.setLength(sb2.length() - 1);
            }
            sb2.append(")}");
            String string2 = sb2.toString();
            Handler handler = webView.getHandler();
            if (handler == null) {
                handler = new Handler(Looper.getMainLooper());
            }
            if (Looper.myLooper() == handler.getLooper()) {
                a(webView, string2);
            } else {
                handler.post(new ab.y(1, this, webView, string2));
            }
        }
    }

    public static int a(com.google.gson.r rVar, String str, int i5) {
        if (rVar != null) {
            try {
                return rVar.v(str).g();
            } catch (Exception unused) {
            }
        }
        return i5;
    }

    public static com.google.gson.r a(com.google.gson.r rVar, String key, com.google.gson.r rVar2) {
        Intrinsics.g(key, "key");
        if (rVar == null) {
            return rVar2;
        }
        try {
            return rVar.x(key);
        } catch (Exception unused) {
            return rVar2;
        }
    }

    public static void a(WebView webView, String str) {
        if (webView == null || TextUtils.isEmpty(str)) {
            return;
        }
        try {
            try {
                webView.evaluateJavascript(str, null);
            } catch (IllegalStateException unused) {
                webView.loadUrl("javascript: " + str);
            }
        } catch (Exception e3) {
            e3.getMessage();
        }
    }

    public static String a(com.google.gson.r rVar, String str, String str2) {
        if (rVar != null) {
            try {
                String strO = rVar.v(str).o();
                Intrinsics.f(strO, "getAsString(...)");
                return strO;
            } catch (Exception unused) {
            }
        }
        return str2;
    }
}
