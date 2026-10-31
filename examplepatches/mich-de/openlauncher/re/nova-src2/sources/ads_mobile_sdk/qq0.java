package ads_mobile_sdk;

import b.o2;
import b.x1;
import b70.h;
import c80.d;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.u1;

/* loaded from: classes.dex */
public final class qq0 {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f8778a;

    /* renamed from: b, reason: collision with root package name */
    public final d f8779b;

    /* renamed from: c, reason: collision with root package name */
    public cq0 f8780c;

    public qq0(b.w4 dataStore, o2 clock) {
        Intrinsics.g(dataStore, "dataStore");
        Intrinsics.g(clock, "clock");
        this.f8778a = dataStore;
        this.f8779b = new d();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00a6 A[Catch: all -> 0x00a9, TRY_LEAVE, TryCatch #1 {all -> 0x00a9, blocks: (B:35:0x00a2, B:37:0x00a6), top: B:51:0x00a2 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v7, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(qq0 qq0Var, ContinuationImpl continuationImpl) {
        gq0 gq0Var;
        d dVar;
        cq0 cq0VarQ;
        d dVar2;
        qq0 qq0Var2;
        cq0 cq0Var;
        d dVar3;
        cq0 cq0Var2;
        if (continuationImpl instanceof gq0) {
            gq0Var = (gq0) continuationImpl;
            int i5 = gq0Var.f4026f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gq0Var.f4026f = i5 - Integer.MIN_VALUE;
            } else {
                gq0Var = new gq0(qq0Var, continuationImpl);
            }
        }
        Object objQ = gq0Var.f4024d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gq0Var.f4026f;
        try {
            if (i11 == 0) {
                ResultKt.b(objQ);
                dVar = qq0Var.f8779b;
                gq0Var.f4021a = qq0Var;
                gq0Var.f4022b = dVar;
                gq0Var.f4026f = 1;
                if (dVar.e(gq0Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    dVar3 = gq0Var.f4023c;
                    cq0Var = (cq0) gq0Var.f4022b;
                    qq0Var2 = gq0Var.f4021a;
                    ResultKt.b(objQ);
                    try {
                        cq0Var2 = qq0Var2.f8780c;
                        if (cq0Var2 != null) {
                            qq0Var2.f8780c = cq0Var;
                        } else {
                            cq0Var = cq0Var2;
                        }
                        dVar3.g(null);
                        Intrinsics.d(cq0Var);
                        return cq0Var;
                    } catch (Throwable th2) {
                        dVar3.g(null);
                        throw th2;
                    }
                }
                qq0Var = gq0Var.f4021a;
                ResultKt.b(objQ);
                cq0VarQ = (cq0) objQ;
                if (cq0VarQ == null) {
                    cq0VarQ = cq0.q();
                }
                dVar2 = qq0Var.f8779b;
                gq0Var.f4021a = qq0Var;
                gq0Var.f4022b = cq0VarQ;
                gq0Var.f4023c = dVar2;
                gq0Var.f4026f = 3;
                if (dVar2.e(gq0Var) != coroutineSingletons) {
                    qq0Var2 = qq0Var;
                    cq0Var = cq0VarQ;
                    dVar3 = dVar2;
                    cq0Var2 = qq0Var2.f8780c;
                    if (cq0Var2 != null) {
                    }
                    dVar3.g(null);
                    Intrinsics.d(cq0Var);
                    return cq0Var;
                }
                return coroutineSingletons;
            }
            ?? r72 = (c80.a) gq0Var.f4022b;
            qq0 qq0Var3 = gq0Var.f4021a;
            ResultKt.b(objQ);
            dVar = r72;
            qq0Var = qq0Var3;
            cq0 cq0Var3 = qq0Var.f8780c;
            if (cq0Var3 != null) {
                return cq0Var3;
            }
            w70.m data = ((t5.g) qq0Var.f8778a.get()).getData();
            gq0Var.f4021a = qq0Var;
            gq0Var.f4022b = null;
            gq0Var.f4026f = 2;
            objQ = u1.q(data, gq0Var);
            if (objQ != coroutineSingletons) {
                cq0VarQ = (cq0) objQ;
                if (cq0VarQ == null) {
                }
                dVar2 = qq0Var.f8779b;
                gq0Var.f4021a = qq0Var;
                gq0Var.f4022b = cq0VarQ;
                gq0Var.f4023c = dVar2;
                gq0Var.f4026f = 3;
                if (dVar2.e(gq0Var) != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(qq0 qq0Var, ContinuationImpl continuationImpl) {
        hq0 hq0Var;
        d dVar;
        if (continuationImpl instanceof hq0) {
            hq0Var = (hq0) continuationImpl;
            int i5 = hq0Var.f4487e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hq0Var.f4487e = i5 - Integer.MIN_VALUE;
            } else {
                hq0Var = new hq0(qq0Var, continuationImpl);
            }
        }
        Object obj = hq0Var.f4485c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hq0Var.f4487e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = qq0Var.f8779b;
            hq0Var.f4483a = qq0Var;
            hq0Var.f4484b = dVar;
            hq0Var.f4487e = 1;
            if (dVar.e(hq0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = hq0Var.f4484b;
            qq0 qq0Var2 = hq0Var.f4483a;
            ResultKt.b(obj);
            dVar = dVar2;
            qq0Var = qq0Var2;
        }
        try {
            cq0 cq0Var = qq0Var.f8780c;
            mapU = cq0Var != null ? cq0Var.u() : null;
            return mapU == null ? h.f17594a : mapU;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        eq0 eq0Var;
        if (continuationImpl instanceof eq0) {
            eq0Var = (eq0) continuationImpl;
            int i5 = eq0Var.f2941c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eq0Var.f2941c = i5 - Integer.MIN_VALUE;
            } else {
                eq0Var = new eq0(this, continuationImpl);
            }
        }
        Object objB = eq0Var.f2939a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eq0Var.f2941c;
        if (i11 == 0) {
            ResultKt.b(objB);
            eq0Var.f2941c = 1;
            objB = b(this, eq0Var);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
        }
        iz izVarP = ((cq0) objB).p();
        Intrinsics.f(izVarP, "getConsentState(...)");
        return izVarP;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(qq0 qq0Var, ContinuationImpl continuationImpl) {
        fq0 fq0Var;
        if (continuationImpl instanceof fq0) {
            fq0Var = (fq0) continuationImpl;
            int i5 = fq0Var.f3466c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fq0Var.f3466c = i5 - Integer.MIN_VALUE;
            } else {
                fq0Var = new fq0(qq0Var, continuationImpl);
            }
        }
        Object objA = fq0Var.f3464a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = fq0Var.f3466c;
        if (i11 == 0) {
            ResultKt.b(objA);
            fq0Var.f3466c = 1;
            objA = qq0Var.a(fq0Var);
            if (objA == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        iz izVar = (iz) objA;
        if (!izVar.v()) {
            return null;
        }
        b.id idVarS = a70.s();
        Intrinsics.f(idVarS, "newBuilder(...)");
        pb2 pb2VarT = izVar.t();
        Intrinsics.f(pb2VarT, "getPatternMatchingFlag(...)");
        idVarS.b();
        ((a70) idVarS.f1095b).a(pb2VarT);
        uh2 uh2VarU = izVar.u();
        Intrinsics.f(uh2VarU, "getPreProcessingFlag(...)");
        idVarS.b();
        ((a70) idVarS.f1095b).a(uh2VarU);
        Intrinsics.f(idVarS.d(), "getConcatenatedSignalsMapMap(...)");
        Map mapO = izVar.o();
        Intrinsics.f(mapO, "getConcatenatedSignalsMapMap(...)");
        idVarS.c(mapO);
        return (a70) idVarS.a();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        jq0 jq0Var;
        qq0 qq0Var;
        qq0 qq0Var2;
        d dVar;
        cq0 cq0Var;
        if (continuationImpl instanceof jq0) {
            jq0Var = (jq0) continuationImpl;
            int i5 = jq0Var.f5343f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jq0Var.f5343f = i5 - Integer.MIN_VALUE;
            } else {
                jq0Var = new jq0(this, continuationImpl);
            }
        }
        Object objA = jq0Var.f5341d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jq0Var.f5343f;
        int i12 = 1;
        try {
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(e3);
        }
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) this.f8778a.get();
            x1 x1Var = new x1(i12);
            jq0Var.f5338a = this;
            jq0Var.f5343f = 1;
            objA = gVar.a(x1Var, jq0Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            qq0Var = this;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                dVar = jq0Var.f5340c;
                cq0Var = jq0Var.f5339b;
                qq0Var2 = jq0Var.f5338a;
                ResultKt.b(objA);
                try {
                    qq0Var2.f8780c = cq0Var;
                    Unit unit = Unit.f71706a;
                    dVar.g(null);
                    return Unit.f71706a;
                } catch (Throwable th2) {
                    dVar.g(null);
                    throw th2;
                }
            }
            qq0Var = jq0Var.f5338a;
            ResultKt.b(objA);
        }
        cq0 cq0Var2 = (cq0) objA;
        d dVar2 = qq0Var.f8779b;
        jq0Var.f5338a = qq0Var;
        jq0Var.f5339b = cq0Var2;
        jq0Var.f5340c = dVar2;
        jq0Var.f5343f = 2;
        if (dVar2.e(jq0Var) != coroutineSingletons) {
            qq0Var2 = qq0Var;
            dVar = dVar2;
            cq0Var = cq0Var2;
            qq0Var2.f8780c = cq0Var;
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(qq0 qq0Var, String str, String str2, ContinuationImpl continuationImpl) {
        mq0 mq0Var;
        cq0 cq0Var;
        qq0 qq0Var2;
        d dVar;
        if (continuationImpl instanceof mq0) {
            mq0Var = (mq0) continuationImpl;
            int i5 = mq0Var.f7312f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mq0Var.f7312f = i5 - Integer.MIN_VALUE;
            } else {
                mq0Var = new mq0(qq0Var, continuationImpl);
            }
        }
        Object objA = mq0Var.f7310d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mq0Var.f7312f;
        Continuation continuation = null;
        try {
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(e3);
        }
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) qq0Var.f8778a.get();
            b10.k kVar = new b10.k(str2, str, continuation, 5);
            mq0Var.f7307a = qq0Var;
            mq0Var.f7312f = 1;
            objA = gVar.a(kVar, mq0Var);
            if (objA == coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = mq0Var.f7309c;
            cq0Var = mq0Var.f7308b;
            qq0Var2 = mq0Var.f7307a;
            ResultKt.b(objA);
            try {
                qq0Var2.f8780c = cq0Var;
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return Unit.f71706a;
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        qq0Var = mq0Var.f7307a;
        ResultKt.b(objA);
        cq0Var = (cq0) objA;
        d dVar2 = qq0Var.f8779b;
        mq0Var.f7307a = qq0Var;
        mq0Var.f7308b = cq0Var;
        mq0Var.f7309c = dVar2;
        mq0Var.f7312f = 2;
        if (dVar2.e(mq0Var) != coroutineSingletons) {
            qq0Var2 = qq0Var;
            dVar = dVar2;
            qq0Var2.f8780c = cq0Var;
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(qq0 qq0Var, iz izVar, com.google.gson.r rVar, boolean z11, ContinuationImpl continuationImpl) {
        oq0 oq0Var;
        cq0 cq0Var;
        qq0 qq0Var2;
        d dVar;
        if (continuationImpl instanceof oq0) {
            oq0Var = (oq0) continuationImpl;
            int i5 = oq0Var.f7987f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oq0Var.f7987f = i5 - Integer.MIN_VALUE;
            } else {
                oq0Var = new oq0(qq0Var, continuationImpl);
            }
        }
        Object objA = oq0Var.f7985d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oq0Var.f7987f;
        try {
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(e3);
        }
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) qq0Var.f8778a.get();
            pq0 pq0Var = new pq0(izVar, rVar, null, z11);
            oq0Var.f7982a = qq0Var;
            oq0Var.f7987f = 1;
            objA = gVar.a(pq0Var, oq0Var);
            if (objA == coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = oq0Var.f7984c;
            cq0Var = oq0Var.f7983b;
            qq0Var2 = oq0Var.f7982a;
            ResultKt.b(objA);
            try {
                qq0Var2.f8780c = cq0Var;
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return Unit.f71706a;
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        qq0Var = oq0Var.f7982a;
        ResultKt.b(objA);
        cq0Var = (cq0) objA;
        d dVar2 = qq0Var.f8779b;
        oq0Var.f7982a = qq0Var;
        oq0Var.f7983b = cq0Var;
        oq0Var.f7984c = dVar2;
        oq0Var.f7987f = 2;
        if (dVar2.e(oq0Var) != coroutineSingletons) {
            qq0Var2 = qq0Var;
            dVar = dVar2;
            qq0Var2.f8780c = cq0Var;
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }
}
