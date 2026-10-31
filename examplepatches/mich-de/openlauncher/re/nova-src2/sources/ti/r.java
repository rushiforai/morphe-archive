package ti;

import ads_mobile_sdk.cw0;
import ads_mobile_sdk.d83;
import ads_mobile_sdk.dr;
import ads_mobile_sdk.du0;
import ads_mobile_sdk.dv0;
import ads_mobile_sdk.e63;
import ads_mobile_sdk.er;
import ads_mobile_sdk.g83;
import ads_mobile_sdk.gq;
import ads_mobile_sdk.hq;
import ads_mobile_sdk.ia3;
import ads_mobile_sdk.iu0;
import ads_mobile_sdk.ji3;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.ka3;
import ads_mobile_sdk.lw0;
import ads_mobile_sdk.ma3;
import ads_mobile_sdk.pu0;
import ads_mobile_sdk.qu0;
import ads_mobile_sdk.s53;
import ads_mobile_sdk.th3;
import ads_mobile_sdk.tu0;
import ads_mobile_sdk.u;
import ads_mobile_sdk.u73;
import ads_mobile_sdk.wd1;
import ads_mobile_sdk.wv0;
import ads_mobile_sdk.xu0;
import ads_mobile_sdk.yu0;
import ads_mobile_sdk.z63;
import ads_mobile_sdk.zi3;
import b.a1;
import b.a4;
import b.f9;
import b.u1;
import b0.b0;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.comparisons.ComparisonsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.j0;
import t70.m0;
import t70.p2;
import t70.r1;
import t70.t;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final Set f89328a;

    /* renamed from: b, reason: collision with root package name */
    public final j0 f89329b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f89330c;

    /* renamed from: d, reason: collision with root package name */
    public final ni.q f89331d;

    /* renamed from: e, reason: collision with root package name */
    public final f9 f89332e;

    public r(Set signalSourceConfigs, j0 uiScope, j0 backgroundScope, jr0 flags, ni.q baseRequest, f9 internalAdRequestEventEmitter) {
        Intrinsics.g(signalSourceConfigs, "signalSourceConfigs");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(internalAdRequestEventEmitter, "internalAdRequestEventEmitter");
        this.f89328a = signalSourceConfigs;
        this.f89329b = backgroundScope;
        this.f89330c = flags;
        this.f89331d = baseRequest;
        this.f89332e = internalAdRequestEventEmitter;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:112:0x020d A[Catch: Exception -> 0x0086, TRY_LEAVE, TryCatch #8 {Exception -> 0x0086, blocks: (B:31:0x007c, B:78:0x01a0, B:80:0x01a4, B:82:0x01c8, B:110:0x0209, B:111:0x020c, B:112:0x020d, B:69:0x016f, B:85:0x01cd, B:87:0x01d4, B:89:0x01d8, B:91:0x01dc, B:94:0x01e3, B:96:0x01e7, B:98:0x01eb, B:100:0x01ef, B:101:0x01f0, B:102:0x01f5, B:103:0x01f6, B:104:0x01fd, B:105:0x01fe, B:106:0x0205, B:107:0x0206, B:108:0x0207, B:81:0x01ae), top: B:162:0x002a, inners: #0, #4, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x0287 A[Catch: Exception -> 0x02c2, s53 -> 0x02ce, TryCatch #11 {s53 -> 0x02ce, Exception -> 0x02c2, blocks: (B:129:0x0281, B:131:0x0287, B:134:0x02a2, B:128:0x027a), top: B:167:0x027a }] */
    /* JADX WARN: Removed duplicated region for block: B:137:0x02b7  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x017d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:207:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01a4 A[Catch: Exception -> 0x0086, TRY_LEAVE, TryCatch #8 {Exception -> 0x0086, blocks: (B:31:0x007c, B:78:0x01a0, B:80:0x01a4, B:82:0x01c8, B:110:0x0209, B:111:0x020c, B:112:0x020d, B:69:0x016f, B:85:0x01cd, B:87:0x01d4, B:89:0x01d8, B:91:0x01dc, B:94:0x01e3, B:96:0x01e7, B:98:0x01eb, B:100:0x01ef, B:101:0x01f0, B:102:0x01f5, B:103:0x01f6, B:104:0x01fd, B:105:0x01fe, B:106:0x0205, B:107:0x0206, B:108:0x0207, B:81:0x01ae), top: B:162:0x002a, inners: #0, #4, #5 }] */
    /* JADX WARN: Type inference failed for: r12v1, types: [t70.r1] */
    /* JADX WARN: Type inference failed for: r12v21 */
    /* JADX WARN: Type inference failed for: r12v5 */
    /* JADX WARN: Type inference failed for: r14v0, types: [ads_mobile_sdk.wd1, java.lang.String, java.util.concurrent.CancellationException] */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v10 */
    /* JADX WARN: Type inference failed for: r14v11, types: [ads_mobile_sdk.er, java.util.Iterator, java.util.List, ti.p] */
    /* JADX WARN: Type inference failed for: r14v12, types: [ads_mobile_sdk.wd1, java.lang.String, java.util.concurrent.CancellationException] */
    /* JADX WARN: Type inference failed for: r14v14 */
    /* JADX WARN: Type inference failed for: r14v15 */
    /* JADX WARN: Type inference failed for: r14v17 */
    /* JADX WARN: Type inference failed for: r14v18 */
    /* JADX WARN: Type inference failed for: r14v2 */
    /* JADX WARN: Type inference failed for: r14v20 */
    /* JADX WARN: Type inference failed for: r14v3 */
    /* JADX WARN: Type inference failed for: r14v9 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v5, types: [t70.r1] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:77:0x019b -> B:78:0x01a0). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(r rVar, ContinuationImpl continuationImpl) {
        ka3 ka3Var;
        ?? r14;
        ?? r12;
        r1 r1Var;
        Iterator it;
        p pVar;
        List list;
        r rVar2;
        cw0 cw0VarA;
        r1 r1Var2;
        r1 r1Var3;
        ?? r142;
        Iterator it2;
        List list2;
        r rVar3;
        p pVar2;
        ?? r22;
        r1 r1Var4;
        p pVar3;
        ?? r143;
        CancellationException cancellationException;
        r1 r1Var5;
        r rVar4 = rVar;
        rVar4.getClass();
        if (continuationImpl instanceof ka3) {
            ka3Var = (ka3) continuationImpl;
            int i5 = ka3Var.f5631i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ka3Var.f5631i = i5 - Integer.MIN_VALUE;
            } else {
                ka3Var = new ka3(rVar4, continuationImpl);
            }
        }
        Object obj = ka3Var.f5629g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ka3Var.f5631i;
        boolean z11 = true;
        try {
            try {
                if (i11 == 0) {
                    ResultKt.b(obj);
                    f9 f9Var = rVar4.f89332e;
                    ni.q qVar = rVar4.f89331d;
                    ka3Var.f5623a = rVar4;
                    ka3Var.f5631i = 1;
                    if (f9Var.a(qVar, ka3Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else if (i11 == 1) {
                    rVar4 = (r) ka3Var.f5623a;
                    ResultKt.b(obj);
                } else {
                    if (i11 != 2) {
                        if (i11 != 3) {
                            if (i11 != 4) {
                                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            pVar3 = (p) ka3Var.f5624b;
                            r1Var5 = (t) ka3Var.f5623a;
                            try {
                                ResultKt.b(obj);
                                return new xu0(pVar3);
                            } catch (s53 e3) {
                                e = e3;
                                cancellationException = null;
                                r1Var4 = r1Var5;
                                r1Var4.c(cancellationException);
                                return new tu0(e.f9421a, wd1.f11213a);
                            } catch (Exception e11) {
                                e = e11;
                                r143 = 0;
                                r22 = r1Var5;
                                r22.c(r143);
                                return new qu0(e, r143, r143, 6);
                            }
                        }
                        it2 = ka3Var.f5627e;
                        list2 = ka3Var.f5626d;
                        pVar2 = ka3Var.f5625c;
                        r1 r1Var6 = (t) ka3Var.f5624b;
                        rVar3 = (r) ka3Var.f5623a;
                        try {
                            ResultKt.b(obj);
                            r1Var3 = r1Var6;
                            r142 = 0;
                            while (it2.hasNext()) {
                                g83 g83Var = (g83) it2.next();
                                ka3Var.f5623a = rVar3;
                                ka3Var.f5624b = r1Var3;
                                ka3Var.f5625c = pVar2;
                                ka3Var.f5626d = list2;
                                ka3Var.f5627e = it2;
                                ka3Var.f5628f = r142;
                                ka3Var.f5631i = 3;
                                if (rVar3.a(g83Var, pVar2, ka3Var) == coroutineSingletons) {
                                    return coroutineSingletons;
                                }
                            }
                            ka3Var.f5623a = r1Var3;
                            ka3Var.f5624b = pVar2;
                            ka3Var.f5625c = r142;
                            ka3Var.f5626d = r142;
                            ka3Var.f5627e = r142;
                            ka3Var.f5628f = r142;
                            ka3Var.f5631i = 4;
                            if (m0.f(list2, ka3Var) != coroutineSingletons) {
                                return coroutineSingletons;
                            }
                            pVar3 = pVar2;
                            return new xu0(pVar3);
                        } catch (s53 e12) {
                            e = e12;
                            r1Var5 = r1Var6;
                            cancellationException = null;
                            r1Var4 = r1Var5;
                            r1Var4.c(cancellationException);
                            return new tu0(e.f9421a, wd1.f11213a);
                        } catch (Exception e13) {
                            e = e13;
                            r1Var5 = r1Var6;
                            r143 = 0;
                            r22 = r1Var5;
                            r22.c(r143);
                            return new qu0(e, r143, r143, 6);
                        }
                    }
                    er erVar = ka3Var.f5628f;
                    it = ka3Var.f5627e;
                    list = ka3Var.f5626d;
                    p pVar4 = ka3Var.f5625c;
                    r1 r1Var7 = (t) ka3Var.f5624b;
                    r rVar5 = (r) ka3Var.f5623a;
                    ResultKt.b(obj);
                    pVar = pVar4;
                    rVar2 = rVar5;
                    r1Var = r1Var7;
                    u1 u1Var = (u1) obj;
                    if (u1Var == null) {
                        wv0 wv0Var = wv0.CUI_NAME_SIGNAL_UPDATE_SIGNALS;
                        WeakHashMap weakHashMap = ji3.f5253a;
                        th3 th3VarA = ji3.a(wv0Var, EmptyList.f71733a, z11);
                        try {
                            ji3.a().e().f1804t = new u73(erVar.f2954f.a(), 6);
                            u1Var.a(pVar);
                            Unit unit = Unit.f71706a;
                            th3VarA.close();
                        } catch (Throwable th2) {
                            try {
                                th3VarA.b(th2);
                                if (th2 instanceof a4) {
                                    throw th2;
                                }
                                if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                    th3VarA.a(th2);
                                }
                                if (th2 instanceof TimeoutCancellationException) {
                                    throw new lw0(th2);
                                }
                                if (th2 instanceof CancellationException) {
                                    throw new du0(th2);
                                }
                                if (th2 instanceof dv0) {
                                    throw th2;
                                }
                                throw new iu0(th2);
                            } finally {
                            }
                        }
                    } else {
                        list.add(erVar);
                    }
                    z11 = true;
                    r1Var2 = r1Var;
                    r1Var3 = r1Var2;
                    if (it.hasNext()) {
                        try {
                            erVar = (er) it.next();
                            dr drVar = erVar.f2954f;
                            ka3Var.f5623a = rVar2;
                            ka3Var.f5624b = r1Var3;
                            ka3Var.f5625c = pVar;
                            ka3Var.f5626d = list;
                            ka3Var.f5627e = it;
                            ka3Var.f5628f = erVar;
                            ka3Var.f5631i = 2;
                            Object objK = drVar.k(ka3Var);
                            if (objK == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                            r1Var = r1Var3;
                            obj = objK;
                            u1 u1Var2 = (u1) obj;
                            if (u1Var2 == null) {
                            }
                            z11 = true;
                            r1Var2 = r1Var;
                            r1Var3 = r1Var2;
                            if (it.hasNext()) {
                                ArrayList<g83> arrayList = new ArrayList();
                                ArrayList arrayList2 = new ArrayList();
                                for (Object obj2 : list) {
                                    if (((g83) obj2).f3670b == e63.f2748b) {
                                        arrayList.add(obj2);
                                    } else {
                                        arrayList2.add(obj2);
                                    }
                                }
                                ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList, 10));
                                for (g83 g83Var2 : arrayList) {
                                    rVar2.getClass();
                                    g83Var2.getClass();
                                    d83[] d83VarArr = d83.f2213b;
                                    arrayList3.add(m0.e(rVar2.f89329b, r1Var3, new b0(rVar2, g83Var2, pVar, (Continuation) null, 8), 2));
                                }
                                r142 = 0;
                                r142 = 0;
                                r142 = 0;
                                try {
                                    it2 = arrayList2.iterator();
                                    list2 = arrayList3;
                                    rVar3 = rVar2;
                                    pVar2 = pVar;
                                    while (it2.hasNext()) {
                                    }
                                    ka3Var.f5623a = r1Var3;
                                    ka3Var.f5624b = pVar2;
                                    ka3Var.f5625c = r142;
                                    ka3Var.f5626d = r142;
                                    ka3Var.f5627e = r142;
                                    ka3Var.f5628f = r142;
                                    ka3Var.f5631i = 4;
                                    if (m0.f(list2, ka3Var) != coroutineSingletons) {
                                    }
                                } catch (s53 e14) {
                                    e = e14;
                                    r1Var4 = r1Var3;
                                    cancellationException = r142;
                                    r1Var4.c(cancellationException);
                                    return new tu0(e.f9421a, wd1.f11213a);
                                } catch (Exception e15) {
                                    e = e15;
                                    r22 = r1Var3;
                                    r143 = r142;
                                    r22.c(r143);
                                    return new qu0(e, r143, r143, 6);
                                }
                            }
                        } catch (Exception e16) {
                            e = e16;
                            r1Var = r1Var3;
                            r14 = 0;
                            r12 = r1Var;
                            r12.c(r14);
                            return new qu0(e, r14, r14, 6);
                        }
                    }
                }
                if (it.hasNext()) {
                }
            } catch (Exception e17) {
                e = e17;
                r14 = 0;
                r12 = r1Var3;
                r12.c(r14);
                return new qu0(e, r14, r14, 6);
            }
            r1 r1VarD = m0.d();
            p pVar5 = new p();
            jr0 jr0Var = rVar4.f89330c;
            jr0Var.getClass();
            Set setN1 = b70.g.N1(r70.k.i1((String) jr0Var.a("gad:signal_ids_to_skip", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, u.a$7), new String[]{","}, 6));
            ArrayList arrayList4 = new ArrayList();
            Iterator it3 = setN1.iterator();
            while (it3.hasNext()) {
                try {
                    cw0VarA = cw0.a(Integer.parseInt((String) it3.next()));
                } catch (Exception unused) {
                    cw0VarA = null;
                }
                if (cw0VarA != null) {
                    arrayList4.add(cw0VarA);
                }
            }
            Set setN12 = b70.g.N1(arrayList4);
            Set set = rVar4.f89328a;
            ArrayList arrayList5 = new ArrayList();
            for (Object obj3 : set) {
                Function0 function0 = ((g83) obj3).f3672e;
                if (function0 == null || ((Boolean) function0.invoke()).booleanValue()) {
                    arrayList5.add(obj3);
                }
            }
            ArrayList arrayList6 = new ArrayList();
            Iterator it4 = arrayList5.iterator();
            while (it4.hasNext()) {
                Object next = it4.next();
                if (!setN12.contains(((g83) next).b().a())) {
                    arrayList6.add(next);
                }
            }
            ArrayList arrayList7 = new ArrayList();
            ArrayList arrayList8 = new ArrayList();
            Iterator it5 = arrayList6.iterator();
            while (it5.hasNext()) {
                g83 g83Var3 = (g83) it5.next();
                if (g83Var3 instanceof er) {
                    arrayList7.add(g83Var3);
                } else {
                    arrayList8.add(g83Var3);
                }
            }
            it = arrayList7.iterator();
            pVar = pVar5;
            list = arrayList8;
            rVar2 = rVar4;
            r1Var2 = r1VarD;
            r1Var3 = r1Var2;
        } catch (Exception e18) {
            e = e18;
            r14 = 0;
            r12 = r1Var;
            r12.c(r14);
            return new qu0(e, r14, r14, 6);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:38:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00d2 A[Catch: all -> 0x00de, TryCatch #9 {all -> 0x00de, blocks: (B:56:0x00cb, B:58:0x00d2, B:60:0x00d6, B:62:0x00da, B:65:0x00e0, B:67:0x00e4, B:69:0x00e8, B:71:0x00ec, B:72:0x00ed, B:73:0x00f2, B:74:0x00f3, B:75:0x00fa, B:76:0x00fb, B:77:0x0102, B:78:0x0103), top: B:91:0x00cb }] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0103 A[Catch: all -> 0x00de, TRY_LEAVE, TryCatch #9 {all -> 0x00de, blocks: (B:56:0x00cb, B:58:0x00d2, B:60:0x00d6, B:62:0x00da, B:65:0x00e0, B:67:0x00e4, B:69:0x00e8, B:71:0x00ec, B:72:0x00ed, B:73:0x00f2, B:74:0x00f3, B:75:0x00fa, B:76:0x00fb, B:77:0x0102, B:78:0x0103), top: B:91:0x00cb }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v17 */
    /* JADX WARN: Type inference failed for: r0v19 */
    /* JADX WARN: Type inference failed for: r0v21, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, kotlin.coroutines.intrinsics.CoroutineSingletons] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v11 */
    /* JADX WARN: Type inference failed for: r1v12 */
    /* JADX WARN: Type inference failed for: r1v4 */
    /* JADX WARN: Type inference failed for: r1v6, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v12, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v2, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v8 */
    /* JADX WARN: Type inference failed for: r2v9, types: [java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(r rVar, ContinuationImpl continuationImpl) {
        ia3 ia3Var;
        TimeoutCancellationException th2;
        ?? r22;
        Closeable closeable;
        ?? r02;
        Closeable closeable2;
        Closeable closeable3;
        a1 a1Var;
        f9 f9Var;
        a1 yu0Var;
        if (continuationImpl instanceof ia3) {
            ia3 ia3Var2 = (ia3) continuationImpl;
            int i5 = ia3Var2.f4708f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ia3Var2.f4708f = i5 - Integer.MIN_VALUE;
                ia3Var = ia3Var2;
            } else {
                ia3Var = new ia3(rVar, continuationImpl);
            }
        }
        Object obj = ia3Var.f4706d;
        ?? r12 = CoroutineSingletons.f71806a;
        int i11 = ia3Var.f4708f;
        Continuation continuation = null;
        try {
            if (i11 != 0) {
                if (i11 == 1) {
                    closeable = (Closeable) ia3Var.f4705c;
                    r22 = (th3) ia3Var.f4704b;
                    r rVar2 = (r) ia3Var.f4703a;
                    try {
                        ResultKt.b(obj);
                        closeable3 = closeable;
                        rVar = rVar2;
                        try {
                            try {
                                a1Var = (a1) obj;
                                f9Var = rVar.f89332e;
                                ia3Var.f4703a = r22;
                            } catch (Throwable th3) {
                                th2 = th3;
                            }
                            try {
                                ia3Var.f4704b = closeable3;
                                ia3Var.f4705c = a1Var;
                                ia3Var.f4708f = 2;
                                if (f9Var.f() != r12) {
                                    yu0Var = a1Var;
                                    ia3Var = r22;
                                    r12 = closeable3;
                                }
                                return r12;
                            } catch (Throwable th4) {
                                th2 = th4;
                                closeable = closeable3;
                                try {
                                    r22.b(th2);
                                    if (th2 instanceof a4) {
                                        throw th2;
                                    }
                                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                        r22.a(th2);
                                    }
                                    if (th2 instanceof TimeoutCancellationException) {
                                        throw new lw0(th2);
                                    }
                                    if (th2 instanceof CancellationException) {
                                        throw new du0(th2);
                                    }
                                    if (th2 instanceof dv0) {
                                        throw th2;
                                    }
                                    throw new iu0(th2);
                                } finally {
                                }
                            }
                        } catch (TimeoutCancellationException e3) {
                            e = e3;
                            r02 = r22;
                            closeable2 = closeable3;
                        }
                    } catch (TimeoutCancellationException e11) {
                        closeable2 = closeable;
                        e = e11;
                        r02 = r22;
                    } catch (Throwable th5) {
                        th2 = th5;
                        r22.b(th2);
                        if (th2 instanceof a4) {
                        }
                    }
                } else {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    yu0Var = (a1) ia3Var.f4705c;
                    closeable2 = ia3Var.f4704b;
                    r02 = (th3) ia3Var.f4703a;
                    try {
                        ResultKt.b(obj);
                        ia3Var = r02;
                        r12 = closeable2;
                    } catch (TimeoutCancellationException e12) {
                        e = e12;
                    }
                }
                yu0Var = new yu0(e, 1);
                ia3Var = r02;
                r12 = closeable2;
            } else {
                ResultKt.b(obj);
                th3 th3VarA = ji3.a(wv0.CUI_NAME_ADREQUEST_SIGNALS, EmptyList.f71733a, true);
                try {
                    long jA0 = rVar.f89330c.A0();
                    a60.d dVar = new a60.d(rVar, continuation, 7);
                    ia3Var.f4703a = rVar;
                    ia3Var.f4704b = th3VarA;
                    ia3Var.f4705c = th3VarA;
                    ia3Var.f4708f = 1;
                    Object objC = p2.c(jA0, dVar, ia3Var);
                    if (objC != r12) {
                        closeable3 = th3VarA;
                        obj = objC;
                        r22 = closeable3;
                        a1Var = (a1) obj;
                        f9Var = rVar.f89332e;
                        ia3Var.f4703a = r22;
                        ia3Var.f4704b = closeable3;
                        ia3Var.f4705c = a1Var;
                        ia3Var.f4708f = 2;
                        if (f9Var.f() != r12) {
                        }
                    }
                    return r12;
                } catch (TimeoutCancellationException e13) {
                    e = e13;
                    r02 = th3VarA;
                    closeable2 = r02;
                } catch (Throwable th6) {
                    r22 = th3VarA;
                    th2 = th6;
                    closeable = r22;
                    r22.b(th2);
                    if (th2 instanceof a4) {
                    }
                }
            }
            if (yu0Var instanceof pu0) {
                zi3.a((pu0) yu0Var, false);
            }
            CloseableKt.a(r12, null);
            return yu0Var;
        } catch (Throwable th7) {
            th2 = th7;
            r22 = ia3Var;
            closeable = r12;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x009d A[Catch: Exception -> 0x0099, TryCatch #2 {Exception -> 0x0099, blocks: (B:19:0x004a, B:21:0x0052, B:23:0x0074, B:27:0x009f, B:26:0x009d), top: B:82:0x004a }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(g83 g83Var, p pVar, ContinuationImpl continuationImpl) {
        ma3 ma3Var;
        p pVar2;
        long j11;
        a1 qu0Var;
        g83 g83Var2 = g83Var;
        jr0 jr0Var = this.f89330c;
        if (continuationImpl instanceof ma3) {
            ma3Var = (ma3) continuationImpl;
            int i5 = ma3Var.f7069e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ma3Var.f7069e = i5 - Integer.MIN_VALUE;
            } else {
                ma3Var = new ma3(this, continuationImpl);
            }
        }
        Object objC = ma3Var.f7067c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ma3Var.f7069e;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objC);
            try {
                if (gq.a() == hq.f4480c) {
                    jr0Var.getClass();
                    Duration.Companion companion = Duration.f72038b;
                    companion.getClass();
                    Duration duration = new Duration(0L);
                    u uVar = u.a$1;
                    long j12 = ((Duration) jr0Var.a("gads:integration_signal_timeout:ms", duration, uVar)).f72041a;
                    companion.getClass();
                    if (Duration.c(j12, 0L) > 0) {
                        Duration duration2 = new Duration(g83Var2.f3671d);
                        companion.getClass();
                        j11 = ((Duration) ComparisonsKt.Z(duration2, new Duration(((Duration) jr0Var.a("gads:integration_signal_timeout:ms", new Duration(0L), uVar)).f72041a))).f72041a;
                    } else {
                        j11 = g83Var2.f3671d;
                    }
                    a60.d dVar = new a60.d(g83Var2, continuation, 9);
                    ma3Var.f7065a = g83Var2;
                    pVar2 = pVar;
                    try {
                        ma3Var.f7066b = pVar2;
                        ma3Var.f7069e = 1;
                        objC = p2.c(j11, dVar, ma3Var);
                        if (objC == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        qu0Var = (a1) objC;
                    } catch (Exception e3) {
                        e = e3;
                        qu0Var = new qu0(e, null, null, 6);
                        if (!(qu0Var instanceof xu0)) {
                        }
                        return Unit.f71706a;
                    }
                }
            } catch (Exception e11) {
                e = e11;
                pVar2 = pVar;
                qu0Var = new qu0(e, null, null, 6);
                if (!(qu0Var instanceof xu0)) {
                }
                return Unit.f71706a;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            p pVar3 = ma3Var.f7066b;
            g83 g83Var3 = ma3Var.f7065a;
            try {
                ResultKt.b(objC);
                pVar2 = pVar3;
                g83Var2 = g83Var3;
                qu0Var = (a1) objC;
            } catch (Exception e12) {
                e = e12;
                pVar2 = pVar3;
                g83Var2 = g83Var3;
                qu0Var = new qu0(e, null, null, 6);
                if (!(qu0Var instanceof xu0)) {
                }
                return Unit.f71706a;
            }
        }
        if (!(qu0Var instanceof xu0)) {
            WeakHashMap weakHashMap = ji3.f5253a;
            th3 th3VarA = ji3.a(wv0.CUI_NAME_SIGNAL_UPDATE_SIGNALS, EmptyList.f71733a, true);
            try {
                ji3.a().e().f1804t = new u73(g83Var2.b().a(), 6);
                ((u1) ((xu0) qu0Var).a()).a(pVar2);
                Unit unit = Unit.f71706a;
                th3VarA.close();
            } catch (Throwable th2) {
                try {
                    th3VarA.b(th2);
                    if (th2 instanceof a4) {
                        throw th2;
                    }
                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                        th3VarA.a(th2);
                    }
                    if (th2 instanceof TimeoutCancellationException) {
                        throw new lw0(th2);
                    }
                    if (th2 instanceof CancellationException) {
                        throw new du0(th2);
                    }
                    if (th2 instanceof dv0) {
                        throw th2;
                    }
                    throw new iu0(th2);
                } finally {
                }
            }
        } else if ((qu0Var instanceof pu0) && g83Var2.f3669a == z63.f12460a) {
            throw new s53("Required signal with id " + g83Var2.b().a().name() + " failed: " + qu0Var);
        }
        return Unit.f71706a;
    }
}
