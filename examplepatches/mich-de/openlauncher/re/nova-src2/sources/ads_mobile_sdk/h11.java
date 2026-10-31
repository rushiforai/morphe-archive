package ads_mobile_sdk;

import android.net.Uri;
import android.util.Base64;
import android.util.Log;
import b.e6;
import b.f9;
import b.k9;
import b0.x;
import b3.o2;
import c80.d;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import e1.e1;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.text.Charsets;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import x80.a0;
import x80.d0;
import x80.e0;
import x80.m0;
import x80.o0;
import x80.p0;
import x80.v;

/* loaded from: classes.dex */
public final class h11 implements e6 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f4181a;

    /* renamed from: b, reason: collision with root package name */
    public final b.y3 f4182b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f4183c;

    /* renamed from: d, reason: collision with root package name */
    public final zv f4184d;

    /* renamed from: e, reason: collision with root package name */
    public hs f4185e;

    /* renamed from: f, reason: collision with root package name */
    public b.xc f4186f;

    /* renamed from: g, reason: collision with root package name */
    public final d f4187g;

    /* renamed from: h, reason: collision with root package name */
    public volatile e0 f4188h;

    /* renamed from: i, reason: collision with root package name */
    public e0 f4189i;

    public h11(jr0 jr0Var, aw concurrencyObjects, b.y3 userAgentProvider, t70.j0 backgroundScope) {
        Intrinsics.g(concurrencyObjects, "concurrencyObjects");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        Intrinsics.g(backgroundScope, "backgroundScope");
        this.f4181a = jr0Var;
        this.f4182b = userAgentProvider;
        this.f4183c = backgroundScope;
        this.f4184d = concurrencyObjects.f1155d;
        this.f4187g = new d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(y11 y11Var, Map map, ContinuationImpl continuationImpl) {
        t01 t01Var;
        Map mapA;
        x11 x11Var;
        String str;
        Map map2;
        if (continuationImpl instanceof t01) {
            t01Var = (t01) continuationImpl;
            int i5 = t01Var.f9749g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                t01Var.f9749g = i5 - Integer.MIN_VALUE;
            } else {
                t01Var = new t01(this, continuationImpl);
            }
        }
        Object obj = t01Var.f9747e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = t01Var.f9749g;
        if (i11 == 0) {
            ResultKt.b(obj);
            hs hsVar = this.f4185e;
            if (hsVar != null) {
                String string = y11Var.f11913a.toString();
                Intrinsics.f(string, "toString(...)");
                mapA = hsVar.a(Uri.parse(string));
            } else {
                mapA = null;
            }
            y11Var.getClass();
            x11Var = new x11(y11Var);
            t01Var.f9743a = map;
            t01Var.f9744b = mapA;
            t01Var.f9745c = x11Var;
            str = "User-Agent";
            t01Var.f9746d = "User-Agent";
            t01Var.f9749g = 1;
            Object objA = this.f4182b.a(t01Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            map2 = mapA;
            obj = objA;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = t01Var.f9746d;
            x11 x11Var2 = t01Var.f9745c;
            map2 = t01Var.f9744b;
            Map map3 = t01Var.f9743a;
            ResultKt.b(obj);
            x11Var = x11Var2;
            map = map3;
        }
        x11Var.a(str, (String) obj);
        if (map != null) {
            for (Map.Entry entry : map.entrySet()) {
                x11Var.a((String) entry.getKey(), (String) entry.getValue());
            }
        }
        if (map2 != null) {
            for (Map.Entry entry2 : map2.entrySet()) {
                x11Var.a((String) entry2.getKey(), (String) entry2.getValue());
            }
        }
        return x11Var.a();
    }

    @Override // b.e6
    public final Object a(ef1 ef1Var) {
        long jG;
        d0 d0Var = new d0();
        d0Var.f95432a = new x80.r(this.f4184d);
        jr0 jr0Var = this.f4181a;
        if (jr0Var != null) {
            jG = jr0Var.D();
        } else {
            Duration.Companion companion = Duration.f72038b;
            jG = DurationKt.g(20, DurationUnit.f72046e);
        }
        long jH = Duration.h(jG);
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        d0Var.b(jH);
        this.f4188h = new e0(d0Var);
        return Unit.f71706a;
    }

    @Override // b.e6
    public final Object a(int i5, long j11, l5 l5Var) {
        long jG;
        d0 d0Var = new d0();
        d0Var.f95432a = new x80.r(this.f4184d);
        jr0 jr0Var = this.f4181a;
        if (jr0Var != null) {
            jG = jr0Var.D();
        } else {
            Duration.Companion companion = Duration.f72038b;
            jG = DurationKt.g(20, DurationUnit.f72046e);
        }
        long jH = Duration.h(jG);
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        d0Var.b(jH);
        TimeUnit timeUnit2 = TimeUnit.MINUTES;
        d0Var.f95433b = new com.google.android.gms.internal.measurement.v6(i5, j11);
        this.f4189i = new e0(d0Var);
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, UUID uuid, com.google.gson.r rVar, ContinuationImpl continuationImpl) {
        u01 u01Var;
        d dVar;
        com.google.gson.r rVar2;
        if (continuationImpl instanceof u01) {
            u01Var = (u01) continuationImpl;
            int i5 = u01Var.f10166e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u01Var.f10166e = i5 - Integer.MIN_VALUE;
            } else {
                u01Var = new u01(this, continuationImpl);
            }
        }
        Object obj = u01Var.f10164c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = u01Var.f10166e;
        if (i11 == 0) {
            ResultKt.b(obj);
            com.google.gson.r rVar3 = new com.google.gson.r();
            rVar3.q(new Long(System.currentTimeMillis()), "timestamp");
            rVar3.s(DatabaseConstants.EVENT_FIELD, str);
            com.google.gson.m mVar = new com.google.gson.m();
            mVar.q("network_request_" + uuid);
            Unit unit = Unit.f71706a;
            rVar3.p("components", mVar);
            rVar3.p("params", rVar);
            u01Var.f10162a = rVar3;
            dVar = this.f4187g;
            u01Var.f10163b = dVar;
            u01Var.f10166e = 1;
            if (dVar.e(u01Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            rVar2 = rVar3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = u01Var.f10163b;
            rVar2 = u01Var.f10162a;
            ResultKt.b(obj);
        }
        try {
            mu0.a("GMA Debug BEGIN", null, 2);
            mu0.a("GMA Debug CONTENT " + rVar2, null, 2);
            mu0.a("GMA Debug FINISH", null, 2);
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00e6, code lost:
    
        if (r2.a("onNetworkRequestError", r14, r15, r0) == r1) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x014a, code lost:
    
        if (r2.a("onNetworkResponseBody", r13, r15, r0) == r1) goto L51;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(m0 m0Var, UUID uuid, ContinuationImpl continuationImpl) {
        v01 v01Var;
        h11 h11Var;
        m0 m0Var2;
        UUID uuid2;
        p0 p0Var;
        String strString;
        if (continuationImpl instanceof v01) {
            v01Var = (v01) continuationImpl;
            int i5 = v01Var.f10535f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                v01Var.f10535f = i5 - Integer.MIN_VALUE;
            } else {
                v01Var = new v01(this, continuationImpl);
            }
        }
        Object obj = v01Var.f10533d;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = v01Var.f10535f;
        if (i11 == 0) {
            ResultKt.b(obj);
            com.google.gson.r rVar = new com.google.gson.r();
            com.google.gson.r rVar2 = new com.google.gson.r();
            rVar2.q(Integer.valueOf(m0Var.f95556d), TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE);
            Unit unit = Unit.f71706a;
            rVar.p("firstline", rVar2);
            x80.u uVar = m0Var.f95558f;
            if (uVar.size() > 0) {
                com.google.gson.m mVar = new com.google.gson.m();
                Iterator it = uVar.iterator();
                while (true) {
                    b70.a aVar = (b70.a) it;
                    if (!aVar.hasNext()) {
                        break;
                    }
                    Pair pair = (Pair) aVar.next();
                    com.google.gson.r rVar3 = new com.google.gson.r();
                    rVar3.s(PendingUpgradeStore.KEY_NAME, (String) pair.f71683a);
                    rVar3.s("value", (String) pair.f71684b);
                    mVar.p(rVar3);
                }
                Unit unit2 = Unit.f71706a;
                rVar.p("headers", mVar);
            }
            v01Var.f10530a = this;
            v01Var.f10531b = m0Var;
            v01Var.f10532c = uuid;
            v01Var.f10535f = 1;
            if (a("onNetworkResponse", uuid, rVar, v01Var) != obj2) {
                h11Var = this;
            }
            return obj2;
        }
        if (i11 == 1) {
            uuid = v01Var.f10532c;
            m0Var = v01Var.f10531b;
            h11Var = v01Var.f10530a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            uuid2 = v01Var.f10532c;
            m0Var2 = v01Var.f10531b;
            h11Var = v01Var.f10530a;
            ResultKt.b(obj);
            p0Var = m0Var2.f95559g;
            if (p0Var == null && (strString = p0Var.string()) != null) {
                if (r70.k.U0(strString)) {
                    return Unit.f71706a;
                }
                com.google.gson.r rVar4 = new com.google.gson.r();
                rVar4.q(new Integer(strString.length()), "bodylength");
                if (strString.length() < 10000) {
                    byte[] bytes = strString.getBytes(Charsets.f72000b);
                    Intrinsics.f(bytes, "getBytes(...)");
                    rVar4.s("body", Base64.encodeToString(bytes, 0));
                } else {
                    b.i8 i8Var = rw0.f9327f;
                    rVar4.s("bodydigest", b.i8.u(strString));
                }
                Unit unit3 = Unit.f71706a;
                v01Var.f10530a = null;
                v01Var.f10531b = null;
                v01Var.f10532c = null;
                v01Var.f10535f = 3;
            } else {
                return Unit.f71706a;
            }
        }
        int i12 = m0Var.f95556d;
        if (200 > i12 || i12 >= 300) {
            com.google.gson.r rVar5 = new com.google.gson.r();
            rVar5.s("error_description", m0Var.f95555c);
            Unit unit4 = Unit.f71706a;
            v01Var.f10530a = h11Var;
            v01Var.f10531b = m0Var;
            v01Var.f10532c = uuid;
            v01Var.f10535f = 2;
        }
        UUID uuid3 = uuid;
        m0Var2 = m0Var;
        uuid2 = uuid3;
        p0Var = m0Var2.f95559g;
        if (p0Var == null) {
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x00bf, code lost:
    
        if (r6 == r1) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.e6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Map map, Continuation continuation) {
        w01 w01Var;
        String str2;
        h11 h11Var;
        x80.g0 g0Var;
        x80.g0 g0Var2;
        if (continuation instanceof w01) {
            w01Var = (w01) continuation;
            int i5 = w01Var.f10980g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                w01Var.f10980g = i5 - Integer.MIN_VALUE;
            } else {
                w01Var = new w01(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = w01Var.f10978e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = w01Var.f10980g;
        if (i11 == 0) {
            ResultKt.b(obj);
            x80.g0 g0Var3 = new x80.g0();
            g0Var3.k(str);
            g0Var3.d();
            if (map != null) {
                for (Map.Entry entry : map.entrySet()) {
                    g0Var3.a((String) entry.getKey(), (String) entry.getValue());
                }
            }
            w01Var.f10974a = this;
            w01Var.f10975b = g0Var3;
            w01Var.f10976c = g0Var3;
            str2 = "User-Agent";
            w01Var.f10977d = "User-Agent";
            w01Var.f10980g = 1;
            Object objA = this.f4182b.a(w01Var);
            if (objA != coroutineSingletons) {
                h11Var = this;
                g0Var = g0Var3;
                obj = objA;
                g0Var2 = g0Var;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        str2 = w01Var.f10977d;
        g0Var2 = w01Var.f10976c;
        g0Var = w01Var.f10975b;
        h11Var = w01Var.f10974a;
        ResultKt.b(obj);
        g0Var2.a(str2, (String) obj);
        x80.h0 h0VarB = g0Var.b();
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID(...)");
        w01Var.f10974a = null;
        w01Var.f10975b = null;
        w01Var.f10976c = null;
        w01Var.f10977d = null;
        w01Var.f10980g = 2;
        h11Var.getClass();
        Object objA2 = h11Var.a("onNetworkRequest", uuidRandomUUID, k9.o(h0VarB), w01Var);
        if (objA2 != CoroutineSingletons.f71806a) {
            objA2 = Unit.f71706a;
        }
    }

    @Override // b.e6
    public final Object a(y11 y11Var, Duration duration, x22 x22Var) {
        return e6.a(this, y11Var, duration, x22Var, 16);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    @Override // b.e6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(URL url, bn0 bn0Var, Continuation continuation) {
        x01 x01Var;
        e0 e0Var;
        URL url2;
        Ref.ObjectRef objectRef;
        h11 h11Var;
        x80.h0 h0Var;
        Ref.ObjectRef objectRef2;
        if (continuation instanceof x01) {
            x01Var = (x01) continuation;
            int i5 = x01Var.f11524f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x01Var.f11524f = i5 - Integer.MIN_VALUE;
            } else {
                x01Var = new x01(this, (ContinuationImpl) continuation);
            }
        }
        x01 x01Var2 = x01Var;
        Object objA = x01Var2.f11522d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x01Var2.f11524f;
        if (i11 == 0) {
            ResultKt.b(objA);
            jr0 jr0Var = this.f4181a;
            cn0 cn0Var = jr0Var != null ? new cn0(bn0Var, jr0Var) : null;
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            if (cn0Var != null) {
                e0 e0Var2 = this.f4188h;
                if (e0Var2 != null) {
                    d0 d0VarA = e0Var2.a();
                    d0VarA.f95435d.add(cn0Var);
                    e0Var = new e0(d0VarA);
                } else {
                    Intrinsics.m("okHttpClient");
                    throw null;
                }
            } else {
                e0Var = this.f4188h;
                if (e0Var == null) {
                    Intrinsics.m("okHttpClient");
                    throw null;
                }
            }
            objectRef3.f71863a = e0Var;
            d0 d0VarA2 = e0Var.a();
            d0VarA2.f95439h = false;
            d0VarA2.f95440i = false;
            objectRef3.f71863a = new e0(d0VarA2);
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            ArrayList arrayList = new ArrayList();
            Intrinsics.g(url, "url");
            if (arrayList.isEmpty()) {
                url2 = url;
            } else {
                String string = url.toString();
                Intrinsics.f(string, "toString(...)");
                Uri.Builder builderBuildUpon = Uri.parse(string).buildUpon();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    Pair pair = (Pair) it.next();
                    builderBuildUpon.appendQueryParameter((String) pair.f71683a, (String) pair.f71684b);
                }
                url2 = new URL(builderBuildUpon.build().toString());
            }
            y11 y11Var = new y11(url2, "GET", MapsKt.s0(linkedHashMap), null, null, null);
            x01Var2.f11520a = this;
            x01Var2.f11521b = objectRef3;
            x01Var2.f11524f = 1;
            Object objA2 = a(y11Var, (Map) null, x01Var2);
            if (objA2 != coroutineSingletons) {
                objectRef = objectRef3;
                objA = objA2;
                h11Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            h0Var = (x80.h0) x01Var2.f11521b;
            objectRef2 = (Ref.ObjectRef) x01Var2.f11520a;
            ResultKt.b(objA);
            b.a1 a1Var = (b.a1) objA;
            mu0.a(new d11(objectRef2, h0Var, 1));
            return a1Var;
        }
        Ref.ObjectRef objectRef4 = (Ref.ObjectRef) x01Var2.f11521b;
        h11 h11Var2 = (h11) x01Var2.f11520a;
        ResultKt.b(objA);
        objectRef = objectRef4;
        h11Var = h11Var2;
        x80.h0 h0VarH = ((y11) objA).h();
        mu0.a(new c11(objectRef, h0VarH, 1));
        e0 e0Var3 = (e0) objectRef.f71863a;
        x01Var2.f11520a = objectRef;
        x01Var2.f11521b = h0VarH;
        x01Var2.f11524f = 2;
        objA = h11Var.a(h0VarH, e0Var3, false, (y11) null, false, (ContinuationImpl) x01Var2);
        if (objA != coroutineSingletons) {
            h0Var = h0VarH;
            objectRef2 = objectRef;
            b.a1 a1Var2 = (b.a1) objA;
            mu0.a(new d11(objectRef2, h0Var, 1));
            return a1Var2;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // b.e6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(URL url, Continuation continuation) {
        a11 a11Var;
        x80.g0 g0Var;
        String str;
        h11 h11Var;
        if (continuation instanceof a11) {
            a11Var = (a11) continuation;
            int i5 = a11Var.f801f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a11Var.f801f = i5 - Integer.MIN_VALUE;
            } else {
                a11Var = new a11(this, (ContinuationImpl) continuation);
            }
        }
        a11 a11Var2 = a11Var;
        Object obj = a11Var2.f799d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a11Var2.f801f;
        if (i11 == 0) {
            ResultKt.b(obj);
            g0Var = new x80.g0();
            Intrinsics.g(url, "url");
            String string = url.toString();
            Intrinsics.f(string, "url.toString()");
            v vVar = new v();
            vVar.e(null, string);
            g0Var.f95504a = vVar.b();
            b.y3 y3Var = this.f4182b;
            a11Var2.f796a = this;
            a11Var2.f797b = g0Var;
            a11Var2.f798c = "User-Agent";
            a11Var2.f801f = 1;
            Object objA = y3Var.a(a11Var2);
            if (objA != coroutineSingletons) {
                obj = objA;
                str = "User-Agent";
                h11Var = this;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        str = a11Var2.f798c;
        g0Var = a11Var2.f797b;
        h11Var = a11Var2.f796a;
        ResultKt.b(obj);
        g0Var.a(str, (String) obj);
        g0Var.g(null, "HEAD");
        x80.h0 h0VarB = g0Var.b();
        e0 e0Var = h11Var.f4189i;
        if (e0Var == null && (e0Var = h11Var.f4188h) == null) {
            Intrinsics.m("okHttpClient");
            throw null;
        }
        a11Var2.f796a = null;
        a11Var2.f797b = null;
        a11Var2.f798c = null;
        a11Var2.f801f = 2;
        Object objA2 = h11Var.a(h0VarB, e0Var, false, (y11) null, true, (ContinuationImpl) a11Var2);
        return objA2 == coroutineSingletons ? coroutineSingletons : objA2;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // b.e6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(y11 y11Var, Duration duration, Map map, boolean z11, boolean z12, ContinuationImpl continuationImpl) {
        b11 b11Var;
        e0 e0Var;
        y11 y11Var2;
        Ref.ObjectRef objectRef;
        h11 h11Var;
        x80.h0 h0Var;
        if (continuationImpl instanceof b11) {
            b11Var = (b11) continuationImpl;
            int i5 = b11Var.f1229h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b11Var.f1229h = i5 - Integer.MIN_VALUE;
            } else {
                b11Var = new b11(this, continuationImpl);
            }
        }
        b11 b11Var2 = b11Var;
        Object objA = b11Var2.f1227f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b11Var2.f1229h;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (!z11 ? (e0Var = this.f4188h) != null : !((e0Var = this.f4189i) == null && (e0Var = this.f4188h) == null)) {
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                if (duration != null) {
                    d0 d0VarA = e0Var.a();
                    long jH = Duration.h(duration.f72041a);
                    TimeUnit timeUnit = TimeUnit.MILLISECONDS;
                    d0VarA.b(jH);
                    e0Var = new e0(d0VarA);
                }
                objectRef2.f71863a = e0Var;
                if (!z12) {
                    d0 d0VarA2 = e0Var.a();
                    d0VarA2.f95439h = false;
                    d0VarA2.f95440i = false;
                    objectRef2.f71863a = new e0(d0VarA2);
                }
                b11Var2.f1222a = this;
                b11Var2.f1223b = y11Var;
                b11Var2.f1224c = objectRef2;
                b11Var2.f1225d = z11;
                b11Var2.f1226e = z12;
                b11Var2.f1229h = 1;
                objA = a(y11Var, map, b11Var2);
                if (objA != coroutineSingletons) {
                    y11Var2 = y11Var;
                    objectRef = objectRef2;
                    h11Var = this;
                }
                return coroutineSingletons;
            }
            Intrinsics.m("okHttpClient");
            throw null;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            h0Var = (x80.h0) b11Var2.f1223b;
            objectRef = (Ref.ObjectRef) b11Var2.f1222a;
            ResultKt.b(objA);
            b.a1 a1Var = (b.a1) objA;
            mu0.a(new d11(objectRef, h0Var, 0));
            return a1Var;
        }
        z12 = b11Var2.f1226e;
        z11 = b11Var2.f1225d;
        Ref.ObjectRef objectRef3 = b11Var2.f1224c;
        y11 y11Var3 = (y11) b11Var2.f1223b;
        h11 h11Var2 = (h11) b11Var2.f1222a;
        ResultKt.b(objA);
        y11Var2 = y11Var3;
        h11Var = h11Var2;
        objectRef = objectRef3;
        boolean z13 = z11;
        boolean z14 = z12;
        x80.h0 h0VarH = ((y11) objA).h();
        mu0.a(new c11(objectRef, h0VarH, 0));
        e0 e0Var2 = (e0) objectRef.f71863a;
        b11Var2.f1222a = objectRef;
        b11Var2.f1223b = h0VarH;
        b11Var2.f1224c = null;
        b11Var2.f1229h = 2;
        objA = h11Var.a(h0VarH, e0Var2, z13, y11Var2, z14, b11Var2);
        if (objA != coroutineSingletons) {
            h0Var = h0VarH;
            b.a1 a1Var2 = (b.a1) objA;
            mu0.a(new d11(objectRef, h0Var, 0));
            return a1Var2;
        }
        return coroutineSingletons;
    }

    @Override // b.e6
    public final Object a(URL url, Map map, boolean z11, ContinuationImpl continuationImpl) {
        URL url2;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ArrayList arrayList = new ArrayList();
        if (arrayList.isEmpty()) {
            url2 = url;
        } else {
            String string = url.toString();
            Intrinsics.f(string, "toString(...)");
            Uri.Builder builderBuildUpon = Uri.parse(string).buildUpon();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Pair pair = (Pair) it.next();
                builderBuildUpon.appendQueryParameter((String) pair.f71683a, (String) pair.f71684b);
            }
            url2 = new URL(builderBuildUpon.build().toString());
        }
        return a(new y11(url2, "GET", MapsKt.s0(linkedHashMap), null, null, null), (Duration) null, map, false, z11, continuationImpl);
    }

    /* JADX WARN: Code restructure failed: missing block: B:85:0x02b0, code lost:
    
        if (r7.a(r0, r15, r3) == r4) goto L86;
     */
    /* JADX WARN: Removed duplicated region for block: B:102:0x02f7  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0304 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:122:0x037c  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0384  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x037e A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x01b2  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x01bd  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x025a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x02c8  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x02ce  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x02d5 A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(x80.h0 h0Var, e0 e0Var, boolean z11, y11 y11Var, boolean z12, ContinuationImpl continuationImpl) {
        e11 e11Var;
        UUID uuidRandomUUID;
        y11 y11Var2;
        x80.h0 h0Var2;
        boolean z13;
        e0 e0Var2;
        boolean z14;
        h11 h11Var;
        y11 y11Var3;
        UUID uuid;
        boolean z15;
        h11 h11Var2;
        e0 e0Var3;
        boolean z16;
        x80.h0 h0Var3;
        int i5;
        boolean z17;
        boolean z18;
        h11 h11Var3;
        boolean z19;
        y11 y11Var4;
        UUID uuid2;
        b.a1 a1Var;
        m0 m0VarA;
        f9 f9Var;
        h11 h11Var4;
        boolean z21;
        boolean z22;
        m0 m0Var;
        m0 m0Var2;
        int i11;
        x80.u uVar;
        p0 p0Var;
        String str;
        boolean z23;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof e11) {
            e11Var = (e11) continuationImpl;
            int i12 = e11Var.f2704k;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                e11Var.f2704k = i12 - Integer.MIN_VALUE;
            } else {
                e11Var = new e11(this, continuationImpl);
            }
        }
        Object objA = e11Var.f2702i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = e11Var.f2704k;
        if (i13 == 0) {
            ResultKt.b(objA);
            uuidRandomUUID = UUID.randomUUID();
            jr0 jr0Var = this.f4181a;
            if (jr0Var == null || !((Boolean) jr0Var.a("gads:disable_network_request_tracing", Boolean.FALSE, jnVar)).booleanValue()) {
                b.xc xcVar = this.f4186f;
                if (xcVar != null) {
                    e11Var.f2694a = this;
                    e11Var.f2695b = h0Var;
                    e11Var.f2696c = e0Var;
                    y11Var2 = y11Var;
                    e11Var.f2697d = y11Var2;
                    e11Var.f2698e = uuidRandomUUID;
                    e11Var.f2699f = z11;
                    e11Var.f2700g = z12;
                    e11Var.f2704k = 1;
                    objA = w81.a((w81) xcVar, e11Var);
                    if (objA != coroutineSingletons) {
                        h0Var2 = h0Var;
                        z13 = z12;
                        e0Var2 = e0Var;
                        z14 = z11;
                        h11Var = this;
                    }
                    return coroutineSingletons;
                }
                y11Var2 = y11Var;
                h0Var2 = h0Var;
                z13 = z12;
                e0Var2 = e0Var;
                z14 = z11;
                h11Var = this;
                if (!z17 || Log.isLoggable("GoogleMobileAdsNetwork", 2)) {
                    x80.h0 h0Var4 = h0Var2;
                    z15 = z14;
                    h0Var3 = h0Var4;
                    y11Var3 = y11Var2;
                    e0Var3 = e0Var2;
                    h11Var2 = h11Var;
                    uuid = uuidRandomUUID;
                    z16 = z13;
                    i5 = 1;
                } else {
                    x80.h0 h0Var5 = h0Var2;
                    z15 = z14;
                    h0Var3 = h0Var5;
                    y11Var3 = y11Var2;
                    e0Var3 = e0Var2;
                    h11Var2 = h11Var;
                    uuid = uuidRandomUUID;
                    z16 = z13;
                    i5 = 0;
                }
                if (i5 != 0) {
                    Intrinsics.d(uuid);
                    e11Var.f2694a = h11Var2;
                    e11Var.f2695b = h0Var3;
                    e11Var.f2696c = e0Var3;
                    e11Var.f2697d = y11Var3;
                    e11Var.f2698e = uuid;
                    e11Var.f2699f = z15;
                    e11Var.f2700g = z16;
                    e11Var.f2701h = i5;
                    e11Var.f2704k = 2;
                    h11Var2.getClass();
                    Object objA2 = h11Var2.a("onNetworkRequest", uuid, k9.o(h0Var3), e11Var);
                    if (objA2 != coroutineSingletons) {
                        objA2 = Unit.f71706a;
                    }
                    if (objA2 != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                b90.j jVarC = e0Var3.c(h0Var3);
                e11Var.f2694a = h11Var2;
                e11Var.f2695b = y11Var3;
                e11Var.f2696c = uuid;
                e11Var.f2697d = null;
                e11Var.f2698e = null;
                e11Var.f2699f = z15;
                e11Var.f2700g = z16;
                e11Var.f2701h = i5;
                e11Var.f2704k = 3;
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(e11Var));
                mVar.t();
                mVar.v(new x(jVarC, 5));
                jVarC.b(new gq3(mVar));
                objA = mVar.s();
                if (objA != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            h0Var2 = h0Var;
            e0Var2 = e0Var;
            z14 = z11;
            y11Var2 = y11Var;
            z13 = z12;
            h11Var = this;
            x80.h0 h0Var52 = h0Var2;
            z15 = z14;
            h0Var3 = h0Var52;
            y11Var3 = y11Var2;
            e0Var3 = e0Var2;
            h11Var2 = h11Var;
            uuid = uuidRandomUUID;
            z16 = z13;
            i5 = 0;
            if (i5 != 0) {
            }
            b90.j jVarC2 = e0Var3.c(h0Var3);
            e11Var.f2694a = h11Var2;
            e11Var.f2695b = y11Var3;
            e11Var.f2696c = uuid;
            e11Var.f2697d = null;
            e11Var.f2698e = null;
            e11Var.f2699f = z15;
            e11Var.f2700g = z16;
            e11Var.f2701h = i5;
            e11Var.f2704k = 3;
            t70.m mVar2 = new t70.m(1, IntrinsicsKt.b(e11Var));
            mVar2.t();
            mVar2.v(new x(jVarC2, 5));
            jVarC2.b(new gq3(mVar2));
            objA = mVar2.s();
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i13 != 1) {
            if (i13 == 2) {
                i5 = e11Var.f2701h;
                z16 = e11Var.f2700g;
                z15 = e11Var.f2699f;
                uuid = e11Var.f2698e;
                y11Var3 = (y11) e11Var.f2697d;
                e0Var3 = (e0) e11Var.f2696c;
                h0Var3 = (x80.h0) e11Var.f2695b;
                h11Var2 = e11Var.f2694a;
                ResultKt.b(objA);
                b90.j jVarC22 = e0Var3.c(h0Var3);
                e11Var.f2694a = h11Var2;
                e11Var.f2695b = y11Var3;
                e11Var.f2696c = uuid;
                e11Var.f2697d = null;
                e11Var.f2698e = null;
                e11Var.f2699f = z15;
                e11Var.f2700g = z16;
                e11Var.f2701h = i5;
                e11Var.f2704k = 3;
                t70.m mVar22 = new t70.m(1, IntrinsicsKt.b(e11Var));
                mVar22.t();
                mVar22.v(new x(jVarC22, 5));
                jVarC22.b(new gq3(mVar22));
                objA = mVar22.s();
                if (objA != coroutineSingletons) {
                    z18 = z16;
                    h11Var3 = h11Var2;
                    z19 = z15;
                    y11Var4 = y11Var3;
                    uuid2 = uuid;
                    a1Var = (b.a1) objA;
                    if (!(a1Var instanceof pu0)) {
                    }
                }
                return coroutineSingletons;
            }
            if (i13 == 3) {
                i5 = e11Var.f2701h;
                boolean z24 = e11Var.f2700g;
                z19 = e11Var.f2699f;
                UUID uuid3 = (UUID) e11Var.f2696c;
                y11 y11Var5 = (y11) e11Var.f2695b;
                h11 h11Var5 = e11Var.f2694a;
                ResultKt.b(objA);
                z18 = z24;
                h11Var3 = h11Var5;
                uuid2 = uuid3;
                y11Var4 = y11Var5;
                a1Var = (b.a1) objA;
                if (!(a1Var instanceof pu0)) {
                    return (pu0) a1Var;
                }
                Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                m0VarA = (m0) ((xu0) a1Var).f11834b;
                if (y11Var4 != null && (f9Var = y11Var4.f11918f) != null) {
                    Map mapR0 = MapsKt.r0(m0VarA.f95558f);
                    LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(mapR0.size()));
                    Iterator it = mapR0.entrySet().iterator();
                    while (it.hasNext()) {
                        Map.Entry entry = (Map.Entry) it.next();
                        Object key = entry.getKey();
                        Iterator it2 = it;
                        List listI1 = r70.k.i1((CharSequence) entry.getValue(), new String[]{","}, 6);
                        ArrayList arrayList = new ArrayList(b70.c.u0(listI1, 10));
                        Iterator it3 = listI1.iterator();
                        while (it3.hasNext()) {
                            arrayList.add(r70.k.u1((String) it3.next()).toString());
                        }
                        linkedHashMap.put(key, arrayList);
                        it = it2;
                    }
                    e11Var.f2694a = h11Var3;
                    e11Var.f2695b = y11Var4;
                    e11Var.f2696c = uuid2;
                    e11Var.f2697d = m0VarA;
                    e11Var.f2699f = z19;
                    e11Var.f2700g = z18;
                    e11Var.f2701h = i5;
                    e11Var.f2704k = 4;
                    if (f9Var.a(linkedHashMap, e11Var) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                if (i5 != 0) {
                }
                h11Var4 = h11Var3;
                z21 = z18;
                z22 = z19;
                m0Var = m0VarA;
                h11Var4.getClass();
                jr0 jr0Var2 = h11Var4.f4181a;
                i11 = m0Var.f95556d;
                uVar = m0Var.f95558f;
                p0Var = m0Var.f95559g;
                str = m0Var.f95555c;
                if (300 <= i11) {
                }
                if (m0Var.c()) {
                }
                Map mapR02 = MapsKt.r0(uVar);
                o2 o2Var = new o2(1);
                o2Var.f17301a = i11;
                o2Var.f17302b = str;
                m0Var.f95554b.getClass();
                if (z23) {
                }
                if (z22) {
                }
                ((LinkedHashMap) o2Var.f17303c).clear();
                ((LinkedHashMap) o2Var.f17303c).putAll(mapR02);
                return new xu0(o2Var.a());
            }
            if (i13 == 4) {
                i5 = e11Var.f2701h;
                z18 = e11Var.f2700g;
                z19 = e11Var.f2699f;
                m0VarA = (m0) e11Var.f2697d;
                uuid2 = (UUID) e11Var.f2696c;
                y11Var4 = (y11) e11Var.f2695b;
                h11Var3 = e11Var.f2694a;
                ResultKt.b(objA);
                if (i5 != 0) {
                    p0 p0Var2 = m0VarA.f95559g;
                    if (p0Var2 != null) {
                        try {
                            byte[] bArrBytes = p0Var2.bytes();
                            x80.l0 l0VarD = m0VarA.d();
                            o0 o0Var = p0.Companion;
                            a0 a0VarContentType = p0Var2.contentType();
                            o0Var.getClass();
                            l0VarD.f95528g = o0.c(bArrBytes, a0VarContentType);
                            m0 m0VarA2 = l0VarD.a();
                            x80.l0 l0VarD2 = m0VarA.d();
                            l0VarD2.f95528g = o0.c(bArrBytes, p0Var2.contentType());
                            m0VarA = l0VarD2.a();
                            m0Var2 = m0VarA2;
                        } catch (Exception e3) {
                            return new qu0(e3, null, null, 6);
                        }
                    } else {
                        m0Var2 = m0VarA;
                    }
                    Intrinsics.d(uuid2);
                    e11Var.f2694a = h11Var3;
                    e11Var.f2695b = y11Var4;
                    e11Var.f2696c = m0VarA;
                    e11Var.f2697d = null;
                    e11Var.f2699f = z19;
                    e11Var.f2700g = z18;
                    e11Var.f2704k = 5;
                }
                h11Var4 = h11Var3;
                z21 = z18;
                z22 = z19;
                m0Var = m0VarA;
                h11Var4.getClass();
                jr0 jr0Var22 = h11Var4.f4181a;
                i11 = m0Var.f95556d;
                uVar = m0Var.f95558f;
                p0Var = m0Var.f95559g;
                str = m0Var.f95555c;
                if (300 <= i11) {
                }
                if (m0Var.c()) {
                }
                Map mapR022 = MapsKt.r0(uVar);
                o2 o2Var2 = new o2(1);
                o2Var2.f17301a = i11;
                o2Var2.f17302b = str;
                m0Var.f95554b.getClass();
                if (z23) {
                }
                if (z22) {
                    if (p0Var != null) {
                    }
                }
                ((LinkedHashMap) o2Var2.f17303c).clear();
                ((LinkedHashMap) o2Var2.f17303c).putAll(mapR022);
                return new xu0(o2Var2.a());
            }
            if (i13 != 5) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z21 = e11Var.f2700g;
            z22 = e11Var.f2699f;
            m0Var = (m0) e11Var.f2696c;
            h11Var4 = e11Var.f2694a;
            ResultKt.b(objA);
            h11Var4.getClass();
            jr0 jr0Var222 = h11Var4.f4181a;
            i11 = m0Var.f95556d;
            uVar = m0Var.f95558f;
            p0Var = m0Var.f95559g;
            str = m0Var.f95555c;
            z23 = 300 <= i11 && i11 < 400;
            if (m0Var.c() && (!z23 || z21)) {
                m0Var.close();
                return new ru0(str, i11);
            }
            Map mapR0222 = MapsKt.r0(uVar);
            o2 o2Var22 = new o2(1);
            o2Var22.f17301a = i11;
            o2Var22.f17302b = str;
            m0Var.f95554b.getClass();
            if (z23) {
                String strB = uVar.b("Location");
                if (strB == null) {
                    strB = null;
                }
                o2Var22.f17306f = strB;
            }
            if (z22 && p0Var != null && jr0Var222 != null && ((Boolean) jr0Var222.a("gads:enable_normalization_before_body", Boolean.FALSE, jnVar)).booleanValue() && !mapR0222.isEmpty()) {
                for (Map.Entry entry2 : mapR0222.entrySet()) {
                    if (r70.j.B0((String) entry2.getKey(), (String) jr0Var222.a("gads:html_body_header", "X-Afma-Is-Html-Response", u.a$7), true) && Boolean.parseBoolean((String) entry2.getValue())) {
                        t70.j0 j0Var = h11Var4.f4183c;
                        es esVar = new es(m0Var, null, 1);
                        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                        Intrinsics.g(j0Var, "<this>");
                        Intrinsics.g(context, "context");
                        o2Var22.f17305e = t70.m0.e(j0Var, context, new e1(esVar, null, 2), 2);
                        break;
                    }
                }
                if (p0Var != null) {
                }
            } else if (p0Var != null) {
                try {
                    byte[] bArrBytes2 = p0Var.bytes();
                    if (bArrBytes2 == null) {
                        bArrBytes2 = new byte[0];
                    }
                    o2Var22.f17304d = new ww2(bArrBytes2);
                } catch (Exception e11) {
                    return new qu0(e11, null, null, 6);
                }
            }
            ((LinkedHashMap) o2Var22.f17303c).clear();
            ((LinkedHashMap) o2Var22.f17303c).putAll(mapR0222);
            return new xu0(o2Var22.a());
        }
        z13 = e11Var.f2700g;
        z14 = e11Var.f2699f;
        uuidRandomUUID = e11Var.f2698e;
        y11Var2 = (y11) e11Var.f2697d;
        e0Var2 = (e0) e11Var.f2696c;
        h0Var2 = (x80.h0) e11Var.f2695b;
        h11Var = e11Var.f2694a;
        ResultKt.b(objA);
        z17 = ((Boolean) objA).booleanValue();
        if (z17) {
        }
        x80.h0 h0Var42 = h0Var2;
        z15 = z14;
        h0Var3 = h0Var42;
        y11Var3 = y11Var2;
        e0Var3 = e0Var2;
        h11Var2 = h11Var;
        uuid = uuidRandomUUID;
        z16 = z13;
        i5 = 1;
        if (i5 != 0) {
        }
        b90.j jVarC222 = e0Var3.c(h0Var3);
        e11Var.f2694a = h11Var2;
        e11Var.f2695b = y11Var3;
        e11Var.f2696c = uuid;
        e11Var.f2697d = null;
        e11Var.f2698e = null;
        e11Var.f2699f = z15;
        e11Var.f2700g = z16;
        e11Var.f2701h = i5;
        e11Var.f2704k = 3;
        t70.m mVar222 = new t70.m(1, IntrinsicsKt.b(e11Var));
        mVar222.t();
        mVar222.v(new x(jVarC222, 5));
        jVarC222.b(new gq3(mVar222));
        objA = mVar222.s();
        if (objA != coroutineSingletons) {
        }
        return coroutineSingletons;
    }

    @Override // b.e6
    public final void a(hs chromeVariationsProvider) {
        Intrinsics.g(chromeVariationsProvider, "chromeVariationsProvider");
        this.f4185e = chromeVariationsProvider;
    }

    @Override // b.e6
    public final void a(b.xc debugModeProvider) {
        Intrinsics.g(debugModeProvider, "debugModeProvider");
        this.f4186f = debugModeProvider;
    }
}
