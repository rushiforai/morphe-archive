package ads_mobile_sdk;

import android.os.SystemClock;
import b.e6;
import b.ed;
import b.f9;
import b.o2;
import com.google.gson.Gson;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.optionals.OptionalsKt;
import kotlin.text.Charsets;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.p0;

/* loaded from: classes.dex */
public final class y22 {

    /* renamed from: a, reason: collision with root package name */
    public final zj1 f11925a;

    /* renamed from: b, reason: collision with root package name */
    public final fz f11926b;

    /* renamed from: c, reason: collision with root package name */
    public final e6 f11927c;

    /* renamed from: d, reason: collision with root package name */
    public final b.y3 f11928d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f11929e;

    /* renamed from: f, reason: collision with root package name */
    public final o2 f11930f;

    /* renamed from: g, reason: collision with root package name */
    public final Gson f11931g;

    /* renamed from: h, reason: collision with root package name */
    public final f9 f11932h;

    /* renamed from: i, reason: collision with root package name */
    public final Optional f11933i;

    public y22(zj1 javascriptEngine, fz consentManager, e6 httpClient, b.y3 userAgentProvider, jr0 flags, o2 clock, Gson gson, f9 internalAdRequestEventEmitter, Optional isPersistentCacheFillRequest) {
        Intrinsics.g(javascriptEngine, "javascriptEngine");
        Intrinsics.g(consentManager, "consentManager");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(internalAdRequestEventEmitter, "internalAdRequestEventEmitter");
        Intrinsics.g(isPersistentCacheFillRequest, "isPersistentCacheFillRequest");
        this.f11925a = javascriptEngine;
        this.f11926b = consentManager;
        this.f11927c = httpClient;
        this.f11928d = userAgentProvider;
        this.f11929e = flags;
        this.f11930f = clock;
        this.f11931g = gson;
        this.f11932h = internalAdRequestEventEmitter;
        this.f11933i = isPersistentCacheFillRequest;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x025e A[Catch: all -> 0x0238, TRY_LEAVE, TryCatch #6 {all -> 0x0238, blocks: (B:85:0x0225, B:87:0x022c, B:89:0x0230, B:91:0x0234, B:94:0x023b, B:96:0x023f, B:98:0x0243, B:100:0x0247, B:101:0x0248, B:102:0x024d, B:103:0x024e, B:104:0x0255, B:105:0x0256, B:106:0x025d, B:107:0x025e), top: B:155:0x0225 }] */
    /* JADX WARN: Removed duplicated region for block: B:120:0x028a A[Catch: all -> 0x0296, TryCatch #5 {all -> 0x0296, blocks: (B:118:0x0283, B:120:0x028a, B:122:0x028e, B:124:0x0292, B:127:0x0299, B:129:0x029d, B:131:0x02a1, B:133:0x02a5, B:134:0x02a6, B:135:0x02ab, B:136:0x02ac, B:137:0x02b3, B:138:0x02b4, B:139:0x02bb, B:140:0x02bc), top: B:154:0x0283 }] */
    /* JADX WARN: Removed duplicated region for block: B:140:0x02bc A[Catch: all -> 0x0296, TRY_LEAVE, TryCatch #5 {all -> 0x0296, blocks: (B:118:0x0283, B:120:0x028a, B:122:0x028e, B:124:0x0292, B:127:0x0299, B:129:0x029d, B:131:0x02a1, B:133:0x02a5, B:134:0x02a6, B:135:0x02ab, B:136:0x02ac, B:137:0x02b3, B:138:0x02b4, B:139:0x02bb, B:140:0x02bc), top: B:154:0x0283 }] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00a2 A[Catch: all -> 0x0061, TRY_LEAVE, TryCatch #2 {all -> 0x0061, blocks: (B:20:0x005d, B:29:0x009c, B:31:0x00a2, B:34:0x00ab), top: B:149:0x005d }] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00ab A[Catch: all -> 0x0061, TRY_ENTER, TRY_LEAVE, TryCatch #2 {all -> 0x0061, blocks: (B:20:0x005d, B:29:0x009c, B:31:0x00a2, B:34:0x00ab), top: B:149:0x005d }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01be A[Catch: all -> 0x0042, TRY_LEAVE, TryCatch #3 {all -> 0x0042, blocks: (B:13:0x003d, B:60:0x01b8, B:62:0x01be), top: B:150:0x003d }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01cd  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01d4  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x022c A[Catch: all -> 0x0238, TryCatch #6 {all -> 0x0238, blocks: (B:85:0x0225, B:87:0x022c, B:89:0x0230, B:91:0x0234, B:94:0x023b, B:96:0x023f, B:98:0x0243, B:100:0x0247, B:101:0x0248, B:102:0x024d, B:103:0x024e, B:104:0x0255, B:105:0x0256, B:106:0x025d, B:107:0x025e), top: B:155:0x0225 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ti.p pVar, fq fqVar, ContinuationImpl continuationImpl) {
        w22 w22Var;
        long jH;
        th3 th3VarA;
        th3 th3Var;
        y22 y22Var;
        ti.p pVar2;
        th3 th3Var2;
        b.a1 a1Var;
        String strA;
        th3 th3VarA2;
        a21 a21Var;
        y22 y22Var2;
        b.a1 a1Var2;
        b.a1 qu0Var;
        fq fqVar2 = fqVar;
        if (continuationImpl instanceof w22) {
            w22Var = (w22) continuationImpl;
            int i5 = w22Var.f11021i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                w22Var.f11021i = i5 - Integer.MIN_VALUE;
            } else {
                w22Var = new w22(this, continuationImpl);
            }
        }
        Object obj = w22Var.f11019g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = w22Var.f11021i;
        if (i11 == 0) {
            ResultKt.b(obj);
            Duration.Companion companion = Duration.f72038b;
            this.f11930f.getClass();
            jH = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
            th3VarA = ji3.a(wv0.CUI_NAME_ADREQUEST_REQUEST, EmptyList.f71733a, true);
            try {
                w22Var.f11013a = this;
                w22Var.f11014b = pVar;
                w22Var.f11015c = fqVar2;
                w22Var.f11016d = th3VarA;
                w22Var.f11017e = th3VarA;
                w22Var.f11018f = jH;
                w22Var.f11021i = 1;
                Object objA = a(fqVar2, w22Var);
                if (objA != coroutineSingletons) {
                    y22Var = this;
                    pVar2 = pVar;
                    obj = objA;
                    a1Var = (b.a1) obj;
                    if (!(a1Var instanceof pu0)) {
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th2) {
                th = th2;
                th3Var = th3VarA;
                th3Var.b(th);
                if (!(th instanceof b.a4)) {
                    throw th;
                }
                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                    th3Var.a(th);
                }
                if (th instanceof TimeoutCancellationException) {
                    throw new lw0(th);
                }
                if (th instanceof CancellationException) {
                    throw new du0(th);
                }
                if (th instanceof dv0) {
                    throw th;
                }
                throw new iu0(th);
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var2 = w22Var.f11016d;
            th3VarA2 = (th3) w22Var.f11015c;
            a21Var = (a21) w22Var.f11014b;
            y22Var2 = w22Var.f11013a;
            try {
                ResultKt.b(obj);
                a1Var2 = (b.a1) obj;
                if (a1Var2 instanceof pu0) {
                    zi3.a((pu0) a1Var2, false);
                }
                CloseableKt.a(th3Var2, null);
                if (!(a1Var2 instanceof pu0)) {
                    pu0 pu0Var = (pu0) a1Var2;
                    zi3.a(pu0Var, false);
                    return pu0Var;
                }
                Intrinsics.e(a1Var2, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                com.google.gson.r json = (com.google.gson.r) ((xu0) a1Var2).f11834b;
                p0 p0Var = a21Var.f813e;
                Intrinsics.g(json, "json");
                try {
                    qu0Var = new xu0(new s5.b(3, json, p0Var).invoke());
                } catch (Exception e3) {
                    qu0Var = new qu0(e3, null, null, 6);
                }
                if (qu0Var instanceof pu0) {
                    return (pu0) qu0Var;
                }
                z23 z23Var = (z23) ((xu0) qu0Var).f11834b;
                Boolean bool = (Boolean) OptionalsKt.b(y22Var2.f11933i);
                if (bool != null && bool.booleanValue()) {
                    z23Var.f12430d = json;
                }
                return new xu0(z23Var);
            } catch (Throwable th3) {
                th = th3;
                try {
                    th3VarA2.b(th);
                    if (!(th instanceof b.a4)) {
                        throw th;
                    }
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        th3VarA2.a(th);
                    }
                    if (th instanceof TimeoutCancellationException) {
                        throw new lw0(th);
                    }
                    if (th instanceof CancellationException) {
                        throw new du0(th);
                    }
                    if (th instanceof dv0) {
                        throw th;
                    }
                    throw new iu0(th);
                } catch (Throwable th4) {
                    try {
                        throw th4;
                    } finally {
                    }
                }
            }
        }
        jH = w22Var.f11018f;
        th3VarA = w22Var.f11017e;
        th3Var = w22Var.f11016d;
        fqVar2 = (fq) w22Var.f11015c;
        pVar2 = (ti.p) w22Var.f11014b;
        y22Var = w22Var.f11013a;
        try {
            ResultKt.b(obj);
            a1Var = (b.a1) obj;
            if (!(a1Var instanceof pu0)) {
                pu0 pu0Var2 = (pu0) a1Var;
                zi3.a(pu0Var2, false);
                CloseableKt.a(th3VarA, null);
                return pu0Var2;
            }
            Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
            a21 a21Var2 = (a21) ((xu0) a1Var).f11834b;
            CloseableKt.a(th3VarA, null);
            Duration.Companion companion2 = Duration.f72038b;
            y22Var.f11930f.getClass();
            long jL = Duration.l(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), jH);
            ww2 ww2Var = a21Var2.f812d;
            if (ww2Var == null && a21Var2.f813e == null) {
                return new tu0("HTTP response body is null", wd1.f11213a);
            }
            if (ww2Var != null) {
                try {
                    strA = ww2.a(ww2Var);
                } catch (InterruptedException e11) {
                    Thread.currentThread().interrupt();
                    CancellationException cancellationException = new CancellationException("Thread interrupted while processing HTTP response body.");
                    cancellationException.initCause(e11);
                    throw cancellationException;
                } catch (Exception e12) {
                    return new qu0(e12, wd1.f11217e, null, 4);
                }
            } else {
                strA = "<html><body></body></html>";
            }
            com.google.gson.r rVar = new com.google.gson.r();
            com.google.gson.r rVar2 = new com.google.gson.r();
            com.google.gson.r rVar3 = new com.google.gson.r();
            rVar2.s("ad_request_url", fqVar2.f3461e);
            rVar2.s("ad_request_post_body", fqVar2.f3459c);
            rVar2.s("base_url", fqVar2.f3458b);
            rVar2.p("signals", y22Var.f11931g.toJsonTree(pVar2).j());
            rVar3.s("body", strA);
            rVar3.q(Integer.valueOf(a21Var2.f809a), "response_code");
            rVar3.q(Long.valueOf(Duration.h(jL)), "latency");
            com.google.gson.r rVar4 = new com.google.gson.r();
            for (Map.Entry entry : a21Var2.f811c.entrySet()) {
                String str = (String) entry.getKey();
                String str2 = (String) entry.getValue();
                com.google.gson.m mVarE = d62.e(rVar4, str);
                if (mVarE == null) {
                    mVarE = new com.google.gson.m();
                }
                mVarE.q(str2);
                rVar4.p(str, mVarE);
            }
            rVar3.p("headers", rVar4);
            rVar.p("request", rVar2);
            rVar.p("response", rVar3);
            th3VarA2 = ji3.a(wv0.CUI_NAME_ADREQUEST_NORMALIZE_RESPONSE, EmptyList.f71733a, true);
            try {
                zj1 zj1Var = y22Var.f11925a;
                w22Var.f11013a = y22Var;
                w22Var.f11014b = a21Var2;
                w22Var.f11015c = th3VarA2;
                w22Var.f11016d = th3VarA2;
                w22Var.f11017e = null;
                w22Var.f11021i = 2;
                zj1Var.getClass();
                String string = rVar.toString();
                Intrinsics.f(string, "toString(...)");
                Object objA2 = zj1Var.a("google.afma.response.normalize", string, w22Var);
                if (objA2 != coroutineSingletons) {
                    obj = objA2;
                    a21Var = a21Var2;
                    th3Var2 = th3VarA2;
                    y22Var2 = y22Var;
                    a1Var2 = (b.a1) obj;
                    if (a1Var2 instanceof pu0) {
                    }
                    CloseableKt.a(th3Var2, null);
                    if (!(a1Var2 instanceof pu0)) {
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th5) {
                th = th5;
                th3Var2 = th3VarA2;
                th3VarA2.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
        } catch (Throwable th6) {
            th = th6;
            try {
                th3Var.b(th);
                if (!(th instanceof b.a4)) {
                }
            } catch (Throwable th42) {
                try {
                    throw th42;
                } finally {
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(fq fqVar, ContinuationImpl continuationImpl) {
        x22 x22Var;
        String str;
        y22 y22Var;
        y22 y22Var2;
        String str2;
        Object objA;
        x11 x11Var;
        String str3;
        fq fqVar2;
        x11 x11Var2;
        String str4;
        jr0 jr0Var;
        u uVar = u.a$1;
        if (continuationImpl instanceof x22) {
            x22Var = (x22) continuationImpl;
            int i5 = x22Var.f11555i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x22Var.f11555i = i5 - Integer.MIN_VALUE;
            } else {
                x22Var = new x22(this, continuationImpl);
            }
        }
        Object objJ = x22Var.f11553g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x22Var.f11555i;
        if (i11 == 0) {
            ResultKt.b(objJ);
            if (fqVar.f3460d) {
                x22Var.f11547a = this;
                x22Var.f11548b = fqVar;
                x22Var.f11555i = 1;
                fz fzVar = this.f11926b;
                fzVar.getClass();
                objJ = fz.j(fzVar, x22Var);
                if (objJ != coroutineSingletons) {
                    y22Var2 = this;
                }
                return coroutineSingletons;
            }
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            y22Var = this;
            str2 = str;
            x11 x11Var3 = new x11();
            x11Var3.b(fqVar.f3461e);
            b.y3 y3Var = y22Var.f11928d;
            x22Var.f11547a = y22Var;
            x22Var.f11548b = fqVar;
            x22Var.f11549c = str2;
            x22Var.f11550d = x11Var3;
            x22Var.f11551e = "User-Agent";
            x22Var.f11552f = x11Var3;
            x22Var.f11555i = 2;
            objA = y3Var.a(x22Var);
            if (objA != coroutineSingletons) {
                x11Var = x11Var3;
                objJ = objA;
                str3 = "User-Agent";
                fqVar2 = fqVar;
                x11Var2 = x11Var;
                x11Var2.a(str3, (String) objJ);
                if (str2 != null) {
                    x11Var.a("Cookie", str2);
                }
                str4 = fqVar2.f3459c;
                if (str4 != null) {
                    byte[] bytes = str4.getBytes(Charsets.f72000b);
                    Intrinsics.f(bytes, "getBytes(...)");
                    x11Var.b("text/plain", bytes);
                }
                f9 f9Var = y22Var.f11932h;
                e6 e6Var = y22Var.f11927c;
                jr0Var = y22Var.f11929e;
                x11Var.f11536f = f9Var;
                y11 y11VarA = x11Var.a();
                jr0Var.getClass();
                if (!((Boolean) jr0Var.a("gads:ad_request_http_client_enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                }
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 == 3) {
                    ResultKt.b(objJ);
                    return objJ;
                }
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objJ);
                return objJ;
            }
            x11Var2 = x22Var.f11552f;
            str3 = x22Var.f11551e;
            x11Var = x22Var.f11550d;
            str2 = x22Var.f11549c;
            fqVar2 = x22Var.f11548b;
            y22Var = x22Var.f11547a;
            ResultKt.b(objJ);
            x11Var2.a(str3, (String) objJ);
            if (str2 != null && str2.length() != 0) {
                x11Var.a("Cookie", str2);
            }
            str4 = fqVar2.f3459c;
            if (str4 != null && str4.length() != 0) {
                byte[] bytes2 = str4.getBytes(Charsets.f72000b);
                Intrinsics.f(bytes2, "getBytes(...)");
                x11Var.b("text/plain", bytes2);
            }
            f9 f9Var2 = y22Var.f11932h;
            e6 e6Var2 = y22Var.f11927c;
            jr0Var = y22Var.f11929e;
            x11Var.f11536f = f9Var2;
            y11 y11VarA2 = x11Var.a();
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:ad_request_http_client_enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                Duration.Companion companion = Duration.f72038b;
                Duration duration = new Duration(((Duration) jr0Var.a("gads:http_ad_request:timeout_millis", ed.k(60, DurationUnit.f72046e, "gads:http_ad_request:timeout_millis"), uVar)).f72041a);
                x22Var.f11547a = null;
                x22Var.f11548b = null;
                x22Var.f11549c = null;
                x22Var.f11550d = null;
                x22Var.f11551e = null;
                x22Var.f11552f = null;
                x22Var.f11555i = 3;
                Object objA2 = e6Var2.a(y11VarA2, duration, x22Var);
                if (objA2 != coroutineSingletons) {
                    return objA2;
                }
            } else {
                Duration.Companion companion2 = Duration.f72038b;
                Duration duration2 = new Duration(((Duration) jr0Var.a("gads:http_ad_request:timeout_millis", ed.k(60, DurationUnit.f72046e, "gads:http_ad_request:timeout_millis"), uVar)).f72041a);
                x22Var.f11547a = null;
                x22Var.f11548b = null;
                x22Var.f11549c = null;
                x22Var.f11550d = null;
                x22Var.f11551e = null;
                x22Var.f11552f = null;
                x22Var.f11555i = 4;
                Object objA3 = e6.a(e6Var2, y11VarA2, duration2, x22Var, 28);
                if (objA3 != coroutineSingletons) {
                    return objA3;
                }
            }
            return coroutineSingletons;
        }
        fqVar = x22Var.f11548b;
        y22Var2 = x22Var.f11547a;
        ResultKt.b(objJ);
        str = (String) objJ;
        y22Var = y22Var2;
        str2 = str;
        x11 x11Var32 = new x11();
        x11Var32.b(fqVar.f3461e);
        b.y3 y3Var2 = y22Var.f11928d;
        x22Var.f11547a = y22Var;
        x22Var.f11548b = fqVar;
        x22Var.f11549c = str2;
        x22Var.f11550d = x11Var32;
        x22Var.f11551e = "User-Agent";
        x22Var.f11552f = x11Var32;
        x22Var.f11555i = 2;
        objA = y3Var2.a(x22Var);
        if (objA != coroutineSingletons) {
        }
        return coroutineSingletons;
    }
}
