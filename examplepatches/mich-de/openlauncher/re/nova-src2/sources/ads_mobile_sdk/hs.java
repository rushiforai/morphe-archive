package ads_mobile_sdk;

import android.net.Uri;
import android.util.Base64;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewFeature;
import b.x7;
import c80.d;
import e1.e1;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.p0;
import t70.q0;

/* loaded from: classes.dex */
public final class hs extends b.h1 {

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f4496c;

    /* renamed from: d, reason: collision with root package name */
    public final x7 f4497d;

    /* renamed from: e, reason: collision with root package name */
    public final kz2 f4498e;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f4499f;

    /* renamed from: g, reason: collision with root package name */
    public final rw0 f4500g;

    /* renamed from: h, reason: collision with root package name */
    public final d f4501h;

    /* renamed from: i, reason: collision with root package name */
    public q0 f4502i;

    /* renamed from: j, reason: collision with root package name */
    public mg.l f4503j;

    /* renamed from: k, reason: collision with root package name */
    public t70.g2 f4504k;

    public hs(t70.j0 backgroundScope, x7 webviewCompatWrapper, kz2 rootTraceCreator, jr0 flags, rw0 gmaUtil) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(webviewCompatWrapper, "webviewCompatWrapper");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(gmaUtil, "gmaUtil");
        this.f4496c = backgroundScope;
        this.f4497d = webviewCompatWrapper;
        this.f4498e = rootTraceCreator;
        this.f4499f = flags;
        this.f4500g = gmaUtil;
        this.f4501h = new d();
    }

    public static final mg.l a(hs hsVar) {
        jn jnVar = jn.a$10;
        as asVar = as.f1073a;
        kz2 kz2Var = hsVar.f4498e;
        wv0 wv0Var = wv0.CUI_NAME_GET_WEBVIEW_VARIATIONS;
        EmptyList emptyList = EmptyList.f71733a;
        mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
            try {
                try {
                    hsVar.f4497d.getClass();
                    String variationsHeader = WebViewCompat.getVariationsHeader();
                    Intrinsics.f(variationsHeader, "getVariationsHeader(...)");
                    if (r70.k.U0(variationsHeader)) {
                        mu0.a(asVar);
                        em2VarA.close();
                        return null;
                    }
                    try {
                        yr yrVarA = yr.a(Base64.decode(variationsHeader, 0));
                        jr0 jr0Var = hsVar.f4499f;
                        jr0Var.getClass();
                        ht htVarA = ((Boolean) jr0Var.a("gads:parse_chrome_variations_client_header", Boolean.TRUE, jnVar)).booleanValue() ? ht.a(Base64.decode(variationsHeader, 2), nl0.b()) : null;
                        Intrinsics.d(yrVarA);
                        mg.l lVar = new mg.l(4, variationsHeader, yrVarA, htVarA);
                        mu0.a(new a3.e(lVar, 1));
                        hsVar.f4503j = lVar;
                        em2VarA.close();
                        return lVar;
                    } catch (Throwable th2) {
                        th3 th3VarA = ji3.a();
                        th3VarA.e().f1799m = false;
                        th3VarA.a(th2);
                        em2VarA.close();
                    }
                } catch (Exception e3) {
                    th3 th3VarA2 = ji3.a();
                    th3VarA2.e().f1799m = false;
                    th3VarA2.a(e3);
                    em2VarA.close();
                }
            } catch (Throwable th3) {
                try {
                    em2VarA.b(th3);
                    if (th3 instanceof b.a4) {
                        throw th3;
                    }
                    if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                        em2VarA.a(th3);
                    }
                    if (th3 instanceof TimeoutCancellationException) {
                        throw new lw0(th3);
                    }
                    if (th3 instanceof CancellationException) {
                        throw new du0(th3);
                    }
                    if (th3 instanceof dv0) {
                        throw th3;
                    }
                    throw new iu0(th3);
                } finally {
                }
            }
        } else {
            th3 th3VarA3 = ji3.a(wv0Var, emptyList, true);
            try {
                try {
                    hsVar.f4497d.getClass();
                    String variationsHeader2 = WebViewCompat.getVariationsHeader();
                    Intrinsics.f(variationsHeader2, "getVariationsHeader(...)");
                    if (r70.k.U0(variationsHeader2)) {
                        mu0.a(asVar);
                        th3VarA3.close();
                        return null;
                    }
                    try {
                        yr yrVarA2 = yr.a(Base64.decode(variationsHeader2, 0));
                        jr0 jr0Var2 = hsVar.f4499f;
                        jr0Var2.getClass();
                        ht htVarA2 = ((Boolean) jr0Var2.a("gads:parse_chrome_variations_client_header", Boolean.TRUE, jnVar)).booleanValue() ? ht.a(Base64.decode(variationsHeader2, 2), nl0.b()) : null;
                        Intrinsics.d(yrVarA2);
                        mg.l lVar2 = new mg.l(4, variationsHeader2, yrVarA2, htVarA2);
                        mu0.a(new a3.e(lVar2, 1));
                        hsVar.f4503j = lVar2;
                        th3VarA3.close();
                        return lVar2;
                    } catch (Throwable th4) {
                        th3 th3VarA4 = ji3.a();
                        th3VarA4.e().f1799m = false;
                        th3VarA4.a(th4);
                        th3VarA3.close();
                    }
                } catch (Exception e11) {
                    th3 th3VarA5 = ji3.a();
                    th3VarA5.e().f1799m = false;
                    th3VarA5.a(e11);
                    th3VarA3.close();
                }
            } catch (Throwable th5) {
                try {
                    th3VarA3.b(th5);
                    if (th5 instanceof b.a4) {
                        throw th5;
                    }
                    if (!(th5 instanceof TimeoutCancellationException) && !(th5 instanceof CancellationException)) {
                        th3VarA3.a(th5);
                    }
                    if (th5 instanceof TimeoutCancellationException) {
                        throw new lw0(th5);
                    }
                    if (th5 instanceof CancellationException) {
                        throw new du0(th5);
                    }
                    if (th5 instanceof dv0) {
                        throw th5;
                    }
                    throw new iu0(th5);
                } finally {
                }
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(hs hsVar, ContinuationImpl continuationImpl) {
        gs gsVar;
        if (continuationImpl instanceof gs) {
            gsVar = (gs) continuationImpl;
            int i5 = gsVar.f4046c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gsVar.f4046c = i5 - Integer.MIN_VALUE;
            } else {
                gsVar = new gs(hsVar, continuationImpl);
            }
        }
        Object obj = gsVar.f4044a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gsVar.f4046c;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = hsVar.f4499f;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:chrome_variations_initialization_task_enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                gsVar.f4046c = 1;
                if (a(hsVar, gsVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return new xu0(Unit.f71706a);
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        return b(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0079  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Map a(Uri uri) {
        mg.l lVar;
        String strA;
        Intrinsics.g(uri, "uri");
        jr0 jr0Var = this.f4499f;
        jr0Var.getClass();
        Continuation continuation = null;
        if (((Boolean) jr0Var.a("gads:parse_chrome_variations_client_header", Boolean.TRUE, jn.a$10)).booleanValue()) {
            rw0 rw0Var = this.f4500g;
            if (!rw0Var.c(uri) && !rw0Var.a(uri)) {
                if (rw0Var.b(uri)) {
                    String string = uri.toString();
                    jr0 jr0Var2 = rw0Var.f9333c;
                    jr0Var2.getClass();
                    List list = (List) jr0Var2.a("gads:ad_request_url_pattern_match", ul.b.P("^[^?]*(/mads/gma|/gampad/ads|/pagead/ads).*"), jn.a$20);
                    if (!(list instanceof Collection) || !list.isEmpty()) {
                        Iterator it = list.iterator();
                        while (it.hasNext()) {
                            Regex regex = new Regex((String) it.next());
                            Intrinsics.d(string);
                            if (regex.a(string)) {
                                lVar = this.f4503j;
                                if (lVar == null) {
                                }
                                if (lVar != null) {
                                    return a80.m.n((String) jr0Var.a("gads:client_data_header", "x-client-data", u.a$7), strA);
                                }
                            }
                        }
                    }
                }
            } else {
                lVar = this.f4503j;
                if (lVar == null) {
                    m0.t(this.f4496c, null, null, new ds(this, continuation, 1), 3);
                }
                if (lVar != null && (strA = lVar.a()) != null) {
                    return a80.m.n((String) jr0Var.a("gads:client_data_header", "x-client-data", u.a$7), strA);
                }
            }
        }
        return null;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(hs hsVar, ContinuationImpl continuationImpl) {
        cs csVar;
        d dVar;
        p0 p0VarA;
        if (continuationImpl instanceof cs) {
            csVar = (cs) continuationImpl;
            int i5 = csVar.f1986e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                csVar.f1986e = i5 - Integer.MIN_VALUE;
            } else {
                csVar = new cs(hsVar, continuationImpl);
            }
        }
        Object obj = csVar.f1984c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = csVar.f1986e;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                hsVar.f4497d.getClass();
                if (!WebViewFeature.a(WebViewFeature.GET_VARIATIONS_HEADER)) {
                    return null;
                }
                dVar = hsVar.f4501h;
                csVar.f1982a = hsVar;
                csVar.f1983b = dVar;
                csVar.f1986e = 1;
                if (dVar.e(csVar) != coroutineSingletons) {
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            d dVar2 = csVar.f1983b;
            hs hsVar2 = csVar.f1982a;
            ResultKt.b(obj);
            dVar = dVar2;
            hsVar = hsVar2;
            mg.l lVar = hsVar.f4503j;
            t70.j0 j0Var = hsVar.f4496c;
            if (lVar != null) {
                p0VarA = m0.a(lVar);
            } else {
                q0 q0VarE = hsVar.f4502i;
                if (q0VarE == null) {
                    es esVar = new es(hsVar, continuation, 0);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    q0VarE = m0.e(j0Var, context, new e1(esVar, null, 2), 2);
                    hsVar.f4502i = q0VarE;
                    jr0 jr0Var = hsVar.f4499f;
                    jr0Var.getClass();
                    if (((Boolean) jr0Var.a("gads:chrome_variations_refresh_enabled", Boolean.TRUE, jn.a$10)).booleanValue() && hsVar.f4504k == null) {
                        hsVar.f4504k = m0.t(j0Var, null, null, new ds(hsVar, continuation, 0), 3);
                    }
                }
                p0VarA = q0VarE;
            }
            dVar.g(null);
            csVar.f1982a = null;
            csVar.f1983b = null;
            csVar.f1986e = 2;
            Object objL = p0VarA.l(csVar);
            return objL == coroutineSingletons ? coroutineSingletons : objL;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
