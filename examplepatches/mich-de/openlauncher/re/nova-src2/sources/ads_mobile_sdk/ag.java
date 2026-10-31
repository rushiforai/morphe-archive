package ads_mobile_sdk;

import b.d0;
import b.e6;
import b.e7;
import b.ed;
import b.o2;
import b.q3;
import b.yc;
import b0.b0;
import b80.f;
import c80.d;
import java.io.Closeable;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.comparisons.ComparisonsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.t0;
import v70.i;
import v70.o;

/* loaded from: classes.dex */
public final class ag extends c61 implements b.db {

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f958c;

    /* renamed from: d, reason: collision with root package name */
    public final t70.j0 f959d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f960e;

    /* renamed from: f, reason: collision with root package name */
    public final o2 f961f;

    /* renamed from: g, reason: collision with root package name */
    public final e6 f962g;

    /* renamed from: h, reason: collision with root package name */
    public final we f963h;

    /* renamed from: i, reason: collision with root package name */
    public final df f964i;

    /* renamed from: j, reason: collision with root package name */
    public final kz2 f965j;

    /* renamed from: k, reason: collision with root package name */
    public long f966k;

    /* renamed from: l, reason: collision with root package name */
    public long f967l;

    /* renamed from: m, reason: collision with root package name */
    public long f968m;
    public final AtomicBoolean n;
    public t70.g2 o;

    /* renamed from: p, reason: collision with root package name */
    public t70.g2 f969p;

    /* renamed from: q, reason: collision with root package name */
    public Cif f970q;

    /* renamed from: r, reason: collision with root package name */
    public final e7 f971r;

    /* renamed from: s, reason: collision with root package name */
    public kv0 f972s;

    /* renamed from: t, reason: collision with root package name */
    public String f973t;

    /* renamed from: u, reason: collision with root package name */
    public final d f974u;

    /* renamed from: v, reason: collision with root package name */
    public long f975v;

    /* renamed from: w, reason: collision with root package name */
    public final i f976w;

    /* renamed from: x, reason: collision with root package name */
    public final d f977x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f978y;

    /* renamed from: z, reason: collision with root package name */
    public long f979z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ag(t70.j0 backgroundScope, t70.j0 uiScope, jr0 flags, o2 clock, e6 httpClient, we anrDataCollector, df anrLogsDataStore, kz2 rootTraceCreator) {
        super((wv0) null, 1);
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(anrDataCollector, "anrDataCollector");
        Intrinsics.g(anrLogsDataStore, "anrLogsDataStore");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        this.f958c = backgroundScope;
        this.f959d = uiScope;
        this.f960e = flags;
        this.f961f = clock;
        this.f962g = httpClient;
        this.f963h = anrDataCollector;
        this.f964i = anrLogsDataStore;
        this.f965j = rootTraceCreator;
        Duration.f72038b.getClass();
        this.f966k = 0L;
        this.f967l = 0L;
        this.f968m = 0L;
        this.n = new AtomicBoolean(false);
        this.f970q = Cif.f4757a;
        this.f971r = qv0.o();
        this.f974u = new d();
        this.f975v = 0L;
        this.f976w = o.b(0, 7, null);
        this.f977x = new d();
        this.f978y = true;
        this.f979z = 0L;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(ag agVar, ContinuationImpl continuationImpl) {
        nf nfVar;
        if (continuationImpl instanceof nf) {
            nfVar = (nf) continuationImpl;
            int i5 = nfVar.f7548d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nfVar.f7548d = i5 - Integer.MIN_VALUE;
            } else {
                nfVar = new nf(agVar, continuationImpl);
            }
        }
        Object obj = nfVar.f7546b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nfVar.f7548d;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            agVar = nfVar.f7545a;
        }
        ResultKt.b(obj);
        while (agVar.n.get()) {
            m0.t(agVar.f959d, null, null, new b0(agVar, (Continuation) null, 15), 3);
            long j11 = agVar.f968m;
            nfVar.f7545a = agVar;
            nfVar.f7548d = 1;
            if (t0.c(j11, nfVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x004b, code lost:
    
        if (r7 == r1) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(ag agVar, ContinuationImpl continuationImpl) {
        wf wfVar;
        Map map;
        ag agVar2;
        Iterator it;
        if (continuationImpl instanceof wf) {
            wfVar = (wf) continuationImpl;
            int i5 = wfVar.f11255f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wfVar.f11255f = i5 - Integer.MIN_VALUE;
            } else {
                wfVar = new wf(agVar, continuationImpl);
            }
        }
        Object objA = wfVar.f11253d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wfVar.f11255f;
        if (i11 == 0) {
            ResultKt.b(objA);
            df dfVar = agVar.f964i;
            wfVar.f11250a = agVar;
            wfVar.f11255f = 1;
            objA = dfVar.a(wfVar);
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                it = wfVar.f11252c;
                map = wfVar.f11251b;
                agVar2 = wfVar.f11250a;
                ResultKt.b(objA);
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next();
                    String str = (String) entry.getKey();
                    kv0 kv0Var = (kv0) entry.getValue();
                    wfVar.f11250a = agVar2;
                    wfVar.f11251b = map;
                    wfVar.f11252c = it;
                    wfVar.f11255f = 2;
                    if (agVar2.a(str, kv0Var, wfVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                return Unit.f71706a;
            }
            agVar = wfVar.f11250a;
            ResultKt.b(objA);
        }
        map = (Map) objA;
        if (map != null) {
            agVar2 = agVar;
            it = map.entrySet().iterator();
            while (it.hasNext()) {
            }
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0043 A[PHI: r10
      0x0043: PHI (r10v3 ads_mobile_sdk.ag) = (r10v1 ads_mobile_sdk.ag), (r10v5 ads_mobile_sdk.ag) binds: [B:14:0x002b, B:31:0x00a2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x009a A[PHI: r10
      0x009a: PHI (r10v5 ads_mobile_sdk.ag) = (r10v2 ads_mobile_sdk.ag), (r10v7 ads_mobile_sdk.ag) binds: [B:28:0x0097, B:17:0x0037] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x00a2 -> B:19:0x0043). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(ag agVar, ContinuationImpl continuationImpl) {
        xf xfVar;
        f fVar;
        if (continuationImpl instanceof xf) {
            xfVar = (xf) continuationImpl;
            int i5 = xfVar.f11719d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xfVar.f11719d = i5 - Integer.MIN_VALUE;
            } else {
                xfVar = new xf(agVar, continuationImpl);
            }
        }
        Object objR = xfVar.f11717b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xfVar.f11719d;
        int i12 = 2;
        if (i11 != 0) {
            if (i11 == 1) {
                agVar = xfVar.f11716a;
                ResultKt.b(objR);
                long j11 = ((Duration) objR).f72041a;
                fVar = new f(xfVar.getContext());
                b80.i.a(fVar, t0.e(j11), new yc(1, null, 0));
                fVar.f(agVar.f976w.s(), new q3(i12, null, 1));
                xfVar.f11716a = agVar;
                xfVar.f11719d = 2;
                if ((!(f.f17624f.get(fVar) instanceof b80.d) ? fVar.b(xfVar) : fVar.d(xfVar)) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 == 2) {
                agVar = xfVar.f11716a;
                ResultKt.b(objR);
                xfVar.f11716a = agVar;
                xfVar.f11719d = 3;
                if (agVar.s(xfVar) != coroutineSingletons) {
                    if (agVar.n.get()) {
                        return Unit.f71706a;
                    }
                    xfVar.f11716a = agVar;
                    xfVar.f11719d = 1;
                    objR = agVar.r(xfVar);
                    if (objR != coroutineSingletons) {
                        long j112 = ((Duration) objR).f72041a;
                        fVar = new f(xfVar.getContext());
                        b80.i.a(fVar, t0.e(j112), new yc(1, null, 0));
                        fVar.f(agVar.f976w.s(), new q3(i12, null, 1));
                        xfVar.f11716a = agVar;
                        xfVar.f11719d = 2;
                        if ((!(f.f17624f.get(fVar) instanceof b80.d) ? fVar.b(xfVar) : fVar.d(xfVar)) != coroutineSingletons) {
                            xfVar.f11716a = agVar;
                            xfVar.f11719d = 3;
                            if (agVar.s(xfVar) != coroutineSingletons) {
                            }
                        }
                    }
                }
                return coroutineSingletons;
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            agVar = xfVar.f11716a;
        }
        ResultKt.b(objR);
        if (agVar.n.get()) {
        }
    }

    @Override // b.db
    public final Object d(long j11, SuspendLambda suspendLambda) {
        return a(this, j11, suspendLambda);
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        return d(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(Continuation continuation) throws NoSuchAlgorithmException {
        jf jfVar;
        ag agVar;
        ag agVar2;
        if (continuation instanceof jf) {
            jfVar = (jf) continuation;
            int i5 = jfVar.f5230e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jfVar.f5230e = i5 - Integer.MIN_VALUE;
            } else {
                jfVar = new jf(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = jfVar.f5228c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jfVar.f5230e;
        if (i11 == 0) {
            ResultKt.b(objA);
            jfVar.f5226a = this;
            jfVar.f5227b = this;
            jfVar.f5230e = 1;
            objA = this.f963h.a(jfVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            agVar = this;
            agVar2 = agVar;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            agVar2 = jfVar.f5227b;
            agVar = jfVar.f5226a;
            ResultKt.b(objA);
        }
        agVar2.f972s = (kv0) objA;
        agVar.f973t = UUID.randomUUID().toString();
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object r(ContinuationImpl continuationImpl) {
        kf kfVar;
        ag agVar;
        long j11;
        d dVar;
        long jL;
        if (continuationImpl instanceof kf) {
            kfVar = (kf) continuationImpl;
            int i5 = kfVar.f5725f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kfVar.f5725f = i5 - Integer.MIN_VALUE;
            } else {
                kfVar = new kf(this, continuationImpl);
            }
        }
        Object obj = kfVar.f5723d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kfVar.f5725f;
        if (i11 == 0) {
            ResultKt.b(obj);
            Duration.Companion companion = Duration.f72038b;
            this.f961f.getClass();
            long jH = DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d);
            kfVar.f5720a = this;
            d dVar2 = this.f974u;
            kfVar.f5721b = dVar2;
            kfVar.f5722c = jH;
            kfVar.f5725f = 1;
            if (dVar2.e(kfVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            agVar = this;
            j11 = jH;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = kfVar.f5722c;
            dVar = kfVar.f5721b;
            agVar = kfVar.f5720a;
            ResultKt.b(obj);
        }
        try {
            long j12 = agVar.f975v;
            dVar.g(null);
            long jL2 = Duration.l(j11, j12);
            int iOrdinal = agVar.f970q.ordinal();
            if (iOrdinal == 0) {
                jL = Duration.l(agVar.f966k, jL2);
            } else if (iOrdinal == 1) {
                jL = Duration.l(agVar.f967l, jL2);
            } else {
                if (iOrdinal != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                jL = agVar.f968m;
            }
            Duration.f72038b.getClass();
            return ComparisonsKt.Z(new Duration(0L), new Duration(jL));
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00db, code lost:
    
        if (r15.k(r2) == r3) goto L104;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x01c5  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x01ec A[Catch: all -> 0x01f8, TryCatch #6 {all -> 0x01f8, blocks: (B:111:0x01e5, B:113:0x01ec, B:115:0x01f0, B:117:0x01f4, B:120:0x01fb, B:122:0x01ff, B:124:0x0203, B:126:0x0207, B:127:0x0208, B:128:0x020d, B:129:0x020e, B:130:0x0215, B:131:0x0216, B:132:0x021d, B:133:0x021e), top: B:159:0x01e5 }] */
    /* JADX WARN: Removed duplicated region for block: B:133:0x021e A[Catch: all -> 0x01f8, TRY_LEAVE, TryCatch #6 {all -> 0x01f8, blocks: (B:111:0x01e5, B:113:0x01ec, B:115:0x01f0, B:117:0x01f4, B:120:0x01fb, B:122:0x01ff, B:124:0x0203, B:126:0x0207, B:127:0x0208, B:128:0x020d, B:129:0x020e, B:130:0x0215, B:131:0x0216, B:132:0x021d, B:133:0x021e), top: B:159:0x01e5 }] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x018c A[Catch: all -> 0x0198, TryCatch #5 {all -> 0x0198, blocks: (B:74:0x0185, B:76:0x018c, B:78:0x0190, B:80:0x0194, B:83:0x019b, B:85:0x019f, B:87:0x01a3, B:89:0x01a7, B:90:0x01a8, B:91:0x01ad, B:92:0x01ae, B:93:0x01b5, B:94:0x01b6, B:95:0x01bd, B:96:0x01be), top: B:158:0x0185 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01be A[Catch: all -> 0x0198, TRY_LEAVE, TryCatch #5 {all -> 0x0198, blocks: (B:74:0x0185, B:76:0x018c, B:78:0x0190, B:80:0x0194, B:83:0x019b, B:85:0x019f, B:87:0x01a3, B:89:0x01a7, B:90:0x01a8, B:91:0x01ad, B:92:0x01ae, B:93:0x01b5, B:94:0x01b6, B:95:0x01bd, B:96:0x01be), top: B:158:0x0185 }] */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v17 */
    /* JADX WARN: Type inference failed for: r2v31, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v37 */
    /* JADX WARN: Type inference failed for: r2v38 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object s(ContinuationImpl continuationImpl) {
        pf pfVar;
        Cif cif;
        long jH;
        ag agVar;
        Object obj;
        String str;
        kv0 kv0Var;
        ag agVar2;
        th3 th3VarA;
        Closeable closeable;
        th3 th3Var;
        em2 em2VarA;
        Closeable closeable2;
        ?? r22;
        if (continuationImpl instanceof pf) {
            pfVar = (pf) continuationImpl;
            int i5 = pfVar.f8253g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pfVar.f8253g = i5 - Integer.MIN_VALUE;
            } else {
                pfVar = new pf(this, continuationImpl);
            }
        }
        Object obj2 = pfVar.f8251e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pfVar.f8253g;
        int i12 = 0;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                cif = this.f970q;
                Duration.Companion companion = Duration.f72038b;
                this.f961f.getClass();
                jH = DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d);
                d dVar = this.f974u;
                pfVar.f8247a = this;
                pfVar.f8248b = cif;
                pfVar.f8249c = dVar;
                pfVar.f8250d = jH;
                pfVar.f8253g = 1;
                if (dVar.e(pfVar) != coroutineSingletons) {
                    agVar = this;
                    obj = dVar;
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                jH = pfVar.f8250d;
                Object obj3 = (c80.a) pfVar.f8249c;
                cif = (Cif) pfVar.f8248b;
                agVar = (ag) pfVar.f8247a;
                ResultKt.b(obj2);
                obj = obj3;
            } else {
                if (i11 == 2) {
                    ResultKt.b(obj2);
                    return Unit.f71706a;
                }
                if (i11 == 3) {
                    kv0Var = (kv0) pfVar.f8249c;
                    str = (String) pfVar.f8248b;
                    agVar2 = (ag) pfVar.f8247a;
                    ResultKt.b(obj2);
                    kz2 kz2Var = agVar2.f965j;
                    wv0 wv0Var = wv0.CUI_NAME_ANR_DETECTED;
                    EmptyList emptyList = EmptyList.f71733a;
                    mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                    if (ji3.b().f4777a != null) {
                        em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                        try {
                            pfVar.f8247a = em2VarA;
                            pfVar.f8248b = em2VarA;
                            pfVar.f8249c = null;
                            pfVar.f8253g = 4;
                            if (agVar2.a(str, kv0Var, pfVar) != coroutineSingletons) {
                                em2 em2Var = em2VarA;
                                closeable2 = em2Var;
                                r22 = em2Var;
                                Unit unit = Unit.f71706a;
                                CloseableKt.a(closeable2, null);
                                return Unit.f71706a;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            closeable2 = em2VarA;
                            em2VarA.b(th);
                            if (!(th instanceof b.a4)) {
                                throw th;
                            }
                            if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                em2VarA.a(th);
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
                    } else {
                        th3VarA = ji3.a(wv0Var, emptyList, true);
                        try {
                            pfVar.f8247a = th3VarA;
                            pfVar.f8248b = th3VarA;
                            pfVar.f8249c = null;
                            pfVar.f8253g = 5;
                            if (agVar2.a(str, kv0Var, pfVar) != coroutineSingletons) {
                                th3Var = th3VarA;
                                closeable = th3Var;
                                Unit unit2 = Unit.f71706a;
                                CloseableKt.a(closeable, null);
                                return Unit.f71706a;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            closeable = th3VarA;
                            th3VarA.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                    }
                    return coroutineSingletons;
                }
                if (i11 != 4) {
                    if (i11 != 5) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    closeable = (Closeable) pfVar.f8248b;
                    th3Var = (th3) pfVar.f8247a;
                    try {
                        ResultKt.b(obj2);
                        Unit unit22 = Unit.f71706a;
                        CloseableKt.a(closeable, null);
                        return Unit.f71706a;
                    } catch (Throwable th4) {
                        th = th4;
                        th3VarA = th3Var;
                        try {
                            th3VarA.b(th);
                            if (!(th instanceof b.a4)) {
                                throw th;
                            }
                            if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                th3VarA.a(th);
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
                        } finally {
                            try {
                                throw th;
                            } finally {
                            }
                        }
                    }
                }
                closeable2 = (Closeable) pfVar.f8248b;
                r22 = (th3) pfVar.f8247a;
                try {
                    ResultKt.b(obj2);
                    r22 = r22;
                    Unit unit3 = Unit.f71706a;
                    CloseableKt.a(closeable2, null);
                    return Unit.f71706a;
                } catch (Throwable th5) {
                    th = th5;
                    em2VarA = r22;
                    try {
                        em2VarA.b(th);
                        if (!(th instanceof b.a4)) {
                        }
                    } finally {
                    }
                }
            }
            long j11 = agVar.f975v;
            ((d) obj).g(null);
            long jL = Duration.l(jH, j11);
            Cif cif2 = Cif.f4757a;
            if (cif != cif2 || Duration.c(jL, agVar.f966k) <= 0) {
                Cif cif3 = Cif.f4758b;
                if (cif == cif3 && Duration.c(jL, agVar.f966k) <= 0) {
                    d0.o("Recover ANR");
                    agVar.f970q = cif2;
                    agVar.f972s = null;
                    agVar.f973t = null;
                } else if (cif == cif3 && Duration.c(jL, agVar.f967l) > 0) {
                    d0.o("Full ANR detected");
                    agVar.f970q = Cif.f4759c;
                    String str2 = agVar.f973t;
                    kv0 kv0Var2 = agVar.f972s;
                    if (str2 != null && kv0Var2 != null) {
                        df dfVar = agVar.f964i;
                        pfVar.f8247a = agVar;
                        pfVar.f8248b = str2;
                        pfVar.f8249c = kv0Var2;
                        pfVar.f8253g = 3;
                        Object objA = ((t5.g) dfVar.f2489a.get()).a(new af(str2, kv0Var2, continuation, i12), pfVar);
                        if (objA != coroutineSingletons) {
                            objA = Unit.f71706a;
                        }
                        if (objA != coroutineSingletons) {
                            str = str2;
                            kv0Var = kv0Var2;
                            agVar2 = agVar;
                            kz2 kz2Var2 = agVar2.f965j;
                            wv0 wv0Var2 = wv0.CUI_NAME_ANR_DETECTED;
                            EmptyList emptyList2 = EmptyList.f71733a;
                            mi3 mi3Var2 = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                            if (ji3.b().f4777a != null) {
                            }
                        }
                    }
                } else if (cif == Cif.f4759c && Duration.c(jL, agVar.f967l) <= 0) {
                    d0.o("Cooldown ANR");
                    agVar.f970q = cif2;
                    agVar.f972s = null;
                    agVar.f973t = null;
                }
                return Unit.f71706a;
            }
            d0.o("Early ANR detected");
            agVar.f970q = Cif.f4758b;
            pfVar.f8247a = null;
            pfVar.f8248b = null;
            pfVar.f8249c = null;
            pfVar.f8253g = 2;
            return coroutineSingletons;
        } catch (Throwable th6) {
            ((d) obj).g(null);
            throw th6;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object d(ag agVar, ContinuationImpl continuationImpl) {
        rf rfVar;
        d dVar;
        ag agVar2 = agVar;
        if (continuationImpl instanceof rf) {
            rfVar = (rf) continuationImpl;
            int i5 = rfVar.f9149e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rfVar.f9149e = i5 - Integer.MIN_VALUE;
            } else {
                rfVar = new rf(agVar2, continuationImpl);
            }
        }
        Object obj = rfVar.f9147c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rfVar.f9149e;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = agVar2.f960e;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:system_health:anr_watchdog:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                return new tu0("ANR watchdog is disabled", wd1.f11213a);
            }
            jr0Var.getClass();
            Duration.Companion companion = Duration.f72038b;
            DurationUnit durationUnit = DurationUnit.f72045d;
            Duration durationK = ed.k(1000, durationUnit, "gads:system_health:early_anr_threshold_millis");
            u uVar = u.a$1;
            long j11 = ((Duration) jr0Var.a("gads:system_health:early_anr_threshold_millis", durationK, uVar)).f72041a;
            companion.getClass();
            if (Duration.c(j11, 0L) <= 0 || Duration.c(((Duration) jr0Var.a("gads:system_health:full_anr_threshold_millis", new Duration(DurationKt.g(4500, durationUnit)), uVar)).f72041a, 0L) <= 0 || Duration.c(((Duration) jr0Var.a("gads:system_health:anr_polling_millis", new Duration(DurationKt.g(500, durationUnit)), uVar)).f72041a, 0L) <= 0) {
                return new tu0("Invalid ANR watchdog flags", wd1.f11213a);
            }
            if (agVar2.n.getAndSet(true)) {
                mu0.b("ANR watchdog is already running", null);
                return new xu0(Unit.f71706a);
            }
            agVar2.f966k = ((Duration) jr0Var.a("gads:system_health:early_anr_threshold_millis", new Duration(DurationKt.g(1000, durationUnit)), uVar)).f72041a;
            agVar2.f967l = ((Duration) jr0Var.a("gads:system_health:full_anr_threshold_millis", new Duration(DurationKt.g(4500, durationUnit)), uVar)).f72041a;
            agVar2.f968m = ((Duration) jr0Var.a("gads:system_health:anr_polling_millis", new Duration(DurationKt.g(500, durationUnit)), uVar)).f72041a;
            dVar = agVar2.f974u;
            rfVar.f9145a = agVar2;
            rfVar.f9146b = dVar;
            rfVar.f9149e = 1;
            if (dVar.e(rfVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = rfVar.f9146b;
            ag agVar3 = rfVar.f9145a;
            ResultKt.b(obj);
            dVar = dVar2;
            agVar2 = agVar3;
        }
        try {
            Duration.Companion companion2 = Duration.f72038b;
            o2 o2Var = agVar2.f961f;
            t70.j0 j0Var = agVar2.f958c;
            o2Var.getClass();
            agVar2.f975v = DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d);
            Unit unit = Unit.f71706a;
            dVar.g(null);
            zi3.a(j0Var, new sf(agVar2, null, 0));
            agVar2.o = zi3.a(j0Var, new a60.a(agVar2, null, 20));
            agVar2.f969p = zi3.a(j0Var, new sf(agVar2, null, 1));
            d0.o("ANR watchdog started");
            return new xu0(unit);
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(ag agVar, long j11, ContinuationImpl continuationImpl) {
        lf lfVar;
        d dVar;
        if (continuationImpl instanceof lf) {
            lfVar = (lf) continuationImpl;
            int i5 = lfVar.f6225f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lfVar.f6225f = i5 - Integer.MIN_VALUE;
            } else {
                lfVar = new lf(agVar, continuationImpl);
            }
        }
        Object obj = lfVar.f6223d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lfVar.f6225f;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = agVar.f977x;
            lfVar.f6220a = agVar;
            lfVar.f6221b = dVar;
            lfVar.f6222c = j11;
            lfVar.f6225f = 1;
            if (dVar.e(lfVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = lfVar.f6222c;
            d dVar2 = lfVar.f6221b;
            ag agVar2 = lfVar.f6220a;
            ResultKt.b(obj);
            dVar = dVar2;
            agVar = agVar2;
        }
        try {
            if (Duration.c(j11, agVar.f979z) > 0 && agVar.f978y) {
                agVar.f978y = false;
                agVar.f979z = j11;
                agVar.n.set(false);
                t70.g2 g2Var = agVar.o;
                if (g2Var != null) {
                    g2Var.c(null);
                }
                t70.g2 g2Var2 = agVar.f969p;
                if (g2Var2 != null) {
                    g2Var2.c(null);
                }
                mu0.b("ANR watchdog stopped", null);
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return unit;
            }
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return unit2;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    @Override // b.db
    public final Object b(long j11, SuspendLambda suspendLambda) {
        return b(this, j11, suspendLambda);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r9v13, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r9v14 */
    /* JADX WARN: Type inference failed for: r9v5 */
    /* JADX WARN: Type inference failed for: r9v6 */
    /* JADX WARN: Type inference failed for: r9v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(ag agVar, long j11, ContinuationImpl continuationImpl) throws Throwable {
        mf mfVar;
        d dVar;
        Throwable th2;
        ?? r92;
        if (continuationImpl instanceof mf) {
            mfVar = (mf) continuationImpl;
            int i5 = mfVar.f7199f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mfVar.f7199f = i5 - Integer.MIN_VALUE;
            } else {
                mfVar = new mf(agVar, continuationImpl);
            }
        }
        Object obj = mfVar.f7197d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mfVar.f7199f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = agVar.f977x;
                mfVar.f7194a = agVar;
                mfVar.f7195b = dVar;
                mfVar.f7196c = j11;
                mfVar.f7199f = 1;
                if (dVar.e(mfVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r92 = (c80.a) mfVar.f7194a;
                try {
                    ResultKt.b(obj);
                    r92 = r92;
                    Unit unit = Unit.f71706a;
                    ((d) r92).g(null);
                    return unit;
                } catch (Throwable th3) {
                    th2 = th3;
                    dVar = r92;
                    dVar.g(null);
                    throw th2;
                }
            }
            j11 = mfVar.f7196c;
            d dVar2 = mfVar.f7195b;
            ag agVar2 = (ag) mfVar.f7194a;
            ResultKt.b(obj);
            dVar = dVar2;
            agVar = agVar2;
            if (Duration.c(j11, agVar.f979z) > 0 && !agVar.f978y) {
                agVar.f978y = true;
                agVar.f979z = j11;
                mfVar.f7194a = dVar;
                mfVar.f7195b = null;
                mfVar.f7199f = 2;
                Object objD = d(agVar, mfVar);
                if (objD != coroutineSingletons) {
                    d dVar3 = dVar;
                    obj = objD;
                    r92 = dVar3;
                    Unit unit2 = Unit.f71706a;
                    ((d) r92).g(null);
                    return unit2;
                }
                return coroutineSingletons;
            }
            Unit unit3 = Unit.f71706a;
            dVar.g(null);
            return unit3;
        } catch (Throwable th4) {
            th2 = th4;
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x00ad, code lost:
    
        if (r8 == r1) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, kv0 log, ContinuationImpl continuationImpl) {
        qf qfVar;
        String str2;
        ag agVar;
        if (continuationImpl instanceof qf) {
            qfVar = (qf) continuationImpl;
            int i5 = qfVar.f8618e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qfVar.f8618e = i5 - Integer.MIN_VALUE;
            } else {
                qfVar = new qf(this, continuationImpl);
            }
        }
        Object objA = qfVar.f8616c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qfVar.f8618e;
        if (i11 == 0) {
            ResultKt.b(objA);
            Intrinsics.g(log, "log");
            b.a8 a8VarO = pv0.o();
            Intrinsics.f(a8VarO, "newBuilder(...)");
            a8VarO.b();
            ((pv0) a8VarO.f1095b).a(log);
            pv0 pv0Var = (pv0) a8VarO.a();
            e7 e7Var = this.f971r;
            e7Var.b();
            ((qv0) e7Var.f1095b).a(pv0Var);
            byte[] bArrA = ((qv0) e7Var.a()).a();
            qfVar.f8614a = this;
            qfVar.f8615b = str;
            qfVar.f8618e = 1;
            objA = a(bArrA, qfVar);
            if (objA != coroutineSingletons) {
                str2 = str;
                agVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            agVar = qfVar.f8614a;
            ResultKt.b(objA);
            e7 e7Var2 = agVar.f971r;
            e7Var2.b();
            qv0 qv0Var = (qv0) e7Var2.f1095b;
            qv0Var.getClass();
            qv0Var.payloads_ = in2.f4887e;
            return Unit.f71706a;
        }
        String str3 = qfVar.f8615b;
        ag agVar2 = qfVar.f8614a;
        ResultKt.b(objA);
        str2 = str3;
        agVar = agVar2;
        if (((Boolean) objA).booleanValue()) {
            df dfVar = agVar.f964i;
            qfVar.f8614a = agVar;
            qfVar.f8615b = null;
            qfVar.f8618e = 2;
            Object objA2 = ((t5.g) dfVar.f2489a.get()).a(new bf(str2, null), qfVar);
            if (objA2 != coroutineSingletons) {
                objA2 = Unit.f71706a;
            }
        }
        e7 e7Var22 = agVar.f971r;
        e7Var22.b();
        qv0 qv0Var2 = (qv0) e7Var22.f1095b;
        qv0Var2.getClass();
        qv0Var2.payloads_ = in2.f4887e;
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(byte[] bArr, ContinuationImpl continuationImpl) {
        vf vfVar;
        if (continuationImpl instanceof vf) {
            vfVar = (vf) continuationImpl;
            int i5 = vfVar.f10768c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vfVar.f10768c = i5 - Integer.MIN_VALUE;
            } else {
                vfVar = new vf(this, continuationImpl);
            }
        }
        Object objA = vfVar.f10766a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vfVar.f10768c;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                x11 x11Var = new x11();
                x11Var.b((String) this.f960e.a("gads:remote_capture_service_url", "https://pagead2.googlesyndication.com/pagead/ping?e=2&f=1", u.a$7));
                x11Var.b("application/x-protobuf", bArr);
                y11 y11VarA = x11Var.a();
                e6 e6Var = this.f962g;
                vfVar.f10768c = 1;
                objA = e6.a(e6Var, y11VarA, null, vfVar, 30);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
            }
            return Boolean.valueOf(((b.a1) objA) instanceof xu0);
        } catch (Exception e3) {
            cz.b bVar = mu0.f7335a;
            mu0.b("Failed to ping RCS payload: " + e3, null);
            return Boolean.FALSE;
        }
    }
}
