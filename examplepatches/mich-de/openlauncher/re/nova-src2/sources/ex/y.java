package ex;

import c0.g2;
import cw.r3;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.collections.EmptySet;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final gx.l f53127a;

    /* renamed from: b, reason: collision with root package name */
    public final gx.f f53128b;

    /* renamed from: c, reason: collision with root package name */
    public final gx.f f53129c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f53130d;

    /* renamed from: e, reason: collision with root package name */
    public final c80.d f53131e;

    /* renamed from: f, reason: collision with root package name */
    public final HashMap f53132f;

    /* renamed from: g, reason: collision with root package name */
    public final i2 f53133g;

    /* renamed from: h, reason: collision with root package name */
    public final o1 f53134h;

    public y(gx.l lVar, gx.f fVar, gx.f fVar2) {
        r3 r3Var = new r3(26);
        this.f53127a = lVar;
        this.f53128b = fVar;
        this.f53129c = fVar2;
        this.f53130d = r3Var;
        this.f53131e = new c80.d();
        this.f53132f = new HashMap();
        i2 i2VarC = u1.c(EmptySet.f71734a);
        this.f53133g = i2VarC;
        this.f53134h = new o1(i2VarC);
    }

    public final void a(String str) {
        ArrayDeque arrayDeque = (ArrayDeque) this.f53132f.get(str);
        if (arrayDeque == null) {
            return;
        }
        long jLongValue = ((Number) this.f53130d.invoke()).longValue() - ((Number) this.f53129c.invoke()).longValue();
        while (!arrayDeque.isEmpty() && ((v) arrayDeque.first()).f53113b < jLongValue) {
            v vVar = (v) arrayDeque.removeFirst();
            try {
                int i5 = Result.f71687b;
                ((g2) vVar.f53112a).destroy();
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                ResultKt.a(th2);
            }
        }
        d();
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00c2, code lost:
    
        if (r14.e(r0) == r1) goto L41;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:25:0x007f A[Catch: all -> 0x0082, TryCatch #0 {all -> 0x0082, blocks: (B:23:0x0072, B:25:0x007f, B:29:0x0086), top: B:55:0x0072 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0072 A[EXC_TOP_SPLITTER, PHI: r7 r13 r14
      0x0072: PHI (r7v2 ex.y) = (r7v3 ex.y), (r7v5 ex.y) binds: [B:21:0x006f, B:18:0x004d] A[DONT_GENERATE, DONT_INLINE]
      0x0072: PHI (r13v3 java.lang.String) = (r13v5 java.lang.String), (r13v10 java.lang.String) binds: [B:21:0x006f, B:18:0x004d] A[DONT_GENERATE, DONT_INLINE]
      0x0072: PHI (r14v4 c80.d) = (r14v9 c80.d), (r14v11 c80.d) binds: [B:21:0x006f, B:18:0x004d] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r13v9, types: [c80.a] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x00c2 -> B:14:0x0039). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, ContinuationImpl continuationImpl) {
        w wVar;
        y yVar;
        y yVar2;
        oi.b bVar;
        c80.d dVar;
        int iIntValue;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i5 = wVar.f53120z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f53120z = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(this, continuationImpl);
            }
        }
        Object objInvoke = wVar.f53118x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f53120z;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            yVar = this;
            dVar = yVar.f53131e;
            wVar.f53114t = yVar;
            wVar.f53115u = str;
            wVar.f53116v = dVar;
            wVar.f53117w = null;
            wVar.f53120z = 1;
            if (dVar.e(wVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ?? r13 = (c80.a) wVar.f53116v;
            String str2 = wVar.f53115u;
            yVar = wVar.f53114t;
            ResultKt.b(objInvoke);
            dVar = r13;
            str = str2;
            yVar.a(str);
            ArrayDeque arrayDeque = (ArrayDeque) yVar.f53132f.get(str);
            iIntValue = ((Number) yVar.f53128b.invoke()).intValue() - (arrayDeque == null ? arrayDeque.f71724c : 0);
            dVar.g(null);
            if (iIntValue > 0) {
            }
            return Unit.f71706a;
        }
        if (i11 == 2) {
            str = wVar.f53115u;
            y yVar3 = wVar.f53114t;
            ResultKt.b(objInvoke);
            yVar2 = yVar3;
            bVar = (oi.b) objInvoke;
            if (bVar != null) {
            }
            return Unit.f71706a;
        }
        if (i11 != 3) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        c80.d dVar2 = wVar.f53117w;
        bVar = (oi.b) wVar.f53116v;
        String str3 = wVar.f53115u;
        yVar2 = wVar.f53114t;
        ResultKt.b(objInvoke);
        c80.d dVar3 = dVar2;
        str = str3;
        yVar = yVar2;
        try {
            HashMap map = yVar.f53132f;
            Object arrayDeque2 = map.get(str);
            if (arrayDeque2 == null) {
                arrayDeque2 = new ArrayDeque();
                map.put(str, arrayDeque2);
            }
            ((ArrayDeque) arrayDeque2).addLast(new v(bVar, ((Number) yVar.f53130d.invoke()).longValue()));
            yVar.d();
            Unit unit = Unit.f71706a;
            dVar3.g(null);
            dVar = yVar.f53131e;
            wVar.f53114t = yVar;
            wVar.f53115u = str;
            wVar.f53116v = dVar;
            wVar.f53117w = null;
            wVar.f53120z = 1;
            if (dVar.e(wVar) != coroutineSingletons) {
                try {
                    yVar.a(str);
                    ArrayDeque arrayDeque3 = (ArrayDeque) yVar.f53132f.get(str);
                    iIntValue = ((Number) yVar.f53128b.invoke()).intValue() - (arrayDeque3 == null ? arrayDeque3.f71724c : 0);
                    dVar.g(null);
                    if (iIntValue > 0) {
                        gx.l lVar = yVar.f53127a;
                        wVar.f53114t = yVar;
                        wVar.f53115u = str;
                        wVar.f53116v = null;
                        wVar.f53120z = 2;
                        objInvoke = lVar.invoke(str, wVar);
                        if (objInvoke != coroutineSingletons) {
                            yVar2 = yVar;
                            bVar = (oi.b) objInvoke;
                            if (bVar != null) {
                                dVar3 = yVar2.f53131e;
                                wVar.f53114t = yVar2;
                                wVar.f53115u = str;
                                wVar.f53116v = bVar;
                                wVar.f53117w = dVar3;
                                wVar.f53120z = 3;
                            }
                        }
                    }
                    return Unit.f71706a;
                } catch (Throwable th2) {
                    dVar.g(null);
                    throw th2;
                }
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            dVar3.g(null);
            throw th3;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00ab A[Catch: all -> 0x00be, TryCatch #1 {all -> 0x00be, blocks: (B:34:0x00a1, B:36:0x00ab, B:40:0x00b7, B:42:0x00bb, B:46:0x00c1, B:39:0x00b3), top: B:58:0x00a1 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00d6 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, ContinuationImpl continuationImpl) {
        x xVar;
        c80.d dVar;
        y yVar;
        String str2;
        c80.d dVar2;
        y yVar2;
        ArrayDeque arrayDeque;
        oi.b bVar;
        if (continuationImpl instanceof x) {
            xVar = (x) continuationImpl;
            int i5 = xVar.f53126y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.f53126y = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(this, continuationImpl);
            }
        }
        Object obj = xVar.f53124w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xVar.f53126y;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                xVar.f53121t = this;
                xVar.f53122u = str;
                dVar = this.f53131e;
                xVar.f53123v = dVar;
                xVar.f53126y = 1;
                if (dVar.e(xVar) != coroutineSingletons) {
                    yVar = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 == 2) {
                    str = xVar.f53122u;
                    y yVar3 = (y) xVar.f53121t;
                    ResultKt.b(obj);
                    yVar = yVar3;
                    str2 = str;
                    dVar2 = yVar.f53131e;
                    xVar.f53121t = yVar;
                    xVar.f53122u = str2;
                    xVar.f53123v = dVar2;
                    xVar.f53126y = 3;
                    if (dVar2.e(xVar) != coroutineSingletons) {
                        yVar2 = yVar;
                        arrayDeque = (ArrayDeque) yVar2.f53132f.get(str2);
                        if (arrayDeque == null) {
                        }
                    }
                    return coroutineSingletons;
                }
                if (i11 != 3) {
                    if (i11 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    oi.b bVar2 = (oi.b) xVar.f53121t;
                    ResultKt.b(obj);
                    return bVar2;
                }
                dVar2 = xVar.f53123v;
                str2 = xVar.f53122u;
                yVar2 = (y) xVar.f53121t;
                ResultKt.b(obj);
                try {
                    arrayDeque = (ArrayDeque) yVar2.f53132f.get(str2);
                    if (arrayDeque == null) {
                        bVar = null;
                        yVar2.d();
                        dVar.g(null);
                        xVar.f53121t = bVar;
                        xVar.f53122u = null;
                        xVar.f53123v = null;
                        xVar.f53126y = 4;
                        if (yVar2.b(str2, xVar) == coroutineSingletons) {
                            return bVar;
                        }
                    } else {
                        v vVar = (v) (arrayDeque.isEmpty() ? null : arrayDeque.removeFirst());
                        if (vVar != null) {
                            bVar = vVar.f53112a;
                        }
                        yVar2.d();
                        dVar.g(null);
                        xVar.f53121t = bVar;
                        xVar.f53122u = null;
                        xVar.f53123v = null;
                        xVar.f53126y = 4;
                        if (yVar2.b(str2, xVar) == coroutineSingletons) {
                        }
                    }
                    return coroutineSingletons;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            c80.d dVar3 = xVar.f53123v;
            String str3 = xVar.f53122u;
            yVar = (y) xVar.f53121t;
            ResultKt.b(obj);
            dVar = dVar3;
            str = str3;
            yVar.a(str);
            Unit unit = Unit.f71706a;
            dVar.g(null);
            xVar.f53121t = yVar;
            xVar.f53122u = str;
            xVar.f53123v = null;
            xVar.f53126y = 2;
            if (yVar.b(str, xVar) != coroutineSingletons) {
                str2 = str;
                dVar2 = yVar.f53131e;
                xVar.f53121t = yVar;
                xVar.f53122u = str2;
                xVar.f53123v = dVar2;
                xVar.f53126y = 3;
                if (dVar2.e(xVar) != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } finally {
            dVar.g(null);
        }
    }

    public final void d() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : this.f53132f.entrySet()) {
            if (!((ArrayDeque) entry.getValue()).isEmpty()) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        this.f53133g.j(b70.g.N1(linkedHashMap.keySet()));
    }
}
