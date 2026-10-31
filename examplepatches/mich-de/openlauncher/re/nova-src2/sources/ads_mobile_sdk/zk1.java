package ads_mobile_sdk;

import android.net.Uri;
import b.k9;
import c80.d;
import com.google.gson.Gson;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes.dex */
public abstract class zk1 implements b.u7 {

    /* renamed from: a, reason: collision with root package name */
    public final kz2 f12566a;

    /* renamed from: b, reason: collision with root package name */
    public final mi3 f12567b;

    /* renamed from: c, reason: collision with root package name */
    public final rw0 f12568c;

    /* renamed from: d, reason: collision with root package name */
    public final t70.j0 f12569d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f12570e;

    /* renamed from: f, reason: collision with root package name */
    public final d f12571f;

    /* renamed from: g, reason: collision with root package name */
    public final LinkedHashMap f12572g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkedHashMap f12573h;

    /* renamed from: i, reason: collision with root package name */
    public final ft1 f12574i;

    public zk1(kz2 rootTraceCreator, mi3 traceMetaSet, rw0 gmaUtil, t70.j0 backgroundScope, jr0 flags) {
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        this.f12566a = rootTraceCreator;
        this.f12567b = traceMetaSet;
        this.f12568c = gmaUtil;
        this.f12569d = backgroundScope;
        this.f12570e = flags;
        this.f12571f = new d();
        this.f12572g = new LinkedHashMap();
        this.f12573h = new LinkedHashMap();
        this.f12574i = new ft1(null);
    }

    @Override // b.u7
    public final Object a(tx0 tx0Var, Uri uri, vx0 vx0Var) {
        return a(this, tx0Var, uri, vx0Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00c6, code lost:
    
        if (r4 == r7) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x01bc, code lost:
    
        if (r14.invoke(r6) == r7) goto L66;
     */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0106 A[Catch: all -> 0x010d, TryCatch #5 {all -> 0x010d, blocks: (B:38:0x00fc, B:40:0x0106, B:45:0x0112, B:47:0x0118, B:49:0x012d, B:51:0x0135), top: B:151:0x00fc }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(zk1 zk1Var, tx0 tx0Var, Uri uri, ContinuationImpl continuationImpl) {
        rk1 rk1Var;
        String path;
        String queryParameter;
        Ref.ObjectRef objectRef;
        zk1 zk1Var2;
        Ref.ObjectRef objectRef2;
        zk1 zk1Var3;
        Ref.ObjectRef objectRef3;
        tx0 tx0Var2;
        String str;
        Object objA;
        zk1 zk1Var4;
        tx0 tx0Var3;
        Uri uri2;
        b.gb gbVar;
        WeakReference weakReference;
        zk1 zk1Var5 = zk1Var;
        tx0 tx0Var4 = tx0Var;
        Uri uri3 = uri;
        d dVar = zk1Var5.f12571f;
        if (continuationImpl instanceof rk1) {
            rk1Var = (rk1) continuationImpl;
            int i5 = rk1Var.f9226j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rk1Var.f9226j = i5 - Integer.MIN_VALUE;
            } else {
                rk1Var = new rk1(zk1Var5, continuationImpl);
            }
        }
        Object obj = rk1Var.f9224h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rk1Var.f9226j;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            path = uri3.getPath();
            if (path == null) {
                return Unit.f71706a;
            }
            queryParameter = uri3.getQueryParameter("ad_mid");
            objectRef = new Ref.ObjectRef();
            objectRef.f71863a = "Unknown/Unexpected GMSG without a handler: ".concat(path);
            if (path.equals("/result")) {
                ft1 ft1Var = zk1Var5.f12574i;
                rk1Var.f9217a = zk1Var5;
                rk1Var.f9218b = tx0Var4;
                rk1Var.f9219c = uri3;
                rk1Var.f9220d = path;
                rk1Var.f9221e = queryParameter;
                rk1Var.f9222f = objectRef;
                rk1Var.f9226j = 1;
                objA = ft1Var.a(rk1Var);
            } else if (queryParameter == null || r70.k.U0(queryParameter)) {
                rk1Var.f9217a = zk1Var5;
                rk1Var.f9218b = tx0Var4;
                rk1Var.f9219c = uri3;
                rk1Var.f9220d = path;
                rk1Var.f9221e = queryParameter;
                rk1Var.f9222f = objectRef;
                rk1Var.f9223g = dVar;
                rk1Var.f9226j = 3;
                if (dVar.e(rk1Var) != coroutineSingletons) {
                    zk1Var2 = zk1Var5;
                    objectRef2 = objectRef;
                    b.gb gbVar2 = (b.gb) zk1Var2.f12572g.get(path);
                    dVar.g(null);
                    objectRef = objectRef2;
                    tx0Var3 = tx0Var4;
                    uri2 = uri3;
                    gbVar = gbVar2;
                    zk1Var4 = zk1Var2;
                }
            } else {
                rk1Var.f9217a = zk1Var5;
                rk1Var.f9218b = tx0Var4;
                rk1Var.f9219c = uri3;
                rk1Var.f9220d = path;
                rk1Var.f9221e = queryParameter;
                rk1Var.f9222f = objectRef;
                rk1Var.f9223g = dVar;
                rk1Var.f9226j = 2;
                if (dVar.e(rk1Var) != coroutineSingletons) {
                    zk1Var3 = zk1Var5;
                    objectRef3 = objectRef;
                    tx0Var2 = tx0Var4;
                    str = queryParameter;
                    Map map = (Map) zk1Var3.f12573h.get(str);
                    if (map == null) {
                    }
                    if (weakReference != null) {
                        objectRef3.f71863a = "GMSG handler for: " + path + " has been garbage collected";
                    }
                    if (weakReference != null) {
                    }
                    b.gb gbVar3 = (b.gb) zk1Var3.f12572g.get(path);
                    dVar.g(null);
                    queryParameter = str;
                    uri2 = uri3;
                    gbVar = gbVar3;
                    tx0Var3 = tx0Var2;
                    zk1Var4 = zk1Var3;
                    objectRef = objectRef3;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            Ref.ObjectRef objectRef4 = rk1Var.f9222f;
            String str2 = rk1Var.f9221e;
            String str3 = rk1Var.f9220d;
            Uri uri4 = rk1Var.f9219c;
            tx0 tx0Var5 = rk1Var.f9218b;
            zk1 zk1Var6 = rk1Var.f9217a;
            ResultKt.b(obj);
            path = str3;
            uri3 = uri4;
            objA = obj;
            objectRef = objectRef4;
            zk1Var5 = zk1Var6;
            queryParameter = str2;
            tx0Var4 = tx0Var5;
            zk1Var4 = zk1Var5;
            tx0Var3 = tx0Var4;
            uri2 = uri3;
            gbVar = (b.gb) objA;
        } else if (i11 == 2) {
            dVar = rk1Var.f9223g;
            objectRef3 = rk1Var.f9222f;
            str = rk1Var.f9221e;
            String str4 = rk1Var.f9220d;
            Uri uri5 = rk1Var.f9219c;
            tx0Var2 = rk1Var.f9218b;
            zk1Var3 = rk1Var.f9217a;
            ResultKt.b(obj);
            path = str4;
            uri3 = uri5;
            try {
                Map map2 = (Map) zk1Var3.f12573h.get(str);
                weakReference = map2 == null ? (WeakReference) map2.get(path) : null;
                if (weakReference != null && weakReference.get() == null) {
                    objectRef3.f71863a = "GMSG handler for: " + path + " has been garbage collected";
                }
                if (weakReference != null || (gbVar3 = (b.gb) weakReference.get()) == null) {
                    b.gb gbVar32 = (b.gb) zk1Var3.f12572g.get(path);
                }
                dVar.g(null);
                queryParameter = str;
                uri2 = uri3;
                gbVar = gbVar32;
                tx0Var3 = tx0Var2;
                zk1Var4 = zk1Var3;
                objectRef = objectRef3;
            } catch (Throwable th2) {
                throw th2;
            }
        } else {
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            dVar = rk1Var.f9223g;
            objectRef2 = rk1Var.f9222f;
            String str5 = rk1Var.f9221e;
            String str6 = rk1Var.f9220d;
            Uri uri6 = rk1Var.f9219c;
            tx0 tx0Var6 = rk1Var.f9218b;
            zk1Var2 = rk1Var.f9217a;
            ResultKt.b(obj);
            queryParameter = str5;
            tx0Var4 = tx0Var6;
            path = str6;
            uri3 = uri6;
            try {
                b.gb gbVar22 = (b.gb) zk1Var2.f12572g.get(path);
                dVar.g(null);
                objectRef = objectRef2;
                tx0Var3 = tx0Var4;
                uri2 = uri3;
                gbVar = gbVar22;
                zk1Var4 = zk1Var2;
            } finally {
                dVar.g(null);
            }
        }
        if (gbVar != null) {
            cz.b bVar = mu0.f7335a;
            mu0.b("Dispatching gmsg: " + uri2.getPath() + " " + queryParameter, null);
            yq yqVar = new yq(zk1Var4, gbVar, tx0Var3, uri2, null);
            if (gbVar.c()) {
                rk1Var.f9217a = null;
                rk1Var.f9218b = null;
                rk1Var.f9219c = null;
                rk1Var.f9220d = null;
                rk1Var.f9221e = null;
                rk1Var.f9222f = null;
                rk1Var.f9223g = null;
                rk1Var.f9226j = 4;
            } else {
                m0.t(zk1Var4.f12569d, null, null, new a60.a(yqVar, continuation, 18), 3);
            }
        } else {
            if (zk1Var4.f12570e.f5357s.k().contains(path)) {
                return Unit.f71706a;
            }
            kz2 kz2Var = zk1Var4.f12566a;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = zk1Var4.f12567b;
            th3 th3VarC = ji3.c();
            wv0 wv0Var = wv0.CUI_NAME_GMSG;
            if (th3VarC == null) {
                em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    ji3.a().e().f1798l = 1;
                    cz.b bVar2 = mu0.f7335a;
                    mu0.c((String) objectRef.f71863a, null);
                    zi3.a(6, objectRef.f71863a + ". Ad Key: " + queryParameter, null);
                    Unit unit = Unit.f71706a;
                    em2VarA.close();
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
                th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    ji3.a().e().f1798l = 1;
                    cz.b bVar3 = mu0.f7335a;
                    mu0.c((String) objectRef.f71863a, null);
                    zi3.a(6, objectRef.f71863a + ". Ad Key: " + queryParameter, null);
                    Unit unit2 = Unit.f71706a;
                    th3VarA.close();
                } catch (Throwable th4) {
                    try {
                        th3VarA.b(th4);
                        if (th4 instanceof b.a4) {
                            throw th4;
                        }
                        if (!(th4 instanceof TimeoutCancellationException) && !(th4 instanceof CancellationException)) {
                            th3VarA.a(th4);
                        }
                        if (th4 instanceof TimeoutCancellationException) {
                            throw new lw0(th4);
                        }
                        if (th4 instanceof CancellationException) {
                            throw new du0(th4);
                        }
                        if (th4 instanceof dv0) {
                            throw th4;
                        }
                        throw new iu0(th4);
                    } finally {
                    }
                }
            }
        }
        return Unit.f71706a;
    }

    @Override // b.u7
    public final Object a(tx0 tx0Var, String str, ar.a aVar) {
        return a(this, str, aVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(zk1 zk1Var, String str, ContinuationImpl continuationImpl) {
        uk1 uk1Var;
        com.google.gson.r rVar;
        if (continuationImpl instanceof uk1) {
            uk1Var = (uk1) continuationImpl;
            int i5 = uk1Var.f10387e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uk1Var.f10387e = i5 - Integer.MIN_VALUE;
            } else {
                uk1Var = new uk1(zk1Var, continuationImpl);
            }
        }
        Object objA = uk1Var.f10385c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uk1Var.f10387e;
        if (i11 == 0) {
            ResultKt.b(objA);
            ft1 ft1Var = zk1Var.f12574i;
            uk1Var.f10383a = zk1Var;
            uk1Var.f10384b = str;
            uk1Var.f10387e = 1;
            objA = ft1Var.a(uk1Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                if (i11 == 2) {
                    ResultKt.b(objA);
                    return Unit.f71706a;
                }
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = uk1Var.f10384b;
            zk1Var = uk1Var.f10383a;
            ResultKt.b(objA);
        }
        ax2 ax2Var = (ax2) objA;
        Continuation continuation = null;
        if (ax2Var == null) {
            mu0.c("Unknown/Unexpected GMSG without a handler: result", null);
            zi3.a(6, "Unknown/Unexpected GMSG without a handler: result", null);
            return Unit.f71706a;
        }
        try {
            rVar = (com.google.gson.r) new Gson().fromJson(str, com.google.gson.r.class);
        } catch (Exception e3) {
            ArrayList arrayList = k9.e(e3, e3).f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList.add(message);
            rVar = null;
        }
        if (rVar == null) {
            return Unit.f71706a;
        }
        m0.t(zk1Var.f12569d, null, null, new a60.d(new ix1(zk1Var, ax2Var, rVar, null), continuation, 20), 3);
        return Unit.f71706a;
    }

    @Override // b.u7
    public final Object a(String str, b.gb gbVar, ContinuationImpl continuationImpl) {
        return a(this, str, gbVar, continuationImpl);
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x006c, code lost:
    
        if (r7.a(r10, r0) == r1) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a1 A[Catch: all -> 0x00a7, TryCatch #1 {all -> 0x00a7, blocks: (B:34:0x0097, B:36:0x00a1, B:39:0x00a9), top: B:56:0x0097 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(zk1 zk1Var, String str, b.gb gbVar, ContinuationImpl continuationImpl) {
        xk1 xk1Var;
        b.gb gbVarA;
        zk1 zk1Var2;
        c80.a aVar;
        d dVar;
        String str2;
        String str3;
        b.gb gbVar2;
        Map linkedHashMap;
        if (continuationImpl instanceof xk1) {
            xk1Var = (xk1) continuationImpl;
            int i5 = xk1Var.f11762h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xk1Var.f11762h = i5 - Integer.MIN_VALUE;
            } else {
                xk1Var = new xk1(zk1Var, continuationImpl);
            }
        }
        Object obj = xk1Var.f11760f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xk1Var.f11762h;
        if (i11 == 0) {
            ResultKt.b(obj);
            gbVarA = gbVar.a();
            if (gbVarA instanceof ax2) {
                ft1 ft1Var = zk1Var.f12574i;
                xk1Var.f11762h = 1;
            } else {
                String strD = gbVar.d();
                if (strD != null && !r70.k.U0(strD)) {
                    dVar = zk1Var.f12571f;
                    xk1Var.f11755a = zk1Var;
                    xk1Var.f11756b = str;
                    xk1Var.f11757c = gbVarA;
                    xk1Var.f11758d = strD;
                    xk1Var.f11759e = dVar;
                    xk1Var.f11762h = 2;
                    if (dVar.e(xk1Var) != coroutineSingletons) {
                        str2 = str;
                        str3 = strD;
                        gbVar2 = gbVarA;
                        linkedHashMap = (Map) zk1Var.f12573h.get(str3);
                        if (linkedHashMap == null) {
                        }
                        linkedHashMap.put(str2, new WeakReference(gbVar2));
                        zk1Var.f12573h.put(str3, linkedHashMap);
                        Unit unit = Unit.f71706a;
                        dVar.g(null);
                    }
                } else {
                    d dVar2 = zk1Var.f12571f;
                    xk1Var.f11755a = zk1Var;
                    xk1Var.f11756b = str;
                    xk1Var.f11757c = gbVarA;
                    xk1Var.f11758d = dVar2;
                    xk1Var.f11762h = 3;
                    if (dVar2.e(xk1Var) != coroutineSingletons) {
                        zk1Var2 = zk1Var;
                        aVar = dVar2;
                        zk1Var2.f12572g.put(str, gbVarA);
                        Unit unit2 = Unit.f71706a;
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        if (i11 == 2) {
            d dVar3 = xk1Var.f11759e;
            str3 = (String) xk1Var.f11758d;
            gbVar2 = xk1Var.f11757c;
            str2 = xk1Var.f11756b;
            zk1 zk1Var3 = xk1Var.f11755a;
            ResultKt.b(obj);
            dVar = dVar3;
            zk1Var = zk1Var3;
            try {
                linkedHashMap = (Map) zk1Var.f12573h.get(str3);
                if (linkedHashMap == null) {
                    linkedHashMap = new LinkedHashMap();
                }
                linkedHashMap.put(str2, new WeakReference(gbVar2));
                zk1Var.f12573h.put(str3, linkedHashMap);
                Unit unit3 = Unit.f71706a;
                dVar.g(null);
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        } else {
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = (c80.a) xk1Var.f11758d;
            b.gb gbVar3 = xk1Var.f11757c;
            String str4 = xk1Var.f11756b;
            zk1Var2 = xk1Var.f11755a;
            ResultKt.b(obj);
            gbVarA = gbVar3;
            str = str4;
            try {
                zk1Var2.f12572g.put(str, gbVarA);
                Unit unit22 = Unit.f71706a;
            } finally {
                ((d) aVar).g(null);
            }
        }
        return Unit.f71706a;
    }

    @Override // b.u7
    public final Object a(String str, t70.s sVar, zw0 zw0Var) {
        return a(this, str, sVar, zw0Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x005e, code lost:
    
        if (r8.a(r6, r7, r0) == r1) goto L25;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v2, types: [t70.r] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(zk1 zk1Var, String str, t70.s sVar, ContinuationImpl continuationImpl) {
        yk1 yk1Var;
        t70.s sVar2;
        if (continuationImpl instanceof yk1) {
            yk1Var = (yk1) continuationImpl;
            int i5 = yk1Var.f12183e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yk1Var.f12183e = i5 - Integer.MIN_VALUE;
            } else {
                yk1Var = new yk1(zk1Var, continuationImpl);
            }
        }
        Object objA = yk1Var.f12181c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yk1Var.f12183e;
        if (i11 == 0) {
            ResultKt.b(objA);
            ft1 ft1Var = zk1Var.f12574i;
            yk1Var.f12179a = str;
            yk1Var.f12180b = sVar;
            yk1Var.f12183e = 1;
            objA = ft1Var.a(yk1Var);
            sVar2 = sVar;
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Boolean.TRUE;
        }
        ?? r72 = yk1Var.f12180b;
        str = yk1Var.f12179a;
        ResultKt.b(objA);
        sVar2 = r72;
        ax2 ax2Var = (ax2) objA;
        if (ax2Var == null) {
            return Boolean.FALSE;
        }
        yk1Var.f12179a = null;
        yk1Var.f12180b = null;
        yk1Var.f12183e = 2;
    }
}
