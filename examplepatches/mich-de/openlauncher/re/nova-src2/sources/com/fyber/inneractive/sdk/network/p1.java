package com.fyber.inneractive.sdk.network;

import android.net.Uri;
import android.text.TextUtils;
import android.util.Pair;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.FilterInputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class p1 extends i implements h {

    /* renamed from: a, reason: collision with root package name */
    public final x80.e0 f28761a = new x80.e0(new x80.e0().a());

    public static HashMap b(x80.m0 m0Var) {
        HashMap map = new HashMap();
        if (m0Var != null) {
            x80.u uVar = m0Var.f95558f;
            for (int i5 = 0; i5 < uVar.size(); i5++) {
                String strC = uVar.c(i5);
                map.put(strC, Collections.singletonList(uVar.b(strC)));
            }
        }
        return map;
    }

    @Override // com.fyber.inneractive.sdk.network.h
    public final l a(t0 t0Var, String str, String str2) throws Exception {
        IAlog.a("%s okhttp network stack is in use", "OkHttpExecutorImpl");
        try {
            ArrayList arrayList = new ArrayList();
            arrayList.add(t0Var.r());
            Pair pairA = a(t0Var.r(), t0Var, arrayList, str, str2);
            Object obj = pairA.second;
            String str3 = obj != null ? ((x80.m0) obj).f95555c : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            FilterInputStream filterInputStreamA = a((x80.m0) obj);
            Object obj2 = pairA.second;
            int i5 = obj2 == null ? -1 : ((x80.m0) obj2).f95556d;
            HashMap mapB = b((x80.m0) obj2);
            x80.m0 m0Var = (x80.m0) pairA.second;
            o1 o1Var = new o1(i.a(filterInputStreamA, i5, str3, mapB, m0Var != null ? m0Var.f95558f.b("Last-Modified") : null), (x80.m0) pairA.second);
            Iterator it = ((List) pairA.first).iterator();
            while (it.hasNext()) {
                o1Var.f28738f.add((String) it.next());
            }
            return o1Var;
        } catch (b e3) {
            IAlog.b("%s cannot connect exception: %s", "OkHttpExecutorImpl", e3.getMessage());
            throw e3;
        } catch (Exception e11) {
            IAlog.b("%s exception: %s", "OkHttpExecutorImpl", e11.getMessage());
            throw e11;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0053  */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v14, types: [java.util.Iterator] */
    /* JADX WARN: Type inference failed for: r4v2, types: [java.util.regex.Pattern] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Pair a(String str, t0 t0Var, ArrayList arrayList, String str2, String str3) throws Exception {
        t0 t0Var2;
        Throwable th2;
        Exception exc;
        t0 t0Var3;
        int i5;
        l1 l1VarP = t0Var.p();
        x80.g0 g0Var = new x80.g0();
        ?? it = "gzip";
        a(g0Var, "Accept-Encoding", "gzip");
        a(g0Var, "User-Agent", str2);
        a(g0Var, "If-Modified-Since", str3);
        Map mapL = t0Var.l();
        if (mapL != null) {
            it = mapL.keySet().iterator();
            while (it.hasNext()) {
                String str4 = (String) it.next();
                a(g0Var, str4, (String) mapL.get(str4));
            }
        }
        g0Var.k(str);
        if (t0Var.m() != m0.POST) {
            t0Var2 = it;
            if (t0Var.m() == m0.PUT) {
                byte[] bArrF = t0Var.f();
                if (bArrF != null) {
                    String strN = t0Var.n();
                    ?? r42 = x80.a0.f95396e;
                    g0Var.h(x80.k0.create(bArrF, x80.z.b(strN)));
                    t0Var2 = r42;
                } else {
                    throw new Exception("Could not create ok http request. post payload is null");
                }
            }
        }
        x80.h0 h0VarB = g0Var.b();
        x80.d0 d0VarA = this.f28761a.a();
        boolean z11 = !(t0Var instanceof h1);
        d0VarA.f95439h = z11;
        d0VarA.f95440i = z11;
        long j11 = l1VarP.f28746a;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        d0VarA.c(j11, timeUnit);
        d0VarA.d(l1VarP.f28747b, timeUnit);
        x80.e0 e0Var = new x80.e0(d0VarA);
        t0Var.c(System.currentTimeMillis());
        IAlog.a("OkHttpExecutorImpl: start connection timestamp: %s", t0Var.f28783g);
        try {
            try {
                x80.m0 m0VarL = e0Var.c(h0VarB).l();
                try {
                    if (!(t0Var instanceof h1) || (((i5 = m0VarL.f95556d) <= 300 || i5 >= 304) && i5 != 307 && i5 != 308)) {
                        Pair pair = new Pair(arrayList, m0VarL);
                        t0Var.a(System.currentTimeMillis());
                        IAlog.a("OkHttpExecutorImpl: end connection timestamp: %s", t0Var.f28783g);
                        return pair;
                    }
                    String str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    String strB = m0VarL.f95558f.b("Location");
                    if (strB != null) {
                        str5 = strB;
                    }
                    if (!str5.startsWith("http")) {
                        try {
                            if (!str5.contains("://") && arrayList.size() > 0) {
                                Uri uri = Uri.parse((String) arrayList.get(arrayList.size() - 1));
                                str5 = String.format(str5.startsWith("/") ? "%s://%s%s" : "%s://%s/%s", uri.getScheme(), uri.getHost(), str5);
                            }
                        } catch (Exception e3) {
                            exc = e3;
                            throw new b(exc);
                        } catch (Throwable th3) {
                            th2 = th3;
                            t0Var3 = t0Var;
                            t0Var3.a(System.currentTimeMillis());
                            IAlog.a("OkHttpExecutorImpl: end connection timestamp: %s", t0Var3.f28783g);
                            throw th2;
                        }
                    }
                    String str6 = str5;
                    arrayList.add(str6);
                    if (arrayList.size() <= 5) {
                        Pair pairA = a(str6, t0Var, arrayList, str2, str3);
                        t0Var.a(System.currentTimeMillis());
                        IAlog.a("OkHttpExecutorImpl: end connection timestamp: %s", t0Var.f28783g);
                        return pairA;
                    }
                    throw new b("Url chain too big for us");
                } catch (Exception e11) {
                    e = e11;
                    exc = e;
                    throw new b(exc);
                }
            } catch (Throwable th4) {
                th = th4;
                th2 = th;
                t0Var3 = t0Var2;
                t0Var3.a(System.currentTimeMillis());
                IAlog.a("OkHttpExecutorImpl: end connection timestamp: %s", t0Var3.f28783g);
                throw th2;
            }
        } catch (Exception e12) {
            e = e12;
        } catch (Throwable th5) {
            th = th5;
            t0Var2 = t0Var;
            th2 = th;
            t0Var3 = t0Var2;
            t0Var3.a(System.currentTimeMillis());
            IAlog.a("OkHttpExecutorImpl: end connection timestamp: %s", t0Var3.f28783g);
            throw th2;
        }
    }

    public static FilterInputStream a(x80.m0 m0Var) {
        if (m0Var == null) {
            return null;
        }
        try {
            x80.p0 p0Var = m0Var.f95559g;
            if (p0Var == null) {
                return null;
            }
            return i.a(p0Var.byteStream(), TextUtils.equals("gzip", m0Var.f95558f.b("content-encoding")));
        } catch (Exception unused) {
            return null;
        }
    }

    public static void a(x80.g0 g0Var, String str, String str2) {
        IAlog.d("%s %s : %s", "REQUEST_HEADER", str, str2);
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        g0Var.a(str, str2);
    }
}
