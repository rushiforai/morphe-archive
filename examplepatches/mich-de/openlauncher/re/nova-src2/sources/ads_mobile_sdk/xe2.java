package ads_mobile_sdk;

import b.f9;
import b.q8;
import b.s9;
import com.google.gson.Gson;
import java.util.Iterator;
import java.util.Optional;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class xe2 implements q8 {

    /* renamed from: a, reason: collision with root package name */
    public final ni.q f11706a;

    /* renamed from: b, reason: collision with root package name */
    public final f9 f11707b;

    /* renamed from: c, reason: collision with root package name */
    public final l f11708c;

    /* renamed from: d, reason: collision with root package name */
    public final pe2 f11709d;

    /* renamed from: e, reason: collision with root package name */
    public final u5 f11710e;

    /* renamed from: f, reason: collision with root package name */
    public final qw2 f11711f;

    /* renamed from: g, reason: collision with root package name */
    public final p32 f11712g;

    /* renamed from: h, reason: collision with root package name */
    public final Gson f11713h;

    /* renamed from: i, reason: collision with root package name */
    public final ci3 f11714i;

    /* renamed from: j, reason: collision with root package name */
    public final Optional f11715j;

    public xe2(ni.q baseRequest, f9 internalAdRequestEventEmitter, l actionFunction, pe2 persistentCacheManager, u5 adRequestKeyGenerator, qw2 requestType, p32 delegateNetworkRequester, Gson gson, ci3 traceLogger, Optional numberOfAdsRequestedOptional) {
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(internalAdRequestEventEmitter, "internalAdRequestEventEmitter");
        Intrinsics.g(actionFunction, "actionFunction");
        Intrinsics.g(persistentCacheManager, "persistentCacheManager");
        Intrinsics.g(adRequestKeyGenerator, "adRequestKeyGenerator");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(delegateNetworkRequester, "delegateNetworkRequester");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(numberOfAdsRequestedOptional, "numberOfAdsRequestedOptional");
        this.f11706a = baseRequest;
        this.f11707b = internalAdRequestEventEmitter;
        this.f11708c = actionFunction;
        this.f11709d = persistentCacheManager;
        this.f11710e = adRequestKeyGenerator;
        this.f11711f = requestType;
        this.f11712g = delegateNetworkRequester;
        this.f11713h = gson;
        this.f11714i = traceLogger;
        this.f11715j = numberOfAdsRequestedOptional;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(bm1 bm1Var, ContinuationImpl continuationImpl) {
        ve2 ve2Var;
        xe2 xe2Var;
        te2 te2Var;
        if (continuationImpl instanceof ve2) {
            ve2Var = (ve2) continuationImpl;
            int i5 = ve2Var.f10765d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ve2Var.f10765d = i5 - Integer.MIN_VALUE;
            } else {
                ve2Var = new ve2(this, continuationImpl);
            }
        }
        Object objB = ve2Var.f10763b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ve2Var.f10765d;
        if (i11 == 0) {
            ResultKt.b(objB);
            ue2 ue2Var = bm1Var.f1460b;
            ve2Var.f10762a = this;
            ve2Var.f10765d = 1;
            pe2 pe2Var = this.f11709d;
            pe2Var.getClass();
            objB = pe2.b(pe2Var, ue2Var, ve2Var);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
            xe2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            xe2Var = ve2Var.f10762a;
            ResultKt.b(objB);
        }
        b.a1 a1Var = (b.a1) objB;
        th3 th3VarA = ji3.a();
        te2 te2Var2 = th3VarA.f9923a.f7225b.f3356f;
        se2 se2Var = se2.MISS_REASON_CORRUPTED;
        if (te2Var2 != null) {
            s9 s9Var = (s9) te2Var2.n();
            s9Var.e(false);
            s9Var.d(se2Var);
            s9Var.f(xe2Var.a());
            te2Var = (te2) s9Var.a();
        } else {
            s9 s9VarO = te2.o();
            Intrinsics.f(s9VarO, "newBuilder(...)");
            s9VarO.e(false);
            s9VarO.d(se2Var);
            s9VarO.f(xe2Var.a());
            te2Var = (te2) s9VarO.a();
        }
        th3VarA.f9923a.f7225b.f3356f = te2Var;
        if (a1Var instanceof pu0) {
            ci3 ci3Var = xe2Var.f11714i;
            Throwable thB = ((pu0) a1Var).b();
            if (thB == null) {
                thB = new Exception(a1Var.toString());
            }
            ci3Var.a("Failed to evict cached ad", thB);
        }
        return Unit.f71706a;
    }

    public final int a() {
        Optional optional = this.f11715j;
        if (!optional.isPresent()) {
            return 1;
        }
        Object obj = optional.get();
        Intrinsics.f(obj, "get(...)");
        return ((Number) obj).intValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x022d A[Catch: Exception -> 0x0056, TryCatch #1 {Exception -> 0x0056, blocks: (B:16:0x0045, B:95:0x01c6, B:97:0x01d2, B:98:0x0201, B:100:0x0207, B:101:0x0213, B:107:0x0288, B:102:0x022d, B:103:0x025d, B:105:0x0263, B:106:0x026f, B:19:0x0050, B:91:0x0195), top: B:119:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:114:0x02b7 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:115:0x02b8 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0127 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0177 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01c3  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x01c5  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01d2 A[Catch: Exception -> 0x0056, TryCatch #1 {Exception -> 0x0056, blocks: (B:16:0x0045, B:95:0x01c6, B:97:0x01d2, B:98:0x0201, B:100:0x0207, B:101:0x0213, B:107:0x0288, B:102:0x022d, B:103:0x025d, B:105:0x0263, B:106:0x026f, B:19:0x0050, B:91:0x0195), top: B:119:0x0027 }] */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    @Override // b.q8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) throws Throwable {
        we2 we2Var;
        bm1 bm1Var;
        xe2 xe2Var;
        Object objB;
        b.a1 qu0Var;
        z23 z23Var;
        xe2 xe2Var2;
        xe2 xe2Var3;
        bm1 bm1Var2;
        te2 te2Var;
        se2 se2Var;
        se2 se2Var2;
        Object objB2;
        d33 d33Var;
        f9 f9Var;
        z23 z23Var2;
        te2 te2Var2;
        te2 te2Var3;
        if (continuation instanceof we2) {
            we2Var = (we2) continuation;
            int i5 = we2Var.f11249g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                we2Var.f11249g = i5 - Integer.MIN_VALUE;
            } else {
                we2Var = new we2(this, (ContinuationImpl) continuation);
            }
        }
        Object objB3 = we2Var.f11247e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r22 = we2Var.f11249g;
        int iA = 0;
        Object obj = null;
        try {
            try {
            } catch (Exception unused) {
                xe2Var = xe2Var2;
            }
        } catch (Exception unused2) {
            bm1Var = r22;
            xe2Var = 2;
        }
        switch (r22) {
            case 0:
                ResultKt.b(objB3);
                ni.q qVar = this.f11706a;
                ni.k kVar = qVar instanceof ni.k ? (ni.k) qVar : null;
                if (kVar == null) {
                    return new tu0("Expected AdRequest.", wd1.f11213a);
                }
                String strA = this.f11710e.a(kVar);
                we2Var.f11243a = this;
                we2Var.f11249g = 1;
                objB3 = this.f11709d.b(this.f11711f, strA, we2Var);
                if (objB3 != coroutineSingletons) {
                    xe2Var = this;
                    b.a1 a1Var = (b.a1) objB3;
                    tq tqVar = !(a1Var instanceof xu0) ? (tq) ((xu0) a1Var).f11834b : null;
                    bm1Var = tqVar == null ? tqVar.f10036a : null;
                    if (bm1Var != null) {
                        th3 th3VarA = ji3.a();
                        te2 te2Var4 = th3VarA.f9923a.f7225b.f3356f;
                        se2 se2Var3 = se2.MISS_REASON_EMPTY;
                        if (te2Var4 != null) {
                            s9 s9Var = (s9) te2Var4.n();
                            s9Var.e(false);
                            if (tqVar != null && (se2Var2 = tqVar.f10037b) != null) {
                                se2Var3 = se2Var2;
                            }
                            s9Var.d(se2Var3);
                            s9Var.f(xe2Var.a());
                            te2Var = (te2) s9Var.a();
                        } else {
                            s9 s9VarO = te2.o();
                            Intrinsics.f(s9VarO, "newBuilder(...)");
                            s9VarO.e(false);
                            if (tqVar != null && (se2Var = tqVar.f10037b) != null) {
                                se2Var3 = se2Var;
                            }
                            s9VarO.d(se2Var3);
                            s9VarO.f(xe2Var.a());
                            te2Var = (te2) s9VarO.a();
                        }
                        th3VarA.f9923a.f7225b.f3356f = te2Var;
                        p32 p32Var = xe2Var.f11712g;
                        we2Var.f11243a = null;
                        we2Var.f11249g = 2;
                        p32Var.getClass();
                        Object objB4 = p32.b(p32Var, we2Var);
                        if (objB4 != coroutineSingletons) {
                            return objB4;
                        }
                    } else {
                        try {
                            com.google.gson.r rVar = (com.google.gson.r) xe2Var.f11713h.fromJson(bm1Var.f1459a, com.google.gson.r.class);
                            Intrinsics.d(rVar);
                            try {
                                qu0Var = new xu0(new s5.b(3, rVar, obj).invoke());
                            } catch (Exception e3) {
                                qu0Var = new qu0(e3, null, null, 6);
                            }
                            if (qu0Var instanceof pu0) {
                                we2Var.f11243a = xe2Var;
                                we2Var.f11244b = bm1Var;
                                we2Var.f11249g = 3;
                                if (xe2Var.a(bm1Var, we2Var) != coroutineSingletons) {
                                    xe2Var3 = xe2Var;
                                    bm1Var2 = bm1Var;
                                    p32 p32Var2 = xe2Var3.f11712g;
                                    we2Var.f11243a = xe2Var3;
                                    we2Var.f11244b = bm1Var2;
                                    we2Var.f11249g = 4;
                                    p32Var2.getClass();
                                    objB2 = p32.b(p32Var2, we2Var);
                                    if (objB2 != coroutineSingletons) {
                                        return objB2;
                                    }
                                }
                            } else {
                                z23Var = (z23) ((xu0) qu0Var).f11834b;
                                l lVar = xe2Var.f11708c;
                                we2Var.f11243a = xe2Var;
                                we2Var.f11244b = bm1Var;
                                we2Var.f11245c = z23Var;
                                we2Var.f11249g = 5;
                                if (lVar.a(z23Var, we2Var) != coroutineSingletons) {
                                    xe2Var2 = xe2Var;
                                    ji3.a().f9923a.f7225b.f3352b = z23Var.f12428b.f4554h;
                                    d33Var = new d33(new v23(xe2Var2.f11706a), z23Var, true, bm1Var.f1460b);
                                    f9Var = xe2Var2.f11707b;
                                    we2Var.f11243a = xe2Var2;
                                    we2Var.f11244b = bm1Var;
                                    we2Var.f11245c = z23Var;
                                    we2Var.f11246d = d33Var;
                                    we2Var.f11249g = 6;
                                    if (f9Var.a(d33Var, we2Var) == coroutineSingletons) {
                                        z23Var2 = z23Var;
                                        th3 th3VarA2 = ji3.a();
                                        te2Var2 = th3VarA2.f9923a.f7225b.f3356f;
                                        if (te2Var2 == null) {
                                            s9 s9Var2 = (s9) te2Var2.n();
                                            s9Var2.e(true);
                                            boolean z11 = bm1Var.f1461c;
                                            s9Var2.b();
                                            te2 te2Var5 = (te2) s9Var2.f1095b;
                                            te2Var5.bitField0_ = 2 | te2Var5.bitField0_;
                                            te2Var5.isFromPreviousSession_ = z11;
                                            s9Var2.c(bm1Var.f1462d);
                                            s9Var2.f(xe2Var2.a());
                                            Iterator it = z23Var2.f12427a.iterator();
                                            while (it.hasNext()) {
                                                iA += ((z1) it.next()).a();
                                            }
                                            s9Var2.b();
                                            te2 te2Var6 = (te2) s9Var2.f1095b;
                                            te2Var6.bitField0_ |= 16;
                                            te2Var6.numAdsInCachedResponse_ = iA;
                                            te2Var3 = (te2) s9Var2.a();
                                        } else {
                                            s9 s9VarO2 = te2.o();
                                            Intrinsics.f(s9VarO2, "newBuilder(...)");
                                            s9VarO2.e(true);
                                            boolean z12 = bm1Var.f1461c;
                                            s9VarO2.b();
                                            te2 te2Var7 = (te2) s9VarO2.f1095b;
                                            te2Var7.bitField0_ = 2 | te2Var7.bitField0_;
                                            te2Var7.isFromPreviousSession_ = z12;
                                            s9VarO2.c(bm1Var.f1462d);
                                            s9VarO2.f(xe2Var2.a());
                                            Iterator it2 = z23Var2.f12427a.iterator();
                                            while (it2.hasNext()) {
                                                iA += ((z1) it2.next()).a();
                                            }
                                            s9VarO2.b();
                                            te2 te2Var8 = (te2) s9VarO2.f1095b;
                                            te2Var8.bitField0_ |= 16;
                                            te2Var8.numAdsInCachedResponse_ = iA;
                                            te2Var3 = (te2) s9VarO2.a();
                                        }
                                        th3VarA2.f9923a.f7225b.f3356f = te2Var3;
                                        return new xu0(d33Var);
                                    }
                                }
                            }
                        } catch (Exception unused3) {
                            we2Var.f11243a = xe2Var;
                            we2Var.f11244b = null;
                            we2Var.f11245c = null;
                            we2Var.f11246d = null;
                            we2Var.f11249g = 7;
                            if (xe2Var.a(bm1Var, we2Var) != coroutineSingletons) {
                                p32 p32Var3 = xe2Var.f11712g;
                                we2Var.f11243a = null;
                                we2Var.f11249g = 8;
                                p32Var3.getClass();
                                objB = p32.b(p32Var3, we2Var);
                                if (objB == coroutineSingletons) {
                                }
                            }
                            return coroutineSingletons;
                        }
                    }
                }
                return coroutineSingletons;
            case 1:
                xe2Var = we2Var.f11243a;
                ResultKt.b(objB3);
                b.a1 a1Var2 = (b.a1) objB3;
                if (!(a1Var2 instanceof xu0)) {
                }
                if (tqVar == null) {
                }
                if (bm1Var != null) {
                }
                return coroutineSingletons;
            case 2:
                ResultKt.b(objB3);
                return objB3;
            case 3:
                bm1Var2 = we2Var.f11244b;
                xe2Var3 = we2Var.f11243a;
                ResultKt.b(objB3);
                p32 p32Var22 = xe2Var3.f11712g;
                we2Var.f11243a = xe2Var3;
                we2Var.f11244b = bm1Var2;
                we2Var.f11249g = 4;
                p32Var22.getClass();
                objB2 = p32.b(p32Var22, we2Var);
                if (objB2 != coroutineSingletons) {
                    return coroutineSingletons;
                }
                break;
            case 4:
                bm1 bm1Var3 = we2Var.f11244b;
                xe2 xe2Var4 = we2Var.f11243a;
                ResultKt.b(objB3);
                return objB3;
            case 5:
                z23 z23Var3 = we2Var.f11245c;
                bm1Var = we2Var.f11244b;
                xe2Var2 = we2Var.f11243a;
                ResultKt.b(objB3);
                z23Var = z23Var3;
                ji3.a().f9923a.f7225b.f3352b = z23Var.f12428b.f4554h;
                d33Var = new d33(new v23(xe2Var2.f11706a), z23Var, true, bm1Var.f1460b);
                f9Var = xe2Var2.f11707b;
                we2Var.f11243a = xe2Var2;
                we2Var.f11244b = bm1Var;
                we2Var.f11245c = z23Var;
                we2Var.f11246d = d33Var;
                we2Var.f11249g = 6;
                if (f9Var.a(d33Var, we2Var) == coroutineSingletons) {
                }
                break;
            case 6:
                d33Var = we2Var.f11246d;
                z23Var2 = we2Var.f11245c;
                bm1Var = we2Var.f11244b;
                xe2Var2 = we2Var.f11243a;
                ResultKt.b(objB3);
                th3 th3VarA22 = ji3.a();
                te2Var2 = th3VarA22.f9923a.f7225b.f3356f;
                if (te2Var2 == null) {
                }
                th3VarA22.f9923a.f7225b.f3356f = te2Var3;
                return new xu0(d33Var);
            case 7:
                xe2Var = we2Var.f11243a;
                ResultKt.b(objB3);
                p32 p32Var32 = xe2Var.f11712g;
                we2Var.f11243a = null;
                we2Var.f11249g = 8;
                p32Var32.getClass();
                objB = p32.b(p32Var32, we2Var);
                if (objB == coroutineSingletons) {
                    return objB;
                }
                break;
            case 8:
                ResultKt.b(objB3);
                return objB3;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
