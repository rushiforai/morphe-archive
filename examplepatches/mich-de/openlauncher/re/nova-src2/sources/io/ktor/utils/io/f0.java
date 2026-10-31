package io.ktor.utils.io;

import b.u4;
import java.io.EOFException;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jdk7.AutoCloseableKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class f0 {
    /* JADX WARN: Code restructure failed: missing block: B:34:0x009f, code lost:
    
        if (r0 != r2) goto L20;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0073 A[Catch: all -> 0x00a2, TRY_LEAVE, TryCatch #0 {all -> 0x00a2, blocks: (B:27:0x006d, B:29:0x0073, B:38:0x00a8, B:46:0x00c4), top: B:55:0x006d }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00a8 A[Catch: all -> 0x00a2, TRY_ENTER, TRY_LEAVE, TryCatch #0 {all -> 0x00a2, blocks: (B:27:0x006d, B:29:0x0073, B:38:0x00a8, B:46:0x00c4), top: B:55:0x006d }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r14v0, types: [io.ktor.utils.io.t] */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v2, types: [io.ktor.utils.io.j0] */
    /* JADX WARN: Type inference failed for: r14v21 */
    /* JADX WARN: Type inference failed for: r14v5, types: [io.ktor.utils.io.j0] */
    /* JADX WARN: Type inference failed for: r14v7 */
    /* JADX WARN: Type inference failed for: r14v9 */
    /* JADX WARN: Type inference failed for: r3v0, types: [int] */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v2, types: [io.ktor.utils.io.t] */
    /* JADX WARN: Type inference failed for: r3v4, types: [io.ktor.utils.io.t, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x009f -> B:20:0x0052). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(t tVar, o0 o0Var, ContinuationImpl continuationImpl) throws Throwable {
        u uVar;
        long jF;
        u uVar2;
        j0 j0Var;
        t tVar2;
        long j11;
        j0 j0Var2;
        t tVar3;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.f66657x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f66657x = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(continuationImpl);
            }
        }
        Object obj = uVar.f66656w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r32 = uVar.f66657x;
        try {
            if (r32 == 0) {
                ResultKt.b(obj);
                jF = 0;
                uVar2 = uVar;
                j0Var = o0Var;
                tVar2 = tVar;
                if (tVar2.h()) {
                }
                return coroutineSingletons;
            }
            if (r32 == 1) {
                jF = uVar.f66655v;
                j0 j0Var3 = uVar.f66654u;
                t tVar4 = (t) uVar.f66653t;
                ResultKt.b(obj);
                r32 = tVar4;
                tVar = j0Var3;
                uVar.f66653t = r32;
                uVar.f66654u = tVar;
                uVar.f66655v = jF;
                uVar.f66657x = 2;
                Object objG = r32.g(1, uVar);
                tVar3 = r32;
                j0Var2 = tVar;
            } else {
                if (r32 != 2) {
                    if (r32 == 3) {
                        j11 = uVar.f66655v;
                        ResultKt.b(obj);
                        return new Long(j11);
                    }
                    if (r32 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    Throwable th2 = (Throwable) uVar.f66653t;
                    ResultKt.b(obj);
                    throw th2;
                }
                jF = uVar.f66655v;
                j0 j0Var4 = uVar.f66654u;
                t tVar5 = (t) uVar.f66653t;
                ResultKt.b(obj);
                tVar3 = tVar5;
                j0Var2 = j0Var4;
                u uVar3 = uVar;
                j0Var = j0Var2;
                tVar2 = tVar3;
                uVar2 = uVar3;
                try {
                    if (tVar2.h()) {
                        jF += tVar2.f().f(j0Var.e());
                        uVar2.f66653t = tVar2;
                        uVar2.f66654u = j0Var;
                        uVar2.f66655v = jF;
                        uVar2.f66657x = 1;
                        if (j0Var.c(uVar2) != coroutineSingletons) {
                            u uVar4 = uVar2;
                            r32 = tVar2;
                            tVar = j0Var;
                            uVar = uVar4;
                            uVar.f66653t = r32;
                            uVar.f66654u = tVar;
                            uVar.f66655v = jF;
                            uVar.f66657x = 2;
                            Object objG2 = r32.g(1, uVar);
                            tVar3 = r32;
                            j0Var2 = tVar;
                        }
                    } else {
                        Throwable thB = tVar2.b();
                        if (thB != null) {
                            throw thB;
                        }
                        uVar2.f66653t = null;
                        uVar2.f66654u = null;
                        uVar2.f66655v = jF;
                        uVar2.f66657x = 3;
                        if (j0Var.d(uVar2) != coroutineSingletons) {
                            j11 = jF;
                            return new Long(j11);
                        }
                    }
                    return coroutineSingletons;
                } catch (Throwable th3) {
                    th = th3;
                    u uVar5 = uVar2;
                    r32 = tVar2;
                    tVar = j0Var;
                    uVar = uVar5;
                    try {
                        r32.a(th);
                        m0.a(tVar, th);
                        throw th;
                    } catch (Throwable th4) {
                        uVar.f66653t = th4;
                        uVar.f66654u = null;
                        uVar.f66657x = 4;
                        if (tVar.d(uVar) != coroutineSingletons) {
                            throw th4;
                        }
                    }
                }
            }
        } catch (Throwable th5) {
            th = th5;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x009d, code lost:
    
        if (r1.g(r7, r13) == r2) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00d2, code lost:
    
        if (r0 != r2) goto L20;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r3v0, types: [int] */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v13 */
    /* JADX WARN: Type inference failed for: r3v2, types: [io.ktor.utils.io.j0] */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v4, types: [io.ktor.utils.io.j0] */
    /* JADX WARN: Type inference failed for: r3v5, types: [io.ktor.utils.io.j0] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x00d2 -> B:20:0x0056). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(t tVar, j0 j0Var, long j11, ContinuationImpl continuationImpl) throws Throwable {
        v vVar;
        t tVar2;
        long j12;
        long j13;
        v vVar2;
        t tVar3;
        long j14;
        long j15;
        j0 j0Var2;
        if (continuationImpl instanceof v) {
            vVar = (v) continuationImpl;
            int i5 = vVar.f66665y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vVar.f66665y = i5 - Integer.MIN_VALUE;
            } else {
                vVar = new v(continuationImpl);
            }
        }
        Object obj = vVar.f66664x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r32 = vVar.f66665y;
        int i11 = 1;
        try {
            if (r32 == 0) {
                ResultKt.b(obj);
                r32 = j0Var;
                j12 = j11;
                j13 = j12;
                vVar2 = vVar;
                tVar3 = tVar;
                if (tVar3.h()) {
                }
                vVar2.f66660t = null;
                vVar2.f66661u = null;
                vVar2.f66662v = j13;
                vVar2.f66663w = j12;
                vVar2.f66665y = 3;
                if (r32.c(vVar2) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (r32 == 1) {
                j12 = vVar.f66663w;
                j13 = vVar.f66662v;
                j0 j0Var3 = vVar.f66661u;
                tVar2 = (t) vVar.f66660t;
                ResultKt.b(obj);
                r32 = j0Var3;
                long jMin = Math.min(j12, v4.a.k(tVar2.f()));
                tVar2.f().c(r32.e(), jMin);
                j12 -= jMin;
                vVar.f66660t = tVar2;
                vVar.f66661u = r32;
                vVar.f66662v = j13;
                vVar.f66663w = j12;
                vVar.f66665y = 2;
                Object objC = r32.c(vVar);
                j0Var2 = r32;
            } else {
                if (r32 != 2) {
                    if (r32 == 3) {
                        j14 = vVar.f66663w;
                        j15 = vVar.f66662v;
                        ResultKt.b(obj);
                        return new Long(j15 - j14);
                    }
                    if (r32 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    Throwable th2 = (Throwable) vVar.f66660t;
                    ResultKt.b(obj);
                    throw th2;
                }
                j12 = vVar.f66663w;
                j13 = vVar.f66662v;
                j0 j0Var4 = vVar.f66661u;
                tVar2 = (t) vVar.f66660t;
                ResultKt.b(obj);
                j0Var2 = j0Var4;
                try {
                    t tVar4 = tVar2;
                    vVar2 = vVar;
                    tVar3 = tVar4;
                    if (!tVar3.h() || j12 <= 0) {
                        vVar2.f66660t = null;
                        vVar2.f66661u = null;
                        vVar2.f66662v = j13;
                        vVar2.f66663w = j12;
                        vVar2.f66665y = 3;
                        if (r32.c(vVar2) != coroutineSingletons) {
                            j14 = j12;
                            j15 = j13;
                            return new Long(j15 - j14);
                        }
                    } else {
                        if (tVar3.f().N()) {
                            vVar2.f66660t = tVar3;
                            vVar2.f66661u = r32;
                            vVar2.f66662v = j13;
                            vVar2.f66663w = j12;
                            vVar2.f66665y = i11;
                        }
                        v vVar3 = vVar2;
                        tVar2 = tVar3;
                        vVar = vVar3;
                        r32 = r32;
                        long jMin2 = Math.min(j12, v4.a.k(tVar2.f()));
                        tVar2.f().c(r32.e(), jMin2);
                        j12 -= jMin2;
                        vVar.f66660t = tVar2;
                        vVar.f66661u = r32;
                        vVar.f66662v = j13;
                        vVar.f66663w = j12;
                        vVar.f66665y = 2;
                        Object objC2 = r32.c(vVar);
                        j0Var2 = r32;
                    }
                    return coroutineSingletons;
                } catch (Throwable th3) {
                    th = th3;
                    v vVar4 = vVar2;
                    tVar2 = tVar3;
                    vVar = vVar4;
                    try {
                        tVar2.a(th);
                        m0.a(r32, th);
                        throw th;
                    } catch (Throwable th4) {
                        vVar.f66660t = th4;
                        vVar.f66661u = null;
                        vVar.f66665y = 4;
                        if (r32.c(vVar) != coroutineSingletons) {
                            throw th4;
                        }
                    }
                }
                i11 = 1;
                r32 = j0Var2;
            }
        } catch (Throwable th5) {
            th = th5;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x004f -> B:26:0x0066). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x0060 -> B:25:0x0063). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(t tVar, long j11, ContinuationImpl continuationImpl) {
        w wVar;
        long j12;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i5 = wVar.f66672x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f66672x = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(continuationImpl);
            }
        }
        Object obj = wVar.f66671w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f66672x;
        if (i11 == 0) {
            ResultKt.b(obj);
            j12 = j11;
            if (j11 > 0) {
            }
            return new Long(j12 - j11);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        long j13 = wVar.f66670v;
        j12 = wVar.f66669u;
        t tVar2 = wVar.f66668t;
        ResultKt.b(obj);
        long j14 = j13;
        tVar = tVar2;
        j11 = j14;
        long jMin = Math.min(j11, v4.a.k(tVar.f()));
        e80.a aVarF = tVar.f();
        Intrinsics.g(aVarF, "<this>");
        aVarF.j(jMin);
        aVarF.skip(Math.min(jMin, v4.a.k(aVarF)));
        j11 -= jMin;
        if (j11 > 0 || tVar.h()) {
            return new Long(j12 - j11);
        }
        e80.a aVarF2 = tVar.f();
        aVarF2.getClass();
        if (((int) aVarF2.f52247c) == 0) {
            wVar.f66668t = tVar;
            wVar.f66669u = j12;
            wVar.f66670v = j11;
            wVar.f66672x = 1;
            if (tVar.g(1, wVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            tVar2 = tVar;
            j13 = j11;
            long j142 = j13;
            tVar = tVar2;
            j11 = j142;
        }
        long jMin2 = Math.min(j11, v4.a.k(tVar.f()));
        e80.a aVarF3 = tVar.f();
        Intrinsics.g(aVarF3, "<this>");
        aVarF3.j(jMin2);
        aVarF3.skip(Math.min(jMin2, v4.a.k(aVarF3)));
        j11 -= jMin2;
        if (j11 > 0) {
        }
        return new Long(j12 - j11);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Comparable d(t tVar, int i5, ContinuationImpl continuationImpl) {
        x xVar;
        if (continuationImpl instanceof x) {
            xVar = (x) continuationImpl;
            int i11 = xVar.f66677w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                xVar.f66677w = i11 - Integer.MIN_VALUE;
            } else {
                xVar = new x(continuationImpl);
            }
        }
        Object objG = xVar.f66676v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = xVar.f66677w;
        if (i12 == 0) {
            ResultKt.b(objG);
            if (tVar.h()) {
                return null;
            }
            xVar.f66674t = tVar;
            xVar.f66675u = i5;
            xVar.f66677w = 1;
            objG = tVar.g(i5, xVar);
            if (objG == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = xVar.f66675u;
            tVar = xVar.f66674t;
            ResultKt.b(objG);
        }
        if (!((Boolean) objG).booleanValue()) {
            return null;
        }
        e80.a aVarF = tVar.f();
        aVarF.getClass();
        return e80.b.b(cl.k0.m(new e80.d(aVarF)), i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(t tVar, ContinuationImpl continuationImpl) throws Throwable {
        y yVar;
        e80.a aVar;
        if (continuationImpl instanceof y) {
            yVar = (y) continuationImpl;
            int i5 = yVar.f66683w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yVar.f66683w = i5 - Integer.MIN_VALUE;
            } else {
                yVar = new y(continuationImpl);
            }
        }
        Object obj = yVar.f66682v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yVar.f66683w;
        if (i11 == 0) {
            ResultKt.b(obj);
            aVar = new e80.a();
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            e80.a aVar2 = yVar.f66681u;
            t tVar2 = yVar.f66680t;
            ResultKt.b(obj);
            aVar = aVar2;
            tVar = tVar2;
        }
        while (!tVar.h()) {
            aVar.e(tVar.f());
            yVar.f66680t = tVar;
            yVar.f66681u = aVar;
            yVar.f66683w = 1;
            if (tVar.g(1, yVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        Throwable thB = tVar.b();
        if (thB == null) {
            return aVar;
        }
        throw thB;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x009b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x004f -> B:24:0x0064). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0060 -> B:23:0x0062). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(t0 t0Var, int i5, ContinuationImpl continuationImpl) throws EOFException {
        z zVar;
        int i11;
        e80.a aVar;
        t tVar;
        if (continuationImpl instanceof z) {
            zVar = (z) continuationImpl;
            int i12 = zVar.f66688x;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                zVar.f66688x = i12 - Integer.MIN_VALUE;
            } else {
                zVar = new z(continuationImpl);
            }
        }
        Object obj = zVar.f66687w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = zVar.f66688x;
        if (i13 != 0) {
            if (i13 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i14 = zVar.f66686v;
            aVar = zVar.f66685u;
            t tVar2 = zVar.f66684t;
            ResultKt.b(obj);
            i11 = i14;
            t tVar3 = tVar2;
            if (!tVar3.h()) {
                long j11 = i11;
                if (v4.a.k(tVar3.f()) > j11 - aVar.f52247c) {
                    tVar3.f().c(aVar, j11 - aVar.f52247c);
                    tVar = tVar3;
                } else {
                    new Long(tVar3.f().f(aVar));
                    tVar = tVar3;
                }
                if (aVar.f52247c < i11) {
                    boolean zN = tVar.f().N();
                    tVar3 = tVar;
                    if (zN) {
                        zVar.f66684t = tVar;
                        zVar.f66685u = aVar;
                        zVar.f66686v = i11;
                        zVar.f66688x = 1;
                        if (tVar.g(1, zVar) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        tVar2 = tVar;
                        i14 = i11;
                        i11 = i14;
                        t tVar32 = tVar2;
                    }
                    if (!tVar32.h()) {
                    }
                }
            }
            if (aVar.f52247c < i11) {
                return aVar;
            }
            throw new EOFException(a2.c.i(aVar.f52247c, " available", u4.j(i11, "Not enough data available, required ", " bytes but only ")));
        }
        ResultKt.b(obj);
        i11 = i5;
        aVar = new e80.a();
        tVar = t0Var;
        if (aVar.f52247c < i11) {
        }
        if (aVar.f52247c < i11) {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r10v0, types: [e80.j] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object g(t tVar, long j11, ContinuationImpl continuationImpl) throws EOFException {
        b0 b0Var;
        e80.a aVar;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f66559x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f66559x = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(continuationImpl);
            }
        }
        Object obj = b0Var.f66558w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f66559x;
        if (i11 == 0) {
            ResultKt.b(obj);
            aVar = new e80.a();
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            long j12 = b0Var.f66557v;
            ?? r102 = b0Var.f66556u;
            t tVar2 = b0Var.f66555t;
            ResultKt.b(obj);
            aVar = r102;
            j11 = j12;
            tVar = tVar2;
        }
        while (!tVar.h()) {
            long jK = 0;
            if (j11 <= 0) {
                break;
            }
            if (j11 >= v4.a.k(tVar.f())) {
                jK = j11 - v4.a.k(tVar.f());
                new Long(tVar.f().f(aVar));
            } else {
                tVar.f().c(aVar, j11);
            }
            b0Var.f66555t = tVar;
            b0Var.f66556u = aVar;
            b0Var.f66557v = jK;
            b0Var.f66559x = 1;
            if (tVar.g(1, b0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            j11 = jK;
        }
        e80.a aVar2 = aVar;
        aVar2.getClass();
        return aVar2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object h(t tVar, ContinuationImpl continuationImpl) {
        a0 a0Var;
        e80.a aVar;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i5 = a0Var.f66551w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a0Var.f66551w = i5 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(continuationImpl);
            }
        }
        Object obj = a0Var.f66550v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a0Var.f66551w;
        if (i11 == 0) {
            ResultKt.b(obj);
            aVar = new e80.a();
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            e80.a aVar2 = a0Var.f66549u;
            t tVar2 = a0Var.f66548t;
            ResultKt.b(obj);
            aVar = aVar2;
            tVar = tVar2;
        }
        while (!tVar.h()) {
            aVar.e(tVar.f());
            a0Var.f66548t = tVar;
            a0Var.f66549u = aVar;
            a0Var.f66551w = 1;
            if (tVar.g(1, a0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        Throwable thB = tVar.b();
        if (thB != null) {
            throw thB;
        }
        aVar.getClass();
        return aVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0090, code lost:
    
        if (r16.g(1, r2) == r3) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x015c, code lost:
    
        if (r10.f52247c >= r4) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x015e, code lost:
    
        r2.f66561t = r13;
        r2.f66562u = r12;
        r2.f66563v = r11;
        r2.f66564w = r10;
        r2.f66565x = r4;
        r2.f66566y = r0;
        r2.A = 3;
        r7 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0174, code lost:
    
        if (r13.g(1, r2) != r3) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0176, code lost:
    
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0196, code lost:
    
        throw new io.ktor.utils.io.charsets.TooLongLineException("Line exceeds limit of " + r4 + " characters");
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Not initialized variable reg: 11, insn: 0x01b6: INVOKE (r11 I:java.lang.AutoCloseable), (r1 I:java.lang.Throwable) STATIC call: kotlin.jdk7.AutoCloseableKt.a(java.lang.AutoCloseable, java.lang.Throwable):void A[MD:(java.lang.AutoCloseable, java.lang.Throwable):void (m)], block:B:81:0x01b6 */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b3 A[Catch: all -> 0x0044, LOOP:0: B:38:0x00b3->B:61:0x0152, LOOP_START, TryCatch #0 {all -> 0x0044, blocks: (B:14:0x003e, B:36:0x00ad, B:38:0x00b3, B:40:0x00bd, B:42:0x00c9, B:44:0x00d3, B:49:0x00f0, B:51:0x00fd, B:53:0x012d, B:52:0x0125, B:57:0x013c, B:61:0x0152, B:62:0x0157, B:64:0x015e, B:68:0x017b, B:69:0x0196, B:70:0x0197, B:74:0x01a3, B:76:0x01a9, B:21:0x005d), top: B:83:0x0028 }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00fd A[Catch: all -> 0x0044, TryCatch #0 {all -> 0x0044, blocks: (B:14:0x003e, B:36:0x00ad, B:38:0x00b3, B:40:0x00bd, B:42:0x00c9, B:44:0x00d3, B:49:0x00f0, B:51:0x00fd, B:53:0x012d, B:52:0x0125, B:57:0x013c, B:61:0x0152, B:62:0x0157, B:64:0x015e, B:68:0x017b, B:69:0x0196, B:70:0x0197, B:74:0x01a3, B:76:0x01a9, B:21:0x005d), top: B:83:0x0028 }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0125 A[Catch: all -> 0x0044, TryCatch #0 {all -> 0x0044, blocks: (B:14:0x003e, B:36:0x00ad, B:38:0x00b3, B:40:0x00bd, B:42:0x00c9, B:44:0x00d3, B:49:0x00f0, B:51:0x00fd, B:53:0x012d, B:52:0x0125, B:57:0x013c, B:61:0x0152, B:62:0x0157, B:64:0x015e, B:68:0x017b, B:69:0x0196, B:70:0x0197, B:74:0x01a3, B:76:0x01a9, B:21:0x005d), top: B:83:0x0028 }] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0197 A[Catch: all -> 0x0044, TryCatch #0 {all -> 0x0044, blocks: (B:14:0x003e, B:36:0x00ad, B:38:0x00b3, B:40:0x00bd, B:42:0x00c9, B:44:0x00d3, B:49:0x00f0, B:51:0x00fd, B:53:0x012d, B:52:0x0125, B:57:0x013c, B:61:0x0152, B:62:0x0157, B:64:0x015e, B:68:0x017b, B:69:0x0196, B:70:0x0197, B:74:0x01a3, B:76:0x01a9, B:21:0x005d), top: B:83:0x0028 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r10v9, types: [java.lang.Appendable] */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5, types: [boolean] */
    /* JADX WARN: Type inference failed for: r8v6 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:65:0x0174 -> B:67:0x0177). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object i(t tVar, q50.c cVar, int i5, int i11, ContinuationImpl continuationImpl) {
        c0 c0Var;
        q50.c cVar2;
        int i12;
        int i13;
        t tVar2;
        int i14;
        e80.a aVar;
        Appendable appendable;
        t tVar3;
        AutoCloseable autoCloseable;
        e80.a aVarF;
        Appendable appendable2;
        e80.a aVar2;
        t tVar4;
        if (continuationImpl instanceof c0) {
            c0Var = (c0) continuationImpl;
            int i15 = c0Var.A;
            if ((i15 & Integer.MIN_VALUE) != 0) {
                c0Var.A = i15 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(continuationImpl);
            }
        }
        Object obj = c0Var.f66567z;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i16 = c0Var.A;
        int i17 = 2;
        int i18 = 1;
        try {
            if (i16 == 0) {
                ResultKt.b(obj);
                if (tVar.f().N()) {
                    c0Var.f66561t = tVar;
                    cVar2 = cVar;
                    c0Var.f66562u = cVar2;
                    i12 = i5;
                    c0Var.f66565x = i12;
                    i13 = i11;
                    c0Var.f66566y = i13;
                    c0Var.A = 1;
                } else {
                    cVar2 = cVar;
                    i12 = i5;
                    i13 = i11;
                }
                tVar2 = tVar;
                i14 = i13;
            } else {
                if (i16 != 1) {
                    if (i16 == 2) {
                        i14 = c0Var.f66565x;
                        aVar2 = c0Var.f66564w;
                        autoCloseable = c0Var.f66563v;
                        appendable2 = c0Var.f66562u;
                        tVar4 = c0Var.f66561t;
                        ResultKt.b(obj);
                        tVar3 = tVar4;
                        aVar = aVar2;
                        appendable = appendable2;
                        aVarF = tVar3.f();
                        aVarF.getClass();
                        if (aVarF.a() != 10) {
                        }
                        appendable.append(e80.m.b(aVar));
                        Boolean bool = Boolean.TRUE;
                        AutoCloseableKt.a(autoCloseable, null);
                        return bool;
                    }
                    if (i16 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    i14 = c0Var.f66566y;
                    i12 = c0Var.f66565x;
                    aVar = c0Var.f66564w;
                    autoCloseable = c0Var.f66563v;
                    appendable = c0Var.f66562u;
                    tVar3 = c0Var.f66561t;
                    ResultKt.b(obj);
                    int i19 = 1;
                    i18 = i19;
                    i17 = 2;
                    if (!tVar3.h()) {
                        ?? r82 = aVar.f52247c > 0 ? i18 : 0;
                        Boolean boolValueOf = Boolean.valueOf((boolean) r82);
                        if (r82 != 0) {
                            appendable.append(e80.m.b(aVar));
                        }
                        AutoCloseableKt.a(autoCloseable, null);
                        return boolValueOf;
                    }
                    while (true) {
                        if (tVar3.f().N()) {
                            break;
                        }
                        byte b11 = tVar3.f().readByte();
                        if (b11 == 13) {
                            if (tVar3.f().N()) {
                                c0Var.f66561t = tVar3;
                                c0Var.f66562u = appendable;
                                c0Var.f66563v = autoCloseable;
                                c0Var.f66564w = aVar;
                                c0Var.f66565x = i14;
                                c0Var.A = i17;
                                if (tVar3.g(i18, c0Var) != coroutineSingletons) {
                                    aVar2 = aVar;
                                    appendable2 = appendable;
                                    tVar4 = tVar3;
                                }
                            }
                        } else {
                            if (b11 == 10) {
                                List list = u0.f66658b;
                                r0.d();
                                j(i14, i17);
                                appendable.append(e80.m.b(aVar));
                                Boolean bool2 = Boolean.TRUE;
                                AutoCloseableKt.a(autoCloseable, null);
                                return bool2;
                            }
                            aVar.s(b11);
                        }
                    }
                    aVarF = tVar3.f();
                    aVarF.getClass();
                    if (aVarF.a() != 10) {
                        List list2 = u0.f66658b;
                        r0.c();
                        j(i14, 4);
                        e80.a aVarF2 = tVar3.f();
                        Intrinsics.g(aVarF2, "<this>");
                        aVarF2.j(1L);
                        long jMin = Math.min(1L, v4.a.k(aVarF2));
                        aVarF2.skip(jMin);
                        new Long(jMin);
                    } else {
                        List list3 = u0.f66658b;
                        r0.b();
                        j(i14, i18);
                    }
                    appendable.append(e80.m.b(aVar));
                    Boolean bool3 = Boolean.TRUE;
                    AutoCloseableKt.a(autoCloseable, null);
                    return bool3;
                }
                i14 = c0Var.f66566y;
                i12 = c0Var.f66565x;
                ?? r102 = c0Var.f66562u;
                tVar2 = c0Var.f66561t;
                ResultKt.b(obj);
                cVar2 = r102;
            }
            if (tVar2.h()) {
                return Boolean.FALSE;
            }
            aVar = new e80.a();
            appendable = cVar2;
            tVar3 = tVar2;
            autoCloseable = aVar;
            if (!tVar3.h()) {
            }
        } finally {
        }
    }

    public static final void j(int i5, int i11) throws IOException {
        if (u0.a(i5, i11)) {
            return;
        }
        throw new IOException("Unexpected line ending " + ((Object) u0.b(i11)) + ", while expected " + ((Object) u0.b(i5)));
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0064, code lost:
    
        if (c(r5, r6, r0) == r1) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object k(t tVar, f80.a aVar, ContinuationImpl continuationImpl) {
        d0 d0Var;
        if (continuationImpl instanceof d0) {
            d0Var = (d0) continuationImpl;
            int i5 = d0Var.f66574w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d0Var.f66574w = i5 - Integer.MIN_VALUE;
            } else {
                d0Var = new d0(continuationImpl);
            }
        }
        Object objD = d0Var.f66573v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d0Var.f66574w;
        if (i11 == 0) {
            ResultKt.b(objD);
            int iB = aVar.b();
            d0Var.f66571t = tVar;
            d0Var.f66572u = aVar;
            d0Var.f66574w = 1;
            objD = d(tVar, iB, d0Var);
            if (objD != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objD);
            return Boolean.TRUE;
        }
        aVar = d0Var.f66572u;
        tVar = d0Var.f66571t;
        ResultKt.b(objD);
        if (!Intrinsics.b(objD, aVar)) {
            return Boolean.FALSE;
        }
        long jB = aVar.b();
        d0Var.f66571t = null;
        d0Var.f66572u = null;
        d0Var.f66574w = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r4v2, types: [byte[], java.io.Serializable] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Serializable l(t tVar, ContinuationImpl continuationImpl) throws Throwable {
        e0 e0Var;
        if (continuationImpl instanceof e0) {
            e0Var = (e0) continuationImpl;
            int i5 = e0Var.f66576u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e0Var.f66576u = i5 - Integer.MIN_VALUE;
            } else {
                e0Var = new e0(continuationImpl);
            }
        }
        Object objE = e0Var.f66575t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e0Var.f66576u;
        if (i11 == 0) {
            ResultKt.b(objE);
            e0Var.f66576u = 1;
            objE = e(tVar, e0Var);
            if (objE == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objE);
        }
        e80.a aVar = (e80.a) objE;
        return e80.l.a(aVar, (int) aVar.f52247c);
    }
}
