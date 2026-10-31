package v5;

import kotlin.ExceptionsKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import m90.b0;
import m90.c0;
import m90.m;
import m90.t;
import m90.z;
import t5.c1;
import t5.o1;

/* loaded from: classes2.dex */
public final class j extends b implements o1 {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00a7 A[Catch: all -> 0x00a0, TRY_LEAVE, TryCatch #0 {all -> 0x00a0, blocks: (B:48:0x00a7, B:54:0x00b4, B:43:0x009c, B:40:0x0097), top: B:68:0x0020, inners: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00b4 A[Catch: all -> 0x00a0, TRY_ENTER, TRY_LEAVE, TryCatch #0 {all -> 0x00a0, blocks: (B:48:0x00a7, B:54:0x00b4, B:43:0x009c, B:40:0x0097), top: B:68:0x0020, inners: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0097 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v10, types: [m90.t] */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v2, types: [kotlin.coroutines.jvm.internal.ContinuationImpl, v5.i] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v8, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r3v2, types: [t5.c1] */
    @Override // t5.o1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Object obj, ContinuationImpl continuationImpl) throws Throwable {
        ?? iVar;
        t tVarL;
        Unit unit;
        Throwable th2;
        c0 c0Var;
        t tVar;
        Throwable th3;
        Unit unit2;
        if (continuationImpl instanceof i) {
            i iVar2 = (i) continuationImpl;
            int i5 = iVar2.f92102y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar2.f92102y = i5 - Integer.MIN_VALUE;
                iVar = iVar2;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object obj2 = iVar.f92100w;
        Object obj3 = CoroutineSingletons.f71806a;
        int i11 = iVar.f92102y;
        Throwable th4 = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                if (this.f92066d.f61637a.get()) {
                    throw new IllegalStateException("This scope has already been closed.");
                }
                m mVar = this.f92063a;
                mVar.getClass();
                z file = this.f92064b;
                Intrinsics.g(file, "file");
                tVarL = mVar.l(file);
                try {
                    c0 c0VarQ = x7.f.q(t.a(tVarL));
                    try {
                        q.c cVar = this.f92065c;
                        iVar.f92097t = tVarL;
                        iVar.f92098u = tVarL;
                        iVar.f92099v = c0VarQ;
                        iVar.f92102y = 1;
                        Object objWriteTo = ((c1) cVar.f83189b).writeTo(obj, new b0(c0VarQ), iVar);
                        if (objWriteTo != obj3) {
                            objWriteTo = Unit.f71706a;
                        }
                        if (objWriteTo == obj3) {
                            return obj3;
                        }
                        t tVar2 = tVarL;
                        tVar = tVar2;
                        c0Var = c0VarQ;
                        iVar = tVar2;
                    } catch (Throwable th5) {
                        iVar = tVarL;
                        th2 = th5;
                        c0Var = c0VarQ;
                        if (c0Var != null) {
                            try {
                                c0Var.close();
                            } catch (Throwable th6) {
                                ExceptionsKt.a(th2, th6);
                            }
                        }
                        th3 = th2;
                        unit2 = null;
                        if (th3 == null) {
                        }
                    }
                } catch (Throwable th7) {
                    th = th7;
                    if (tVarL != null) {
                        try {
                            tVarL.close();
                        } catch (Throwable th8) {
                            ExceptionsKt.a(th, th8);
                        }
                    }
                    th4 = th;
                    unit = null;
                    if (th4 == null) {
                    }
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c0Var = iVar.f92099v;
                tVar = iVar.f92098u;
                iVar = iVar.f92097t;
                try {
                    ResultKt.b(obj2);
                    iVar = iVar;
                } catch (Throwable th9) {
                    th2 = th9;
                    if (c0Var != null) {
                    }
                    th3 = th2;
                    unit2 = null;
                    if (th3 == null) {
                    }
                }
            }
            tVar.flush();
            unit2 = Unit.f71706a;
            if (c0Var != null) {
                try {
                    c0Var.close();
                    th3 = null;
                } catch (Throwable th10) {
                    th3 = th10;
                }
                if (th3 == null) {
                    throw th3;
                }
                Intrinsics.d(unit2);
                unit = Unit.f71706a;
                if (iVar != 0) {
                    try {
                        iVar.close();
                    } catch (Throwable th11) {
                        th4 = th11;
                    }
                }
            } else {
                th3 = null;
                if (th3 == null) {
                }
            }
        } catch (Throwable th12) {
            th = th12;
            tVarL = iVar;
        }
        if (th4 == null) {
            throw th4;
        }
        Intrinsics.d(unit);
        return Unit.f71706a;
    }
}
