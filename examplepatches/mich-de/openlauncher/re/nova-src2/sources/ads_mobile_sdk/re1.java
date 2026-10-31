package ads_mobile_sdk;

import b.c3;
import c80.d;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes2.dex */
public final class re1 implements c3 {

    /* renamed from: a, reason: collision with root package name */
    public tx0 f9121a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f9122b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f9123c;

    /* renamed from: d, reason: collision with root package name */
    public final kz2 f9124d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f9125e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f9126f;

    /* renamed from: g, reason: collision with root package name */
    public final d f9127g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f9128h;

    /* renamed from: i, reason: collision with root package name */
    public int f9129i;

    public re1(tx0 tx0Var, t70.j0 uiScope, t70.j0 backgroundScope, kz2 rootTraceCreator, jr0 flags, boolean z11) {
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(flags, "flags");
        this.f9121a = tx0Var;
        this.f9122b = uiScope;
        this.f9123c = backgroundScope;
        this.f9124d = rootTraceCreator;
        this.f9125e = flags;
        this.f9126f = z11;
        this.f9127g = new d();
    }

    @Override // b.c3
    public final Object a(String str, String str2, ContinuationImpl continuationImpl) {
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID(...)");
        return a(this, str, str2, uuidRandomUUID, continuationImpl);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0062, code lost:
    
        if (r5.e(r0) == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        le1 le1Var;
        d dVar;
        re1 re1Var;
        if (continuationImpl instanceof le1) {
            le1Var = (le1) continuationImpl;
            int i5 = le1Var.f6219e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                le1Var.f6219e = i5 - Integer.MIN_VALUE;
            } else {
                le1Var = new le1(this, continuationImpl);
            }
        }
        Object obj = le1Var.f6217c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = le1Var.f6219e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                le1Var.f6215a = this;
                dVar = this.f9127g;
                le1Var.f6216b = dVar;
                le1Var.f6219e = 1;
                if (dVar.e(le1Var) != coroutineSingletons) {
                    re1Var = this;
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
            dVar = le1Var.f6216b;
            re1Var = le1Var.f6215a;
            ResultKt.b(obj);
            re1Var.f9129i--;
            Unit unit = Unit.f71706a;
            dVar.g(null);
            le1Var.f6215a = null;
            le1Var.f6216b = null;
            le1Var.f6219e = 2;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x005f, code lost:
    
        if (r5.e(r0) == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        me1 me1Var;
        d dVar;
        re1 re1Var;
        if (continuationImpl instanceof me1) {
            me1Var = (me1) continuationImpl;
            int i5 = me1Var.f7180e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                me1Var.f7180e = i5 - Integer.MIN_VALUE;
            } else {
                me1Var = new me1(this, continuationImpl);
            }
        }
        Object obj = me1Var.f7178c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = me1Var.f7180e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                me1Var.f7176a = this;
                dVar = this.f9127g;
                me1Var.f7177b = dVar;
                me1Var.f7180e = 1;
                if (dVar.e(me1Var) != coroutineSingletons) {
                    re1Var = this;
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
            dVar = me1Var.f7177b;
            re1Var = me1Var.f7176a;
            ResultKt.b(obj);
            re1Var.f9128h = true;
            Unit unit = Unit.f71706a;
            dVar.g(null);
            me1Var.f7176a = null;
            me1Var.f7177b = null;
            me1Var.f7180e = 2;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ContinuationImpl continuationImpl) {
        ne1 ne1Var;
        re1 re1Var;
        d dVar;
        if (continuationImpl instanceof ne1) {
            ne1Var = (ne1) continuationImpl;
            int i5 = ne1Var.f7544e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ne1Var.f7544e = i5 - Integer.MIN_VALUE;
            } else {
                ne1Var = new ne1(this, continuationImpl);
            }
        }
        Object obj = ne1Var.f7542c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ne1Var.f7544e;
        if (i11 == 0) {
            ResultKt.b(obj);
            ne1Var.f7540a = this;
            d dVar2 = this.f9127g;
            ne1Var.f7541b = dVar2;
            ne1Var.f7544e = 1;
            if (dVar2.e(ne1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            re1Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = ne1Var.f7541b;
            re1Var = ne1Var.f7540a;
            ResultKt.b(obj);
        }
        try {
            re1Var.f9129i++;
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(ContinuationImpl continuationImpl) {
        oe1 oe1Var;
        re1 re1Var;
        d dVar;
        if (continuationImpl instanceof oe1) {
            oe1Var = (oe1) continuationImpl;
            int i5 = oe1Var.f7870e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oe1Var.f7870e = i5 - Integer.MIN_VALUE;
            } else {
                oe1Var = new oe1(this, continuationImpl);
            }
        }
        Object obj = oe1Var.f7868c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oe1Var.f7870e;
        if (i11 == 0) {
            ResultKt.b(obj);
            oe1Var.f7866a = this;
            d dVar2 = this.f9127g;
            oe1Var.f7867b = dVar2;
            oe1Var.f7870e = 1;
            if (dVar2.e(oe1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            re1Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = oe1Var.f7867b;
            re1Var = oe1Var.f7866a;
            ResultKt.b(obj);
        }
        Continuation continuation = null;
        try {
            if (re1Var.f9128h && re1Var.f9129i <= 0) {
                m0.t(re1Var.f9123c, null, null, new pe1(re1Var, continuation, 0), 3);
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:115:0x01a9 A[Catch: all -> 0x0183, TRY_LEAVE, TryCatch #1 {all -> 0x0183, blocks: (B:93:0x0170, B:95:0x0177, B:97:0x017b, B:99:0x017f, B:102:0x0186, B:104:0x018a, B:106:0x018e, B:108:0x0192, B:109:0x0193, B:110:0x0198, B:111:0x0199, B:112:0x01a0, B:113:0x01a1, B:114:0x01a8, B:115:0x01a9), top: B:122:0x0170 }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00c8 A[Catch: all -> 0x004d, TRY_LEAVE, TryCatch #6 {all -> 0x004d, blocks: (B:20:0x0049, B:33:0x00bb, B:37:0x00c2, B:38:0x00c4, B:40:0x00c8), top: B:130:0x0049 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00de A[Catch: all -> 0x00ea, TryCatch #3 {all -> 0x00ea, blocks: (B:46:0x00d7, B:48:0x00de, B:50:0x00e2, B:52:0x00e6, B:55:0x00ed, B:57:0x00f1, B:59:0x00f5, B:61:0x00f9, B:62:0x00fa, B:63:0x00ff, B:64:0x0100, B:65:0x0107, B:66:0x0108, B:67:0x010f, B:68:0x0110), top: B:125:0x00d7 }] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0110 A[Catch: all -> 0x00ea, TRY_LEAVE, TryCatch #3 {all -> 0x00ea, blocks: (B:46:0x00d7, B:48:0x00de, B:50:0x00e2, B:52:0x00e6, B:55:0x00ed, B:57:0x00f1, B:59:0x00f5, B:61:0x00f9, B:62:0x00fa, B:63:0x00ff, B:64:0x0100, B:65:0x0107, B:66:0x0108, B:67:0x010f, B:68:0x0110), top: B:125:0x00d7 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0161 A[Catch: all -> 0x003a, TRY_LEAVE, TryCatch #4 {all -> 0x003a, blocks: (B:13:0x0035, B:80:0x0154, B:84:0x015b, B:85:0x015d, B:87:0x0161), top: B:126:0x0035 }] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0177 A[Catch: all -> 0x0183, TryCatch #1 {all -> 0x0183, blocks: (B:93:0x0170, B:95:0x0177, B:97:0x017b, B:99:0x017f, B:102:0x0186, B:104:0x018a, B:106:0x018e, B:108:0x0192, B:109:0x0193, B:110:0x0198, B:111:0x0199, B:112:0x01a0, B:113:0x01a1, B:114:0x01a8, B:115:0x01a9), top: B:122:0x0170 }] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v33, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v37 */
    /* JADX WARN: Type inference failed for: r2v38 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(re1 re1Var, String value, String str, UUID uuid, ContinuationImpl continuationImpl) {
        ke1 ke1Var;
        th3 th3VarA;
        th3 th3Var;
        th3 th3Var2;
        em2 em2VarA;
        th3 th3Var3;
        th3 th3Var4;
        th3 th3Var5;
        ?? r22;
        Object obj;
        Object obj2;
        if (continuationImpl instanceof ke1) {
            ke1Var = (ke1) continuationImpl;
            int i5 = ke1Var.f5713e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ke1Var.f5713e = i5 - Integer.MIN_VALUE;
            } else {
                ke1Var = new ke1(re1Var, continuationImpl);
            }
        }
        Object obj3 = ke1Var.f5711c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ke1Var.f5713e;
        if (i11 == 0) {
            ResultKt.b(obj3);
            kz2 kz2Var = re1Var.f9124d;
            wv0 wv0Var = wv0.CUI_NAME_WEBVIEW_CALL_JS;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    cc2 cc2VarE = ji3.a().e();
                    b.j0 j0VarO = cl1.o();
                    Intrinsics.f(j0VarO, "newBuilder(...)");
                    Intrinsics.g(value, "value");
                    j0VarO.b();
                    ((cl1) j0VarO.f1095b).b(value);
                    cc2VarE.f1808y = (cl1) j0VarO.a();
                    tx0 tx0Var = re1Var.f9121a;
                    if (tx0Var == null) {
                        th3Var3 = em2VarA;
                        th3Var4 = th3Var3;
                        obj = bv0.f1574c;
                        r22 = th3Var4;
                        if (obj instanceof pu0) {
                        }
                        CloseableKt.a(th3Var3, null);
                        return obj;
                    }
                    ke1Var.f5709a = em2VarA;
                    ke1Var.f5710b = em2VarA;
                    ke1Var.f5713e = 1;
                    Object objB = tx0Var.b(value, str, uuid, ke1Var);
                    if (objB != coroutineSingletons) {
                        th3Var3 = em2VarA;
                        th3Var5 = th3Var3;
                        obj3 = objB;
                        obj = (b.a1) obj3;
                        r22 = th3Var5;
                        if (obj == null) {
                        }
                        if (obj instanceof pu0) {
                        }
                        CloseableKt.a(th3Var3, null);
                        return obj;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    th3Var3 = em2VarA;
                    em2VarA.b(th);
                    if (th instanceof b.a4) {
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
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    cc2 cc2VarE2 = ji3.a().e();
                    b.j0 j0VarO2 = cl1.o();
                    Intrinsics.f(j0VarO2, "newBuilder(...)");
                    Intrinsics.g(value, "value");
                    j0VarO2.b();
                    ((cl1) j0VarO2.f1095b).b(value);
                    cc2VarE2.f1808y = (cl1) j0VarO2.a();
                    tx0 tx0Var2 = re1Var.f9121a;
                    if (tx0Var2 == null) {
                        th3Var = th3VarA;
                        th3Var2 = th3Var;
                        obj2 = bv0.f1574c;
                        if (obj2 instanceof pu0) {
                        }
                        CloseableKt.a(th3Var, null);
                        return obj2;
                    }
                    ke1Var.f5709a = th3VarA;
                    ke1Var.f5710b = th3VarA;
                    ke1Var.f5713e = 2;
                    Object objB2 = tx0Var2.b(value, str, uuid, ke1Var);
                    if (objB2 != coroutineSingletons) {
                        th3Var = th3VarA;
                        th3Var2 = th3Var;
                        obj3 = objB2;
                        obj2 = (b.a1) obj3;
                        if (obj2 == null) {
                        }
                        if (obj2 instanceof pu0) {
                        }
                        CloseableKt.a(th3Var, null);
                        return obj2;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    th3Var = th3VarA;
                    th3VarA.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var = ke1Var.f5710b;
            th3Var2 = ke1Var.f5709a;
            try {
                ResultKt.b(obj3);
                obj2 = (b.a1) obj3;
                if (obj2 == null) {
                    obj2 = bv0.f1574c;
                }
                if (obj2 instanceof pu0) {
                    zi3.a((pu0) obj2, false);
                }
                CloseableKt.a(th3Var, null);
                return obj2;
            } catch (Throwable th4) {
                th = th4;
                th3VarA = th3Var2;
                try {
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
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        th3Var3 = ke1Var.f5710b;
        r22 = ke1Var.f5709a;
        try {
            ResultKt.b(obj3);
            th3Var5 = r22;
            obj = (b.a1) obj3;
            r22 = th3Var5;
            if (obj == null) {
                th3Var4 = th3Var5;
                obj = bv0.f1574c;
                r22 = th3Var4;
            }
            if (obj instanceof pu0) {
                zi3.a((pu0) obj, false);
            }
            CloseableKt.a(th3Var3, null);
            return obj;
        } catch (Throwable th5) {
            th = th5;
            em2VarA = r22;
            try {
                em2VarA.b(th);
                if (th instanceof b.a4) {
                }
            } finally {
            }
        }
    }

    @Override // b.c3
    public final Object a(com.google.gson.r rVar, Continuation continuation) throws Throwable {
        tx0 tx0Var = this.f9121a;
        if (tx0Var == null) {
            return Unit.f71706a;
        }
        Object objA = tx0Var.a(rVar, "sendMessageToNativeJs", continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
