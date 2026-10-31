package ads_mobile_sdk;

import ab.e0;
import android.content.Context;
import android.os.SystemClock;
import b.a6;
import b.c0;
import b.fb;
import b.ia;
import b.o2;
import b.t2;
import b.wb;
import b0.b0;
import b70.n;
import c80.d;
import e1.e1;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.k0;
import t70.m0;
import t70.q0;
import t70.q1;
import t70.r1;
import t70.s1;
import xk.w;

/* loaded from: classes.dex */
public final class sb {
    public static final List A = ul.b.Q("com.google.ads.mediation.admob.AdMobAdapter", "com.google.ads.mediation.admob.AdMobCustomTabsAdapter");

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f9475a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f9476b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f9477c;

    /* renamed from: d, reason: collision with root package name */
    public final a6 f9478d;

    /* renamed from: e, reason: collision with root package name */
    public final wb f9479e;

    /* renamed from: f, reason: collision with root package name */
    public final g0 f9480f;

    /* renamed from: g, reason: collision with root package name */
    public final wj f9481g;

    /* renamed from: h, reason: collision with root package name */
    public final o2 f9482h;

    /* renamed from: i, reason: collision with root package name */
    public final jr0 f9483i;

    /* renamed from: j, reason: collision with root package name */
    public final kz2 f9484j;

    /* renamed from: k, reason: collision with root package name */
    public final b41 f9485k;

    /* renamed from: l, reason: collision with root package name */
    public final d f9486l;

    /* renamed from: m, reason: collision with root package name */
    public final LinkedHashMap f9487m;
    public final LinkedHashMap n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public pi.b f9488p;

    /* renamed from: q, reason: collision with root package name */
    public long f9489q;

    /* renamed from: r, reason: collision with root package name */
    public long f9490r;

    /* renamed from: s, reason: collision with root package name */
    public int f9491s;

    /* renamed from: t, reason: collision with root package name */
    public long f9492t;

    /* renamed from: u, reason: collision with root package name */
    public final d f9493u;

    /* renamed from: v, reason: collision with root package name */
    public final LinkedHashSet f9494v;

    /* renamed from: w, reason: collision with root package name */
    public final LinkedHashSet f9495w;

    /* renamed from: x, reason: collision with root package name */
    public Set f9496x;

    /* renamed from: y, reason: collision with root package name */
    public final AtomicBoolean f9497y;

    /* renamed from: z, reason: collision with root package name */
    public final s1 f9498z;

    public sb(t70.j0 backgroundScope, CoroutineContext uiContext, Context applicationContext, a6 mediationAdapterProxyFactory, wb adapterStatusMapUpdater, g0 activityTracker, wj appState, o2 clock, jr0 flags, kz2 rootTraceCreator, b41 initializationConfigWrapper) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(mediationAdapterProxyFactory, "mediationAdapterProxyFactory");
        Intrinsics.g(adapterStatusMapUpdater, "adapterStatusMapUpdater");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        this.f9475a = backgroundScope;
        this.f9476b = uiContext;
        this.f9477c = applicationContext;
        this.f9478d = mediationAdapterProxyFactory;
        this.f9479e = adapterStatusMapUpdater;
        this.f9480f = activityTracker;
        this.f9481g = appState;
        this.f9482h = clock;
        this.f9483i = flags;
        this.f9484j = rootTraceCreator;
        this.f9485k = initializationConfigWrapper;
        this.f9486l = new d();
        this.f9487m = new LinkedHashMap();
        this.n = new LinkedHashMap();
        Duration.f72038b.getClass();
        this.o = 0L;
        this.f9488p = fb.h(null, null, 7);
        this.f9489q = 0L;
        this.f9490r = 0L;
        this.f9492t = 0L;
        this.f9493u = new d();
        this.f9494v = new LinkedHashSet();
        this.f9495w = new LinkedHashSet();
        this.f9497y = new AtomicBoolean(false);
        this.f9498z = m0.c();
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x00cc, code lost:
    
        if (r5.b(r3) != r4) goto L39;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r0v13, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(sb sbVar, String str, oa oaVar, ContinuationImpl continuationImpl) throws Throwable {
        xa xaVar;
        oa oaVar2;
        d dVar;
        sb sbVar2;
        sb sbVar3 = sbVar;
        String str2 = str;
        if (continuationImpl instanceof xa) {
            xaVar = (xa) continuationImpl;
            int i5 = xaVar.f11651f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xaVar.f11651f = i5 - Integer.MIN_VALUE;
            } else {
                xaVar = new xa(sbVar3, continuationImpl);
            }
        }
        Object obj = xaVar.f11649d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xaVar.f11651f;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (A.contains(str2)) {
                return new xu0(Unit.f71706a);
            }
            xaVar.f11646a = sbVar3;
            xaVar.f11647b = str2;
            oaVar2 = oaVar;
            xaVar.f11648c = oaVar2;
            xaVar.f11651f = 1;
            if (sbVar3.a(xaVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            oa oaVar3 = (oa) xaVar.f11648c;
            str2 = xaVar.f11647b;
            sb sbVar4 = xaVar.f11646a;
            ResultKt.b(obj);
            oaVar2 = oaVar3;
            sbVar3 = sbVar4;
        } else {
            if (i11 != 2) {
                if (i11 == 3) {
                    ResultKt.b(obj);
                    return new tu0("The adapter was unable to be instantiated via reflection.", wd1.f11213a);
                }
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ?? r02 = (c80.a) xaVar.f11648c;
            str2 = xaVar.f11647b;
            sbVar2 = xaVar.f11646a;
            ResultKt.b(obj);
            dVar = r02;
            String str3 = str2;
            try {
                wb wbVar = sbVar2.f9479e;
                LinkedHashMap linkedHashMap = sbVar2.f9487m;
                va vaVarH = fb.h(pi.a.f82598e, "The adapter was unable to be instantiated via reflection.", 4);
                long jA = sbVar2.a();
                wbVar.getClass();
                wb.a(linkedHashMap, str3, null, vaVarH, jA);
                Unit unit = Unit.f71706a;
                dVar.g(null);
                xaVar.f11646a = null;
                xaVar.f11647b = null;
                xaVar.f11648c = null;
                xaVar.f11651f = 3;
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        b.kb kbVarA = a6.a(sbVar3.f9478d, str2, false, null, 10);
        if (kbVarA == null) {
            dVar = sbVar3.f9486l;
            xaVar.f11646a = sbVar3;
            xaVar.f11647b = str2;
            xaVar.f11648c = dVar;
            xaVar.f11651f = 2;
            if (dVar.e(xaVar) != coroutineSingletons) {
                sbVar2 = sbVar3;
                String str32 = str2;
                wb wbVar2 = sbVar2.f9479e;
                LinkedHashMap linkedHashMap2 = sbVar2.f9487m;
                va vaVarH2 = fb.h(pi.a.f82598e, "The adapter was unable to be instantiated via reflection.", 4);
                long jA2 = sbVar2.a();
                wbVar2.getClass();
                wb.a(linkedHashMap2, str32, null, vaVarH2, jA2);
                Unit unit2 = Unit.f71706a;
                dVar.g(null);
                xaVar.f11646a = null;
                xaVar.f11647b = null;
                xaVar.f11648c = null;
                xaVar.f11651f = 3;
            }
        } else {
            xaVar.f11646a = null;
            xaVar.f11647b = null;
            xaVar.f11648c = null;
            xaVar.f11651f = 4;
            Object objA = sbVar3.a(kbVarA, str2, oaVar2, xaVar);
            if (objA != coroutineSingletons) {
                return objA;
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Code restructure failed: missing block: B:59:0x01d5, code lost:
    
        if (t70.m0.r(r0, r2) == r3) goto L60;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0181 A[Catch: all -> 0x01ad, TRY_LEAVE, TryCatch #0 {all -> 0x01ad, blocks: (B:49:0x0173, B:51:0x0181), top: B:63:0x0173 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01bd  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r0v23, types: [java.util.Collection] */
    /* JADX WARN: Type inference failed for: r7v6, types: [java.util.Collection] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x016f -> B:63:0x0173). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a$1(sb sbVar, Set set, ContinuationImpl continuationImpl) {
        ib ibVar;
        Set set2;
        sb sbVar2;
        Set set3;
        Object objA$1;
        Set set4;
        long jP;
        ArrayList arrayList;
        Ref.LongRef longRef;
        sb sbVar3;
        Iterator it;
        sb sbVar4 = sbVar;
        if (continuationImpl instanceof ib) {
            ibVar = (ib) continuationImpl;
            int i5 = ibVar.f4718j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ibVar.f4718j = i5 - Integer.MIN_VALUE;
            } else {
                ibVar = new ib(sbVar4, continuationImpl);
            }
        }
        Object objA$12 = ibVar.f4716h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ibVar.f4718j;
        Continuation continuation = null;
        int i12 = 4;
        if (i11 == 0) {
            ResultKt.b(objA$12);
            s1 s1Var = sbVar4.f9498z;
            ibVar.f4709a = sbVar4;
            ibVar.f4710b = null;
            set2 = set;
            ibVar.f4711c = set2;
            ibVar.f4718j = 1;
            if (s1Var.K(ibVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                set3 = (Set) ibVar.f4711c;
                c0.y(ibVar.f4710b);
                sbVar2 = ibVar.f4709a;
                ResultKt.b(objA$12);
                Set set5 = (Set) objA$12;
                set3.addAll(set5);
                wj wjVar = sbVar2.f9481g;
                ibVar.f4709a = sbVar2;
                ibVar.f4710b = null;
                ibVar.f4711c = set5;
                ibVar.f4718j = 3;
                wjVar.getClass();
                objA$1 = wj.a$1(wjVar, ibVar);
                if (objA$1 != coroutineSingletons) {
                    objA$12 = objA$1;
                    set4 = set5;
                    Map mapS = ((qi) objA$12).s();
                    Intrinsics.f(mapS, "getAdapterInitializationConfigsMap(...)");
                    LinkedHashMap linkedHashMap = new LinkedHashMap();
                    while (r1.hasNext()) {
                    }
                    Ref.LongRef longRef2 = new Ref.LongRef();
                    jP = sbVar2.f9483i.p();
                    longRef2.f71862a = jP;
                    Duration.f72038b.getClass();
                    if (Duration.c(jP, 0L) <= 0) {
                    }
                    arrayList = new ArrayList(linkedHashMap.size());
                    longRef = longRef2;
                    sbVar3 = sbVar2;
                    it = linkedHashMap.entrySet().iterator();
                    ArrayList arrayList2 = arrayList;
                    if (!it.hasNext()) {
                    }
                }
                return coroutineSingletons;
            }
            if (i11 == 3) {
                set4 = (Set) ibVar.f4711c;
                c0.y(ibVar.f4710b);
                sbVar2 = ibVar.f4709a;
                ResultKt.b(objA$12);
                Map mapS2 = ((qi) objA$12).s();
                Intrinsics.f(mapS2, "getAdapterInitializationConfigsMap(...)");
                LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                for (Map.Entry entry : mapS2.entrySet()) {
                    if (set4.contains(entry.getKey())) {
                        linkedHashMap2.put(entry.getKey(), entry.getValue());
                    }
                }
                Ref.LongRef longRef22 = new Ref.LongRef();
                jP = sbVar2.f9483i.p();
                longRef22.f71862a = jP;
                Duration.f72038b.getClass();
                if (Duration.c(jP, 0L) <= 0) {
                    longRef22.f71862a = sbVar2.f9483i.p();
                }
                arrayList = new ArrayList(linkedHashMap2.size());
                longRef = longRef22;
                sbVar3 = sbVar2;
                it = linkedHashMap2.entrySet().iterator();
                ArrayList arrayList22 = arrayList;
                if (!it.hasNext()) {
                }
                return coroutineSingletons;
            }
            if (i11 != 4) {
                if (i11 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA$12);
                return Unit.f71706a;
            }
            ?? r02 = ibVar.f4715g;
            d dVar = ibVar.f4714f;
            Map.Entry entry2 = ibVar.f4713e;
            Iterator it2 = ibVar.f4712d;
            ?? r72 = ibVar.f4711c;
            longRef = ibVar.f4710b;
            sb sbVar5 = ibVar.f4709a;
            ResultKt.b(objA$12);
            arrayList = r72;
            Iterator it3 = it2;
            sb sbVar6 = sbVar5;
            Map.Entry entry3 = entry2;
            ArrayList arrayList3 = r02;
            try {
                CoroutineContext.Element elementT = (r1) sbVar6.n.get(entry3.getKey());
                if (elementT == null) {
                    t70.j0 j0Var = sbVar6.f9475a;
                    b0 b0Var = new b0(sbVar6, entry3, longRef, continuation, 6);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    elementT = m0.t(j0Var, context, null, new ar.a(b0Var, null), 2);
                    LinkedHashMap linkedHashMap3 = sbVar6.n;
                    Object key = entry3.getKey();
                    Intrinsics.f(key, "<get-key>(...)");
                    linkedHashMap3.put(key, elementT);
                }
                dVar.g(null);
                arrayList3.add(elementT);
                sbVar3 = sbVar6;
                it = it3;
                i12 = 4;
                ArrayList arrayList222 = arrayList;
                if (!it.hasNext()) {
                    Map.Entry entry4 = (Map.Entry) it.next();
                    dVar = sbVar3.f9486l;
                    ibVar.f4709a = sbVar3;
                    ibVar.f4710b = longRef;
                    ibVar.f4711c = arrayList222;
                    ibVar.f4712d = it;
                    ibVar.f4713e = entry4;
                    ibVar.f4714f = dVar;
                    ibVar.f4715g = arrayList222;
                    ibVar.f4718j = i12;
                    if (dVar.e(ibVar) != coroutineSingletons) {
                        arrayList = arrayList222;
                        entry3 = entry4;
                        it3 = it;
                        sbVar6 = sbVar3;
                        arrayList3 = arrayList222;
                        CoroutineContext.Element elementT2 = (r1) sbVar6.n.get(entry3.getKey());
                        if (elementT2 == null) {
                        }
                        dVar.g(null);
                        arrayList3.add(elementT2);
                        sbVar3 = sbVar6;
                        it = it3;
                        i12 = 4;
                        ArrayList arrayList2222 = arrayList;
                        if (!it.hasNext()) {
                            ibVar.f4709a = null;
                            ibVar.f4710b = null;
                            ibVar.f4711c = null;
                            ibVar.f4712d = null;
                            ibVar.f4713e = null;
                            ibVar.f4714f = null;
                            ibVar.f4715g = null;
                            ibVar.f4718j = 5;
                        }
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        Set set6 = (Set) ibVar.f4711c;
        c0.y(ibVar.f4710b);
        sb sbVar7 = ibVar.f4709a;
        ResultKt.b(objA$12);
        set2 = set6;
        sbVar4 = sbVar7;
        wj wjVar2 = sbVar4.f9481g;
        ibVar.f4709a = sbVar4;
        ibVar.f4710b = null;
        ibVar.f4711c = set2;
        ibVar.f4718j = 2;
        objA$12 = wjVar2.a$1(ibVar);
        if (objA$12 != coroutineSingletons) {
            Set set7 = set2;
            sbVar2 = sbVar4;
            set3 = set7;
            Set set52 = (Set) objA$12;
            set3.addAll(set52);
            wj wjVar3 = sbVar2.f9481g;
            ibVar.f4709a = sbVar2;
            ibVar.f4710b = null;
            ibVar.f4711c = set52;
            ibVar.f4718j = 3;
            wjVar3.getClass();
            objA$1 = wj.a$1(wjVar3, ibVar);
            if (objA$1 != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0079 A[Catch: all -> 0x007f, TryCatch #1 {all -> 0x007f, blocks: (B:25:0x0075, B:27:0x0079, B:30:0x0081), top: B:53:0x0075 }] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b6 A[Catch: all -> 0x00db, LOOP:0: B:39:0x00b0->B:41:0x00b6, LOOP_END, TryCatch #0 {all -> 0x00db, blocks: (B:38:0x00aa, B:39:0x00b0, B:41:0x00b6, B:44:0x00dd), top: B:51:0x00aa }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(sb sbVar, ContinuationImpl continuationImpl) {
        nb nbVar;
        Set set;
        sb sbVar2;
        d dVar;
        Set linkedHashSet;
        d dVar2;
        sb sbVar3;
        Object obj;
        Iterator it;
        if (continuationImpl instanceof nb) {
            nbVar = (nb) continuationImpl;
            int i5 = nbVar.f7463f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nbVar.f7463f = i5 - Integer.MIN_VALUE;
            } else {
                nbVar = new nb(sbVar, continuationImpl);
            }
        }
        Object objA$1 = nbVar.f7461d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nbVar.f7463f;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objA$1);
            wj wjVar = sbVar.f9481g;
            nbVar.f7458a = sbVar;
            nbVar.f7463f = 1;
            objA$1 = wjVar.a$1(nbVar);
            if (objA$1 != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                Object obj2 = (c80.a) nbVar.f7459b;
                sbVar3 = nbVar.f7458a;
                ResultKt.b(objA$1);
                obj = obj2;
                try {
                    it = sbVar3.f9494v.iterator();
                    while (it.hasNext()) {
                        c0.y(it.next());
                        t70.j0 j0Var = sbVar3.f9475a;
                        a60.d dVar3 = new a60.d(sbVar3, continuation, 12);
                        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                        Intrinsics.g(j0Var, "<this>");
                        Intrinsics.g(context, "context");
                        m0.t(j0Var, context, null, new ar.a(dVar3, null), 2);
                    }
                    Unit unit = Unit.f71706a;
                    ((d) obj).g(null);
                    return unit;
                } catch (Throwable th2) {
                    ((d) obj).g(null);
                    throw th2;
                }
            }
            dVar = nbVar.f7460c;
            set = (Set) nbVar.f7459b;
            sbVar2 = nbVar.f7458a;
            ResultKt.b(objA$1);
            try {
                linkedHashSet = sbVar2.f9496x;
                if (linkedHashSet == null) {
                    linkedHashSet = new LinkedHashSet();
                }
                linkedHashSet.addAll(set);
                sbVar2.f9496x = linkedHashSet;
                Unit unit2 = Unit.f71706a;
                dVar.g(null);
                if (!sbVar2.f9497y.getAndSet(true)) {
                    sbVar2.f9498z.j0();
                }
                dVar2 = sbVar2.f9493u;
                nbVar.f7458a = sbVar2;
                nbVar.f7459b = dVar2;
                nbVar.f7460c = null;
                nbVar.f7463f = 3;
                if (dVar2.e(nbVar) != coroutineSingletons) {
                    sbVar3 = sbVar2;
                    obj = dVar2;
                    it = sbVar3.f9494v.iterator();
                    while (it.hasNext()) {
                    }
                    Unit unit3 = Unit.f71706a;
                    ((d) obj).g(null);
                    return unit3;
                }
                return coroutineSingletons;
            } finally {
                dVar.g(null);
            }
        }
        sbVar = nbVar.f7458a;
        ResultKt.b(objA$1);
        set = (Set) objA$1;
        d dVar4 = sbVar.f9493u;
        nbVar.f7458a = sbVar;
        nbVar.f7459b = set;
        nbVar.f7460c = dVar4;
        nbVar.f7463f = 2;
        if (dVar4.e(nbVar) != coroutineSingletons) {
            sbVar2 = sbVar;
            dVar = dVar4;
            linkedHashSet = sbVar2.f9496x;
            if (linkedHashSet == null) {
            }
            linkedHashSet.addAll(set);
            sbVar2.f9496x = linkedHashSet;
            Unit unit22 = Unit.f71706a;
            dVar.g(null);
            if (!sbVar2.f9497y.getAndSet(true)) {
            }
            dVar2 = sbVar2.f9493u;
            nbVar.f7458a = sbVar2;
            nbVar.f7459b = dVar2;
            nbVar.f7460c = null;
            nbVar.f7463f = 3;
            if (dVar2.e(nbVar) != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x020e A[Catch: all -> 0x004a, TryCatch #7 {all -> 0x004a, blocks: (B:16:0x0044, B:115:0x0273, B:118:0x027c, B:120:0x0280, B:116:0x0278, B:117:0x027b, B:23:0x005d, B:99:0x0208, B:101:0x020e, B:102:0x0215, B:104:0x0219, B:108:0x0238, B:110:0x0242, B:114:0x0248), top: B:159:0x002e, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0219 A[Catch: all -> 0x004a, TRY_LEAVE, TryCatch #7 {all -> 0x004a, blocks: (B:16:0x0044, B:115:0x0273, B:118:0x027c, B:120:0x0280, B:116:0x0278, B:117:0x027b, B:23:0x005d, B:99:0x0208, B:101:0x020e, B:102:0x0215, B:104:0x0219, B:108:0x0238, B:110:0x0242, B:114:0x0248), top: B:159:0x002e, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0242 A[Catch: all -> 0x0245, TryCatch #2 {all -> 0x0245, blocks: (B:108:0x0238, B:110:0x0242, B:114:0x0248), top: B:156:0x0238, outer: #7 }] */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0280 A[Catch: all -> 0x004a, TRY_LEAVE, TryCatch #7 {all -> 0x004a, blocks: (B:16:0x0044, B:115:0x0273, B:118:0x027c, B:120:0x0280, B:116:0x0278, B:117:0x027b, B:23:0x005d, B:99:0x0208, B:101:0x020e, B:102:0x0215, B:104:0x0219, B:108:0x0238, B:110:0x0242, B:114:0x0248), top: B:159:0x002e, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0296 A[Catch: all -> 0x02a2, TryCatch #1 {all -> 0x02a2, blocks: (B:126:0x028f, B:128:0x0296, B:130:0x029a, B:132:0x029e, B:135:0x02a5, B:137:0x02a9, B:139:0x02ad, B:141:0x02b1, B:142:0x02b2, B:143:0x02b7, B:144:0x02b8, B:145:0x02bf, B:146:0x02c0, B:147:0x02c7, B:148:0x02c8), top: B:155:0x028f }] */
    /* JADX WARN: Removed duplicated region for block: B:148:0x02c8 A[Catch: all -> 0x02a2, TRY_LEAVE, TryCatch #1 {all -> 0x02a2, blocks: (B:126:0x028f, B:128:0x0296, B:130:0x029a, B:132:0x029e, B:135:0x02a5, B:137:0x02a9, B:139:0x02ad, B:141:0x02b1, B:142:0x02b2, B:143:0x02b7, B:144:0x02b8, B:145:0x02bf, B:146:0x02c0, B:147:0x02c7, B:148:0x02c8), top: B:155:0x028f }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0102 A[Catch: all -> 0x0078, TryCatch #4 {all -> 0x0078, blocks: (B:26:0x0072, B:56:0x0167, B:59:0x0170, B:61:0x0174, B:57:0x016c, B:58:0x016f, B:31:0x0083, B:40:0x00fc, B:42:0x0102, B:43:0x0109, B:45:0x010d, B:49:0x012c, B:51:0x0136, B:55:0x013c), top: B:159:0x002e, inners: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x010d A[Catch: all -> 0x0078, TRY_LEAVE, TryCatch #4 {all -> 0x0078, blocks: (B:26:0x0072, B:56:0x0167, B:59:0x0170, B:61:0x0174, B:57:0x016c, B:58:0x016f, B:31:0x0083, B:40:0x00fc, B:42:0x0102, B:43:0x0109, B:45:0x010d, B:49:0x012c, B:51:0x0136, B:55:0x013c), top: B:159:0x002e, inners: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0136 A[Catch: all -> 0x0139, TryCatch #5 {all -> 0x0139, blocks: (B:49:0x012c, B:51:0x0136, B:55:0x013c), top: B:160:0x012c, outer: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0174 A[Catch: all -> 0x0078, TRY_LEAVE, TryCatch #4 {all -> 0x0078, blocks: (B:26:0x0072, B:56:0x0167, B:59:0x0170, B:61:0x0174, B:57:0x016c, B:58:0x016f, B:31:0x0083, B:40:0x00fc, B:42:0x0102, B:43:0x0109, B:45:0x010d, B:49:0x012c, B:51:0x0136, B:55:0x013c), top: B:159:0x002e, inners: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /* JADX WARN: Type inference failed for: r18v1, types: [ti.c] */
    /* JADX WARN: Type inference failed for: r18v2, types: [ti.c] */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v19, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v20, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v22, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v23, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v26, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v28, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v33 */
    /* JADX WARN: Type inference failed for: r3v34 */
    /* JADX WARN: Type inference failed for: r3v35 */
    /* JADX WARN: Type inference failed for: r3v36 */
    /* JADX WARN: Type inference failed for: r3v39 */
    /* JADX WARN: Type inference failed for: r3v40 */
    /* JADX WARN: Type inference failed for: r3v41 */
    /* JADX WARN: Type inference failed for: r3v42 */
    /* JADX WARN: Type inference failed for: r3v43 */
    /* JADX WARN: Type inference failed for: r3v44 */
    /* JADX WARN: Type inference failed for: r3v6, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v7, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v9 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v14 */
    /* JADX WARN: Type inference failed for: r5v15, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r5v19 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v20 */
    /* JADX WARN: Type inference failed for: r5v21 */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v24 */
    /* JADX WARN: Type inference failed for: r5v25 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(sb sbVar, String str, oa oaVar, long j11, ContinuationImpl continuationImpl) {
        bb bbVar;
        ?? r52;
        th3 th3VarA;
        ?? r53;
        em2 em2VarA;
        ?? r32;
        ?? r33;
        Throwable th2;
        th3 th3Var;
        Throwable th3;
        em2 em2Var;
        ?? r34;
        b.a1 a1Var;
        sb sbVar2;
        d dVar;
        String str2;
        b.a1 a1Var2;
        ?? r35;
        ?? r36;
        b.a1 a1Var3;
        sb sbVar3;
        d dVar2;
        String str3;
        b.a1 a1Var4;
        ?? r37;
        sb sbVar4 = sbVar;
        String str4 = str;
        if (continuationImpl instanceof bb) {
            bbVar = (bb) continuationImpl;
            int i5 = bbVar.f1355i;
            r53 = -2147483648;
            r52 = -2147483648;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bbVar.f1355i = i5 - Integer.MIN_VALUE;
            } else {
                bbVar = new bb(sbVar4, continuationImpl);
            }
        }
        bb bbVar2 = bbVar;
        Object objN = bbVar2.f1353g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bbVar2.f1355i;
        try {
            try {
                if (i11 == 0) {
                    ResultKt.b(objN);
                    kz2 kz2Var = sbVar4.f9484j;
                    wv0 wv0Var = wv0.CUI_NAME_SDKINIT_ADAPTERINIT;
                    EmptyList emptyList = EmptyList.f71733a;
                    mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                    if (ji3.b().f4777a == null) {
                        em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                        try {
                            ji3.a().f9923a.f7226c.f10107d = str4;
                            t70.j0 j0Var = sbVar4.f9475a;
                            t70.i2 i2VarD = m0.d();
                            th3 = null;
                            db dbVar = new db(sbVar4, str4, oaVar, false ? 1 : 0, 0);
                            Intrinsics.g(j0Var, "<this>");
                            q0 q0VarE = m0.e(j0Var, i2VarD, new e1(dbVar, null, 2), 2);
                            b.i8 i8Var = rw0.f9327f;
                            cb cbVar = new cb(q0VarE, null);
                            bbVar2.f1347a = sbVar4;
                            bbVar2.f1348b = str4;
                            bbVar2.f1349c = em2VarA;
                            bbVar2.f1350d = em2VarA;
                            bbVar2.f1355i = 1;
                            objN = i8Var.n(j11, cbVar, bbVar2);
                            if (objN != coroutineSingletons) {
                                em2 em2Var2 = em2VarA;
                                em2Var = em2Var2;
                                r34 = em2Var2;
                                a1Var = (b.a1) objN;
                                if (a1Var instanceof pu0) {
                                }
                                r35 = r34;
                                if (a1Var instanceof yu0) {
                                }
                                if (a1Var instanceof pu0) {
                                }
                                CloseableKt.a(r35, th3);
                                return a1Var;
                            }
                        } catch (Throwable th4) {
                            th = th4;
                            r33 = em2VarA;
                            try {
                                em2VarA.b(th);
                                if (!(th instanceof b.a4)) {
                                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                        em2VarA.a(th);
                                    }
                                    if (!(th instanceof TimeoutCancellationException)) {
                                        if (!(th instanceof CancellationException)) {
                                            if (th instanceof dv0) {
                                                throw th;
                                            }
                                            throw new iu0(th);
                                        }
                                        throw new du0(th);
                                    }
                                    throw new lw0(th);
                                }
                                throw th;
                            } finally {
                            }
                        }
                    } else {
                        th2 = null;
                        boolean z11 = false;
                        th3VarA = ji3.a(wv0Var, emptyList, true);
                        try {
                            ji3.a().f9923a.f7226c.f10107d = str4;
                            t70.j0 j0Var2 = sbVar4.f9475a;
                            t70.i2 i2VarD2 = m0.d();
                            db dbVar2 = new db(sbVar4, str4, oaVar, z11 ? 1 : 0, 0);
                            Intrinsics.g(j0Var2, "<this>");
                            q0 q0VarE2 = m0.e(j0Var2, i2VarD2, new e1(dbVar2, null, 2), 2);
                            b.i8 i8Var2 = rw0.f9327f;
                            cb cbVar2 = new cb(q0VarE2, null);
                            bbVar2.f1347a = sbVar4;
                            bbVar2.f1348b = str4;
                            bbVar2.f1349c = th3VarA;
                            bbVar2.f1350d = th3VarA;
                            bbVar2.f1355i = 3;
                            objN = i8Var2.n(j11, cbVar2, bbVar2);
                            if (objN != coroutineSingletons) {
                                th3 th3Var2 = th3VarA;
                                th3Var = th3Var2;
                                r36 = th3Var2;
                                a1Var3 = (b.a1) objN;
                                if (a1Var3 instanceof pu0) {
                                }
                                r37 = r36;
                                if (a1Var3 instanceof yu0) {
                                }
                                if (a1Var3 instanceof pu0) {
                                }
                                CloseableKt.a(r37, th2);
                                return a1Var3;
                            }
                        } catch (Throwable th5) {
                            th = th5;
                            r32 = th3VarA;
                            try {
                                th3VarA.b(th);
                                if (th instanceof b.a4) {
                                }
                            } finally {
                                try {
                                    throw th;
                                } finally {
                                }
                            }
                        }
                    }
                    return coroutineSingletons;
                }
                if (i11 == 1) {
                    Closeable closeable = bbVar2.f1350d;
                    ?? r54 = bbVar2.f1349c;
                    String str5 = bbVar2.f1348b;
                    sb sbVar5 = bbVar2.f1347a;
                    ResultKt.b(objN);
                    str4 = str5;
                    sbVar4 = sbVar5;
                    th3 = null;
                    r34 = closeable;
                    em2Var = r54;
                    a1Var = (b.a1) objN;
                    if (a1Var instanceof pu0) {
                        zi3.a((pu0) a1Var, false);
                    }
                    r35 = r34;
                    if (a1Var instanceof yu0) {
                        d dVar3 = sbVar4.f9486l;
                        bbVar2.f1347a = sbVar4;
                        bbVar2.f1348b = str4;
                        bbVar2.f1349c = em2Var;
                        bbVar2.f1350d = r34;
                        bbVar2.f1351e = (yu0) a1Var;
                        bbVar2.f1352f = dVar3;
                        bbVar2.f1355i = 2;
                        if (dVar3.e(bbVar2) != coroutineSingletons) {
                            sbVar2 = sbVar4;
                            dVar = dVar3;
                            str2 = str4;
                            a1Var2 = a1Var;
                            i11 = r34;
                            r53 = em2Var;
                            ma maVar = (ma) sbVar2.f9487m.get(str2);
                            if (maVar == null) {
                            }
                            wb wbVar = sbVar2.f9479e;
                            LinkedHashMap linkedHashMap = sbVar2.f9487m;
                            va vaVarE = fb.e(pi.a.f82597d, "Timeout.", (int) Duration.h(sbVar2.f9483i.p()));
                            long jA = sbVar2.a();
                            wbVar.getClass();
                            wb.a(linkedHashMap, str2, obj, vaVarE, jA);
                            Unit unit = Unit.f71706a;
                            dVar.g(th3);
                            a1Var = a1Var2;
                            r35 = i11;
                        }
                        return coroutineSingletons;
                    }
                    if (a1Var instanceof pu0) {
                    }
                    CloseableKt.a(r35, th3);
                    return a1Var;
                }
                if (i11 == 2) {
                    dVar = bbVar2.f1352f;
                    a1Var2 = bbVar2.f1351e;
                    ?? r38 = bbVar2.f1350d;
                    th3 th3Var3 = bbVar2.f1349c;
                    str2 = bbVar2.f1348b;
                    sbVar2 = bbVar2.f1347a;
                    ResultKt.b(objN);
                    th3 = null;
                    i11 = r38;
                    r53 = th3Var3;
                    try {
                        ma maVar2 = (ma) sbVar2.f9487m.get(str2);
                        Object obj = maVar2 == null ? maVar2.f7060b : th3;
                        wb wbVar2 = sbVar2.f9479e;
                        LinkedHashMap linkedHashMap2 = sbVar2.f9487m;
                        va vaVarE2 = fb.e(pi.a.f82597d, "Timeout.", (int) Duration.h(sbVar2.f9483i.p()));
                        long jA2 = sbVar2.a();
                        wbVar2.getClass();
                        wb.a(linkedHashMap2, str2, obj, vaVarE2, jA2);
                        Unit unit2 = Unit.f71706a;
                        dVar.g(th3);
                        a1Var = a1Var2;
                        r35 = i11;
                        if (a1Var instanceof pu0) {
                            zi3.a((pu0) a1Var, false);
                        }
                        CloseableKt.a(r35, th3);
                        return a1Var;
                    } finally {
                    }
                }
                if (i11 != 3) {
                    if (i11 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    dVar2 = bbVar2.f1352f;
                    a1Var4 = bbVar2.f1351e;
                    ?? r39 = bbVar2.f1350d;
                    th3 th3Var4 = bbVar2.f1349c;
                    str3 = bbVar2.f1348b;
                    sbVar3 = bbVar2.f1347a;
                    ResultKt.b(objN);
                    th2 = null;
                    i11 = r39;
                    r52 = th3Var4;
                    try {
                        ma maVar3 = (ma) sbVar3.f9487m.get(str3);
                        Object obj2 = maVar3 == null ? maVar3.f7060b : th2;
                        wb wbVar3 = sbVar3.f9479e;
                        LinkedHashMap linkedHashMap3 = sbVar3.f9487m;
                        va vaVarE3 = fb.e(pi.a.f82597d, "Timeout.", (int) Duration.h(sbVar3.f9483i.p()));
                        long jA3 = sbVar3.a();
                        wbVar3.getClass();
                        wb.a(linkedHashMap3, str3, obj2, vaVarE3, jA3);
                        Unit unit3 = Unit.f71706a;
                        dVar2.g(th2);
                        a1Var3 = a1Var4;
                        r37 = i11;
                        if (a1Var3 instanceof pu0) {
                            zi3.a((pu0) a1Var3, false);
                        }
                        CloseableKt.a(r37, th2);
                        return a1Var3;
                    } finally {
                    }
                }
                Closeable closeable2 = bbVar2.f1350d;
                th3 th3Var5 = bbVar2.f1349c;
                String str6 = bbVar2.f1348b;
                sb sbVar6 = bbVar2.f1347a;
                ResultKt.b(objN);
                str4 = str6;
                sbVar4 = sbVar6;
                th2 = null;
                r36 = closeable2;
                th3Var = th3Var5;
                a1Var3 = (b.a1) objN;
                if (a1Var3 instanceof pu0) {
                    zi3.a((pu0) a1Var3, false);
                }
                r37 = r36;
                if (a1Var3 instanceof yu0) {
                    d dVar4 = sbVar4.f9486l;
                    bbVar2.f1347a = sbVar4;
                    bbVar2.f1348b = str4;
                    bbVar2.f1349c = th3Var;
                    bbVar2.f1350d = r36;
                    bbVar2.f1351e = (yu0) a1Var3;
                    bbVar2.f1352f = dVar4;
                    bbVar2.f1355i = 4;
                    if (dVar4.e(bbVar2) != coroutineSingletons) {
                        sbVar3 = sbVar4;
                        dVar2 = dVar4;
                        str3 = str4;
                        a1Var4 = a1Var3;
                        i11 = r36;
                        r52 = th3Var;
                        ma maVar32 = (ma) sbVar3.f9487m.get(str3);
                        if (maVar32 == null) {
                        }
                        wb wbVar32 = sbVar3.f9479e;
                        LinkedHashMap linkedHashMap32 = sbVar3.f9487m;
                        va vaVarE32 = fb.e(pi.a.f82597d, "Timeout.", (int) Duration.h(sbVar3.f9483i.p()));
                        long jA32 = sbVar3.a();
                        wbVar32.getClass();
                        wb.a(linkedHashMap32, str3, obj2, vaVarE32, jA32);
                        Unit unit32 = Unit.f71706a;
                        dVar2.g(th2);
                        a1Var3 = a1Var4;
                        r37 = i11;
                    }
                    return coroutineSingletons;
                }
                if (a1Var3 instanceof pu0) {
                }
                CloseableKt.a(r37, th2);
                return a1Var3;
            } catch (Throwable th6) {
                th = th6;
                em2VarA = r53;
                r33 = i11;
            }
        } catch (Throwable th7) {
            th = th7;
            th3VarA = r52;
            r32 = i11;
            th3VarA.b(th);
            if (th instanceof b.a4) {
                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                    th3VarA.a(th);
                }
                if (!(th instanceof TimeoutCancellationException)) {
                    if (!(th instanceof CancellationException)) {
                        if (th instanceof dv0) {
                            throw th;
                        }
                        throw new iu0(th);
                    }
                    throw new du0(th);
                }
                throw new lw0(th);
            }
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        rb rbVar;
        sb sbVar;
        d dVar;
        if (continuationImpl instanceof rb) {
            rbVar = (rb) continuationImpl;
            int i5 = rbVar.f8999e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rbVar.f8999e = i5 - Integer.MIN_VALUE;
            } else {
                rbVar = new rb(this, continuationImpl);
            }
        }
        Object obj = rbVar.f8997c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rbVar.f8999e;
        if (i11 == 0) {
            ResultKt.b(obj);
            rbVar.f8995a = this;
            d dVar2 = this.f9486l;
            rbVar.f8996b = dVar2;
            rbVar.f8999e = 1;
            if (dVar2.e(rbVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            sbVar = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = rbVar.f8996b;
            sbVar = rbVar.f8995a;
            ResultKt.b(obj);
        }
        try {
            if (sbVar.f9491s == 1) {
                long j11 = sbVar.f9490r;
                Duration.Companion companion = Duration.f72038b;
                sbVar.f9482h.getClass();
                sbVar.f9490r = Duration.m(j11, Duration.l(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), sbVar.f9492t));
            }
            sbVar.f9491s--;
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(sb sbVar, ContinuationImpl continuationImpl) {
        ya yaVar;
        d dVar;
        if (continuationImpl instanceof ya) {
            yaVar = (ya) continuationImpl;
            int i5 = yaVar.f11986e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yaVar.f11986e = i5 - Integer.MIN_VALUE;
            } else {
                yaVar = new ya(sbVar, continuationImpl);
            }
        }
        Object obj = yaVar.f11984c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yaVar.f11986e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = sbVar.f9486l;
            yaVar.f11982a = sbVar;
            yaVar.f11983b = dVar;
            yaVar.f11986e = 1;
            if (dVar.e(yaVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = yaVar.f11983b;
            sb sbVar2 = yaVar.f11982a;
            ResultKt.b(obj);
            dVar = dVar2;
            sbVar = sbVar2;
        }
        try {
            return MapsKt.s0(sbVar.f9487m);
        } finally {
            dVar.g(null);
        }
    }

    public final long a() {
        long jM;
        if (this.f9491s == 0) {
            jM = this.f9490r;
        } else {
            long j11 = this.f9490r;
            Duration.Companion companion = Duration.f72038b;
            this.f9482h.getClass();
            jM = Duration.m(j11, Duration.l(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), this.f9492t));
        }
        return Duration.h(jM);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(sb sbVar, Set set, ContinuationImpl continuationImpl) {
        za zaVar;
        d dVar;
        long j11;
        if (continuationImpl instanceof za) {
            zaVar = (za) continuationImpl;
            int i5 = zaVar.f12500f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zaVar.f12500f = i5 - Integer.MIN_VALUE;
            } else {
                zaVar = new za(sbVar, continuationImpl);
            }
        }
        Object obj = zaVar.f12498d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zaVar.f12500f;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = sbVar.f9486l;
            zaVar.f12495a = sbVar;
            zaVar.f12496b = set;
            zaVar.f12497c = dVar;
            zaVar.f12500f = 1;
            if (dVar.e(zaVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = zaVar.f12497c;
            set = zaVar.f12496b;
            sb sbVar2 = zaVar.f12495a;
            ResultKt.b(obj);
            dVar = dVar2;
            sbVar = sbVar2;
        }
        try {
            Ref.LongRef longRef = new Ref.LongRef();
            long j12 = sbVar.f9489q;
            LinkedHashMap linkedHashMap = sbVar.f9487m;
            longRef.f71862a = j12;
            if (set.isEmpty()) {
                set = linkedHashMap.keySet();
            }
            for (String str : n.b0(set, e0.U("com.google.android.libraries.ads.mobile.sdk.MobileAds"))) {
                Duration duration = new Duration(longRef.f71862a);
                ma maVar = (ma) linkedHashMap.get(str);
                if (maVar != null) {
                    j11 = maVar.f7061c;
                } else {
                    Duration.f72038b.getClass();
                    j11 = 0;
                }
                longRef.f71862a = ((Duration) w.p(duration, new Duration(j11))).f72041a;
                ma maVar2 = (ma) linkedHashMap.get(str);
                if ((maVar2 != null ? maVar2.f7059a.getInitializationState() : null) == pi.a.f82597d) {
                    longRef.f71862a = ((Duration) w.p(new Duration(longRef.f71862a), new Duration(DurationKt.h(sbVar.a(), DurationUnit.f72045d)))).f72041a;
                }
            }
            Set setEntrySet = linkedHashMap.entrySet();
            int iD0 = b70.k.d0(b70.c.u0(setEntrySet, 10));
            if (iD0 < 16) {
                iD0 = 16;
            }
            LinkedHashMap linkedHashMap2 = new LinkedHashMap(iD0);
            for (Object obj2 : setEntrySet) {
                linkedHashMap2.put((String) ((Map.Entry) obj2).getKey(), ((ma) ((Map.Entry) obj2).getValue()).f7059a);
            }
            LinkedHashMap linkedHashMapU0 = MapsKt.u0(linkedHashMap2);
            linkedHashMapU0.put("com.google.android.libraries.ads.mobile.sdk.MobileAds", sbVar.f9488p);
            ab abVar = new ab(longRef, linkedHashMapU0);
            dVar.g(null);
            return abVar;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:318:?, code lost:
    
        throw null;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:102:0x032a A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:103:0x032c  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x034d  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0358 A[Catch: all -> 0x03a5, TryCatch #1 {all -> 0x03a5, blocks: (B:108:0x034e, B:109:0x0352, B:111:0x0358, B:114:0x0369, B:116:0x0381, B:119:0x03a8), top: B:264:0x034e, outer: #21 }] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x03d4 A[Catch: all -> 0x0159, TRY_LEAVE, TryCatch #21 {all -> 0x0159, blocks: (B:45:0x014b, B:121:0x03ab, B:123:0x03d4, B:129:0x040b, B:130:0x040e, B:50:0x0172, B:104:0x0330, B:63:0x01d2, B:65:0x01db, B:67:0x01e5, B:94:0x02b9, B:96:0x02db, B:97:0x02e0, B:99:0x02fd, B:100:0x0303, B:70:0x01ef, B:71:0x01f5, B:90:0x02a7, B:92:0x02b1, B:131:0x040f, B:132:0x0415, B:84:0x0279, B:86:0x028d, B:89:0x02a5, B:108:0x034e, B:109:0x0352, B:111:0x0358, B:114:0x0369, B:116:0x0381, B:119:0x03a8, B:64:0x01d5), top: B:266:0x0033, inners: #0, #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0404  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0423 A[Catch: all -> 0x042f, TryCatch #5 {all -> 0x042f, blocks: (B:136:0x041c, B:138:0x0423, B:140:0x0427, B:142:0x042b, B:145:0x0432, B:147:0x0436, B:149:0x043a, B:151:0x043e, B:152:0x043f, B:153:0x0444, B:154:0x0445, B:155:0x044c, B:156:0x044d, B:157:0x0454, B:158:0x0455), top: B:270:0x041c }] */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0455 A[Catch: all -> 0x042f, TRY_LEAVE, TryCatch #5 {all -> 0x042f, blocks: (B:136:0x041c, B:138:0x0423, B:140:0x0427, B:142:0x042b, B:145:0x0432, B:147:0x0436, B:149:0x043a, B:151:0x043e, B:152:0x043f, B:153:0x0444, B:154:0x0445, B:155:0x044c, B:156:0x044d, B:157:0x0454, B:158:0x0455), top: B:270:0x041c }] */
    /* JADX WARN: Removed duplicated region for block: B:172:0x04a3 A[Catch: all -> 0x04b8, TryCatch #11 {all -> 0x04b8, blocks: (B:170:0x049d, B:172:0x04a3, B:175:0x04bb), top: B:279:0x049d }] */
    /* JADX WARN: Removed duplicated region for block: B:178:0x04c9 A[Catch: all -> 0x04cf, TRY_LEAVE, TryCatch #17 {all -> 0x04cf, blocks: (B:176:0x04bd, B:178:0x04c9, B:230:0x0652, B:231:0x065a), top: B:287:0x048d }] */
    /* JADX WARN: Removed duplicated region for block: B:185:0x04f9 A[Catch: all -> 0x0067, TryCatch #2 {all -> 0x0067, blocks: (B:13:0x0056, B:18:0x0080, B:193:0x0558, B:183:0x04d7, B:185:0x04f9, B:186:0x04fe, B:188:0x0520, B:189:0x0526), top: B:266:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:188:0x0520 A[Catch: all -> 0x0067, TryCatch #2 {all -> 0x0067, blocks: (B:13:0x0056, B:18:0x0080, B:193:0x0558, B:183:0x04d7, B:185:0x04f9, B:186:0x04fe, B:188:0x0520, B:189:0x0526), top: B:266:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:191:0x0552  */
    /* JADX WARN: Removed duplicated region for block: B:192:0x0553  */
    /* JADX WARN: Removed duplicated region for block: B:196:0x0575  */
    /* JADX WARN: Removed duplicated region for block: B:200:0x0583 A[Catch: all -> 0x05db, TryCatch #24 {all -> 0x05db, blocks: (B:197:0x0579, B:198:0x057d, B:200:0x0583, B:203:0x0594, B:205:0x05ac), top: B:282:0x0579 }] */
    /* JADX WARN: Removed duplicated region for block: B:216:0x060b A[Catch: all -> 0x063b, TRY_LEAVE, TryCatch #13 {all -> 0x063b, blocks: (B:224:0x0646, B:225:0x0649, B:214:0x05e4, B:216:0x060b), top: B:282:0x0579 }] */
    /* JADX WARN: Removed duplicated region for block: B:221:0x063f  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x0665 A[Catch: all -> 0x0671, TryCatch #8 {all -> 0x0671, blocks: (B:234:0x065e, B:236:0x0665, B:238:0x0669, B:240:0x066d, B:243:0x0674, B:245:0x0678, B:247:0x067c, B:249:0x0680, B:250:0x0681, B:251:0x0686, B:252:0x0687, B:253:0x068e, B:254:0x068f, B:255:0x0696, B:256:0x0697), top: B:274:0x065e }] */
    /* JADX WARN: Removed duplicated region for block: B:256:0x0697 A[Catch: all -> 0x0671, TRY_LEAVE, TryCatch #8 {all -> 0x0671, blocks: (B:234:0x065e, B:236:0x0665, B:238:0x0669, B:240:0x066d, B:243:0x0674, B:245:0x0678, B:247:0x067c, B:249:0x0680, B:250:0x0681, B:251:0x0686, B:252:0x0687, B:253:0x068e, B:254:0x068f, B:255:0x0696, B:256:0x0697), top: B:274:0x065e }] */
    /* JADX WARN: Removed duplicated region for block: B:321:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x028d A[Catch: all -> 0x02a2, TryCatch #0 {all -> 0x02a2, blocks: (B:84:0x0279, B:86:0x028d, B:89:0x02a5), top: B:262:0x0279, outer: #21 }] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x02b1 A[Catch: all -> 0x0159, TryCatch #21 {all -> 0x0159, blocks: (B:45:0x014b, B:121:0x03ab, B:123:0x03d4, B:129:0x040b, B:130:0x040e, B:50:0x0172, B:104:0x0330, B:63:0x01d2, B:65:0x01db, B:67:0x01e5, B:94:0x02b9, B:96:0x02db, B:97:0x02e0, B:99:0x02fd, B:100:0x0303, B:70:0x01ef, B:71:0x01f5, B:90:0x02a7, B:92:0x02b1, B:131:0x040f, B:132:0x0415, B:84:0x0279, B:86:0x028d, B:89:0x02a5, B:108:0x034e, B:109:0x0352, B:111:0x0358, B:114:0x0369, B:116:0x0381, B:119:0x03a8, B:64:0x01d5), top: B:266:0x0033, inners: #0, #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x02db A[Catch: all -> 0x0159, TryCatch #21 {all -> 0x0159, blocks: (B:45:0x014b, B:121:0x03ab, B:123:0x03d4, B:129:0x040b, B:130:0x040e, B:50:0x0172, B:104:0x0330, B:63:0x01d2, B:65:0x01db, B:67:0x01e5, B:94:0x02b9, B:96:0x02db, B:97:0x02e0, B:99:0x02fd, B:100:0x0303, B:70:0x01ef, B:71:0x01f5, B:90:0x02a7, B:92:0x02b1, B:131:0x040f, B:132:0x0415, B:84:0x0279, B:86:0x028d, B:89:0x02a5, B:108:0x034e, B:109:0x0352, B:111:0x0358, B:114:0x0369, B:116:0x0381, B:119:0x03a8, B:64:0x01d5), top: B:266:0x0033, inners: #0, #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:99:0x02fd A[Catch: all -> 0x0159, TryCatch #21 {all -> 0x0159, blocks: (B:45:0x014b, B:121:0x03ab, B:123:0x03d4, B:129:0x040b, B:130:0x040e, B:50:0x0172, B:104:0x0330, B:63:0x01d2, B:65:0x01db, B:67:0x01e5, B:94:0x02b9, B:96:0x02db, B:97:0x02e0, B:99:0x02fd, B:100:0x0303, B:70:0x01ef, B:71:0x01f5, B:90:0x02a7, B:92:0x02b1, B:131:0x040f, B:132:0x0415, B:84:0x0279, B:86:0x028d, B:89:0x02a5, B:108:0x034e, B:109:0x0352, B:111:0x0358, B:114:0x0369, B:116:0x0381, B:119:0x03a8, B:64:0x01d5), top: B:266:0x0033, inners: #0, #1, #3 }] */
    /* JADX WARN: Type inference failed for: r0v100, types: [java.util.Set] */
    /* JADX WARN: Type inference failed for: r0v23, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r0v71, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r1v29, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v3, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v48 */
    /* JADX WARN: Type inference failed for: r1v70, types: [java.util.Set] */
    /* JADX WARN: Type inference failed for: r1v72 */
    /* JADX WARN: Type inference failed for: r1v73 */
    /* JADX WARN: Type inference failed for: r1v74 */
    /* JADX WARN: Type inference failed for: r4v21 */
    /* JADX WARN: Type inference failed for: r4v23, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v3, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r5v35, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v11 */
    /* JADX WARN: Type inference failed for: r6v12 */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v16, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v19, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v22 */
    /* JADX WARN: Type inference failed for: r6v24, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v27 */
    /* JADX WARN: Type inference failed for: r6v3 */
    /* JADX WARN: Type inference failed for: r6v30, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r6v32 */
    /* JADX WARN: Type inference failed for: r6v33 */
    /* JADX WARN: Type inference failed for: r6v34 */
    /* JADX WARN: Type inference failed for: r6v38 */
    /* JADX WARN: Type inference failed for: r6v39 */
    /* JADX WARN: Type inference failed for: r6v4 */
    /* JADX WARN: Type inference failed for: r6v8, types: [ads_mobile_sdk.th3, java.io.Closeable, java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(sb sbVar, pi.c cVar, ContinuationImpl continuationImpl) {
        eb ebVar;
        th3 th3Var;
        ?? r62;
        em2 em2Var;
        th3 th3Var2;
        ?? r42;
        ?? r12;
        Object obj;
        pi.c cVar2;
        d dVar;
        q1 q1Var;
        t70.e0 e0Var;
        bk.e eVar;
        String str;
        q1 q1Var2;
        t70.e0 e0Var2;
        sb sbVar2;
        Ref.BooleanRef booleanRef;
        Object obj2;
        sb sbVar3;
        Ref.BooleanRef booleanRef2;
        long j11;
        pi.c cVar3;
        sb sbVar4;
        Closeable closeable;
        Ref.LongRef longRef;
        long jP;
        bk.e eVar2;
        b.i8 i8Var;
        long j12;
        gb gbVar;
        String str2;
        sb sbVar5;
        Set<String> set;
        pi.c cVar4;
        ta taVar;
        Closeable closeable2;
        d dVar2;
        Ref.LongRef longRef2;
        Unit unit;
        pi.c cVar5;
        d dVar3;
        long j13;
        ?? r63;
        sb sbVar6;
        Object obj3;
        t70.e0 e0Var3;
        q1 q1Var3;
        long jP2;
        b.i8 i8Var2;
        long j14;
        gb gbVar2;
        bk.e eVar3;
        CoroutineSingletons coroutineSingletons;
        pi.c cVar6;
        LinkedHashSet linkedHashSet;
        Ref.LongRef longRef3;
        ta taVar2;
        Object obj4;
        Closeable closeable3;
        d dVar4;
        d dVar5;
        LinkedHashSet linkedHashSet2;
        sb sbVar7;
        Object obj5;
        Iterator it;
        Unit unit2;
        int i5;
        pi.c cVar7 = cVar;
        if (!(continuationImpl instanceof eb) || (r62 = (i5 = (ebVar = (eb) continuationImpl).f2833m) & Integer.MIN_VALUE) == 0) {
            ebVar = new eb(sbVar, continuationImpl);
        } else {
            ebVar.f2833m = i5 - Integer.MIN_VALUE;
        }
        Object obj6 = ebVar.f2831k;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        int i11 = ebVar.f2833m;
        q1 q1Var4 = q1.f88853a;
        t70.e0 e0Var4 = t70.e0.f88787a;
        bk.e eVar4 = ti3.f9938b;
        try {
            try {
                switch (i11) {
                    case 0:
                        ResultKt.b(obj6);
                        kz2 kz2Var = sbVar.f9484j;
                        dVar = sbVar.f9486l;
                        EmptyList emptyListZ = ul.b.z();
                        q1Var = q1Var4;
                        e0Var = e0Var4;
                        mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                        th3 th3VarC = ji3.c();
                        wv0 wv0Var = wv0.CUI_NAME_SDKINIT_OVERALL_ADAPTER_INIT;
                        if (th3VarC == null) {
                            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyListZ, mi3Var);
                            try {
                                Ref.BooleanRef booleanRef3 = new Ref.BooleanRef();
                                ebVar.f2823a = sbVar;
                                ebVar.f2824b = null;
                                ebVar.f2825c = cVar7;
                                ebVar.f2826d = em2VarA;
                                ebVar.f2827e = em2VarA;
                                ebVar.f2828f = booleanRef3;
                                ebVar.f2829g = dVar;
                                ebVar.f2833m = 1;
                                if (dVar.e(ebVar) != coroutineSingletons2) {
                                    sbVar3 = sbVar;
                                    th3Var = em2VarA;
                                    booleanRef2 = booleanRef3;
                                    r62 = th3Var;
                                    try {
                                        j11 = sbVar3.o;
                                        Duration.f72038b.getClass();
                                        Duration.Companion.a();
                                        pi.c cVar8 = cVar7;
                                        if (Duration.d(j11, 0L)) {
                                            booleanRef2.f71859a = true;
                                            sbVar3.f9482h.getClass();
                                            sbVar3.o = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
                                        }
                                        Unit unit3 = Unit.f71706a;
                                        dVar.g(null);
                                        if (!booleanRef2.f71859a) {
                                            sbVar3.f9485k.a();
                                        }
                                        cVar3 = cVar8;
                                        sbVar4 = sbVar3;
                                        closeable = r62;
                                        jr0 jr0Var = sbVar4.f9483i;
                                        ia iaVarO = ta.o();
                                        Intrinsics.f(iaVarO, "newBuilder(...)");
                                        ta taVar3 = (ta) iaVarO.a();
                                        ji3.a().e().K = taVar3;
                                        LinkedHashSet linkedHashSet3 = new LinkedHashSet();
                                        if (booleanRef2.f71859a) {
                                            sbVar4.f9485k.a();
                                        }
                                        longRef = new Ref.LongRef();
                                        jP = jr0Var.p();
                                        longRef.f71862a = jP;
                                        Duration.f72038b.getClass();
                                        Duration.Companion.a();
                                        eVar2 = eVar4;
                                        if (Duration.c(jP, 0L) <= 0) {
                                            longRef.f71862a = jr0Var.p();
                                        }
                                        i8Var = rw0.f9327f;
                                        j12 = longRef.f71862a;
                                        str2 = "getInitializedAdapterClassesList(...)";
                                        gbVar = new gb(sbVar4, linkedHashSet3, null, 0);
                                        ebVar.f2823a = sbVar4;
                                        ebVar.f2824b = cVar3;
                                        ebVar.f2825c = th3Var;
                                        ebVar.f2826d = closeable;
                                        ebVar.f2827e = taVar3;
                                        ebVar.f2828f = longRef;
                                        ebVar.f2829g = linkedHashSet3;
                                        ebVar.f2830h = null;
                                        ebVar.f2833m = 4;
                                        if (i8Var.n(j12, gbVar, ebVar) != coroutineSingletons2) {
                                            sbVar5 = sbVar4;
                                            set = linkedHashSet3;
                                            cVar4 = cVar3;
                                            taVar = taVar3;
                                            closeable2 = closeable;
                                            dVar2 = sbVar5.f9486l;
                                            ebVar.f2823a = sbVar5;
                                            ebVar.f2824b = cVar4;
                                            ebVar.f2825c = th3Var;
                                            ebVar.f2826d = closeable2;
                                            ebVar.f2827e = taVar;
                                            ebVar.f2828f = longRef;
                                            ebVar.f2829g = set;
                                            ebVar.f2830h = dVar2;
                                            ebVar.f2833m = 5;
                                            if (dVar2.e(ebVar) != coroutineSingletons2) {
                                                longRef2 = longRef;
                                                r62 = closeable2;
                                                try {
                                                    for (String str3 : set) {
                                                        ma maVar = (ma) sbVar5.f9487m.get(str3);
                                                        if (maVar != null && ul.b.Q(pi.a.f82594a, pi.a.f82595b).contains(maVar.f7059a.getInitializationState())) {
                                                            wb wbVar = sbVar5.f9479e;
                                                            LinkedHashMap linkedHashMap = sbVar5.f9487m;
                                                            ti.c cVar9 = maVar.f7060b;
                                                            va vaVarE = fb.e(pi.a.f82597d, "Timeout.", (int) Duration.h(longRef2.f71862a));
                                                            long jA = sbVar5.a();
                                                            wbVar.getClass();
                                                            wb.a(linkedHashMap, str3, cVar9, vaVarE, jA);
                                                        }
                                                    }
                                                    Unit unit4 = Unit.f71706a;
                                                    dVar2.g(null);
                                                    cc2 cc2VarE = ji3.a().e();
                                                    ia iaVar = (ia) taVar.n();
                                                    Intrinsics.f(iaVar.d(), str2);
                                                    iaVar.c(set);
                                                    Unit unit5 = Unit.f71706a;
                                                    cc2VarE.K = (ta) iaVar.a();
                                                    if (cVar4 == null) {
                                                        b.i8 i8Var3 = rw0.f9327f;
                                                        m0.t(k0.a(t70.c2.f88780b.plus(ebVar.getContext()).minusKey(eVar2).minusKey(e0Var).minusKey(q1Var)), null, null, new androidx.room.p((Continuation) null, cVar4, sbVar5, set), 3);
                                                        unit = unit5;
                                                    } else {
                                                        unit = null;
                                                    }
                                                    CloseableKt.a(r62, null);
                                                    return unit;
                                                } finally {
                                                    dVar2.g(null);
                                                }
                                            }
                                        }
                                    } catch (Throwable th2) {
                                        dVar.g(null);
                                        throw th2;
                                    }
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                em2 em2Var2 = em2VarA;
                                th3Var2 = em2Var2;
                                em2Var = em2Var2;
                                try {
                                    th3Var2.b(th);
                                    if (th instanceof b.a4) {
                                    }
                                } finally {
                                    try {
                                        throw th;
                                    } catch (Throwable th4) {
                                        CloseableKt.a(em2Var, th);
                                    }
                                }
                            }
                        } else {
                            eVar = eVar4;
                            str = "getInitializedAdapterClassesList(...)";
                            q1Var2 = q1Var;
                            e0Var2 = e0Var;
                            ?? A2 = ji3.a(wv0Var, ul.b.z(), true);
                            try {
                                Ref.BooleanRef booleanRef4 = new Ref.BooleanRef();
                                ebVar.f2823a = sbVar;
                                ebVar.f2824b = null;
                                ebVar.f2825c = cVar7;
                                ebVar.f2826d = A2;
                                ebVar.f2827e = A2;
                                ebVar.f2828f = booleanRef4;
                                ebVar.f2829g = dVar;
                                ebVar.f2833m = 6;
                                if (dVar.e(ebVar) != coroutineSingletons2) {
                                    sbVar2 = sbVar;
                                    booleanRef = booleanRef4;
                                    obj2 = A2;
                                    cVar5 = A2;
                                    try {
                                        try {
                                            j13 = sbVar2.o;
                                            Duration.f72038b.getClass();
                                            Duration.Companion.a();
                                            dVar3 = dVar;
                                            cVar = cVar5;
                                            try {
                                                if (Duration.d(j13, 0L)) {
                                                    booleanRef.f71859a = true;
                                                    sbVar2.f9482h.getClass();
                                                    sbVar2.o = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
                                                }
                                                Unit unit6 = Unit.f71706a;
                                                dVar3.g(null);
                                                if (!booleanRef.f71859a) {
                                                    sbVar2.f9485k.a();
                                                }
                                                r63 = cVar;
                                                sbVar6 = sbVar2;
                                                obj3 = obj2;
                                                jr0 jr0Var2 = sbVar6.f9483i;
                                                ia iaVarO2 = ta.o();
                                                Intrinsics.f(iaVarO2, "newBuilder(...)");
                                                ta taVar4 = (ta) iaVarO2.a();
                                                ji3.a().e().K = taVar4;
                                                LinkedHashSet linkedHashSet4 = new LinkedHashSet();
                                                if (booleanRef.f71859a) {
                                                    sbVar6.f9485k.a();
                                                }
                                                Ref.LongRef longRef4 = new Ref.LongRef();
                                                e0Var3 = e0Var2;
                                                q1Var3 = q1Var2;
                                                jP2 = jr0Var2.p();
                                                longRef4.f71862a = jP2;
                                                Duration.f72038b.getClass();
                                                Duration.Companion.a();
                                                if (Duration.c(jP2, 0L) <= 0) {
                                                    longRef4.f71862a = jr0Var2.p();
                                                }
                                                i8Var2 = rw0.f9327f;
                                                j14 = longRef4.f71862a;
                                                eVar3 = eVar;
                                                gbVar2 = new gb(sbVar6, linkedHashSet4, null, 0);
                                                ebVar.f2823a = sbVar6;
                                                ebVar.f2824b = cVar7;
                                                ebVar.f2825c = obj3;
                                                ebVar.f2826d = r63;
                                                ebVar.f2827e = taVar4;
                                                ebVar.f2828f = longRef4;
                                                ebVar.f2829g = linkedHashSet4;
                                                ebVar.f2830h = null;
                                                ebVar.f2833m = 9;
                                                coroutineSingletons = coroutineSingletons2;
                                                if (i8Var2.n(j14, gbVar2, ebVar) == coroutineSingletons) {
                                                    return coroutineSingletons;
                                                }
                                                cVar6 = cVar7;
                                                linkedHashSet = linkedHashSet4;
                                                longRef3 = longRef4;
                                                taVar2 = taVar4;
                                                closeable3 = r63;
                                                obj4 = obj3;
                                                dVar4 = sbVar6.f9486l;
                                                ebVar.f2823a = sbVar6;
                                                ebVar.f2824b = cVar6;
                                                ebVar.f2825c = obj4;
                                                ebVar.f2826d = closeable3;
                                                ebVar.f2827e = taVar2;
                                                ebVar.f2828f = longRef3;
                                                ebVar.f2829g = linkedHashSet;
                                                ebVar.f2830h = dVar4;
                                                ebVar.f2833m = 10;
                                                if (dVar4.e(ebVar) != coroutineSingletons) {
                                                    return coroutineSingletons;
                                                }
                                                LinkedHashSet linkedHashSet5 = linkedHashSet;
                                                dVar5 = dVar4;
                                                linkedHashSet2 = linkedHashSet5;
                                                sbVar7 = sbVar6;
                                                r62 = closeable3;
                                                obj5 = obj4;
                                                try {
                                                    try {
                                                        it = linkedHashSet2.iterator();
                                                        while (it.hasNext()) {
                                                            String str4 = (String) it.next();
                                                            ma maVar2 = (ma) sbVar7.f9487m.get(str4);
                                                            if (maVar2 != null && ul.b.Q(pi.a.f82594a, pi.a.f82595b).contains(maVar2.f7059a.getInitializationState())) {
                                                                wb wbVar2 = sbVar7.f9479e;
                                                                LinkedHashMap linkedHashMap2 = sbVar7.f9487m;
                                                                ti.c cVar10 = maVar2.f7060b;
                                                                Iterator it2 = it;
                                                                Object obj7 = obj5;
                                                                try {
                                                                    va vaVarE2 = fb.e(pi.a.f82597d, "Timeout.", (int) Duration.h(longRef3.f71862a));
                                                                    long jA2 = sbVar7.a();
                                                                    wbVar2.getClass();
                                                                    wb.a(linkedHashMap2, str4, cVar10, vaVarE2, jA2);
                                                                    it = it2;
                                                                    obj5 = obj7;
                                                                } catch (Throwable th5) {
                                                                    th = th5;
                                                                    throw th;
                                                                }
                                                            }
                                                        }
                                                        Unit unit7 = Unit.f71706a;
                                                        dVar5.g(null);
                                                        cc2 cc2VarE2 = ji3.a().e();
                                                        ia iaVar2 = (ia) taVar2.n();
                                                        Intrinsics.f(iaVar2.d(), str);
                                                        iaVar2.c(linkedHashSet2);
                                                        Unit unit8 = Unit.f71706a;
                                                        cc2VarE2.K = (ta) iaVar2.a();
                                                        if (cVar6 == null) {
                                                            b.i8 i8Var4 = rw0.f9327f;
                                                            m0.t(k0.a(t70.c2.f88780b.plus(ebVar.getContext()).minusKey(eVar3).minusKey(e0Var3).minusKey(q1Var3)), null, null, new androidx.room.p((Continuation) null, cVar6, sbVar7, linkedHashSet2), 3);
                                                            unit2 = unit8;
                                                        } else {
                                                            unit2 = null;
                                                        }
                                                        CloseableKt.a(r62, null);
                                                        return unit2;
                                                    } catch (Throwable th6) {
                                                        th = th6;
                                                        obj = cVar;
                                                        cVar2 = r62;
                                                        r42 = obj;
                                                        r12 = cVar2;
                                                        try {
                                                            r42.b(th);
                                                            if (th instanceof b.a4) {
                                                            }
                                                        } finally {
                                                            try {
                                                                throw th;
                                                            } catch (Throwable th7) {
                                                                CloseableKt.a(r12, th);
                                                            }
                                                        }
                                                    }
                                                } catch (Throwable th8) {
                                                    th = th8;
                                                }
                                            } catch (Throwable th9) {
                                                th = th9;
                                                dVar3.g(null);
                                                throw th;
                                            }
                                        } catch (Throwable th10) {
                                            th = th10;
                                            dVar3 = dVar;
                                        }
                                    } catch (Throwable th11) {
                                        th = th11;
                                        cVar2 = cVar;
                                        obj = obj2;
                                        r42 = obj;
                                        r12 = cVar2;
                                        r42.b(th);
                                        if (th instanceof b.a4) {
                                        }
                                    }
                                }
                            } catch (Throwable th12) {
                                th = th12;
                                Object obj8 = A2;
                                r42 = obj8;
                                r12 = obj8;
                                r42.b(th);
                                if (th instanceof b.a4) {
                                }
                            }
                        }
                        return coroutineSingletons2;
                    case 1:
                        ?? r02 = (c80.a) ebVar.f2829g;
                        Ref.BooleanRef booleanRef5 = (Ref.BooleanRef) ebVar.f2828f;
                        Closeable closeable4 = (Closeable) ebVar.f2827e;
                        th3Var = (th3) ebVar.f2826d;
                        pi.c cVar11 = (pi.c) ebVar.f2825c;
                        c0.y(ebVar.f2824b);
                        sbVar3 = ebVar.f2823a;
                        try {
                            ResultKt.b(obj6);
                            r62 = closeable4;
                            q1Var = q1Var4;
                            e0Var = e0Var4;
                            dVar = r02;
                            booleanRef2 = booleanRef5;
                            cVar7 = cVar11;
                            j11 = sbVar3.o;
                            Duration.f72038b.getClass();
                            Duration.Companion.a();
                            pi.c cVar82 = cVar7;
                            if (Duration.d(j11, 0L)) {
                            }
                            Unit unit32 = Unit.f71706a;
                            dVar.g(null);
                            if (!booleanRef2.f71859a) {
                            }
                            cVar3 = cVar82;
                            sbVar4 = sbVar3;
                            closeable = r62;
                            jr0 jr0Var3 = sbVar4.f9483i;
                            ia iaVarO3 = ta.o();
                            Intrinsics.f(iaVarO3, "newBuilder(...)");
                            ta taVar32 = (ta) iaVarO3.a();
                            ji3.a().e().K = taVar32;
                            LinkedHashSet linkedHashSet32 = new LinkedHashSet();
                            if (booleanRef2.f71859a) {
                            }
                            longRef = new Ref.LongRef();
                            jP = jr0Var3.p();
                            longRef.f71862a = jP;
                            Duration.f72038b.getClass();
                            Duration.Companion.a();
                            eVar2 = eVar4;
                            if (Duration.c(jP, 0L) <= 0) {
                            }
                            i8Var = rw0.f9327f;
                            j12 = longRef.f71862a;
                            str2 = "getInitializedAdapterClassesList(...)";
                            gbVar = new gb(sbVar4, linkedHashSet32, null, 0);
                            ebVar.f2823a = sbVar4;
                            ebVar.f2824b = cVar3;
                            ebVar.f2825c = th3Var;
                            ebVar.f2826d = closeable;
                            ebVar.f2827e = taVar32;
                            ebVar.f2828f = longRef;
                            ebVar.f2829g = linkedHashSet32;
                            ebVar.f2830h = null;
                            ebVar.f2833m = 4;
                            if (i8Var.n(j12, gbVar, ebVar) != coroutineSingletons2) {
                            }
                        } catch (Throwable th13) {
                            th = th13;
                            r62 = closeable4;
                            em2Var = r62;
                            th3Var2 = th3Var;
                            th3Var2.b(th);
                            if (th instanceof b.a4) {
                            }
                        }
                        break;
                    case 2:
                        c80.a aVar = (c80.a) ebVar.f2829g;
                        booleanRef2 = (Ref.BooleanRef) ebVar.f2828f;
                        r62 = (Closeable) ebVar.f2827e;
                        th3Var = (th3) ebVar.f2826d;
                        cVar3 = (pi.c) ebVar.f2825c;
                        c0.y(ebVar.f2824b);
                        sbVar4 = ebVar.f2823a;
                        ResultKt.b(obj6);
                        try {
                            if (sbVar4.f9494v.isEmpty()) {
                                mu0.c("No AdapterInitializationConfig was provided when calling MobileAds.initialize, so all adapters were already initialized. Future calls to MobileAds.initializeAdapters will have no effect.", null);
                            }
                            q1Var = q1Var4;
                            e0Var = e0Var4;
                            closeable = r62;
                            jr0 jr0Var32 = sbVar4.f9483i;
                            ia iaVarO32 = ta.o();
                            Intrinsics.f(iaVarO32, "newBuilder(...)");
                            ta taVar322 = (ta) iaVarO32.a();
                            ji3.a().e().K = taVar322;
                            LinkedHashSet linkedHashSet322 = new LinkedHashSet();
                            if (booleanRef2.f71859a) {
                            }
                            longRef = new Ref.LongRef();
                            jP = jr0Var32.p();
                            longRef.f71862a = jP;
                            Duration.f72038b.getClass();
                            Duration.Companion.a();
                            eVar2 = eVar4;
                            if (Duration.c(jP, 0L) <= 0) {
                            }
                            i8Var = rw0.f9327f;
                            j12 = longRef.f71862a;
                            str2 = "getInitializedAdapterClassesList(...)";
                            gbVar = new gb(sbVar4, linkedHashSet322, null, 0);
                            ebVar.f2823a = sbVar4;
                            ebVar.f2824b = cVar3;
                            ebVar.f2825c = th3Var;
                            ebVar.f2826d = closeable;
                            ebVar.f2827e = taVar322;
                            ebVar.f2828f = longRef;
                            ebVar.f2829g = linkedHashSet322;
                            ebVar.f2830h = null;
                            ebVar.f2833m = 4;
                            if (i8Var.n(j12, gbVar, ebVar) != coroutineSingletons2) {
                            }
                        } finally {
                        }
                        break;
                    case 3:
                        ?? r13 = (Closeable) ebVar.f2827e;
                        th3Var2 = (th3) ebVar.f2826d;
                        c0.y(ebVar.f2824b);
                        sb sbVar8 = ebVar.f2823a;
                        try {
                            ResultKt.b(obj6);
                            try {
                                try {
                                    sbVar8.f9494v.add(null);
                                    throw null;
                                } catch (Throwable unused) {
                                    throw null;
                                }
                            } catch (Throwable unused2) {
                                throw null;
                            }
                        } catch (Throwable th14) {
                            th = th14;
                            em2Var = r13;
                            th3Var2.b(th);
                            if (th instanceof b.a4) {
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    th3Var2.a(th);
                                }
                                if (!(th instanceof TimeoutCancellationException)) {
                                    if (!(th instanceof CancellationException)) {
                                        if (th instanceof dv0) {
                                            throw th;
                                        }
                                        throw new iu0(th);
                                    }
                                    throw new du0(th);
                                }
                                throw new lw0(th);
                            }
                            throw th;
                        }
                    case 4:
                        Set set2 = (Set) ebVar.f2829g;
                        Ref.LongRef longRef5 = (Ref.LongRef) ebVar.f2828f;
                        taVar = (ta) ebVar.f2827e;
                        Closeable closeable5 = ebVar.f2826d;
                        th3Var = (th3) ebVar.f2825c;
                        cVar4 = ebVar.f2824b;
                        sbVar5 = ebVar.f2823a;
                        ResultKt.b(obj6);
                        set = set2;
                        longRef = longRef5;
                        q1Var = q1Var4;
                        e0Var = e0Var4;
                        eVar2 = eVar4;
                        str2 = "getInitializedAdapterClassesList(...)";
                        closeable2 = closeable5;
                        dVar2 = sbVar5.f9486l;
                        ebVar.f2823a = sbVar5;
                        ebVar.f2824b = cVar4;
                        ebVar.f2825c = th3Var;
                        ebVar.f2826d = closeable2;
                        ebVar.f2827e = taVar;
                        ebVar.f2828f = longRef;
                        ebVar.f2829g = set;
                        ebVar.f2830h = dVar2;
                        ebVar.f2833m = 5;
                        if (dVar2.e(ebVar) != coroutineSingletons2) {
                        }
                        return coroutineSingletons2;
                    case 5:
                        d dVar6 = ebVar.f2830h;
                        set = (Set) ebVar.f2829g;
                        longRef2 = (Ref.LongRef) ebVar.f2828f;
                        taVar = (ta) ebVar.f2827e;
                        Closeable closeable6 = ebVar.f2826d;
                        th3Var = (th3) ebVar.f2825c;
                        cVar4 = ebVar.f2824b;
                        sbVar5 = ebVar.f2823a;
                        ResultKt.b(obj6);
                        dVar2 = dVar6;
                        q1Var = q1Var4;
                        e0Var = e0Var4;
                        eVar2 = eVar4;
                        str2 = "getInitializedAdapterClassesList(...)";
                        r62 = closeable6;
                        while (r0.hasNext()) {
                        }
                        Unit unit42 = Unit.f71706a;
                        dVar2.g(null);
                        cc2 cc2VarE3 = ji3.a().e();
                        ia iaVar3 = (ia) taVar.n();
                        Intrinsics.f(iaVar3.d(), str2);
                        iaVar3.c(set);
                        Unit unit52 = Unit.f71706a;
                        cc2VarE3.K = (ta) iaVar3.a();
                        if (cVar4 == null) {
                        }
                        CloseableKt.a(r62, null);
                        return unit;
                    case 6:
                        ?? r03 = (c80.a) ebVar.f2829g;
                        Ref.BooleanRef booleanRef6 = (Ref.BooleanRef) ebVar.f2828f;
                        ?? r52 = (Closeable) ebVar.f2827e;
                        Object obj9 = (th3) ebVar.f2826d;
                        pi.c cVar12 = (pi.c) ebVar.f2825c;
                        c0.y(ebVar.f2824b);
                        sbVar2 = ebVar.f2823a;
                        try {
                            ResultKt.b(obj6);
                            cVar5 = r52;
                            eVar = eVar4;
                            dVar = r03;
                            booleanRef = booleanRef6;
                            cVar7 = cVar12;
                            e0Var2 = e0Var4;
                            str = "getInitializedAdapterClassesList(...)";
                            q1Var2 = q1Var4;
                            obj2 = obj9;
                            j13 = sbVar2.o;
                            Duration.f72038b.getClass();
                            Duration.Companion.a();
                            dVar3 = dVar;
                            cVar = cVar5;
                            if (Duration.d(j13, 0L)) {
                            }
                            Unit unit62 = Unit.f71706a;
                            dVar3.g(null);
                            if (!booleanRef.f71859a) {
                            }
                            r63 = cVar;
                            sbVar6 = sbVar2;
                            obj3 = obj2;
                            jr0 jr0Var22 = sbVar6.f9483i;
                            ia iaVarO22 = ta.o();
                            Intrinsics.f(iaVarO22, "newBuilder(...)");
                            ta taVar42 = (ta) iaVarO22.a();
                            ji3.a().e().K = taVar42;
                            LinkedHashSet linkedHashSet42 = new LinkedHashSet();
                            if (booleanRef.f71859a) {
                            }
                            Ref.LongRef longRef42 = new Ref.LongRef();
                            e0Var3 = e0Var2;
                            q1Var3 = q1Var2;
                            jP2 = jr0Var22.p();
                            longRef42.f71862a = jP2;
                            Duration.f72038b.getClass();
                            Duration.Companion.a();
                            if (Duration.c(jP2, 0L) <= 0) {
                            }
                            i8Var2 = rw0.f9327f;
                            j14 = longRef42.f71862a;
                            eVar3 = eVar;
                            gbVar2 = new gb(sbVar6, linkedHashSet42, null, 0);
                            ebVar.f2823a = sbVar6;
                            ebVar.f2824b = cVar7;
                            ebVar.f2825c = obj3;
                            ebVar.f2826d = r63;
                            ebVar.f2827e = taVar42;
                            ebVar.f2828f = longRef42;
                            ebVar.f2829g = linkedHashSet42;
                            ebVar.f2830h = null;
                            ebVar.f2833m = 9;
                            coroutineSingletons = coroutineSingletons2;
                            if (i8Var2.n(j14, gbVar2, ebVar) == coroutineSingletons) {
                            }
                        } catch (Throwable th15) {
                            th = th15;
                            cVar2 = r52;
                            obj = obj9;
                            r42 = obj;
                            r12 = cVar2;
                            r42.b(th);
                            if (th instanceof b.a4) {
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    r42.a(th);
                                }
                                if (!(th instanceof TimeoutCancellationException)) {
                                    if (!(th instanceof CancellationException)) {
                                        if (th instanceof dv0) {
                                            throw th;
                                        }
                                        throw new iu0(th);
                                    }
                                    throw new du0(th);
                                }
                                throw new lw0(th);
                            }
                            throw th;
                        }
                        break;
                    case 7:
                        c80.a aVar2 = (c80.a) ebVar.f2829g;
                        booleanRef = (Ref.BooleanRef) ebVar.f2828f;
                        Closeable closeable7 = (Closeable) ebVar.f2827e;
                        Object obj10 = (th3) ebVar.f2826d;
                        pi.c cVar13 = (pi.c) ebVar.f2825c;
                        c0.y(ebVar.f2824b);
                        sbVar6 = ebVar.f2823a;
                        try {
                            ResultKt.b(obj6);
                            try {
                                if (sbVar6.f9494v.isEmpty()) {
                                    mu0.c("No AdapterInitializationConfig was provided when calling MobileAds.initialize, so all adapters were already initialized. Future calls to MobileAds.initializeAdapters will have no effect.", null);
                                }
                                cVar7 = cVar13;
                                eVar = eVar4;
                                obj3 = obj10;
                                e0Var2 = e0Var4;
                                str = "getInitializedAdapterClassesList(...)";
                                r63 = closeable7;
                                q1Var2 = q1Var4;
                                jr0 jr0Var222 = sbVar6.f9483i;
                                ia iaVarO222 = ta.o();
                                Intrinsics.f(iaVarO222, "newBuilder(...)");
                                ta taVar422 = (ta) iaVarO222.a();
                                ji3.a().e().K = taVar422;
                                LinkedHashSet linkedHashSet422 = new LinkedHashSet();
                                if (booleanRef.f71859a) {
                                }
                                Ref.LongRef longRef422 = new Ref.LongRef();
                                e0Var3 = e0Var2;
                                q1Var3 = q1Var2;
                                jP2 = jr0Var222.p();
                                longRef422.f71862a = jP2;
                                Duration.f72038b.getClass();
                                Duration.Companion.a();
                                if (Duration.c(jP2, 0L) <= 0) {
                                }
                                i8Var2 = rw0.f9327f;
                                j14 = longRef422.f71862a;
                                eVar3 = eVar;
                                gbVar2 = new gb(sbVar6, linkedHashSet422, null, 0);
                                ebVar.f2823a = sbVar6;
                                ebVar.f2824b = cVar7;
                                ebVar.f2825c = obj3;
                                ebVar.f2826d = r63;
                                ebVar.f2827e = taVar422;
                                ebVar.f2828f = longRef422;
                                ebVar.f2829g = linkedHashSet422;
                                ebVar.f2830h = null;
                                ebVar.f2833m = 9;
                                coroutineSingletons = coroutineSingletons2;
                                if (i8Var2.n(j14, gbVar2, ebVar) == coroutineSingletons) {
                                }
                            } finally {
                            }
                        } catch (Throwable th16) {
                            th = th16;
                            r12 = closeable7;
                            r42 = obj10;
                            r42.b(th);
                            if (th instanceof b.a4) {
                            }
                        }
                        break;
                    case 8:
                        Closeable closeable8 = (Closeable) ebVar.f2827e;
                        r42 = (th3) ebVar.f2826d;
                        c0.y(ebVar.f2824b);
                        sb sbVar9 = ebVar.f2823a;
                        try {
                            ResultKt.b(obj6);
                            sbVar9.f9494v.add(null);
                            throw null;
                        } catch (Throwable th17) {
                            th = th17;
                            r12 = closeable8;
                            r42.b(th);
                            if (th instanceof b.a4) {
                            }
                        }
                        break;
                    case 9:
                        ?? r04 = (Set) ebVar.f2829g;
                        Ref.LongRef longRef6 = (Ref.LongRef) ebVar.f2828f;
                        taVar2 = (ta) ebVar.f2827e;
                        Closeable closeable9 = ebVar.f2826d;
                        Object obj11 = (th3) ebVar.f2825c;
                        cVar6 = ebVar.f2824b;
                        sb sbVar10 = ebVar.f2823a;
                        ResultKt.b(obj6);
                        q1Var3 = q1Var4;
                        e0Var3 = e0Var4;
                        eVar3 = eVar4;
                        str = "getInitializedAdapterClassesList(...)";
                        sbVar6 = sbVar10;
                        coroutineSingletons = coroutineSingletons2;
                        longRef3 = longRef6;
                        linkedHashSet = r04;
                        closeable3 = closeable9;
                        obj4 = obj11;
                        dVar4 = sbVar6.f9486l;
                        ebVar.f2823a = sbVar6;
                        ebVar.f2824b = cVar6;
                        ebVar.f2825c = obj4;
                        ebVar.f2826d = closeable3;
                        ebVar.f2827e = taVar2;
                        ebVar.f2828f = longRef3;
                        ebVar.f2829g = linkedHashSet;
                        ebVar.f2830h = dVar4;
                        ebVar.f2833m = 10;
                        if (dVar4.e(ebVar) != coroutineSingletons) {
                        }
                        break;
                    case 10:
                        d dVar7 = ebVar.f2830h;
                        ?? r14 = (Set) ebVar.f2829g;
                        longRef3 = (Ref.LongRef) ebVar.f2828f;
                        taVar2 = (ta) ebVar.f2827e;
                        Closeable closeable10 = ebVar.f2826d;
                        Object obj12 = (th3) ebVar.f2825c;
                        cVar6 = ebVar.f2824b;
                        sbVar7 = ebVar.f2823a;
                        ResultKt.b(obj6);
                        dVar5 = dVar7;
                        linkedHashSet2 = r14;
                        q1Var3 = q1Var4;
                        e0Var3 = e0Var4;
                        eVar3 = eVar4;
                        str = "getInitializedAdapterClassesList(...)";
                        r62 = closeable10;
                        obj5 = obj12;
                        it = linkedHashSet2.iterator();
                        while (it.hasNext()) {
                        }
                        Unit unit72 = Unit.f71706a;
                        dVar5.g(null);
                        cc2 cc2VarE22 = ji3.a().e();
                        ia iaVar22 = (ia) taVar2.n();
                        Intrinsics.f(iaVar22.d(), str);
                        iaVar22.c(linkedHashSet2);
                        Unit unit82 = Unit.f71706a;
                        cc2VarE22.K = (ta) iaVar22.a();
                        if (cVar6 == null) {
                        }
                        CloseableKt.a(r62, null);
                        return unit2;
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (Throwable th18) {
                th = th18;
            }
        } catch (Throwable th19) {
            th = th19;
            em2Var = r62;
            th3Var2 = th3Var;
            th3Var2.b(th);
            if (th instanceof b.a4) {
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0193  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x01d4  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0213  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0218  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0242 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(b.kb kbVar, String str, oa oaVar, ContinuationImpl continuationImpl) throws Throwable {
        kb kbVar2;
        ti.c cVar;
        String str2;
        oa oaVar2;
        Object obj;
        b.kb kbVar3;
        sb sbVar;
        ti.c cVar2;
        sb sbVar2;
        o2 o2Var;
        String str3;
        ti.c cVar3;
        long j11;
        long jH;
        b.a1 a1Var;
        Pair pair;
        String str4;
        d dVar;
        d dVar2;
        pi.a aVar;
        String str5;
        String str6;
        b.a1 a1Var2;
        sb sbVar3;
        Object obj2;
        if (continuationImpl instanceof kb) {
            kbVar2 = (kb) continuationImpl;
            int i5 = kbVar2.f5642k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kbVar2.f5642k = i5 - Integer.MIN_VALUE;
            } else {
                kbVar2 = new kb(this, continuationImpl);
            }
        }
        Object obj3 = kbVar2.f5640i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kbVar2.f5642k;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj3);
                if (kbVar instanceof i61) {
                    i61 i61Var = (i61) kbVar;
                    cVar = new ti.c(i61Var.f4639a.getVersionInfo().toString(), i61Var.f4639a.getSDKVersionInfo().toString());
                } else {
                    cVar = null;
                }
                kbVar2.f5632a = this;
                kbVar2.f5633b = kbVar;
                kbVar2.f5634c = str;
                kbVar2.f5635d = oaVar;
                kbVar2.f5636e = cVar;
                d dVar3 = this.f9486l;
                kbVar2.f5637f = dVar3;
                kbVar2.f5642k = 1;
                if (dVar3.e(kbVar2) != coroutineSingletons) {
                    str2 = str;
                    oaVar2 = oaVar;
                    obj = dVar3;
                    kbVar3 = kbVar;
                    sbVar = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 == 2) {
                    j11 = kbVar2.f5639h;
                    o2Var = (o2) kbVar2.f5635d;
                    ti.c cVar4 = (ti.c) kbVar2.f5634c;
                    String str7 = (String) kbVar2.f5633b;
                    sb sbVar4 = kbVar2.f5632a;
                    ResultKt.b(obj3);
                    str3 = str7;
                    sbVar2 = sbVar4;
                    cVar3 = cVar4;
                    Duration.Companion companion = Duration.f72038b;
                    o2Var.getClass();
                    jH = DurationKt.h(SystemClock.elapsedRealtime() - j11, DurationUnit.f72045d);
                    a1Var = (b.a1) obj3;
                    sbVar2.getClass();
                    if (!(a1Var instanceof xu0)) {
                        pair = new Pair(pi.a.f82596c, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    } else {
                        if (!(a1Var instanceof pu0)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        pair = new Pair(pi.a.f82598e, t2.y((pu0) a1Var));
                    }
                    pi.a aVar2 = (pi.a) pair.f71683a;
                    str4 = (String) pair.f71684b;
                    dVar = sbVar2.f9486l;
                    kbVar2.f5632a = sbVar2;
                    kbVar2.f5633b = str3;
                    kbVar2.f5634c = cVar3;
                    kbVar2.f5635d = a1Var;
                    kbVar2.f5636e = aVar2;
                    kbVar2.f5637f = str4;
                    kbVar2.f5638g = dVar;
                    kbVar2.f5639h = jH;
                    kbVar2.f5642k = 3;
                    if (dVar.e(kbVar2) != coroutineSingletons) {
                        dVar2 = dVar;
                        aVar = aVar2;
                        ti.c cVar5 = cVar3;
                        str5 = str3;
                        wb wbVar = sbVar2.f9479e;
                        LinkedHashMap linkedHashMap = sbVar2.f9487m;
                        va vaVarE = fb.e(aVar, str4, (int) Duration.h(jH));
                        long jA = sbVar2.a();
                        wbVar.getClass();
                        wb.a(linkedHashMap, str5, cVar5, vaVarE, jA);
                        Unit unit = Unit.f71706a;
                        dVar2.g(null);
                        kbVar2.f5632a = sbVar2;
                        kbVar2.f5633b = str5;
                        kbVar2.f5634c = a1Var;
                        kbVar2.f5635d = aVar;
                        kbVar2.f5636e = null;
                        kbVar2.f5637f = null;
                        kbVar2.f5638g = null;
                        kbVar2.f5642k = 4;
                        if (sbVar2.b(kbVar2) != coroutineSingletons) {
                        }
                    }
                    return coroutineSingletons;
                }
                if (i11 == 3) {
                    jH = kbVar2.f5639h;
                    d dVar4 = kbVar2.f5638g;
                    str4 = (String) kbVar2.f5637f;
                    pi.a aVar3 = (pi.a) kbVar2.f5636e;
                    a1Var = (b.a1) kbVar2.f5635d;
                    cVar3 = (ti.c) kbVar2.f5634c;
                    str3 = (String) kbVar2.f5633b;
                    sbVar2 = kbVar2.f5632a;
                    ResultKt.b(obj3);
                    dVar2 = dVar4;
                    aVar = aVar3;
                    ti.c cVar52 = cVar3;
                    str5 = str3;
                    try {
                        wb wbVar2 = sbVar2.f9479e;
                        LinkedHashMap linkedHashMap2 = sbVar2.f9487m;
                        va vaVarE2 = fb.e(aVar, str4, (int) Duration.h(jH));
                        long jA2 = sbVar2.a();
                        wbVar2.getClass();
                        wb.a(linkedHashMap2, str5, cVar52, vaVarE2, jA2);
                        Unit unit2 = Unit.f71706a;
                        dVar2.g(null);
                        kbVar2.f5632a = sbVar2;
                        kbVar2.f5633b = str5;
                        kbVar2.f5634c = a1Var;
                        kbVar2.f5635d = aVar;
                        kbVar2.f5636e = null;
                        kbVar2.f5637f = null;
                        kbVar2.f5638g = null;
                        kbVar2.f5642k = 4;
                        if (sbVar2.b(kbVar2) != coroutineSingletons) {
                            str6 = str5;
                            if (aVar == pi.a.f82596c) {
                            }
                        }
                        return coroutineSingletons;
                    } catch (Throwable th2) {
                        dVar2.g(null);
                        throw th2;
                    }
                }
                if (i11 != 4) {
                    if (i11 != 5) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    Object obj4 = (c80.a) kbVar2.f5635d;
                    a1Var2 = (b.a1) kbVar2.f5634c;
                    str6 = (String) kbVar2.f5633b;
                    sbVar3 = kbVar2.f5632a;
                    ResultKt.b(obj3);
                    obj2 = obj4;
                    Object obj5 = obj2;
                    try {
                        sbVar3.f9495w.add(str6);
                        return a1Var2;
                    } finally {
                        ((d) obj5).g(null);
                    }
                }
                aVar = (pi.a) kbVar2.f5635d;
                b.a1 a1Var3 = (b.a1) kbVar2.f5634c;
                String str8 = (String) kbVar2.f5633b;
                sb sbVar5 = kbVar2.f5632a;
                ResultKt.b(obj3);
                a1Var = a1Var3;
                str6 = str8;
                sbVar2 = sbVar5;
                if (aVar == pi.a.f82596c) {
                    return a1Var;
                }
                d dVar5 = sbVar2.f9493u;
                kbVar2.f5632a = sbVar2;
                kbVar2.f5633b = str6;
                kbVar2.f5634c = a1Var;
                kbVar2.f5635d = dVar5;
                kbVar2.f5642k = 5;
                if (dVar5.e(kbVar2) != coroutineSingletons) {
                    a1Var2 = a1Var;
                    sbVar3 = sbVar2;
                    obj2 = dVar5;
                    Object obj52 = obj2;
                    sbVar3.f9495w.add(str6);
                    return a1Var2;
                }
                return coroutineSingletons;
            }
            Object obj6 = (c80.a) kbVar2.f5637f;
            cVar = (ti.c) kbVar2.f5636e;
            oa oaVar3 = (oa) kbVar2.f5635d;
            String str9 = (String) kbVar2.f5634c;
            kbVar3 = (b.kb) kbVar2.f5633b;
            sb sbVar6 = kbVar2.f5632a;
            ResultKt.b(obj3);
            obj = obj6;
            oaVar2 = oaVar3;
            str2 = str9;
            sbVar = sbVar6;
            wb wbVar3 = sbVar.f9479e;
            LinkedHashMap linkedHashMap3 = sbVar.f9487m;
            va vaVarH = fb.h(pi.a.f82595b, "The adapter is still initializing.", 4);
            wbVar3.getClass();
            wb.a(linkedHashMap3, str2, cVar2, vaVarH, 0L);
            String str10 = str2;
            Unit unit3 = Unit.f71706a;
            ((d) obj).g(null);
            Object objB = sbVar.f9480f.b();
            if (objB == null) {
                objB = sbVar.f9477c;
            }
            Object obj7 = objB;
            b.i8 i8Var = rw0.f9327f;
            o2 o2Var2 = sbVar.f9482h;
            o2Var2.getClass();
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            CoroutineContext coroutineContext = sbVar.f9476b;
            b0 b0Var = new b0(kbVar3, obj7, oaVar2, continuation, 9);
            kbVar2.f5632a = sbVar;
            kbVar2.f5633b = str10;
            kbVar2.f5634c = cVar2;
            kbVar2.f5635d = o2Var2;
            kbVar2.f5636e = null;
            kbVar2.f5637f = null;
            kbVar2.f5639h = jElapsedRealtime;
            kbVar2.f5642k = 2;
            Object objY = m0.y(coroutineContext, b0Var, kbVar2);
            if (objY != coroutineSingletons) {
                sbVar2 = sbVar;
                o2Var = o2Var2;
                str3 = str10;
                obj3 = objY;
                cVar3 = cVar2;
                j11 = jElapsedRealtime;
                Duration.Companion companion2 = Duration.f72038b;
                o2Var.getClass();
                jH = DurationKt.h(SystemClock.elapsedRealtime() - j11, DurationUnit.f72045d);
                a1Var = (b.a1) obj3;
                sbVar2.getClass();
                if (!(a1Var instanceof xu0)) {
                }
                pi.a aVar22 = (pi.a) pair.f71683a;
                str4 = (String) pair.f71684b;
                dVar = sbVar2.f9486l;
                kbVar2.f5632a = sbVar2;
                kbVar2.f5633b = str3;
                kbVar2.f5634c = cVar3;
                kbVar2.f5635d = a1Var;
                kbVar2.f5636e = aVar22;
                kbVar2.f5637f = str4;
                kbVar2.f5638g = dVar;
                kbVar2.f5639h = jH;
                kbVar2.f5642k = 3;
                if (dVar.e(kbVar2) != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            ((d) obj).g(null);
            throw th3;
        }
        cVar2 = cVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(sb sbVar, ni.q qVar, String str, ContinuationImpl continuationImpl) {
        mb mbVar;
        d dVar;
        if (continuationImpl instanceof mb) {
            mbVar = (mb) continuationImpl;
            int i5 = mbVar.f7074g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mbVar.f7074g = i5 - Integer.MIN_VALUE;
            } else {
                mbVar = new mb(sbVar, continuationImpl);
            }
        }
        Object obj = mbVar.f7072e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mbVar.f7074g;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = sbVar.f9493u;
            mbVar.f7070b = qVar;
            mbVar.f7071d = dVar;
            mbVar.f7074g = 1;
            if (dVar.e(mbVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = mbVar.f7071d;
            qVar = mbVar.f7070b;
            ResultKt.b(obj);
        }
        try {
            qVar.getClass();
            return Boolean.TRUE;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(sb sbVar, va vaVar, ContinuationImpl continuationImpl) {
        pb pbVar;
        d dVar;
        if (continuationImpl instanceof pb) {
            pbVar = (pb) continuationImpl;
            int i5 = pbVar.f8153f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pbVar.f8153f = i5 - Integer.MIN_VALUE;
            } else {
                pbVar = new pb(sbVar, continuationImpl);
            }
        }
        Object obj = pbVar.f8151d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pbVar.f8153f;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = sbVar.f9486l;
            pbVar.f8148a = sbVar;
            pbVar.f8149b = vaVar;
            pbVar.f8150c = dVar;
            pbVar.f8153f = 1;
            if (dVar.e(pbVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = pbVar.f8150c;
            vaVar = pbVar.f8149b;
            sb sbVar2 = pbVar.f8148a;
            ResultKt.b(obj);
            dVar = dVar2;
            sbVar = sbVar2;
        }
        try {
            sbVar.f9488p = vaVar;
            Duration.Companion companion = Duration.f72038b;
            sbVar.f9482h.getClass();
            sbVar.f9489q = Duration.l(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), sbVar.o);
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        qb qbVar;
        sb sbVar;
        d dVar;
        if (continuationImpl instanceof qb) {
            qbVar = (qb) continuationImpl;
            int i5 = qbVar.f8546e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qbVar.f8546e = i5 - Integer.MIN_VALUE;
            } else {
                qbVar = new qb(this, continuationImpl);
            }
        }
        Object obj = qbVar.f8544c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qbVar.f8546e;
        if (i11 == 0) {
            ResultKt.b(obj);
            qbVar.f8542a = this;
            d dVar2 = this.f9486l;
            qbVar.f8543b = dVar2;
            qbVar.f8546e = 1;
            if (dVar2.e(qbVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            sbVar = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = qbVar.f8543b;
            sbVar = qbVar.f8542a;
            ResultKt.b(obj);
        }
        try {
            if (sbVar.f9491s == 0) {
                long j11 = sbVar.f9492t;
                Duration.f72038b.getClass();
                if (Duration.d(j11, 0L)) {
                    sbVar.f9492t = sbVar.o;
                } else {
                    sbVar.f9482h.getClass();
                    sbVar.f9492t = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
                }
            }
            sbVar.f9491s++;
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
